package kr.co.project.free.model.service;

import java.util.List;
import java.util.Objects;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.free.model.dao.FreeDAO;
import kr.co.project.free.model.dto.FreeDTO;

@Service
public class FreeServiceImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FreeDAO freeDao;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	public int enrollFree(FreeDTO free) {
		
		return freeDao.enrollFree(sqlSession,free);
	}

	public int selectListCount(FreeDTO free) {
		
		return freeDao.selectListCount(sqlSession,free);
	}

	public List<FreeDTO> selectListAll(PageInfo pi, FreeDTO free) {
		
		return freeDao.selectListAll(sqlSession,pi,free);
	}

	public FreeDTO freeDetail(int flno) {
		
		// 트랜젝션 기본 설정
        DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
        
        // 트랜젝션의 격리 수준을 기본 설정으로
        transactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_DEFAULT);
        
        // 트랜잭션의 동작을 설정 (트랜잭션이 이미 존재하면 참여, 없으면 새로운 트랜잭션 생성)
        transactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        
        // 트랜젝션 시작
        TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
        FreeDTO free = new FreeDTO();
        try {
        	free = freeDao.freeDetail(sqlSession, flno);
        if(!Objects.isNull(free)) {
        	free.setViews(free.getViews()+1);
        	int freeViews = freeDao.freeViews(sqlSession,free);
        	if(freeViews ==1) {
        		transactionManager.commit(status);
        		return free;        		
        	}
          }
        }catch(Exception e) {
        	transactionManager.rollback(status);
        	throw e;
        }
		return null;
	}

	public int freeDelete(int flno) {
		
		return freeDao.freeDelete(sqlSession,flno);
	}

	public FreeDTO freeEditForm(int flno) {
	
		return freeDao.freeEditForm(sqlSession,flno);
	}

	public int updateFree(FreeDTO free) {
		System.out.println("파일서비스");
		return freeDao.updateFree(sqlSession,free);
	}

	public int updateFreeEmpty(FreeDTO free) {
		
		return freeDao.updateFreeEmpty(sqlSession,free);
	}

	public int addComment(FreeDTO free) {
		
		return freeDao.addComment(sqlSession,free);
	}

	public List<FreeDTO> selectComment(PageInfo pi,int flno) {
		
		return freeDao.selectComment(sqlSession,pi,flno);
	}

	public int commentCount(int flno) {
		
		return freeDao.commentCount(sqlSession,flno);
	}

	
	
	
	
	
}
