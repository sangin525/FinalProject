package kr.co.project.free.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.free.model.dto.FreeDTO;

@Repository
public class FreeDAO {

	public int enrollFree(SqlSessionTemplate sqlSession, FreeDTO free) {
		
		return sqlSession.insert("freeMapper.enrollFree",free);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, FreeDTO free) {
		
		return sqlSession.selectOne("freeMapper.selectListCount",free);
	}

	public List<FreeDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, FreeDTO free) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		
		return sqlSession.selectList("freeMapper.selectListAll",free,rb);
	}

	public FreeDTO freeDetail(SqlSessionTemplate sqlSession, int flno) {
		
		return sqlSession.selectOne("freeMapper.freeDetail",flno);
	}

	public int freeViews(SqlSessionTemplate sqlSession, FreeDTO free) {
		
		return sqlSession.update("freeMapper.freeViews",free);
	}

	public int freeDelete(SqlSessionTemplate sqlSession, int flno) {
		
		return sqlSession.update("freeMapper.freeDelete",flno);
	}

	public FreeDTO freeEditForm(SqlSessionTemplate sqlSession, int flno) {
		
		return sqlSession.selectOne("freeMapper.freeDetail",flno);
	}

	public int updateFree(SqlSessionTemplate sqlSession, FreeDTO free) {
		System.out.println("파일다오");
		return sqlSession.update("freeMapper.updateFree",free);
	}

	public int updateFreeEmpty(SqlSessionTemplate sqlSession, FreeDTO free) {
		
		return sqlSession.update("freeMapper.updateFreeEmpty",free);
	}

	public int addComment(SqlSessionTemplate sqlSession, FreeDTO free) {
		
		return sqlSession.insert("freeCommentMapper.addComment",free);
	}

	public List<FreeDTO> selectComment(SqlSessionTemplate sqlSession,PageInfo pi,int flno) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());		
		return sqlSession.selectList("freeCommentMapper.selectComment",flno,rb);
	}

	public int commentCount(SqlSessionTemplate sqlSession, int flno) {
		
		return sqlSession.selectOne("freeCommentMapper.commentCount",flno);
	}

}
