package kr.co.project.cart.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {

	private int sc_no;//shopping cart
	private int sc_price;
	private int sc_count;
	private int m_no;//member
	
	private int g_no; // goods
	//-----------------------------------------------------------------------------------------------
	private String g_name;
	private int g_price;
	private int g_regular_price;
	private String g_file_name;

}
