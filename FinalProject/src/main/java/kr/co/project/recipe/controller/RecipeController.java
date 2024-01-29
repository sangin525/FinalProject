package kr.co.project.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.common.access.LoginCheck;
import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.session.SessionMessage;
import kr.co.project.common.upload.UploadFile;
import kr.co.project.common.validation.DataValidation;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dto.RecipeDTO;
import kr.co.project.recipe.model.service.RecipeServiceImpl;

@Controller
@RequestMapping("/recipe")

public class RecipeController {
	
	
	private static final String BOARD_NAME="recipe\\";
	
	@Autowired
	private RecipeServiceImpl recipeService;
	
	@Autowired
	private SessionMessage sessionMessage;
	
	
	@GetMapping("/categoryListForm.do")
	public String categoryListForm() {
		return "category/category";
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
	public String addRecipe(RecipeDTO recipe,MemberDTO member,MultipartFile upload, 
					HttpSession session,Model model)throws IllegalStateException, IOException {
					
		recipe.setMemberNickName((String)session.getAttribute("memberNickName"));
		recipe.setMno((int) session.getAttribute("mno"));
		// 제목 길이 검사
		boolean titleLengthCheck = DataValidation.CheckLength(recipe.getTitle(), 150);
		
		// 제목이 비어있는지 검사
		boolean titleEmptyCheck = DataValidation.emptyCheck(recipe.getTitle());
		
		if(titleLengthCheck && titleEmptyCheck) {
			
		if(!upload.isEmpty()) {
			UploadFile.uploadMethod(upload, recipe, member, session, BOARD_NAME);
		}
		
		int result = recipeService.addRecipe(recipe);
		
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
			int rno = recipe.getRno();
			System.out.println("게시글 작성됨");
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
	
	
	












}
