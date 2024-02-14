package kr.co.project.foodMate.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.foodMate.model.dto.FoodMateDTO;

@Repository
public class FoodMateDAO {


	public int enrollFoodMate(SqlSessionTemplate sqlSession, FoodMateDTO food) {		
		return sqlSession.insert("foodMateMapper.enrollFoodMate",food);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, FoodMateDTO food) {
		return sqlSession.selectOne("foodMateMapper.selectListCount",food);
	}

	public List<FoodMateDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, FoodMateDTO food) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		
		return sqlSession.selectList("foodMateMapper.selectListAll",food,rb);
	}

	public FoodMateDTO detailFoodMate(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectOne("foodMateMapper.detailFoodMate",fno);
	}

	public int views(SqlSessionTemplate sqlSession, FoodMateDTO food) {
		
		return sqlSession.update("foodMateMapper.views",food);
	}

	public FoodMateDTO editFormBoard(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectOne("foodMateMapper.detailFoodMate",fno);
	}

	public String selectFileName(SqlSessionTemplate sqlSession, int fno) {

		return sqlSession.selectOne("foodMateMapper.selectFileName",fno);
	}

	public int editBoard(SqlSessionTemplate sqlSession, FoodMateDTO food) {

		return sqlSession.update("foodMateMapper.editBoard",food);
	}

	public int editBoardEmptyUpload(SqlSessionTemplate sqlSession, FoodMateDTO food) {

		return sqlSession.update("foodMateMapper.editBoardEmptyUpload",food);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.update("foodMateMapper.deleteBoard",fno);
	}

	public int addComment(SqlSessionTemplate sqlSession, FoodMateDTO food) {
		
		return sqlSession.insert("foodMateCommentMapper.addComment",food);
	}

	public List<FoodMateDTO> selectComment(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectList("foodMateCommentMapper.selectComment",fno);
	}

	public int commentCount(SqlSessionTemplate sqlSession, int fno) {
		
		return sqlSession.selectOne("foodMateCommentMapper.commentCount",fno);
	}
	
	
}
