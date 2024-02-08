package kr.co.project.foodMate.model.service;

import java.util.List;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.foodMate.model.dto.FoodMateDTO;

public interface FoodMateService {

	int enrollFoodMate(FoodMateDTO food);
	
	int selectListCount(FoodMateDTO food);
	
	List<FoodMateDTO> selectListAll(PageInfo pi,FoodMateDTO food);
	
	FoodMateDTO detailFoodMate(int fno);
	
	FoodMateDTO editFormBoard(int fno);
}
