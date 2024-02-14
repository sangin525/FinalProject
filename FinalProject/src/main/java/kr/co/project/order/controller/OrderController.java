package kr.co.project.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.service.GoodsServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;
import kr.co.project.order.model.dto.ItemOnPageDTO;
import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;
import kr.co.project.order.model.service.OrderDetailServiceImpl;
import kr.co.project.order.model.service.OrderServiceImpl;

@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private OrderDetailServiceImpl orderDetailService;

	@Autowired
	private GoodsServiceImpl goodsService;

	@Autowired
	private MemberServiceImpl memberService;

	@PostMapping("/goToOrder.do")
	public String goToOrder(ItemOnPageDTO item, HttpSession session, Model model) {

		int m_no = (int) session.getAttribute("mno");
		int g_no = item.getG_no();
		int g_count = item.getG_count();
		MemberDTO memberInfo = memberService.findMember(m_no);
		GoodsDTO goodsInfo = goodsService.detailGoods(g_no);

		model.addAttribute("goodsInfo", goodsInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("g_count", g_count);

		return "order/orderPage";
	}

	@PostMapping("/insertOrderDetail.do")
	public String insertOrderDetail(OrderDetailDTO orderDetail, Model model) {
		int result = orderDetailService.insertOrderDetail(orderDetail);
		if (result > 0) {
		}
		return null;
	}

	@PostMapping("/insertOrder.do")
	public String insertOrder(OrderDTO order) {
		int result = orderService.insertOrder(order);

		return null;
	}

}
