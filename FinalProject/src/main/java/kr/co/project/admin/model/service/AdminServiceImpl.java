package kr.co.project.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

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
		
		return adminDao.updateNotice(sqlSession,admin);
	}

	public int updateNoticeEmpty(AdminDTO admin) {
		
		return adminDao.updateNoticeEmpty(sqlSession,admin);
	}

}
