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
		
		return sqlSession.insert("recipeMapper.addRecipe",recipe);
	}

}
