package kr.co.project.recipe.model.service;

import java.util.List;
import java.util.Objects;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.recipe.model.dao.RecipeDAO;
import kr.co.project.recipe.model.dto.RecipeDTO;

@Service
public class RecipeServiceImpl implements RecipeService{

	// DB 연결에 관련된 템플릿
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Autowired 
		private RecipeDAO recipeDao;
		
		// 트랜젝션 관리해주는 객체 
		@Autowired
		private PlatformTransactionManager transactionManager;
	
	
	@Override
	public int selectListCount(RecipeDTO recipe) {
		
		return recipeDao.selectListCount(sqlSession,recipe);
	}

	@Override
	public List<RecipeDTO> selectListAll(PageInfo pi, RecipeDTO recipe) {
		
		return recipeDao.selectListAll(sqlSession,pi,recipe);
	}

	@Override
	public int addRecipe(RecipeDTO recipe, List<RecipeDTO> recipeList) {

		return recipeDao.addRecipe(sqlSession, recipe, recipeList);
	}
	
	@Transactional
	@Override
	public RecipeDTO detailRecipe(int rno) {
		
		// 트랜젝션 기본 설정
        DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
        
        // 트랜젝션의 격리 수준을 기본 설정으로
        transactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_DEFAULT);
        
        // 트랜잭션의 동작을 설정 (트랜잭션이 이미 존재하면 참여, 없으면 새로운 트랜잭션 생성)
        transactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        
        // 트랜젝션 시작
        TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
        RecipeDTO recipe = new RecipeDTO();
        try {
        	recipe = recipeDao.detailRecipe(sqlSession,rno); //게시글 정보
        if(!Objects.isNull(recipe)) {
        	recipe.setViews(recipe.getViews()+1);
        	int result = recipeDao.views(sqlSession,recipe);
        	
        	if(result ==1 ) {
        		transactionManager.commit(status);
        		return recipe;
        	}
        }
        
        }catch(Exception e){
        	transactionManager.rollback(status);
        	throw e;
        }
		return null;
	}

	@Override
	public int deleteRecipe(int rno) {
		
		return recipeDao.deleteRecipe(sqlSession,rno);
	}

	@Override
	public String selectWriter(int rno) {
		
		return recipeDao.selectWriter(sqlSession,rno);
	}

	@Override
	public String selectFileName(int rno) {
		
		return recipeDao.selectFileName(sqlSession,rno);
	}
	
	@Override
	public RecipeDTO selectRecipe(int rno) {
	
		return recipeDao.selectRecipe(sqlSession,rno);
	}

}
