package kr.co.project.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.session.SessionMessage;
import kr.co.project.common.upload.MultiUploadFile;
import kr.co.project.common.validation.DataValidation;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;
import kr.co.project.recipe.model.dto.RecipeDTO;
import kr.co.project.recipe.model.service.RecipeServiceImpl;

@Controller
@RequestMapping("/recipe")

public class RecipeController {
	
	
	private static final String BOARD_NAME="recipe\\";
	
	@Autowired
	private RecipeServiceImpl recipeService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private SessionMessage sessionMessage;
	
	@GetMapping("/rankingRecipe.do")
	public String rankingRecipe(RecipeDTO recipe,@RequestParam(value="cpage",defaultValue="1")int cpage,
									Model model,
									HttpSession session) {
		
		int listCount = recipeService.selectListCount(recipe);
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount-(cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		List<RecipeDTO> list = recipeService.selectListAll(pi, recipe);
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);			
		}
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		System.out.println("접근성공");
		
		return "ranking/recipe";		
	}
		
	@GetMapping("/categoryList.do")
	public String RecipeCategoryList(RecipeDTO recipe,@RequestParam(value="cpage",defaultValue="1")int cpage,
									Model model,
									HttpSession session) {
//		if(LoginCheck.loginCheck(session)) {
		int listCount = recipeService.selectListCount(recipe);
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<RecipeDTO> list = recipeService.selectListAll(pi,recipe);
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
		}
		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		System.out.println("접근성공");
			return "category/category";
		
//		}else{
//			System.out.println("접근실패");
//			return "member/login";
//		}	
	}


	@GetMapping("/addRecipeForm.do")
	public String addRecipeForm() {
		return "member/addRecipe";
	}
	
	@PostMapping("/addRecipe.do")
	public String addRecipe(RecipeDTO recipe,MemberDTO member,MultipartFile upload, List<MultipartFile> multiFileList,
					HttpSession session,Model model)throws IllegalStateException, IOException {
					
		recipe.setMemberNickName((String)session.getAttribute("memberNickName"));
		recipe.setMno((int) session.getAttribute("mno"));
		System.out.println(recipe.getMemberNickName());
		// 제목 길이 검사
		boolean titleLengthCheck = DataValidation.CheckLength(recipe.getTitle(), 150);
		
		// 제목이 비어있는지 검사
		boolean titleEmptyCheck = DataValidation.emptyCheck(recipe.getTitle());
		
		if(titleLengthCheck && titleEmptyCheck) {
			
//		if(!upload.isEmpty()) {
//			UploadFile.uploadMethod(upload, recipe, member, session, BOARD_NAME);
//		}
			List<RecipeDTO> recipeList = new ArrayList<>();
			
		if(!multiFileList.isEmpty()) {
			MultiUploadFile.uploadMethod(multiFileList, BOARD_NAME, recipe, member, null, session, BOARD_NAME, recipeList);			
		}
		int result = recipeService.addRecipe(recipe, recipeList);
		
		
		if(result > 0) {
//			model.addAttribute("rno",recipe.getRno());
//			model.addAttribute("rtitle",recipe.getTitle());
//			model.addAttribute("rintoductiond",recipe.getIntroduction());
//			model.addAttribute("rFoodCategory",recipe.getFoodCategory());
//			model.addAttribute("rno",recipe.getRno ());
//			model.addAttribute("rno",recipe.getRno());
//			model.addAttribute("rno",recipe.getRno());
//			model.addAttribute("rno",recipe.getRno());
//			model.addAttribute("rno",recipe.getRno());

//			memberService.plusRecipeCount();
			model.addAttribute("uploadPath",recipe.getUploadPath());
			model.addAttribute("uploadName",recipe.getUploadName());
			model.addAttribute("uploadOriginName",recipe.getUploadOriginName());
			int rno = recipe.getRno();
			int rsno = recipe.getRsno();
			model.addAttribute("rno",rno);
			model.addAttribute("rsno",rsno);
			System.out.println("게시글 작성됨");
			System.out.println(recipe.getFileName());
			
			return "home";
		}else {
			System.out.println("게시글 작성 실패");
			return "common/error";
		} 
	}else if(!titleLengthCheck) {
		return sessionMessage.setSessionMessage("제목이 너무 깁니다.", "error", "home", session);

	} else if(!titleEmptyCheck) {
		return sessionMessage.setSessionMessage("제목을 입력해주세요.", "error", "home", session);

	} else {
		return sessionMessage.setSessionMessage("에러가 발생했습니다.", "error", "home", session);
	}	
}
	
	@GetMapping("/editForm.do")
	public String editFormRecipe(@RequestParam(value="rno")int rno,
			Model model) {
		
		RecipeDTO result = recipeService.editFormRecipe(rno);
		RecipeDTO ingreresult = recipeService.selectRecipe(rno);
		
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(ingreresult)) {	
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}		
			model.addAttribute("recipe",result);
			model.addAttribute("ingre",result);		
			}
			return "member/recipe";
		}
	
//	@PostMapping("/edit.do")
//	public String editRecipe(List<MultipartFile> multiFileList,RecipeDTO recipe,HttpSession session) {
//		String writer = recipeService.selectWriter(recipe.getRno());
//		String loginWriter = (String) session.getAttribute("memberNickName");
//		
//		int result = 0;
//		
//		if(writer.equals(loginWriter) && !multiFileList.isEmpty()) {
//			
//			String fileName = recipeService.selectFileName(recipe.getRno());
//			
//			boolean deleteFile = MultiUploadFile.deleteFile(fileName,fileName);
//			
//			if(deleteFile) {
//				MultiUploadFile.uploadMethod(multiFileList, loginWriter, recipe, null, null, session, fileName, null);
//				result = recipeService.editFormRecipe(recipe);
//			}
//		}else if(writer.equals(loginWriter) && multiFileList.isEmpty()) {
//			result = recipeService.editRecipeEmptyUpload(recipe);
//		}
//		
//		if(result== 1) {
//			System.out.println("수정성공");
//			return "/recipe/categoryList.do";
//		}else {
//			System.out.println("수정실패");
//			return "/recipe/categoryList.do";
//		}
//	}
	
	@GetMapping("/delete.do")
	public String deleteRecipe(@RequestParam(value="rno") int rno,
									HttpSession session) {
		String writer = recipeService.selectWriter(rno);
	
		String loginWriter = (String) session.getAttribute("memberNickName");
		int result = 0;
		
		if(writer.equals(loginWriter)) {		
			result = recipeService.deleteRecipe(rno);
			if(result>0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패 ㅜ");
			}
		}
		return "redirect:/recipe/categoryList.do";
	}
	
	@PostMapping("/comment.do")
	public String comment(@RequestParam(value="rno")int rno,
			HttpSession session,RecipeDTO recipe,Model model) {
			
			
		recipe.setMemberNickName((String)session.getAttribute("memberNickName"));
		recipe.setMno((int) session.getAttribute("mno"));
			
			System.out.println("작성자"+recipe.getMemberNickName());
			System.out.println("회원번호"+recipe.getMno());
			
			int result = recipeService.addComment(recipe);
			
			
			if(result>0) {
				System.out.println("댓글작성 성공");
			}else {
				System.out.println("댓글작성 실패");
			}
			return"redirect:/recipe/categoryList.do";
			
	}

@GetMapping("/detail.do")
	
	public String detailRecipe(@RequestParam(value="rno") int rno,
												RecipeDTO recipe,
												Model model,
												HttpServletRequest request) {
		
		RecipeDTO result =  recipeService.detailRecipe(rno);

		RecipeDTO ingreresult = recipeService.selectRecipe(rno);
		
		RecipeDTO seqresult = recipeService.seqSelectRecipe(rno);
		
		List<RecipeDTO> comresult = recipeService.selectComment(rno);
//		RecipeDTO comresult = recipeService.selectComment(rno);
		
		List<RecipeDTO> seqPhoresult = new ArrayList<>();
//		List<RecipeDTO> list
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(ingreresult)) {
				if(!Objects.isNull(seqresult)) {	
					int rsno = seqresult.getRsno();
					seqPhoresult = recipeService.seqPhoSelectRecipe(rsno);
					if(!Objects.isNull(comresult)) {
						int commentCount = recipeService.commentCount(rno);
						System.out.println(commentCount);
						model.addAttribute("commentCount",commentCount);
						System.out.println("성공");	
						model.addAttribute("comment",comresult);
						System.out.println("값입니다"+comresult);
					}
				}
			}
		}
		// 재료 꺼내기
		String[] ingredient = new String[ingreresult.getIngredient().length()];
		ingredient = ingreresult.getIngredient().split(",");
		for(String s : ingredient) {
//			System.out.println(s);
		}
		model.addAttribute("ingredient",ingredient);
		
		// 재료 무게 꺼내기
		String[] ingredientWeight = new String[ingreresult.getIngredientWeight().length()];
		ingredientWeight = ingreresult.getIngredientWeight().split(",");
		for(String s: ingredientWeight) {
//			System.out.println(s);
		}
		model.addAttribute("ingredientWeight",ingredientWeight);
		
		// 레시피 순서 꺼내기
		String[] sequence = new String[seqresult.getRsSequence().length()];
		sequence = seqresult.getRsSequence().split(",");
		for(String s: sequence) {
			
		}
		model.addAttribute("sequence",sequence);
	
//		String[] comment = new String[comresult.size()];
//		comment = comresult.size();
		
		
//		String[] sequencePhoto = new String[seqPhoresult.size()];
//		sequencePhoto = seqPhoresult.size();
		
		
		
		model.addAttribute("photoList",seqPhoresult);
		model.addAttribute("ingre",ingreresult);
		model.addAttribute("recipe",result);
		model.addAttribute("seqre",seqresult);
//		System.out.println(result);
		
		return "member/afterAddRecipe";
	}







}
