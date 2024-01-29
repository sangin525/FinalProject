package kr.co.project.common.controller;

import org.springframework.stereotype.Controller;
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
	
//	@RequestMapping("recipe_category")
//	public String categoryPage() {
//		return "category/category";
//	}
	
	@RequestMapping("/member_chefmake")
	public String chefmake() {
		return "member/chefmake";
	}
}
