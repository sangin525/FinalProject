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
		
		return sqlSession.selectOne("adminMapper.selectFileName",acno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.update("adminMapper.updateNotice",admin);
	}

	public int updateNoticeEmpty(SqlSessionTemplate sqlSession, AdminDTO admin) {
		
		return sqlSession.update("adminMapper.updateNoticeEmpty",admin);
	}

}
