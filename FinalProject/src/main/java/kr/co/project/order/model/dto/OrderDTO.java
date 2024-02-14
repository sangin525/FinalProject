package kr.co.project.order.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {
	private int o_no;//주문번호
	private String o_recipient_name;//받는사람이름
	private String o_postal_address;//수취인 우편주소
	private String o_address;//수취인 주소
	private String o_detailed_address;//상세주소
	private String o_recipient_phone;//수취인 전화번호
	private String o_order_date;//주문날짜
	private int o_payment_amount;//결제금액
	private String o_order_status;//주문상태
	private String o_status_change_date;//상태변경일
	private int m_no;//회원번호
}


