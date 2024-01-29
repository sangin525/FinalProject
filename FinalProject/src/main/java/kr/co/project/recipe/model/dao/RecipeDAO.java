package kr.co.project.recipe.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.recipe.model.dto.RecipeDTO;

@Repository
public class RecipeDAO {

	public int selectListCount(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectOne("recipeMapper.selectListCount",recipe);
	}

	public List<RecipeDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, RecipeDTO recipe) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("recipeMapper.selectListAll",recipe,rb);
	}

	public int addRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		int addResult1 = sqlSession.insert("recipeMapper.addRecipe",recipe);
		int addResult2 = sqlSession.insert("recipeIngredientMapper.addRecipe",recipe);
		int addResult3 = sqlSession.insert("recipeSequenceMapper.addRecipe",recipe);
		if(addResult1==1 && addResult2 ==1 && addResult3 ==1) {
			System.out.println(recipe);
			return 1;
			
		}else {
			return 0;
		}
//		return sqlSession.insert("recipeMapper.addRecipe",recipe);
	}

}
