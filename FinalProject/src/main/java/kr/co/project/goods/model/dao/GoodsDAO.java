package kr.co.project.goods.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.dto.GoodsPhotosDTO;

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

	public int addGoodsPhotos(SqlSessionTemplate sqlSession, List<GoodsPhotosDTO> goodsPhotoList) {

		int check = goodsPhotoList.size();

		int result = 0;

		for (int i = 0; i < goodsPhotoList.size(); i++) {
			int plus = sqlSession.insert("goodsMapper.addGoodsPhotos", goodsPhotoList.get(i));
			result += plus;
		}

		if (check == result) {
			return 1;
		} else {
			return 0;
		}

	}

	public int addDetailPhotos(SqlSessionTemplate sqlSession, List<GoodsPhotosDTO> detailPhotoList) {
		int check = detailPhotoList.size();

		int result = 0;

		for (int i = 0; i < detailPhotoList.size(); i++) {
			int plus = sqlSession.insert("goodsMapper.addDetailPhotos", detailPhotoList.get(i));
			result += plus;
		}

		if (check == result) {
			return 1;
		} else {
			return 0;
		}

	}

	public int getG_no(SqlSessionTemplate sqlSession, GoodsDTO goodsDTO) {
		return sqlSession.selectOne("goodsMapper.getG_no", goodsDTO);
	}

	public List<GoodsPhotosDTO> goodsPhotosList(SqlSessionTemplate sqlSession, GoodsDTO goodsDTO) {
		return sqlSession.selectList("goodsMapper.goodsPhotosList", goodsDTO);
	}

	public List<GoodsDTO> myInquiryList(SqlSessionTemplate sqlSession, int m_no) {
	
		return sqlSession.selectList("inquiryMapper.myInquiryList",m_no);
	}


}
