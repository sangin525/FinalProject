package kr.co.project.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.upload.MemberUploadFile;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;
import kr.co.project.recipe.model.dto.RecipeDTO;
import kr.co.project.recipe.model.service.RecipeServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final String BOARD_NAME = "member\\";
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private RecipeServiceImpl recipeService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/redirect.do")
	public String redirectIndex() {
		return "member/login";
	}
	
	@PostMapping("/login.do")
	public String loginIndex(MemberDTO member,HttpSession session, Model model) {
		MemberDTO loginUser = memberService.loginMember(member);
		
		if(!Objects.isNull(loginUser) && bcryptPasswordEncoder.matches(member.getPwd(),loginUser.getPwd())) {
			session.setAttribute("mno", loginUser.getMno());
			session.setAttribute("memberName", loginUser.getName());
			session.setAttribute("memberNickName", loginUser.getNickname());
			session.setAttribute("memberName", loginUser.getName());
			model.addAttribute("email",loginUser.getEmail());
			model.addAttribute("m_no",loginUser.getMno());
			session.setAttribute("msg", "로그인 성공");
			session.setAttribute("status", "success");
			session.setAttribute("recipeCount", loginUser.getRecipeCount());
			session.setAttribute("email", loginUser.getEmail());
			session.setAttribute("recipeCount", loginUser.getRecipeCount());
			session.setAttribute("type", loginUser.getType());
			session.setAttribute("uploadName", loginUser.getUploadName());
			session.setAttribute("grade", loginUser.getGrade());
			System.out.println(loginUser.getGrade());
			return "forward:/";
		}else {
			
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요");
			model.addAttribute("status","error");
			System.out.println("로그인 실패");
			return "member/login";
		}	
	}
	
	@GetMapping("/registerForm.do")
	public String registerForm() {
		return "member/register";
	}
	
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/login";
	}

	@GetMapping("/logOut.do")
	public String logOut(HttpServletRequest request)throws Exception {
		
		HttpSession session =request.getSession();
		
		session.invalidate();
		return "forward:/";
	}
	
	@PostMapping("/checkEmail.do")
	@ResponseBody
	public String checkEmail(String email) {
		int result = memberService.checkEmail(email);
		
		if(result == 1) {
			return "duplication";
		}else {
			return "available";
		}
	}
	@GetMapping("/MyPageForm.do")
	public String myPageForm(RecipeDTO recipe,@RequestParam(value="cpage",defaultValue="1")int cpage,
			Model model,
			MemberDTO member,
			HttpSession session) {
		
		recipe.setMno((int)session.getAttribute("mno"));
		int listCount = recipeService.myRecipeCount(recipe);
		
		
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<RecipeDTO> list = recipeService.selectMyRecipe(pi,recipe);
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
			
		}
		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
	
		member.setMno((int) session.getAttribute("mno"));
		int mno = member.getMno();
		MemberDTO result = memberService.memberProfile(mno);
		int viewSum = recipeService.viewSum(mno);
		System.out.println(viewSum);
		model.addAttribute("result",result);
		model.addAttribute("viewSum",viewSum);

		return "/myPage/myRecipes";

	}
	
	@GetMapping("/newList.do")
	public String newList(@RequestParam(value="cpage",defaultValue="1")int cpage,MemberDTO member,HttpSession session,RecipeDTO recipe,Model model) {
		
		recipe.setMno((int)session.getAttribute("mno"));
		int listCount = recipeService.myRecipeCount(recipe);
		
		System.out.println(recipe.getMno());
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<RecipeDTO> list = recipeService.newList(pi,recipe);
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
			
		}
		
		member.setMno((int) session.getAttribute("mno"));
		int mno = member.getMno();
		MemberDTO result = memberService.memberProfile(mno);
		
		int viewSum = recipeService.viewSum(mno);
		System.out.println(viewSum);
		model.addAttribute("result",result);
		model.addAttribute("viewSum",viewSum);
		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
	
		
		return "/myPage/myRecipes";
	}
	
	@GetMapping("/viewList.do")
	public String viewList(@RequestParam(value="cpage",defaultValue="1")int cpage,
			MemberDTO member,HttpSession session,
			RecipeDTO recipe,Model model) {		
		
		recipe.setMno((int)session.getAttribute("mno"));
		int listCount = recipeService.myRecipeCount(recipe); 
		
		System.out.println(recipe.getMno());
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<RecipeDTO> list = recipeService.viewList(pi,recipe);
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
			
		}
		
		member.setMno((int) session.getAttribute("mno"));
		int mno = member.getMno();
		MemberDTO result = memberService.memberProfile(mno);
		
		int viewSum = recipeService.viewSum(mno);
		System.out.println(viewSum);
		model.addAttribute("result",result);
		model.addAttribute("viewSum",viewSum);
		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
	
		
		return "/myPage/myRecipes";
	}
	
	@GetMapping("/chefRank")
	public String chefRank(@RequestParam(value="cpage",defaultValue="1")int cpage,
			MemberDTO member,HttpSession session,
			RecipeDTO recipe,Model model) {
		
		
		int listCount = memberService.chefCount(member); 
		
		
		int pageLimit = 12;
		int boardLimit =12;
		
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<MemberDTO> list = memberService.chefRank(pi,member);
		
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "/ranking/chef";
	}
	
	@GetMapping("/chefDetail")
	public String chefDetail(@RequestParam(value="mno")int mno,
								MemberDTO member,RecipeDTO recipe,
								HttpSession session,Model model) {
		
		List<RecipeDTO> list = recipeService.selectMyRecipe(null, recipe);
		
		model.addAttribute("list",list);		
		return "/ranking/chefDetail";
	}
	
	@GetMapping("/fixProfile.do")
	public String pixProfile() {
		return "/myPage/fixProfile";
	}
	
	@GetMapping("/quiries.do")
	public String quiries() {
		return "/myPage/quiries";
	}
	
//	@GetMapping("/emailUpdateForm.do")
//	public String emailUpdateForm() {
//		return "redirect:/member/emailUpdate.do";
//	}
	
	@PostMapping("/emailUpdate.do")
	public String emailUpdate(MemberDTO member,HttpSession session,Model model) {
		int mno = (int) session.getAttribute("mno");
		
		member.setMno(mno);
		int memberEmailUpdate = memberService.memberEmailUpdate(member);
		
		if(memberEmailUpdate>0) {
		MemberDTO selectMember = memberService.selectMember(mno);
			System.out.println("변경성공");
			System.out.println(selectMember.getEmail());
			String newEmail = member.getEmail();
			model.addAttribute("newEamil",newEmail);
			model.addAttribute("member",member);
			model.addAttribute("member",selectMember);
		}else {
			System.out.println("변경실패");
		}
		
		return "redirect:/member/logOut.do";
		
	}
	
	@PostMapping("/nickNameUpdate.do")
	public String nickNameUpdate(MemberDTO member,HttpSession session,Model model) {
		int mno = (int) session.getAttribute("mno");
		
		member.setMno(mno);
		
		int memberNickNameUpdate = memberService.memberNickNameUpdate(member);
		if(memberNickNameUpdate>0) {
			System.out.println("변경성공");
		}else {
			System.out.println("변경실패");
		}
		return "redirect:/member/logOut.do";
	}
	
	@PostMapping("/secessionMember.do")
	public String secessionMember(MemberDTO member,HttpSession session) {
		int mno = (int) session.getAttribute("mno");
		
		member.setMno(mno);
		
		int secessionMember = memberService.secessionMember(member);
		if(secessionMember>0) {
			System.out.println("회원탈퇴 완료");
		}else {
			System.out.println("회원탈퇴 실패");
			
		}
		return "redirect:/member/logOut.do";
	}
	
	
	@GetMapping("/myRecipe.do")
	public String myRecipe(RecipeDTO recipe,
			@RequestParam(value="cpage",defaultValue="1")int cpage,
			Model model,
			MemberDTO member,
			HttpSession session) {
		
		recipe.setMno((int)session.getAttribute("mno"));
		int listCount = recipeService.myRecipeCount(recipe);
		
		System.out.println(listCount);
		int pageLimit = 12;
		int boardLimit = 8 ;
		
		int row = listCount - (cpage-1) * boardLimit;
		MemberDTO selectMember = memberService.selectMember(recipe.getMno());
		
	
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		// 목록 불러오는 서비스
		List<RecipeDTO> list = recipeService.selectMyRecipe(pi,recipe);
		
		for(RecipeDTO item : list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
			
		}
		member.setMno((int) session.getAttribute("mno"));
		int mno = member.getMno();
		MemberDTO result = memberService.memberProfile(mno);
		
		int viewSum = recipeService.viewSum(mno);
		System.out.println(viewSum);
		model.addAttribute("result",result);
		model.addAttribute("viewSum",viewSum);
		
		model.addAttribute("selectMember",selectMember);
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "/myPage/myRecipes";
	}
	
	@PostMapping("/checkNickName.do")
	@ResponseBody 
	public String checkNickName(String nickname) {
		int result = memberService.checkNickName(nickname);
		
		if(result == 1) {
			return "duplication";
		}else {
			return "available";
		}
	}
	
	@PostMapping("/register.do")
	public String register(MemberDTO member) {
		System.out.println(member.getPwd());
		String password = bcryptPasswordEncoder.encode(member.getPwd());
		member.setPwd(password);
		
		int result = memberService.registerMember(member);
		
		if(result == 1) {
			System.out.println(member.getAge());
			System.out.println("회원가입 성공");
			return "member/login";			
		}else {
			System.out.println("회원가입 실패");
			return "common/error";
		}
		
	}
// 디테일페이지 불러오기	
	
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
						
						model.addAttribute("commentCount",commentCount);
						
						model.addAttribute("comment",comresult);
						
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
	
	@PostMapping("/memberProfileUp")
	public String memberProfileUp(MemberDTO member,RecipeDTO recipe,HttpSession session,
				MultipartFile upload,Model model) {
		
		int memberUpdate = 0;
		member.setMno((int) session.getAttribute("mno"));
		
		if(!upload.isEmpty()) {
//			String fileName = memberService.selectFileName(member);						
				MemberUploadFile.uploadMethod(upload, recipe, member, session, BOARD_NAME);
				memberUpdate = memberService.memberUpdate(member);
					
		}else if(upload.isEmpty()) {
			memberUpdate = memberService.memberUpdate(member);
		}
		if(memberUpdate>0){
//			System.out.println(memberUpdate);
			System.out.println("업뎃성공");
			return "redirect:/member/memberProfile";
		}else {
			System.out.println("업뎃실패");
			return "home";
		}
		
	}
	
	
	@GetMapping("/memberProfile")
	public String memberProfile(MemberDTO member,HttpSession session,
								RecipeDTO recipe,Model model) {
		
		//멤버 사진불러오기	
		member.setMno((int) session.getAttribute("mno"));
		int mno = member.getMno();
		MemberDTO result = memberService.memberProfile(mno);
		int viewSum = recipeService.viewSum(mno);
		
		System.out.println(viewSum);
		model.addAttribute("profile",result);
		model.addAttribute("viewSum",viewSum);
		
		return "myPage/myRecipes";		
	}
	
	
	
	
	
}
