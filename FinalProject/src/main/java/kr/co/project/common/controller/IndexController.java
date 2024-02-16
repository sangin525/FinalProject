package kr.co.project.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.member.model.service.MemberServiceImpl;
import kr.co.project.recipe.model.dto.RecipeDTO;
import kr.co.project.recipe.model.service.RecipeServiceImpl;

@Controller
public class IndexController {
	

	@Autowired
	private RecipeServiceImpl recipeService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("/")
	public String homePage() {
		return "home";
	}
	

//	@RequestMapping("/")
//	public String indexPage(RecipeDTO recipe,
//			Model model,
//			HttpSession session) {
//		recipe.setMno((int) session.getAttribute("mno"));
//		
//		
//		List<RecipeDTO> list = recipeService.recentRecipeList(recipe);
//		System.out.println(list);
//		
//		
//		return "home";
//	}
	
//	@RequestMapping("/member_login")
//	public String loginPage() {
//		return "member/login";
//	}
	
//	@RequestMapping("/member_register")
//	public String registerPage() {
//		return "member/register";
//	}

	@RequestMapping("ranking_recipe")
	public String recipePage() {
		return "ranking/recipe";
	}
	
	@RequestMapping("searchWordRank")
	public String searchWordRankPage() {
		return "ranking/searchWord";
	}
	
	@RequestMapping("chefRank")
	public String chefRankPage() {
		return "ranking/chef";
	}

//	@RequestMapping("/member_addRecipe")
//	public String addRecipePage() {
//		return "member/addRecipe";
//	}
	
	@RequestMapping("/after_addRecipe")
	public String afterAddRecipe() {
		return "member/afterAddRecipe";
	}
	@RequestMapping("/member/notice_Board")
	public String noticePage() {
		return "notice/notice_Board";
	}

	@RequestMapping("/member_chefmake")
	public String chefmake() {
		return "member/chefmake";
	}
	
	@RequestMapping("/products")
	public String foodStorePage() {
		return "redirect:/goods/list.do";
	}
	
	@RequestMapping("/productDetail")
	public String productDetailPage() {
		return "foodStore/productDetail";
	}
	

	@RequestMapping("/sgjGoods")
	public String sgjGoodsPage() {
		return "foodStore/sgjGoods";
	}

//	@RequestMapping("/foodFriend")
//	public String friendPage() {
//		return "foodFriend/foodFriendList";
//	}
	
	@GetMapping("myPage/myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	@RequestMapping("myPage/myRecipes")
	public String myRecipes() {
		return "myPage/myRecipes";
	}
	@RequestMapping("myPage/scrapRecipe")
	public String scrapRecipe() {
		return "myPage/scrapRecipe";
	}
	@RequestMapping("myPage/notification")
	public String notification() {
		return "myPage/notification";
	}
	@RequestMapping("myPage/quiries")
	public String quiries() {
		return "myPage/quiries";
	}
	@RequestMapping("myPage/orders")
	public String orders() {
		return "myPage/orders";
	}
	@RequestMapping("myPage/cart")
	public String cart() {
		return "myPage/cart";
	}
	@RequestMapping("myPage/fixProfile")
	public String fixProfile() {
		return "myPage/fixProfile";
	}
	@RequestMapping("/contectUs")
	public String contectUs() {
		return "myPage/contectUs";
	}
	
	@GetMapping("foodFriendEnroll")
	public String enrollForm() {
		return "foodFriend/foodFriendEnroll";
	}

//	@GetMapping("foodFriendDetail")
//	public String detailForm() {
//		return "foodFriend/foodFriendDetail";
//	}
	@GetMapping("foodFriendEdit")
	public String editForm() {
		return "foodFriend/foodFriendEdit";
	}

//	@GetMapping("foodFriendList")
//	public String listForm() {
//		return "foodFriend/foodFriendList";
//	}
	@RequestMapping("/foodFriendConv")
	public String ConvForm() {
		return "foodFriend/foodFriendConv";
	}
	
	@GetMapping("noticeEnroll")
	public String noticeEnrollForm() {
		return "notice/notice_Enroll";
	}
	@GetMapping("noticeDetail")
	public String noticeDetailForm() {
		return "notice/notice_Detail";
	}
	@GetMapping("noticeEdit")
	public String noticeEditForm() {
		return "notice/notice_Edit";
	}
	@GetMapping("noticeBoard")
	public String noticeBoardForm() {
		return "notice/notice_Board";
	}
	
	@GetMapping("memberList")
	public String sidebarForm() {
		return "admin/memberList";
	}
	
	@GetMapping("/productRegistration")
	public String productRegistrationForm() {
		return "admin/productRegistration";
	}

	@RequestMapping("productPayment")
	public String productPaymentForm() {
		return "foodStore/productPayment";
	}

	
	@GetMapping("/productList")
	public String productListForm() {
		return "admin/productList";
	}
	
	@GetMapping("/orderList")
	public String orderListForm() {
		return "admin/orderList";
	}
	
	@GetMapping("/delivery")
	public String deliveryForm() {
		return "admin/delivery";
	}
//	@GetMapping("/adminNotice")
//	public String adminNoticeForm() {
//		return "admin/adminNotice";
//	}
	@GetMapping("/adminFree")
	public String adminFreeForm() {
		return "admin/adminFree";
	}

//	@GetMapping("/adminEvent")
//	public String adminEventForm() {
//		return "admin/adminEvent";
//	}


	@GetMapping("/eventEnroll")
	public String eventEnrollForm() {
		return "admin/eventEnroll";
	}
	@GetMapping("/productAnswer")
	public String productAnswerForm() {
		return "admin/productAnswer";
	}
}
