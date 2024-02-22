package kr.co.project.goods.model.service;

import java.util.List;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.goods.model.dto.GoodsDTO;

public interface GoodsService {
	// 전체 게시글 수 구하기
	int selectListCount();
	
	//상품 리스트 불러오기
	List<GoodsDTO> selectListAll(PageInfo pi, GoodsDTO goods);
	
	//상세페이지 이동
	GoodsDTO detailGoods(int gno);

	int addGoods(GoodsDTO goodsDTO);

	int changeStock(GoodsDTO goodsDTO);
}
