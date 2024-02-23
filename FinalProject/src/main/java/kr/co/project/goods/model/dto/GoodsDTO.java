package kr.co.project.goods.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
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
	
	private int i_no;
	private String i_writer;
	private String i_email;
	private String i_title;
	private String i_contents;
	private String i_in_date;
	private String i_secret;
	private String i_answerCheck;
	private int m_no;
}
