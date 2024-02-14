package kr.co.project.cart.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.project.cart.model.dto.CartDTO;
import kr.co.project.cart.model.service.CartServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartServiceImpl cartService;

	@PostMapping("/addCart.do")
	public String addCart(CartDTO cart) {
		int result = cartService.addCart(cart);

		if (result > 0) {
			System.out.println("장바구니 추가완료");
			return "redirect:/goods/list.do";
		} else
			return "foodStore/foodStore";
	}

	@GetMapping("/deleteCart.do")
	public String deleteCart(@RequestParam(value = "sc_no") int sc_no) {
		int result = cartService.deleteCart(sc_no);
		if (result > 0) {
			System.out.println("삭제 성공");
			return "redirect:/cart/getCart.do";
		} else
			System.out.println("삭제 실패");
			return "redirect:/cart/getCart.do";
	}

	@GetMapping("/getCart.do")
	public String getCart(HttpSession session, Model model) {
		int mno =(int) session.getAttribute("mno");
		List<CartDTO> list = cartService.getCart(mno);
		model.addAttribute("list", list);
		return "cart/cartView";
	}

	@PostMapping("/modifyCount.do")
	public String modifyCount(CartDTO cart) {
		int result = cartService.modifyCount(cart);
		if (result > 0) {
			return "redirect:/cart/getCart.do";
		} else {
			return "common/error";
		}
	}

	@GetMapping("/checkCart.do")
	public String checkCart(CartDTO cart) {
		CartDTO result = cartService.checkCart(cart);
		if (!Objects.isNull(result)) {
			return "common/error";
		} else {
			return "redirect:/cart/addCart.do";
		}
	}

}
