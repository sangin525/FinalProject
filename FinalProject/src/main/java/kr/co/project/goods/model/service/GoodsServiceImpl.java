package kr.co.project.goods.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.admin.model.dto.AdminDTO;
import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dao.GoodsDAO;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.dto.GoodsPhotosDTO;

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

	@Override
	public int addGoods(GoodsDTO goodsDTO) {
		return goodsDAO.addGoods(sqlSession, goodsDTO);
	}

	@Override
	public int changeStock(GoodsDTO goodsDTO) {
		return goodsDAO.changeStock(sqlSession, goodsDTO);
	}


	public int addInquiry(GoodsDTO goods) {
		
		return goodsDAO.addInquiry(sqlSession,goods);
	}

	public List<GoodsDTO> selectInquiryList(int g_no) {
		
		return goodsDAO.selectInquiryList(sqlSession,g_no);
	}

	public int adminInquiryCount(GoodsDTO goods) {
		
		return goodsDAO.adminInquiryCount(sqlSession,goods);
	}

	public List<GoodsDTO> adminInquiryList(PageInfo pi, GoodsDTO goods) {
		
		return goodsDAO.adminInquiryList(sqlSession,pi,goods);
	}

	
	
	@Override
	public int manyPhotosGoods(GoodsDTO goodsDTO, List<GoodsPhotosDTO> goodsPhotoList,
			List<GoodsPhotosDTO> detailPhotoList) {

		int goodsSave = goodsDAO.addGoods(sqlSession, goodsDTO);

		int getG_no = goodsDAO.getG_no(sqlSession, goodsDTO);

		for (int i = 0; i < goodsPhotoList.size(); i++) {
			goodsPhotoList.get(i).setG_no(getG_no);
		}
		for (int i = 0; i < detailPhotoList.size(); i++) {
			detailPhotoList.get(i).setG_no(getG_no);
		}

		int photosSave = goodsDAO.addGoodsPhotos(sqlSession, goodsPhotoList);

		int detailPhotos = goodsDAO.addDetailPhotos(sqlSession, detailPhotoList);

		if (goodsSave == 1 && photosSave == 1 && detailPhotos == 1) {
			return 1;
		}

		return 0;
	}

	@Override
	public List<GoodsPhotosDTO> goodsPhotosList(GoodsDTO goodsDTO) {
		return goodsDAO.goodsPhotosList(sqlSession, goodsDTO);
	}

	public List<GoodsDTO> myInquiryList(int m_no) {
		
		return goodsDAO.myInquiryList(sqlSession,m_no);
	}


}
