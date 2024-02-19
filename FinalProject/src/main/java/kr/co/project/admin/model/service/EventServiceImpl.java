package kr.co.project.admin.model.service;

import java.util.List;
import java.util.Objects;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.co.project.admin.model.dao.AdminDAO;
import kr.co.project.admin.model.dto.AdminDTO;
import kr.co.project.common.pageing.PageInfo;

@Service
public class EventServiceImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	public AdminDTO detailEvent(int eno) {
		
		// 트랜젝션 기본 설정
        DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
        
        // 트랜젝션의 격리 수준을 기본 설정으로
        transactionDefinition.setIsolationLevel(TransactionDefinition.ISOLATION_DEFAULT);
        
        // 트랜잭션의 동작을 설정 (트랜잭션이 이미 존재하면 참여, 없으면 새로운 트랜잭션 생성)
        transactionDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        
        // 트랜젝션 시작
        TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
        AdminDTO event = new AdminDTO();
        try {
        	event = adminDao.detailEvent(sqlSession, eno);
        if(!Objects.isNull(event)) {
        	event.setE_views(event.getE_views()+1);
        	int result = adminDao.eventViews(sqlSession,event);
        	
        	if(result ==1 ) {
        		System.out.println("서비스 호출됨");
        		transactionManager.commit(status);
        		return event;
        	}
        }
        }catch(Exception e) {
        	transactionManager.rollback(status);
        	throw e;
        }
		return null;
	}
	
}
