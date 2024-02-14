package kr.co.project.cart.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {

	private int sc_no;
	private int sc_price;
	private int sc_count;
	private int m_no;
	
	private int g_no; // goods
	private String g_name;
	private int g_price;
	private int g_regular_price;

}
