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

	public int addRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe, List<RecipeDTO> recipeList) {
		recipe.setUploadPath(recipeList.get(0).getUploadPath());
		recipe.setUploadName(recipeList.get(0).getUploadName());		
		recipe.setUploadOriginName(recipeList.get(0).getUploadOriginName());
		int addResult1 = sqlSession.insert("recipeMapper.addRecipe",recipe);
		int addResult2 = sqlSession.insert("recipeIngredientMapper.addRecipe",recipe);
		int addResult3 = sqlSession.insert("recipeSequenceMapper.addRecipe",recipe);
		
		int addResult4 = 0;
		for(int i=1; i<recipeList.size(); i++) {
			recipe.setFileName(recipeList.get(i).getFileName());
			recipe.setFilePath(recipeList.get(i).getFilePath());
			recipe.setFileOrigin(recipeList.get(i).getFileOrigin());
			addResult4 = sqlSession.insert("recipeSequencePhotoMapper.addRecipe",recipe);
		}
		if(addResult1==1 && addResult2 ==1 && addResult3 ==1 && addResult4 == 1) {

			return 1;
			
		}else {
			return 0;
		}
//		return sqlSession.insert("recipeMapper.addRecipe",recipe);
	}

	public RecipeDTO detailRecipe(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("recipeMapper.detailRecipe",rno);
	}

	public int views(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.update("recipeMapper.views",recipe);
	}

	public int deleteRecipe(SqlSessionTemplate sqlSession, int rno) {

		return sqlSession.delete("recipeMapper.deleteRecipe",rno);
	}

	public String selectWriter(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("recipeMapper.selectWriter",rno);
	}

	public List<RecipeDTO> selectFileName(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectList("recipeMapper.selectFileName",rno);
	}

	public RecipeDTO selectRecipe(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("recipeIngredientMapper.selectRecipe",rno);
	}
	
	public RecipeDTO editFormRecipe(SqlSessionTemplate sqlSession,int rno) {
		
		return sqlSession.selectOne("recipeMapper.detailRecipe",rno);
	}

	public RecipeDTO seqSelectRecipe(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("recipeSequenceMapper.seqSelectRecipe",rno);
	}

	public List<RecipeDTO> seqPhoSelectRecipe(SqlSessionTemplate sqlSession, int rsno) {
		
		return sqlSession.selectList("recipeSequencePhotoMapper.seqPhoSelectRecipe",rsno);
	}

	public List<RecipeDTO> selectSequenceFileName(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectList("recipeSequencePhotoMapper.selectSequenceFileName",rno);
	}

	public int addComment(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.insert("recipeCommentMapper.addComment",recipe);
	}

	public List<RecipeDTO> selectComment(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectList("recipeCommentMapper.selectComment",rno);
	}
}
