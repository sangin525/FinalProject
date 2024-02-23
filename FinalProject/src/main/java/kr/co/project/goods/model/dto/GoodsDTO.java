package kr.co.project.goods.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsDTO {
	private int g_no;
	private String g_name;
	private String g_file_path;
	private String g_file_name;
	private String g_origin_name;
	private String g_introduce;
	private int g_regular_price;
	private int g_price;
	private int g_dcRate;
	private String g_in_date;
	private int g_stock;
	private String g_delete_check;
	
	//---------------------------
	private int gp_type ;
}
