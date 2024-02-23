package kr.co.project.order.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemOnPageDTO {
	private int m_no;//회원정보
	private int g_no;//상품정보
	private int g_count;//상품갯수
//========================================================
	private int section_Price;//항목당 가격
	private int total_Price;//전체 가격
	
}
