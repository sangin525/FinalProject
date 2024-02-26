package kr.co.project.cart.controller;

import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
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
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.service.GoodsServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartServiceImpl cartService;

	@Autowired
	private GoodsServiceImpl goodsService;

	@PostMapping("/addCart.do")
	public String addCart(CartDTO cart, HttpServletRequest request) {
		int result = cartService.addCart(cart);
		if (result > 0) {
			System.out.println("장바구니 추가완료");
		} else {
			System.out.println("장바구니 추가완료");
		}
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer; // 이전 페이지로 리다이렉트
	}

	@GetMapping("/deleteCart.do")
	public String deleteCart(@RequestParam(value = "sc_no") int sc_no) {
		int result = cartService.deleteCart(sc_no);
		if (result > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		return "redirect:/cart/getCart.do";
	}

	@GetMapping("/getCart.do")
	public String getCart(HttpSession session, Model model) {
		int mno = (int) session.getAttribute("mno");
		List<CartDTO> cartList = cartService.getCart(mno);

		if (!Objects.isNull(cartList)) {

			for (CartDTO cartDTO : cartList) {
				GoodsDTO goodsInfo = goodsService.detailGoods(cartDTO.getG_no());
			
				cartDTO.setG_name(goodsInfo.getG_name());
				cartDTO.setG_price(goodsInfo.getG_price());
				cartDTO.setG_regular_price(goodsInfo.getG_regular_price());
				cartDTO.setG_file_name(goodsInfo.getG_file_name());
			}
		} else {

		}

		model.addAttribute("cartList", cartList);
		return "myPage/cart";
	}

	@PostMapping("/modifyCount.do")
	public String modifyCount(CartDTO cart) throws Exception {
		int result = cartService.modifyCount(cart);
		if (result > 0) {
			System.out.println("수량변경성공");
		} else {
			System.out.println("수량변경실패");
		}
		return "redirect:/cart/getCart.do";
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
