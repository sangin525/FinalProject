package kr.co.project.recipe.model.service;

import java.util.List;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.recipe.model.dto.RecipeDTO;

public interface RecipeService {
	
	int selectListCount(RecipeDTO recipe);
	
	List<RecipeDTO> selectListAll(PageInfo pi,RecipeDTO recipe);

	int addRecipe(RecipeDTO recipe);
}
