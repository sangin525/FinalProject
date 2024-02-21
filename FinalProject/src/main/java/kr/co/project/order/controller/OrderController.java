package kr.co.project.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			System.out.println("기본배송이 있음");
			model.addAttribute("defaultDelivery", defaultDelivery);
		} else {
			System.out.println("기본배송지 없음");
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

//	@RequestMapping("/cartToOrder.do")
//	public String cartToOrder(@ModelAttribute(value="SCtoODTOList") SCtoODTOList list, Model model) {
//		System.out.println(list);
//		return "test";
//	}

	@PostMapping("/cartToOrder.do")
	public String cartToOrder(@RequestParam(value = "sc_no") List<String> sc_noList,
			@RequestParam(value = "sc_count") List<String> sc_countList, Model model, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");
		MemberDTO memberInfo = memberService.findMember(m_no);
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
			System.out.println("기본배송지 없음");
		}

		if (deliveryList.isEmpty()) {
			System.out.println("저장된 배송지가 없습니다");
			System.out.println("배송지를 입력해");
		} else {
			System.out.println("저장된 배송지가 불러옴");
			model.addAttribute("deliveryList", deliveryList);
		}

		int totalGoodsPrice = 0;
		String nameForPay = "";
		String sc_noForOrder = "";
		List<CartDTO> cartList = new ArrayList<>();
		int size = sc_noList.size();
		for (int i = 0; i < size; i++) {
			int scNo = Integer.parseInt(sc_noList.get(i));// 받아온 sc_no 바뀌지 않음
			int scCount = Integer.parseInt(sc_countList.get(i));// 받은 sc_count 장바구니에서 바뀔수 있음
			CartDTO dto = cartService.getCartInfo(scNo);// 장바구니 정보
			GoodsDTO goodsInfo = goodsService.detailGoods(dto.getG_no());// 물건정보 바뀌지 않음
			if (dto.getSc_count() == scCount) {// DB와 받아온 값이 같다
				dto.setG_name(goodsInfo.getG_name());
				dto.setG_price(goodsInfo.getG_price());
				dto.setG_regular_price(goodsInfo.getG_regular_price());
				dto.setG_file_name(goodsInfo.getG_file_name());
				cartList.add(dto);
				totalGoodsPrice += dto.getSc_price();
				nameForPay += (dto.getG_name() + "/");
			} else {// DB와 받아온 값이 다르다
				int sc_price = scCount * goodsInfo.getG_price();
				dto.setSc_count(scCount);// 갯수 정정
				dto.setSc_price(sc_price);// 그에 따른 돈 정정
				int result = cartService.modifyCount(dto);
				if (result > 0) {
					CartDTO changeDTO = cartService.getCartInfo(scNo);
					changeDTO.setG_name(goodsInfo.getG_name());
					changeDTO.setG_price(goodsInfo.getG_price());
					changeDTO.setG_regular_price(goodsInfo.getG_regular_price());
					changeDTO.setG_file_name(goodsInfo.getG_file_name());
					cartList.add(changeDTO);
					totalGoodsPrice += changeDTO.getSc_price();
					nameForPay += (changeDTO.getG_name() + "/");
				}
			}
			sc_noForOrder += (dto.getSc_no() + "/");
		}

		model.addAttribute("cartList", cartList);
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("totalGoodsPrice", totalGoodsPrice);
		model.addAttribute("nameForPay", nameForPay);
		model.addAttribute("sc_noForOrder", sc_noForOrder);

		return "foodStore/productPayment";
	}

	@PostMapping("/insertOrderDetail.do")
	public String insertOrderDetail(OrderDetailDTO orderDetail, Model model) {
		int result = orderService.insertOrderDetail(orderDetail);
		if (result > 0) {
		}
		return null;
	}

	@PostMapping("/makeOrderFromCart.do")
	public String insertOrderFromCart(OrderDTO order, HttpSession session, String sc_noForOrder) {
		int m_no = (int) session.getAttribute("mno");// 세션에서 사용자 no
		order.setM_no(m_no);// 받은 order정보에 m_no 추가
		int after = orderService.insertOrder(order);// 오더 정보 db에 저장
		
		if (after > 0) {
			OrderDTO orderInfo = orderService.getO_no(order);// 생성한 오더 o_NO 알려고 정보 갖고 옴
			
			System.out.println("오더 성공");
			String[] sc_noS = sc_noForOrder.split("/");
			
			for (int i = 0; i < sc_noS.length; i++) {
				System.out.println((i + 1) + "카트의 번째 품목:" + sc_noS[i]);
				CartDTO cartInfo = cartService.getCartInfo(Integer.parseInt(sc_noS[i]));
				OrderDetailDTO orderDetail = new OrderDetailDTO();
				orderDetail.setOd_price(cartInfo.getSc_price());
				orderDetail.setOd_count(cartInfo.getSc_count());
				orderDetail.setO_no(orderInfo.getO_no());
				orderDetail.setG_no(cartInfo.getG_no());
				GoodsDTO before =goodsService.detailGoods(cartInfo.getG_no());
				int result = orderService.insertOrderDetail(orderDetail);
				if (result > 0) {//주문상세생성
					System.out.println((i + 1) + "번째 주문상세 생성성공");
					int afterStock = before.getG_stock()- cartInfo.getSc_count();
					before.setG_stock(afterStock);
					int changeStock= goodsService.changeStock(before);
					if(changeStock>0) {//재고변경
						System.out.println("상품재고 변경");
						int delAfterbuy= cartService.deleteCart(Integer.parseInt(sc_noS[i]));
						if(delAfterbuy>0) {//카트비우기
							System.out.println("정상작동");
						}else {//카트비우기 실패
							System.out.println("카트에서 삭제 실패");
						}
					}else {//재고변경 실패
						System.out.println("상품재고 변경실패");
					}
				} else {//주문상세생성 실패ㄴ
					System.out.println((i + 1) + "번째 주문 상세 생성 실패");
				}
			}
			return "redirect:/cart/getCart.do";
		} else {
			System.out.println("오더 실패");
			return "redirect:/";
		}

	}

	@PostMapping("/makeOrderFromGoods.do")
	public String insertOrderFromGoods(OrderDTO order, HttpSession session) {
		int m_no = (int) session.getAttribute("mno");// 세션에서 사용자 no
		order.setM_no(m_no);// 받은 order정보에 m_no 추가
		int after = orderService.insertOrder(order);// 오더 정보 db에 저장
		if (after > 0) {
			System.out.println("오더 성공");

			return "redirect:/cart/getCart.do";
		} else {
			System.out.println("오더 실패");
			return "redirect:/";
		}

	}

}
