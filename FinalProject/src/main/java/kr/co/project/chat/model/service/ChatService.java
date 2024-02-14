package kr.co.project.chat.model.service;

import java.util.List;

import kr.co.project.chat.model.dto.ChatMsgDTO;
import kr.co.project.chat.model.dto.ChatRoomDTO;

public interface ChatService {

	int createChatRoom(ChatRoomDTO chatRoom);

	int tellmeCRNO(ChatRoomDTO chatRoom);

	List<ChatRoomDTO> myChatRoomList(int second_m_no);

	ChatRoomDTO enterChatRoom(int cr_no);

	List<ChatMsgDTO> previouseChat(int cr_no);

	int saveMsg(ChatMsgDTO chatMsg);

	ChatMsgDTO getSendMsg(ChatMsgDTO chatMsg);


}
