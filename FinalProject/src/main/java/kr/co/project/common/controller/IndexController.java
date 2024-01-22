package kr.co.project.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String indexPage() {
		return "home";
	}
	
	@RequestMapping("/member_login")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("/member_register")
	public String registerPage() {
		return "member/register";
	}
	
	@RequestMapping("/ranking_recipe")
	public String recipePage() {
		return "ranking/recipe";
	}
}
