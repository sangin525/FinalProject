package kr.co.project.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String indexPage() {
		return "home";
	}
	
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

	@RequestMapping("/member_addRecipe")
	public String addRecipePage() {
		return "member/addRecipe";
	}
	
	@RequestMapping("/after_addRecipe")
	public String afterAddRecipe() {
		return "member/afterAddRecipe";
	}
	@RequestMapping("/notice_Board")
	public String noticePage() {
		return "notice/notice_Board";
	}

	@RequestMapping("/member_chefmake")
	public String chefmake() {
		return "member/chefmake";
	}
	
	@RequestMapping("/products")
	public String foodStorePage() {
		return "foodStore/products";
	}
	
	@RequestMapping("/productDetail")
	public String productDetailPage() {
		return "foodStore/productDetail";
	}
	
	@RequestMapping("/foodFriend")
	public String friendPage() {
		return "foodFriend/foodFriendList";
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	@RequestMapping("/myRecipes")
	public String myRecipes() {
		return "myPage/myRecipes";
	}
	@RequestMapping("/scrapRecipe")
	public String scrapRecipe() {
		return "myPage/scrapRecipe";
	}
	@RequestMapping("/notification")
	public String notification() {
		return "myPage/notification";
	}
	@RequestMapping("/quiries")
	public String quiries() {
		return "myPage/quiries";
	}
	@RequestMapping("/orders")
	public String orders() {
		return "myPage/orders";
	}
	@RequestMapping("/cart")
	public String cart() {
		return "myPage/cart";
	}
	@RequestMapping("/fixProfile")
	public String fixProfile() {
		return "myPage/fixProfile";
	}
	
	@GetMapping("foodFriendEnroll")
	public String enrollForm() {
		return "foodFriend/foodFriendEnroll";
	}
	@GetMapping("foodFriendDetail")
	public String detailForm() {
		return "foodFriend/foodFriendDetail";
	}
	@GetMapping("foodFriendEdit")
	public String editForm() {
		return "foodFriend/foodFriendEdit";
	}
	
	@GetMapping("memberList")
	public String sidebarForm() {
		return "admin/memberList";
	}
	
	@GetMapping("/productRegistration")
	public String productRegistrationForm() {
		return "admin/productRegistration";
	}
}
