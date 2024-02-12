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

//	@RequestMapping("/member_addRecipe")
//	public String addRecipePage() {
//		return "member/addRecipe";
//	}
	
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
	
	@RequestMapping("/foodFriend")
	public String friendPage() {
		return "foodFriend/foodFriendList";
	}
	
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
	
//	@GetMapping("foodFriendEnroll")
//	public String enrollForm() {
//		return "foodFriend/foodFriendEnroll";
//	}
//	@GetMapping("foodFriendDetail")
//	public String detailForm() {
//		return "foodFriend/foodFriendDetail";
//	}
//	@GetMapping("foodFriendEdit")
//	public String editForm() {
//		return "foodFriend/foodFriendEdit";
//	}
//
//	@GetMapping("foodFriendList")
//	public String listForm() {
//		return "foodFriend/foodFriendList";
//	}
	
	@RequestMapping("/foodFriendConv")
	public String ConvForm() {
		return "foodFriend/foodFriendConv";
	}
	
	@GetMapping("memberList")
	public String sidebarForm() {
		return "admin/memberList";
	}
	
	@GetMapping("/productRegistration")
	public String productRegistrationForm() {
		return "admin/productRegistration";
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
	@GetMapping("/managingPosts")
	public String managingPostsForm() {
		return "admin/managingPosts";
	}
	@GetMapping("/noticeEnroll")
	public String noticeEnrollForm() {
		return "admin/noticeEnroll";
	}
	@GetMapping("/eventEnroll")
	public String eventEnrollForm() {
		return "admin/eventEnroll";
	}
	@GetMapping("/productAnswer")
	public String productAnswerForm() {
		return "admin/productAnswer";
	}
}
