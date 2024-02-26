package kr.co.project.recipe.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
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

	public int deleteRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {

		return sqlSession.delete("recipeMapper.deleteRecipe",recipe);
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

	public List<RecipeDTO> selectComment(SqlSessionTemplate sqlSession,PageInfo pi,int rno) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());	
		
		return sqlSession.selectList("recipeCommentMapper.selectComment",rno,rb);
	}

	public int commentCount(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("recipeCommentMapper.commentCount",rno);
	}

	public int myRecipeCount(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectOne("recipeMapper.myRecipeCount",recipe);
	}

	public List<RecipeDTO> selectMyRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectList("recipeMapper.selectMyRecipe",recipe);
	}

	public List<RecipeDTO> newList(SqlSessionTemplate sqlSession, PageInfo pi, RecipeDTO recipe) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());		
		return sqlSession.selectList("recipeMapper.newList",recipe,rb);
	}

	public List<RecipeDTO> viewList(SqlSessionTemplate sqlSession, PageInfo pi, RecipeDTO recipe) {
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());	
		return sqlSession.selectList("recipeMapper.viewList",recipe,rb);
	}

	public double avgComment(SqlSessionTemplate sqlSession,RecipeDTO item) {
		
		return sqlSession.selectOne("recipeCommentMapper.avgComment",item);
	}

	public List<RecipeDTO> rankingList(SqlSessionTemplate sqlSession, PageInfo pi, RecipeDTO recipe) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("recipeMapper.rankingList",recipe,rb);
	}

	public int countComment(SqlSessionTemplate sqlSession, RecipeDTO item) {
		
		return sqlSession.selectOne("recipeCommentMapper.countComment",item);
	}

	public int scrapRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.insert("recipeScrapMapper.scrapRecipe",recipe);
	}

	public int scrapListCount(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectOne("recipeScrapMapper.scrapListCount",recipe);
	}

	public List<RecipeDTO> scrapRecipeList(SqlSessionTemplate sqlSession, RecipeDTO recipe, PageInfo pi) {
	
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("recipeScrapMapper.scrapRecipeList",recipe,rb);
	}

	public List<RecipeDTO> selectScrapRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe, PageInfo pi) {
		
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();		
		RowBounds rb = new RowBounds(offset,pi.getBoardLimit());
		return sqlSession.selectList("recipeMapper.selectScrapRecipe",recipe,rb);
	}

	public List<RecipeDTO> selectPhotoList(SqlSessionTemplate sqlSession, int rpno) {
	
		return sqlSession.selectList("recipeSequencePhotoMapper.selectPhotoList",rpno);
	}

	public int editRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		int recipeUp = sqlSession.update("recipeMapper.editRecipe",recipe);
		int recipeingUp = sqlSession.update("recipeIngredientMapper.editRecipe",recipe);
		int recipeseqUp = sqlSession.update("recipeSequenceMapper.editRecipe",recipe);
		
		// for  --> i=1 i<sequenceFileName.size()
		// recipeDTO에 setter로 해당 인덱스의 fileName, fileOrigin, filePath
		
		// recipe.setFileName(sequenceFileName.get(i).getFileName())
		int recipeseqPhoUp = sqlSession.update("recipeSequencePhotoMapper.editRecipe",recipe);
		
		if(recipeUp == 1 && recipeingUp == 1 && recipeseqUp == 1 && recipeseqPhoUp == 1) {
			
			System.out.println("업뎃완료");
		}
		return 1;
	}

	public int recentRecipe(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.insert("recipeRecentMapper.recentRecipe",recipe);
	}

	public List<RecipeDTO> recentRecipeList(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectList("recipeRecentMapper.recentRecipeList",recipe);
	}

	public int viewSum(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("recipeMapper.viewSum",mno);
	}

	public List<RecipeDTO> rankingListMain(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectList("recipeMapper.rankingListMain",recipe);
	}

	public List<RecipeDTO> newListMain(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectList("recipeMapper.newListMain",recipe);
	}

	public int mbcomCount(SqlSessionTemplate sqlSession, RecipeDTO br) {
		
		return sqlSession.selectOne("recipeCommentMapper.mbcomCount",br);
	}

	public int mncomCount(SqlSessionTemplate sqlSession, RecipeDTO nr) {
		
		return sqlSession.selectOne("recipeCommentMapper.mncomCount",nr);
	}

	public List<RecipeDTO> selectRecentRecipe(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectList("recipeRecentMapper.selectRecentRecipe",mno);
	}

	public RecipeDTO recentSelectRecipe(SqlSessionTemplate sqlSession, int rno) {

		return sqlSession.selectOne("recipeMapper.recentSelectRecipe",rno);
	}

	public int scrapRecipeDelete(SqlSessionTemplate sqlSession, int frno) {
		
		return sqlSession.update("recipeScrapMapper.scrapRecipeDelete",frno);
	}

	public List<RecipeDTO> searchList(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		
		return sqlSession.selectList("recipeSearchMapper.searchList",recipe);
	}

	public int searchUpdate(SqlSessionTemplate sqlSession, String searchResult) {
		
		return sqlSession.update("recipeSearchMapper.searchUpdate",searchResult);
	}

	public int searchInsert(SqlSessionTemplate sqlSession, String searchResult) {
		
		return sqlSession.insert("recipeSearchMapper.searchInsert",searchResult);
	}

	public int memberNickNameUpdate(SqlSessionTemplate sqlSession, RecipeDTO recipe) {
		return sqlSession.update("recipeMapper.memberNickNameUpdate",recipe);
	}

	
	








}
