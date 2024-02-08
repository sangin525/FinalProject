package kr.co.project.chat.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO {
	
	private int cr_no;
	private int first_m_no;
	private int second_m_no;
	private String cr_start_date;
	private String cr_end_date;

}
