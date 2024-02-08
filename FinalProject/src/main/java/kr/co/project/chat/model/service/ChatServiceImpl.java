package kr.co.project.chat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.chat.model.dao.ChatDAO;
import kr.co.project.chat.model.dto.ChatRoomDTO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ChatDAO chatDAO;

	@Override
	public int createChatRoom(ChatRoomDTO chatRoom) {
		return chatDAO.createChatRoom(sqlSession, chatRoom);
	}

	@Override
	public int tellmeCRNO(ChatRoomDTO chatRoom) {
		return chatDAO.tellmeCRNO(sqlSession, chatRoom);
	}

	@Override
	public ChatRoomDTO enterChatRoom(int cr_no) {
		return chatDAO.enterChatRoom(sqlSession, cr_no);
	}

}
