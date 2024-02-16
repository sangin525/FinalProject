package kr.co.project.common.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.member.model.dto.MemberDTO;
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

	public String indexPage(MemberDTO member, RecipeDTO recipe, Model model, HttpServletRequest request,
			HttpSession session) {

		List<RecipeDTO> bestRecipe = recipeService.rankingListMain(recipe);
		for (RecipeDTO br : bestRecipe) {
//			int brno = br.getMno();
			int mainBestRecipeComcount = recipeService.mbcomCount(br);
			br.setCommentCount(mainBestRecipeComcount);
			if (mainBestRecipeComcount >= 1) {
				double starAvg = recipeService.avgComment(br);
				br.setStar(starAvg);
			}
			model.addAttribute("bestRecipe", bestRecipe);
			model.addAttribute("mainBestRecipeComcount", mainBestRecipeComcount);
		}

		List<RecipeDTO> newRecipe = recipeService.newListMain(recipe);
		for (RecipeDTO nr : newRecipe) {
//			int nrno = nr.getMno();
			int mainNewRecipeComcount = recipeService.mncomCount(nr);
			nr.setCommentCount(mainNewRecipeComcount);
			if (mainNewRecipeComcount >= 1) {
				double starAvg = recipeService.avgComment(nr);
				nr.setStar(starAvg);
			}
			model.addAttribute("newRecipe", newRecipe);
			model.addAttribute("mainNewRecipeComcount", mainNewRecipeComcount);
		}

		if (session.getAttribute("mno") != null) {
			int mno = (int) session.getAttribute("mno");
			member.setMno(mno);
			List<RecipeDTO> recentRecipe = recipeService.selectRecentRecipe(mno);

			List<RecipeDTO> recentSelectRecipe = new ArrayList<>();

			for (RecipeDTO rr : recentRecipe) {
				int rno = rr.getRno();
//				recipe.setRno(rr.getRno());
				RecipeDTO recipeResult = recipeService.recentSelectRecipe(rno);
				recentSelectRecipe.add(recipeResult);
			}

			for (RecipeDTO r : recentSelectRecipe) {
				System.out.println(r.toString());
			}

			model.addAttribute("recentRecipe", recentSelectRecipe);
		}

      return "home";
   }
   

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


//   @GetMapping("foodFriendDetail")
//   public String detailForm() {
//      return "foodFriend/foodFriendDetail";
//   }
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
	
	@GetMapping("freeEnroll")
	public String freeEnrollForm() {
		return "notice/free_Enroll";
	}

	@GetMapping("freeDetail")
	public String freeDetailForm() {
		return "notice/free_Detail";
	}

	@GetMapping("freeEdit")
	public String freeEditForm() {
		return "notice/free_Edit";
	}

	@GetMapping("freeBoard")
	public String freeBoardForm() {
		return "notice/free_Board";
	}
	
	@GetMapping("eventEnroll")
	public String eventenrollForm() {
		return "notice/event_Enroll";
	}

	@GetMapping("eventDetail")
	public String eventDetailForm() {
		return "notice/event_Detail";
	}

	@GetMapping("eventEdit")
	public String eventEditForm() {
		return "notice/event_Edit";
	}

	@GetMapping("eventBoard")
	public String eventBoardForm() {
		return "notice/event_Board";
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

//	@GetMapping("/eventEnroll")
//	public String eventEnrollForm() {
//		return "admin/eventEnroll";
//	}

	@GetMapping("/productAnswer")
	public String productAnswerForm() {
		return "admin/productAnswer";
	}
}

