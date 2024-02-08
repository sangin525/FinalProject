package kr.co.project.chat.model.service;

import kr.co.project.chat.model.dto.ChatRoomDTO;

public interface ChatService {

	int createChatRoom(ChatRoomDTO chatRoom);

	int tellmeCRNO(ChatRoomDTO chatRoom);

	ChatRoomDTO enterChatRoom(int cr_no);

}
