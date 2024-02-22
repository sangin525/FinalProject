package kr.co.project.delivery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.project.delivery.model.dto.DeliveryDTO;
import kr.co.project.delivery.model.service.DeliveryServiceImpl;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

	@Autowired
	private DeliveryServiceImpl deliveryService;

	@PostMapping("/deliverySave.do")
	public String deliverySave(DeliveryDTO delivery, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");
		delivery.setM_no(m_no);
		
		int result = deliveryService.saveDelivery(delivery);
		
		if (result > 0) {
			System.out.println("배송지 저장 성공");
		} else {
			System.out.println("배송지 저장 실패");
		}
		
		return "redirect:/goods/list.do";
	}
}
