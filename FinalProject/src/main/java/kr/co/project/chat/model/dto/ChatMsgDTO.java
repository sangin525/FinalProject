package kr.co.project.chat.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMsgDTO {
	private int cm_no;
	private int cr_no;
	private int m_no;
	private String cm_message;
	private String cm_send_time;
	private String cm_imageName;
	private String cm_imagePath;
	private String cm_imgOrigin;
	
	
	private String m_name;
}
