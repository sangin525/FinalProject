package kr.co.project.recipe.model.service;

import java.util.List;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.recipe.model.dto.RecipeDTO;

public interface RecipeService {
	
	int selectListCount(RecipeDTO recipe);
	
	List<RecipeDTO> selectListAll(PageInfo pi,RecipeDTO recipe);

	int addRecipe(RecipeDTO recipe, List<RecipeDTO> recipeList);
	
	RecipeDTO detailRecipe(int rno);
	
//	int deleteRecipe(int rno);
	
//	String selectWriter(int rno);
	
	List<RecipeDTO> selectFileName(int rno);
	
	RecipeDTO selectRecipe(int rno);
	
}
