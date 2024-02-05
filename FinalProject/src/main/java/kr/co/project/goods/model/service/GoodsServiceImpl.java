package kr.co.project.goods.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dao.GoodsDAO;
import kr.co.project.goods.model.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public int selectListCount() {
		return goodsDAO.selectListCount(sqlSession);
	}

	@Override
	public List<GoodsDTO> selectListAll(PageInfo pi, GoodsDTO goods) {
		return goodsDAO.selectListAll(sqlSession, pi, goods);
	}

	@Override
	public GoodsDTO detailGoods(int g_no) {
		return goodsDAO.detailGoods(sqlSession, g_no);
	}
}
