package kr.co.project.goods.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dto.GoodsDTO;

@Repository
public class GoodsDAO {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.selectListCount");
	}

	public List<GoodsDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, GoodsDTO goods) {
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("goodsMapper.selectListAll", goods, rb);
	}

	public GoodsDTO detailGoods(SqlSessionTemplate sqlSession, int g_no) {
		return sqlSession.selectOne("goodsMapper.detailGoods", g_no);
	}

	public int addGoods(SqlSessionTemplate sqlSession, GoodsDTO goodsDTO) {
		return sqlSession.insert("goodsMapper.addGoods", goodsDTO);
	}

	public int changeStock(SqlSessionTemplate sqlSession, GoodsDTO goodsDTO) {
		return sqlSession.update("goodsMapper.changeStock", goodsDTO);
	}

	public int addInquiry(SqlSessionTemplate sqlSession, GoodsDTO goods) {
		
		return sqlSession.insert("inquiryMapper.addInquiry",goods);
	}

	public List<GoodsDTO> selectInquiryList(SqlSessionTemplate sqlSession, int g_no) {
		
		return sqlSession.selectList("inquiryMapper.selectInquiryList",g_no);
	}

	public int adminInquiryCount(SqlSessionTemplate sqlSession, GoodsDTO goods) {
		
		return sqlSession.selectOne("inquiryMapper.adminInquiryCount",goods);
	}

	public List<GoodsDTO> adminInquiryList(SqlSessionTemplate sqlSession, PageInfo pi, GoodsDTO goods) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		
		return sqlSession.selectList("inquiryMapper.adminInquiryList",goods,rb);
	}

	public int updateAnswerCheck(SqlSessionTemplate sqlSession, GoodsDTO goods) {
		
		return sqlSession.update("inquiryMapper.updateAnswerCheck",goods);
	}
}
