package kr.co.project.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.delivery.model.dto.DeliveryDTO;
import kr.co.project.delivery.model.service.DeliveryServiceImpl;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.service.GoodsServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;
import kr.co.project.order.model.dto.ItemOnPageDTO;
import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;
import kr.co.project.order.model.service.OrderServiceImpl;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private GoodsServiceImpl goodsService;

	@Autowired
	private MemberServiceImpl memberService;

	@Autowired
	private DeliveryServiceImpl deliveryService;

	@PostMapping("/goToOrder.do")
	public String goToOrder(ItemOnPageDTO item, HttpSession session, Model model) {
		int m_no = (int) session.getAttribute("mno");
		int g_no = item.getG_no();
		int g_count = item.getG_count();

		MemberDTO memberInfo = memberService.findMember(m_no);
		GoodsDTO goodsInfo = goodsService.detailGoods(g_no);
		int section_Price = g_count * goodsInfo.getG_price();

		List<DeliveryDTO> deliveryList = deliveryService.deliveryList(m_no);

		DeliveryDTO defaultDelivery = null;

		for (DeliveryDTO delivery : deliveryList) {
			if (delivery.getD_defaultDelivery() == 2) {
				defaultDelivery = delivery;
				break;
			}
		}
		
		if (defaultDelivery != null) {
			System.out.println("기본배송이 있음");
			model.addAttribute("defaultDelivery", defaultDelivery);
		} else {
			System.out.println("기본배송지 없음꺄아악");
		}
		
		if (deliveryList.isEmpty()) {
			System.out.println("저장된 배송지가 없습니다");
			System.out.println("배송지를 입력해주세용");
		} else {
			System.out.println("저장된 배송지가 불러옴");
			model.addAttribute("deliveryList", deliveryList);
		}
		model.addAttribute("goodsInfo", goodsInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("g_count", g_count);
		model.addAttribute("section_Price", section_Price);
		return "foodStore/productPayment";
	}

	@PostMapping("/insertOrderDetail.do")
	public String insertOrderDetail(OrderDetailDTO orderDetail, Model model) {
		int result = orderService.insertOrderDetail(orderDetail);
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
