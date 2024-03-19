package kr.co.project.goods.model.service;

import java.util.List;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.dto.GoodsPhotosDTO;

public interface GoodsService {
	// 전체 게시글 수 구하기
	int selectListCount();

	// 상품 리스트 불러오기
	List<GoodsDTO> selectListAll(PageInfo pi, GoodsDTO goods);

	// 상세페이지 이동
	GoodsDTO detailGoods(int gno);

	int addGoods(GoodsDTO goodsDTO);

	int changeStock(GoodsDTO goodsDTO);

	int manyPhotosGoods(GoodsDTO goodsDTO, List<GoodsPhotosDTO> goodsPhotoList, List<GoodsPhotosDTO> detailPhotoList);

	List<GoodsPhotosDTO> goodsPhotosList(GoodsDTO goodsDTO);
	
	// 상품삭제
	int deleteProduct(GoodsDTO goodsDTO);
}
