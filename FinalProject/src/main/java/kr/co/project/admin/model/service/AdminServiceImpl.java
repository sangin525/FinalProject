package kr.co.project.admin.model.service;

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

import kr.co.project.admin.model.dao.AdminDAO;
import kr.co.project.admin.model.dto.AdminDTO;
import kr.co.project.common.pageing.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO adminDao;
	
	@Autowired
	private PlatformTransactionManager transactionManager;	
	
	
	
	public int enrollNotice(AdminDTO admin) {
		
		return adminDao.enrollNotice(sqlSession,admin);
	}

	public int selectListCount(AdminDTO admin) {
		
		return adminDao.selectListCount(sqlSession,admin);
	}

	public List<AdminDTO> selectListAll(PageInfo pi, AdminDTO admin) {

		return adminDao.selectListAll(sqlSession,pi,admin);
	}

	public int enrollEvent(AdminDTO admin) {
		
		return adminDao.enrollEvent(sqlSession,admin);
	}

	public int eventListCount(AdminDTO admin) {
		
		return adminDao.eventListCount(sqlSession,admin);
	}

	public List<AdminDTO> eventListAll(PageInfo pi, AdminDTO admin) {
		
		return adminDao.eventListAll(sqlSession,pi,admin);
	}

	public String selectFileName(int acno) {
		
		return adminDao.selectFileName(sqlSession,acno);
	}

	public int updateNotice(AdminDTO admin) {
		System.out.println("서비스");
		return adminDao.updateNotice(sqlSession,admin);
	}

	public int updateNoticeEmpty(AdminDTO admin) {
		System.out.println("서비스");
		return adminDao.updateNoticeEmpty(sqlSession,admin);
	}
	
	@Transactional
	public AdminDTO detailNotice(int acno) {
		
		// 트랜젝션 기본 설정
        DefaultTransactionDefinition transactionDefinition1 = new DefaultTransactionDefinition();
        
        // 트랜젝션의 격리 수준을 기본 설정으로
        transactionDefinition1.setIsolationLevel(TransactionDefinition.ISOLATION_DEFAULT);
        
        // 트랜잭션의 동작을 설정 (트랜잭션이 이미 존재하면 참여, 없으면 새로운 트랜잭션 생성)
        transactionDefinition1.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        
        // 트랜젝션 시작
        TransactionStatus status1 = transactionManager.getTransaction(transactionDefinition1);
		
        AdminDTO admin = new AdminDTO();
        try {
        	admin = adminDao.detailNotice(sqlSession, acno);
        if(!Objects.isNull(admin)) {
        	admin.setViews(admin.getViews()+1);
        	int result = adminDao.noticeViews(sqlSession,admin);
        	
        	if(result ==1 ) {
        		transactionManager.commit(status1);
        		return admin;
        	}
        }
        }catch(Exception e) {
        	transactionManager.rollback(status1);
        	throw e;
        }
		return null;
	}

	public int deleteNotice(int acno) {
		
		return adminDao.deleteNotice(sqlSession,acno);
	}
	@Transactional
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
        	event = adminDao.detailEvent(sqlSession,eno);
        if(!Objects.isNull(event)) {
        	System.out.println("게시글 들어옴");
        	event.setE_views(event.getE_views()+1);
        	int eventResult = adminDao.eventViews(sqlSession,event);
        	
        	if(eventResult == 1) {
        		System.out.println("게시글 조회수 증가");
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

	public int deleteEvent(int eno) {
		
		return adminDao.deleteEvent(sqlSession,eno);
	}


	public int updateEvent(AdminDTO admin) {
		
		return adminDao.updateEvent(sqlSession,admin);
	}

	public int updateEventEmpty(AdminDTO admin) {
		
		return adminDao.updateEventEmpty(sqlSession,admin);
	}

	public int addNoticeComment(AdminDTO admin) {
		
		return adminDao.addNoticeComment(sqlSession,admin);
	}

	public List<AdminDTO> selectNoticeComment(int acno) {
		
		return adminDao.selectNoticeComment(sqlSession,acno);
	}

	public int ncommentCount(int acno) {

		return adminDao.ncommentCount(sqlSession,acno);
	}

	public int addEventComment(AdminDTO admin) {
		
		return adminDao.addEventComment(sqlSession,admin);
	}

	public List<AdminDTO> selectEventComment(int eno) {
		
		return adminDao.selectEventComment(sqlSession,eno);
	}

	public int ecommentCount(int eno) {
		
		return adminDao.ecommentCount(sqlSession,eno);
	}

	
	

	
	
	
	
}
