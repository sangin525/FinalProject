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
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// 레시피 랭킹 리스트
	@GetMapping("/rankingRecipe.do")
	public String rankingRecipe(RecipeDTO recipe,@RequestParam(value="cpage",defaultValue="1")int cpage,
									Model model,
									HttpSession session) {
		
		int listCount = recipeService.selectListCount(recipe);
		int pageLimit = 12;
		int boardLimit =12;
		

//		int row = listCount-(cpage-1) * boardLimit;

//		int row = listCount - (cpage - 1) * boardLimit;

		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		List<MemberDTO> memberList = new ArrayList<>();
		
		List<RecipeDTO> list = recipeService.rankingList(pi, recipe);
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);	
			MemberDTO memberProfile = memberService.memberList(item.getMno());
			memberList.add(memberProfile);
			int recipeCommentCount  = recipeService.countComment(item);
			item.setCommentCount(recipeCommentCount);
			if(recipeCommentCount >= 1) {
				double starAvg = recipeService.avgComment(item);
				item.setStar(starAvg);				
			}else {
				item.setStar(0);
			}
		}		
		
//		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("memberList",memberList);
		model.addAttribute("pi",pi);
		System.out.println("접근성공");
		
		// 검색추가
				if(!recipe.getSearchText().equals("")){
					
					List<RecipeDTO> searchList = recipeService.searchList(recipe);
					String searchResult = null;
								
					// 얘가 true면 같은게 있음, false면 같은게 없음
					boolean checkTitle = false;
					
					// 사용자가 검색한 검색어가 search 테이블에 존재하는지 확인하는 로직
					for(RecipeDTO search : searchList) {			
						String searchKeyword = search.getSearchText();
						searchResult = searchKeyword;
						if(searchResult.equals(recipe.getSearchText())) {
							// 같은게 하나라도 있으면 true로 변경 후 for문 종료
							checkTitle = true;
							break;
						}
					}		
//					String r = recipe.getSearchText();
//					System.out.println("입력언어"+r);
					System.out.println("입력언어1"+recipe.getSearchText());
					
					if(checkTitle) { // 같은게 있으면
						System.out.println("같은게 있음");
						int searchUp = recipeService.searchUpdate(searchResult);
					} else { // 같은게 없으면
						System.out.println("같은게 없음");
						int searchIn = recipeService.searchInsert(recipe.getSearchText());
						// recipeService.insert...........
					}
					model.addAttribute("searchList",searchList);
				
				}
		
			return "ranking/recipe";		
	}
	
	//레시피 카테고리 리스트
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
		List<MemberDTO> memberList = new ArrayList<>();

		List<RecipeDTO> list = recipeService.selectListAll(pi,recipe);

		
		
//		System.out.println(recipe.getSearchText());
		
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);	
			MemberDTO memberProfile = memberService.memberList(item.getMno());
			memberList.add(memberProfile);
			int recipeCommentCount  = recipeService.countComment(item);
			item.setCommentCount(recipeCommentCount);
			if(recipeCommentCount >= 1) {
				double starAvg = recipeService.avgComment(item);			
				item.setStar(starAvg);	
								
			}else {
				item.setStar(0);
			}
		}		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("memberList",memberList);
		model.addAttribute("pi",pi);
		
		// 검색추가
		if(!recipe.getSearchText().equals("")){
			
			List<RecipeDTO> searchList = recipeService.searchList(recipe);
			String searchResult = null;
						
			// 얘가 true면 같은게 있음, false면 같은게 없음
			boolean checkTitle = false;
			
			// 사용자가 검색한 검색어가 search 테이블에 존재하는지 확인하는 로직
			for(RecipeDTO search : searchList) {			
				String searchKeyword = search.getSearchText();
				searchResult = searchKeyword;
				if(searchResult.equals(recipe.getSearchText())) {
					// 같은게 하나라도 있으면 true로 변경 후 for문 종료
					checkTitle = true;
					break;
				}
			}		
//			String r = recipe.getSearchText();
//			System.out.println("입력언어"+r);
			System.out.println("입력언어1"+recipe.getSearchText());
			
			if(checkTitle) { // 같은게 있으면
				System.out.println("같은게 있음");
				int searchUp = recipeService.searchUpdate(searchResult);
			} else { // 같은게 없으면
				System.out.println("같은게 없음");
				int searchIn = recipeService.searchInsert(recipe.getSearchText());
				// recipeService.insert...........
			}
			model.addAttribute("searchList",searchList);
		
		}
		
			return "category/category";
	}
	
	// 레시피 스크랩 하기
	@PostMapping("/scrapRecipe.do")
	public String scrapRecipe(@RequestParam(value="rno") int rno,
								RecipeDTO recipe,HttpSession session,
								Model model) {

		recipe.setRno(rno);
		recipe.setMno((int) session.getAttribute("mno"));
		int scrapRecipe = recipeService.scrapRecipe(recipe);
		if(scrapRecipe>0) {
			System.out.println("레시피 스크랩 성공");
		}else {
			System.out.println("레시피 스크랩 실패 ㅜㅜ");
		}		
		
		
		return"redirect:/recipe/scrapRecipeList.do" ;
	}
	
	// 스크랩 레시피 리스트
		@GetMapping("/scrapRecipeList.do")
		public String scrapRecipeList(RecipeDTO recipe,@RequestParam(value="cpage",defaultValue="1")int cpage,
				Model model,MemberDTO member,
				HttpSession session){
			
			int listCount = recipeService.scrapListCount(recipe);
			
			int pageLimit = 6;
			int boardLimit =6;
			
			int row = listCount - (cpage-1) * boardLimit;
			
			PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
			
			List<RecipeDTO> scrapList = recipeService.scrapRecipeList(recipe,pi);
			
			List<RecipeDTO> myScrap = new ArrayList<>();
				for(RecipeDTO item:scrapList) {
					
//					recipe.setMno((int) session.getAttribute("mno"));
//					recipe.setRno(item.getRno());
					
					item.setMno((int) session.getAttribute("mno"));
					item.setRno(item.getRno());
				
					List<RecipeDTO> scraplist2 = recipeService.selectScrapRecipe(item,pi);
					for(RecipeDTO item2:scraplist2) {
					System.out.println(item2);
					String scrapDate2 = item2.getScrapDate().substring(0,10);
					item2.setScrapDate(scrapDate2);
					model.addAttribute("scraplist2",scraplist2);
					myScrap.add(item2);			
					}
					
					
					
					member.setMno((int) session.getAttribute("mno"));
					int mno = member.getMno();
					MemberDTO result = memberService.memberProfile(mno);
				
					recipe.setMno(mno);
					List<RecipeDTO> list = recipeService.selectMyRecipe(null,recipe);
					if(!list.isEmpty()) {
						
						int viewSum = recipeService.viewSum(mno);
					
						model.addAttribute("viewSum",viewSum);
					}
					
					model.addAttribute("result",result);
				
				}
			
			
			
			model.addAttribute("row",row);
//			model.addAttribute("scrapList",scrapList);
			model.addAttribute("pi",pi);
			
			return "myPage/scrapRecipe";
		}
	
	@GetMapping("/scrapRecipeDelete")
	public String scrapRecipeDelete(@RequestParam(value="frno")int frno,
				HttpSession session,RecipeDTO recipe,
				MemberDTO member) {
		
		int scrapDelete =  recipeService.scrapRecipeDelete(frno);
		
		if(scrapDelete>0) {
			System.out.println("스크랩 삭제성공");
			return "redirect:/recipe/scrapRecipeList.do";
		}else {
			System.out.println("실패");
			return"home";
		}
	}
	
	
	
	// 레시피 추가 폼
	@GetMapping("/addRecipeForm.do")
	public String addRecipeForm() {
		return "member/addRecipe";
	}
	
	//레시피 추가
	@PostMapping("/addRecipe.do")
	public String addRecipe(RecipeDTO recipe,MemberDTO member, MultipartFile upload, List<MultipartFile> multiFileList,
					HttpSession session,Model model)throws IllegalStateException, IOException {
		
		int mno = (int) session.getAttribute("mno");
		MemberDTO memberlog = memberService.logMember(mno);
		System.out.println("현재로그인 된계정의 닉네임은? : " + memberlog.getNickname());
		recipe.setMemberNickName(memberlog.getNickname());
//		recipe.setMemberNickName((String)session.getAttribute("memberNickName"));
		recipe.setMno((int) session.getAttribute("mno"));
		member.setMno((int) session.getAttribute("mno"));
		
	
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
			MultiUploadFile.uploadMethod(multiFileList,null, BOARD_NAME, recipe, member, null, session, BOARD_NAME, recipeList,null);			
		}
		int result = recipeService.addRecipe(recipe, recipeList,member);
		
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
			
			return "redirect:/recipe/categoryList.do";
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
	
	// 레시피수정 폼
	@GetMapping("/editForm.do")
	public String editFormRecipe(@RequestParam(value="rno")int rno,
			Model model) {
		
		RecipeDTO result = recipeService.editFormRecipe(rno);
		RecipeDTO ingreresult = recipeService.selectRecipe(rno);
		RecipeDTO seqResult = recipeService.seqSelectRecipe(rno);
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(ingreresult)) {
				if(!Objects.isNull(seqResult)) {					
					System.out.println("성공");				
				}else {
					System.out.println("실패");
				}					
			}	
			model.addAttribute("recipe",result);
			model.addAttribute("ingre",result);	
			model.addAttribute("seq",seqResult);
			}
			return "member/editRecipe";
		}
	
	// 레시피 수정
	@PostMapping("/editRecipe.do")
	public String editRecipe(List<MultipartFile> multiFileList,RecipeDTO recipe,HttpSession session) {
				
		int result = 0;
		
		if(!multiFileList.isEmpty()) {
			List<RecipeDTO> fileName = recipeService.selectFileName(recipe.getRno());
			List<RecipeDTO> sequenceFileName = recipeService.selectPhotoList(recipe.getRsno());
			System.out.println("레시피번호 가져오기"+recipe.getRno());
			System.out.println("레시피시퀀스 번호 가져오기"+recipe.getRsno());
			
			boolean deleteFiles = MultiUploadFile.deleteFile(fileName,sequenceFileName);
			sequenceFileName.remove(0);
			
			if(deleteFiles) {
				MultiUploadFile.uploadMethod(multiFileList, null, BOARD_NAME, recipe, null, null, session, BOARD_NAME, sequenceFileName, null);
				
				recipe.setUploadPath(sequenceFileName.get(0).getUploadPath());
				recipe.setUploadName(sequenceFileName.get(0).getUploadName());		
				recipe.setUploadOriginName(sequenceFileName.get(0).getUploadOriginName());
				
				recipe.setFileName(sequenceFileName.get(1).getFileName());
				recipe.setFileOrigin(sequenceFileName.get(1).getFileOrigin());
				recipe.setFilePath(sequenceFileName.get(1).getFilePath());
				
				result = recipeService.editRecipe(recipe);
			}
		}
// 		else if(multiFileList.isEmpty()) {
//			result = recipeService.editRecipeEmpty(recipe);
//		}
		
		if(result == 1) {
			System.out.println("수정성공");
			return "redirect:/recipe/categoryList.do";
		}else {
			System.out.println("수정실패");
			return "home";
		}		
	}
	
	
	// 레시피 삭제
	@GetMapping("/delete.do")
	public String deleteRecipe(@RequestParam(value="rno") int rno,
								RecipeDTO recipe,
								HttpSession session) {
		recipe.setRno(rno);
		recipe.setMno((int) session.getAttribute("mno"));
		String writer = recipeService.selectWriter(rno);
		
		String loginWriter = (String) session.getAttribute("memberNickName");
		int result = 0;
		
		if(writer.equals(loginWriter)) {		
			result = recipeService.deleteRecipe(recipe);
			if(result>0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패 ㅜ");
			}
		}
		return "redirect:/recipe/categoryList.do";
	}
	
	// 레시피 댓글 달기
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
	
	//레시피 상세보기
	@GetMapping("/detail.do")
	
	public String detailRecipe(@RequestParam(value="rno") int rno,
			@RequestParam(value="cpage",defaultValue="1")int cpage,
												RecipeDTO recipe,
												Model model,
												HttpServletRequest request,HttpSession session) {
		
		recipe.setMno((int) session.getAttribute("mno"));
		recipe.setRno(rno);
		
		RecipeDTO result =  recipeService.detailRecipe(rno);

		RecipeDTO ingreresult = recipeService.selectRecipe(rno);
		System.out.println(ingreresult);

		RecipeDTO seqresult = recipeService.seqSelectRecipe(rno);
				
		List<RecipeDTO> seqPhoresult = new ArrayList<>();
		
		List<MemberDTO> memberResult = new ArrayList<>();
		
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(ingreresult)) {
				if(!Objects.isNull(seqresult)) {	
					int rsno = seqresult.getRsno();
					seqPhoresult = recipeService.seqPhoSelectRecipe(rsno);
						// 댓글 페이징 처리
						int commentCount = recipeService.commentCount(rno);
						int commentPageLimit = 10;
						int commentLimit = 5;
						
						PageInfo pi = Pagination.getPageInfo(commentCount, cpage, commentPageLimit, commentLimit);
						
						List<RecipeDTO> comresult = recipeService.selectComment(pi,rno);

						int recentRecipe = recipeService.recentRecipe(recipe); 
						
						MemberDTO recipeChefProfile = memberService.memberProfile(result.getMno());
						
						for(RecipeDTO cp:comresult) {							
							String indate = cp.getRcInDate().substring(0,10);
							cp.setRcInDate(indate);
							MemberDTO resultProfile = memberService.memberList(cp.getMno());				
							memberResult.add(resultProfile);
					
//							System.out.println(memberResult.toString());							
						}
						System.out.println(recentRecipe);
						model.addAttribute("pi", pi);
						
						model.addAttribute("memberResult",memberResult);
						model.addAttribute("recipeChefProfile",recipeChefProfile);
						model.addAttribute("commentCount",commentCount);						
						model.addAttribute("comment",comresult);				
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
	
	@GetMapping("/recentRecipeList")
	public String recentRecipeList(RecipeDTO recipe,
			Model model,
			HttpSession session) {
		
		recipe.setMno((int) session.getAttribute("mno"));
		
		
		List<RecipeDTO> list = recipeService.recentRecipeList(recipe);
		System.out.println(list);
		return "common/recentlyRecipe";
	}
	
	@GetMapping("/rankSearch")
	public String searchList(RecipeDTO recipe,
							Model model) {
		
		List<RecipeDTO> searchList = recipeService.searchList(recipe);
		
		model.addAttribute("searchList", searchList);
		return "ranking/searchWord";
	}
	

}
