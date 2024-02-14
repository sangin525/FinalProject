package kr.co.project.chef.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.chef.model.dto.ChefDTO;
import kr.co.project.chef.model.service.ChefServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/chef")
public class ChefController {

	@Autowired
	private ChefServiceImpl chefService;

	@PostMapping("/register.do")
	public String register(ChefDTO chef, MemberDTO member, HttpSession session) {

		int mno = (int) session.getAttribute("mno");

		System.out.println(mno);
		int result = chefService.registerChef(mno);
		if (result == 1) {
			chef.setCno(mno);
			System.out.println(chef.getCno());
			System.out.println("쉐프계정 생성 성공");
			return "home";
		} else {
			System.out.println("쉐프계정 생성 실패");
			return "common/error";
		}
	}

}
