package kr.co.project.recipe.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;


import kr.co.project.common.pageing.PageInfo;
import kr.co.project.member.model.dao.MemberDAO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dao.RecipeDAO;
import kr.co.project.recipe.model.dto.RecipeDTO;

@Service
public class RecipeServiceImpl implements RecipeService{

//		private static final String SESSION_KEY= "recipe";
//		
//		public List<RecipeDTO> getReadRecipe(HttpSession session){
//			List<RecipeDTO> readRecipe = (List<RecipeDTO>) session.getAttribute(SESSION_KEY);
//			
//			if(readRecipe==null) {
//				readRecipe = new ArrayList<>();
//			}
//			return readRecipe;
//		}
//		
//		public void addReadRecipe(HttpSession session,RecipeDTO recipe) {
//			List<RecipeDTO> readRecipe = getReadRecipe(session);
//			
//			readRecipe.removeIf(r -> r.getPostId().equals(recipe.getPostId()));
//		
//			readRecipe.add(0,recipe);
//			
//			session.setAttribute(SESSION_KEY, readRecipe);
//		}
		
//		private List<RecipeDTO> recipe = new ArrayList<>();
//		
//		public List<RecipeDTO> getRecipe(){
//			return recipe;
//		}
//		
//		public void addRecipe(RecipeDTO reicpe) {
//			
//			recipe.removeIf(r -> r.getPostId().equals(reicpe.getPostId()));
//			
//			recipe.add(0,reicpe);
//			
//			if(recipe.size()>MAX_RECENT_POSTS) {
//				recipe.remove(MAX_RECENT_POSTS);
//			}
//		}
		
		
		
	// DB 연결에 관련된 템플릿
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Autowired 
		private RecipeDAO recipeDao;
		
		@Autowired
		private MemberDAO memberDao;
		
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
	public int addRecipe(RecipeDTO recipe, List<RecipeDTO> recipeList, MemberDTO member) {
		
		int result = memberDao.plusRecipeCount(sqlSession, recipe.getMno());
		int result2 = memberDao.selectMember2(sqlSession, member);
		member.setRecipeCount(result2);
		System.out.println(result2);
		int result3 = recipeDao.addRecipe(sqlSession, recipe, recipeList);
		
		int result4 = memberDao.gradeCheck(sqlSession,member);
		if(result==1 && result2==1 && result3==1 && result4==1) {
		
			
		}
		return 1;
		
		
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

	
	public int deleteRecipe(RecipeDTO recipe) {
		int recipeDelete = recipeDao.deleteRecipe(sqlSession,recipe);
		int recipeCountMinus = memberDao.minusRecipeCount(sqlSession, recipe);
		if(recipeDelete==1 && recipeCountMinus==1) {
			System.out.println("성공");
		}
		//		return recipeDao.deleteRecipe(sqlSession,rno);
		return 1;
	}

	
	public String selectWriter(int rno) {
		
		return recipeDao.selectWriter(sqlSession,rno);
	}

	
	@Override
	public RecipeDTO selectRecipe(int rno) {
	
		return recipeDao.selectRecipe(sqlSession,rno);
	}
	
	public RecipeDTO editFormRecipe(int idx) {
		
		return recipeDao.detailRecipe(sqlSession, idx);
	}

	public RecipeDTO seqSelectRecipe(int rno) {
		
		return recipeDao.seqSelectRecipe(sqlSession,rno);
	}

	public List<RecipeDTO> seqPhoSelectRecipe(int rsno) {
		
		return recipeDao.seqPhoSelectRecipe(sqlSession,rsno);
	}

	public List<RecipeDTO> selectSequenceFileName(int rno) {
		
		return recipeDao.selectSequenceFileName(sqlSession,rno);
	}

	public int addComment(RecipeDTO recipe) {
		
		return recipeDao.addComment(sqlSession,recipe);
	}

	public List<RecipeDTO> selectComment(int rno) {
		
		return recipeDao.selectComment(sqlSession,rno);
	}

	public int commentCount(int rno) {
		
		return recipeDao.commentCount(sqlSession,rno);
	}

	public int myRecipeCount(RecipeDTO recipe) {
		
		return recipeDao.myRecipeCount(sqlSession,recipe);
	}

	public List<RecipeDTO> selectMyRecipe(PageInfo pi, RecipeDTO recipe) {
		
		return recipeDao.selectMyRecipe(sqlSession,recipe);
	}

	public List<RecipeDTO> newList(PageInfo pi, RecipeDTO recipe) {
		
		return recipeDao.newList(sqlSession,pi,recipe);
	}

	public List<RecipeDTO> viewList(PageInfo pi, RecipeDTO recipe) {
		
		return recipeDao.viewList(sqlSession,pi,recipe);
	}

	public double avgComment(RecipeDTO item) {
		
		return recipeDao.avgComment(sqlSession,item);
	}

	public List<RecipeDTO> rankingList(PageInfo pi, RecipeDTO recipe) {
		
		return recipeDao.rankingList(sqlSession,pi,recipe);
	}


	public int countComment(RecipeDTO item) {
		
		return recipeDao.countComment(sqlSession,item);
	}

	public int scrapRecipe(RecipeDTO recipe) {
		
		return recipeDao.scrapRecipe(sqlSession,recipe);
	}

	public int scrapListCount(RecipeDTO recipe) {
		
		return recipeDao.scrapListCount(sqlSession,recipe);
	}

	public List<RecipeDTO> scrapRecipeList(RecipeDTO recipe, PageInfo pi) {
		
		return recipeDao.scrapRecipeList(sqlSession,recipe,pi);
	}

	public List<RecipeDTO> selectScrapRecipe(RecipeDTO recipe, PageInfo pi) {
		
		return recipeDao.selectScrapRecipe(sqlSession,recipe,pi);
	}
		
	@Override
	public List<RecipeDTO> selectFileName(int rno) {
		
		return recipeDao.selectFileName(sqlSession,rno);
	}

	public List<RecipeDTO> selectPhotoList(int rpno) {
		
		return recipeDao.selectPhotoList(sqlSession,rpno);
	}

	public int editRecipe(RecipeDTO recipe) {
		
		return recipeDao.editRecipe(sqlSession,recipe);
	}

	public int editRecipeEmpty(RecipeDTO recipe) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int recentRecipe(RecipeDTO recipe) {
		
		return recipeDao.recentRecipe(sqlSession,recipe);
	}

	public List<RecipeDTO> recentRecipeList(RecipeDTO recipe) {
		
		return recipeDao.recentRecipeList(sqlSession,recipe);
	}

	public int viewSum(int mno) {

		return recipeDao.viewSum(sqlSession,mno);
	}

//	public List<RecipeDTO> rankingList(RecipeDTO recipe) {
//		
//		return recipeDao.rankingList(sqlSession, null, recipe);
//	}

	public List<RecipeDTO> rankingListMain(RecipeDTO recipe) {
		
		return recipeDao.rankingListMain(sqlSession,recipe);
	}

	public List<RecipeDTO> newListMain(RecipeDTO recipe) {
		
		return recipeDao.newListMain(sqlSession,recipe);
	}

	public int mbcomCount(RecipeDTO br) {
		
		return recipeDao.mbcomCount(sqlSession,br);
	}

	public int mncomCount(RecipeDTO nr) {
		
		return recipeDao.mncomCount(sqlSession,nr);
	}

	public List<RecipeDTO> selectRecentRecipe(int mno) {
		
		return recipeDao.selectRecentRecipe(sqlSession,mno);
	}

	public RecipeDTO recentSelectRecipe(int rno) {
		
		return recipeDao.recentSelectRecipe(sqlSession,rno);
	}

	

	
	

	
	

}
