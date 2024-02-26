package kr.co.project.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.admin.model.dto.AdminDTO;
import kr.co.project.common.pageing.PageInfo;

@Repository
public class AdminDAO {

	public int enrollNotice(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.insert("adminMapper.enrollNotice",admin);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.selectOne("adminMapper.selectListCount",admin);
	}

	public List<AdminDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, AdminDTO admin) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		
		return sqlSession.selectList("adminMapper.selectListAll",admin,rb);
	}

	public int enrollEvent(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.insert("eventMapper.enrollEvent",admin);
	}

	public int eventListCount(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.selectOne("eventMapper.eventListCount",admin);
	}

	public List<AdminDTO> eventListAll(SqlSessionTemplate sqlSession, PageInfo pi, AdminDTO admin) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		
		return sqlSession.selectList("eventMapper.eventListAll",admin,rb);
	}

	public String selectFileName(SqlSessionTemplate sqlSession, int acno) {
		System.out.println("다오");
		return sqlSession.selectOne("adminMapper.selectFileName",acno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, AdminDTO admin) {
		System.out.println("다오");
		return sqlSession.update("adminMapper.updateNotice",admin);
	}

	public int updateNoticeEmpty(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.update("adminMapper.updateNoticeEmpty",admin);
	}

	public AdminDTO detailNotice(SqlSessionTemplate sqlSession, int acno) {
		
		return sqlSession.selectOne("adminMapper.detailNotice",acno);
	}

	public int noticeViews(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.update("adminMapper.noticeViews",admin);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int acno) {
		
		return sqlSession.update("adminMapper.deleteNotice",acno);
	}

	public AdminDTO detailEvent(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.selectOne("eventMapper.detailEvent",eno);
	}

	public int eventViews(SqlSessionTemplate sqlSession, AdminDTO event) {
		
		return sqlSession.update("eventMapper.eventViews",event);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.update("eventMapper.deleteEvent",eno);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.update("eventMapper.updateEvent",admin);
	}

	public int updateEventEmpty(SqlSessionTemplate sqlSession, AdminDTO admin) {
	
		return sqlSession.update("eventMapper.updateEventEmpty",admin);
	}

	public int addNoticeComment(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.insert("adminCommentMapper.addNoticeComment",admin);
	}

	public List<AdminDTO> selectNoticeComment(SqlSessionTemplate sqlSession,PageInfo pi,int acno) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("adminCommentMapper.selectNoticeComment",acno,rb);
	}

	public int ncommentCount(SqlSessionTemplate sqlSession, int acno) {
		
		return sqlSession.selectOne("adminCommentMapper.ncommentCount", acno);
	}

	public int addEventComment(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.insert("eventCommentMapper.addEventComment",admin);
	}

	public List<AdminDTO> selectEventComment(SqlSessionTemplate sqlSession,PageInfo pi, int eno) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());	
		return sqlSession.selectList("eventCommentMapper.selectEventComment",eno,rb);
	}

	public int ecommentCount(SqlSessionTemplate sqlSession, int eno) {
		
		return sqlSession.selectOne("eventCommentMapper.ecommentCount",eno);
	}

	public int addAnswer(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.insert("inquiryAnswerMapper.addAnswer",admin);
	}

	public AdminDTO adminAnswerList(SqlSessionTemplate sqlSession, int i_no) {
		return sqlSession.selectOne("inquiryAnswerMapper.adminAnswerList",i_no);
	}

	
}
