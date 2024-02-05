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
}
