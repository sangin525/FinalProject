package kr.co.project.order.controller;

import java.util.ArrayList;
import java.util.List;

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

	@Autowired
	private CartServiceImpl cartService;

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
			System.out.println("기본배송지 있음");
			model.addAttribute("defaultDelivery", defaultDelivery);
		} else {
			System.out.println("기본배송지 없음");
		}

		if (deliveryList.isEmpty()) {
			System.out.println("저장된 배송지가 없습니다. 추가해주세요");
		} else {
			System.out.println("사용자 배송지 불러옴");
			model.addAttribute("deliveryList", deliveryList);
		}
		model.addAttribute("goodsInfo", goodsInfo);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("g_count", g_count);
		model.addAttribute("section_Price", section_Price);
		return "foodStore/productPayment";
	}

	@PostMapping("/cartToOrder.do")
	public String cartToOrder(@RequestParam(value = "sc_no") List<String> sc_noList,
			@RequestParam(value = "sc_count") List<String> sc_countList, Model model, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");// 세션에서 사용자 정보 받아옴
		MemberDTO memberInfo = memberService.findMember(m_no);
		List<DeliveryDTO> deliveryList = deliveryService.deliveryList(m_no);// 사용자의 배송지 가져옴 but 보여주는게 없음
		DeliveryDTO defaultDelivery = null;
		for (DeliveryDTO delivery : deliveryList) {// 사용자배송지 중 기본배송지 있으면 가져옴
			if (delivery.getD_defaultDelivery() == 2) {
				defaultDelivery = delivery;
				break;
			}
		}
		if (defaultDelivery != null) {// 기본배송지 있음
			System.out.println("기본배송지 있음");
			model.addAttribute("defaultDelivery", defaultDelivery);
		} else {
			System.out.println("기본배송지 없음");
		}
		if (deliveryList.isEmpty()) {// 사용자에게 배송지 없음
			System.out.println("저장된 배송지가 없습니다. 추가해주세요");
		} else {// 사용자 배송지 목록 보냄
			System.out.println("사용자 배송지 불러옴");
			model.addAttribute("deliveryList", deliveryList);
		}

		int totalGoodsPrice = 0;// 결제시 총금액
		String nameForPay = "";// 결제시 이름
		String sc_noForOrder = "";// 결제후 오더 생성시 장바구니정보
		// 장바구니에서 보낸 sc_no, sc_count 사용
		List<CartDTO> cartList = new ArrayList<>();
		int size = sc_noList.size();
		for (int i = 0; i < size; i++) {
			int scNo = Integer.parseInt(sc_noList.get(i));// sc_no 불변
			int scCount = Integer.parseInt(sc_countList.get(i));// sc_count 가변
			CartDTO dto = cartService.getCartInfo(scNo);// 기존 CartDTO에서 sc_count/sc_price 변화 가능
			GoodsDTO goodsInfo = goodsService.detailGoods(dto.getG_no());// GoodsDTO에서 g_stock 재고변화
			if (dto.getSc_count() == scCount) {// 기존값 = 입력값
				System.out.println("기존값=입력값");
			} else {// 기존값 != 입력값
				int sc_price = scCount * goodsInfo.getG_price();
				dto.setSc_count(scCount);// 갯수 정정
				dto.setSc_price(sc_price);// 가격 정정
				int result = cartService.modifyCount(dto);
				if (result > 0) {
					System.out.println("CartDTO업데이트");
				} else {
					System.out.println("CartDTO업데이트 실패");
				}
			}
			dto.setG_name(goodsInfo.getG_name());
			dto.setG_price(goodsInfo.getG_price());
			dto.setG_regular_price(goodsInfo.getG_regular_price());
			dto.setG_file_name(goodsInfo.getG_file_name());
			cartList.add(dto);//
			totalGoodsPrice += dto.getSc_price();// 결제금액생성
			nameForPay += (dto.getG_name() + "/");// 결제이름생성
			sc_noForOrder += (dto.getSc_no() + "/");// orderDetail생성
		}
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalGoodsPrice", totalGoodsPrice);
		model.addAttribute("nameForPay", nameForPay);
		model.addAttribute("sc_noForOrder", sc_noForOrder);
		return "foodStore/productPayment";
	}

	@PostMapping("/makeOrderFromCart.do")
	public String insertOrderFromCart(OrderDTO order, String sc_noForOrder, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");// 사용자 m_no
		order.setM_no(m_no);// 받은 OrderDTO m_no추가
		int saveOrder = orderService.insertOrder(order);// OrderDTO db저장
		if (saveOrder > 0) { // order저장
			System.out.println("order 저장");
			OrderDTO orderInfo = orderService.getO_no(order);// o_NO 알려고 OrderDTO 갖고 옴
			String[] sc_noS = sc_noForOrder.split("/");
			int sc_noSlength = sc_noS.length;
			int check = 0;
			for (int i = 0; i < sc_noS.length; i++) {
				// CartDTO 기반으로 OrderDetailDTO 생성
				CartDTO cartInfo = cartService.getCartInfo(Integer.parseInt(sc_noS[i]));
				OrderDetailDTO orderDetail = new OrderDetailDTO();
				orderDetail.setOd_price(cartInfo.getSc_price());
				orderDetail.setOd_count(cartInfo.getSc_count());
				orderDetail.setO_no(orderInfo.getO_no());
				orderDetail.setG_no(cartInfo.getG_no());
				int saveOrderDetail = orderService.insertOrderDetail(orderDetail);
				if (saveOrderDetail > 0) { // orderDetail 생성
					System.out.println((i + 1) + "번째 orderDetail 생성");
					GoodsDTO before = goodsService.detailGoods(cartInfo.getG_no());// 기존 재고
					int afterStock = before.getG_stock() - cartInfo.getSc_count();// 변경된 재고정보
					before.setG_stock(afterStock);
					int changeStock = goodsService.changeStock(before);// 재고업데이트
					if (changeStock > 0) {// 재고변경
						System.out.println("상품재고 변경");
						int delAfterbuy = cartService.deleteCart(Integer.parseInt(sc_noS[i]));
						if (delAfterbuy > 0) {// 구매후 카트적용
							System.out.println("카트업데이트");
							check += 1;
						} else {// 카트비우기 실패
							System.out.println("카트업데이트 실패");
						}
					} else {// 재고변경 실패
						System.out.println("상품재고 변경실패");
					}
				} else {// orderDetail 생성실패
					System.out.println((i + 1) + "번째 orderDetail 생성실패");
				}
			}
			if (check == sc_noSlength) {
				return "redirect:/cart/getCart.do";
			} else {// 중간에문제생김
				return "redirect:/";
			}
		} else {// order저장실패
			System.out.println("order 저장실패");
			return "redirect:/";
		}
	}

	@PostMapping("/makeOrderFromGoods.do")
	public String insertOrderFromGoods(OrderDTO order, int g_no, int g_count, int section_Price, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");
		order.setM_no(m_no);
		order.setO_payment_amount(section_Price);
		int saveOrder = orderService.insertOrder(order);// 오더 정보 db에 저장
		if (saveOrder > 0) {
			System.out.println("order 성공");
			OrderDTO orderInfo = orderService.getO_no(order);// o_NO 알려고 OrderDTO 갖고 옴
			OrderDetailDTO orderDetail = new OrderDetailDTO();
			orderDetail.setOd_price(section_Price);
			orderDetail.setOd_count(g_count);
			orderDetail.setO_no(orderInfo.getO_no());
			orderDetail.setG_no(g_no);
			int saveOrderDetail = orderService.insertOrderDetail(orderDetail);
			if (saveOrderDetail > 0) {
				System.out.println("orderDetail 성공");
				GoodsDTO before = goodsService.detailGoods(g_no);// 기존 재고
				int afterStock = before.getG_stock() - g_count;// 변경된 재고정보
				before.setG_stock(afterStock);
				int changeStock = goodsService.changeStock(before);// 재고업데이트
				if (changeStock > 0) {
					System.out.println("changeStock 성공");
					return "redirect:/cart/getCart.do";
				} else {// 재고변경 실패

				}

			} else {// orderDetail 실패

			}
			return "redirect:/cart/getCart.do";
		} else {// order 실패
			System.out.println("오더 실패");
			return "redirect:/";
		}
	}

	@GetMapping("/myOrderList.do")
	public String myOrderList(HttpSession session, Model model) {
		int m_no = (int) session.getAttribute("mno");
		List<OrderDTO> orderList = orderService.getOrderList(m_no);
		List<OrderDetailDTO> orderDetailList = new ArrayList<>();
		for (OrderDTO order : orderList) {
			List<OrderDetailDTO> inOneOrder = orderService.getOrderDetailList(order.getO_no());
			for (OrderDetailDTO orderDetail : inOneOrder) {
				orderDetailList.add(orderDetail);
			}
		}

		model.addAttribute("orderList", orderList);
		model.addAttribute("orderDetailList", orderDetailList);

		return "myPage/orders";
	}

}
