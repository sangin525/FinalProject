package kr.co.project.foodMate.model.service;

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
import kr.co.project.foodMate.model.dao.FoodMateDAO;
import kr.co.project.foodMate.model.dto.FoodMateDTO;

@Service
public class FoodMateServiceImpl implements FoodMateService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FoodMateDAO foodMateDao;

	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public int enrollFoodMate(FoodMateDTO food) {		
		return foodMateDao.enrollFoodMate(sqlSession,food);
	}

	@Override
	public int selectListCount(FoodMateDTO food) {
		return foodMateDao.selectListCount(sqlSession,food);
	}

	@Override
	public List<FoodMateDTO> selectListAll(PageInfo pi, FoodMateDTO food) {		
		return foodMateDao.selectListAll(sqlSession,pi,food);
	}
	
	@Transactional
	@Override
	public FoodMateDTO detailFoodMate(int fno) {		
		// 트랜젝션 기본 설정
        DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
        // 트랜젝션의 격리 수준을 기본 설정으로
        transactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_DEFAULT);
        // 트랜잭션의 동작을 설정 (트랜잭션이 이미 존재하면 참여, 없으면 새로운 트랜잭션 생성)
        transactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        
        // 트랜젝션 시작
        TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
        FoodMateDTO food = new FoodMateDTO();      
        try {
        	food = foodMateDao.detailFoodMate(sqlSession,fno);
        if(!Objects.isNull(food)) {
        	food.setViews(food.getViews()+1);
        	int result = foodMateDao.views(sqlSession,food);
        	
        	if(result == 1) {
        		transactionManager.commit(status);
        		return food;
        	}
        }
        	
        }catch(Exception e){
        	transactionManager.rollback(status);
        	throw e;
        }
        
		return null;
	}

	@Override
	public FoodMateDTO editFormBoard(int fno) {
		return foodMateDao.editFormBoard(sqlSession,fno);
	}

	public String selectFileName(int fno) {		
		return foodMateDao.selectFileName(sqlSession,fno);
	}

	public int editBoard(FoodMateDTO food) {	
		return foodMateDao.editBoard(sqlSession,food);
	}

	public int editBoardEmptyUpload(FoodMateDTO food) {		
		return foodMateDao.editBoardEmptyUpload(sqlSession,food);
	}

	public int deleteBoard(int fno) {		
		return foodMateDao.deleteBoard(sqlSession,fno);
	}

	public int addComment(FoodMateDTO food) {
		return foodMateDao.addComment(sqlSession,food);
	}

	public List<FoodMateDTO> selectComment(PageInfo pi,int fno) {		
		return foodMateDao.selectComment(sqlSession,pi,fno);
	}

	public int commentCount(int fno) {		
		return foodMateDao.commentCount(sqlSession,fno);
	}

}
