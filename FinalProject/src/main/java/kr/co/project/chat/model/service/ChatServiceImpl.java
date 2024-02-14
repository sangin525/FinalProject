package kr.co.project.chat.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.chat.model.dao.ChatDAO;
import kr.co.project.chat.model.dto.ChatMsgDTO;
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
	public List<ChatRoomDTO> myChatRoomList(int second_m_no) {
		return chatDAO.myChatRoomList(sqlSession, second_m_no);
	}

	@Override
	public ChatRoomDTO enterChatRoom(int cr_no) {
		return chatDAO.enterChatRoom(sqlSession, cr_no);
	}

	@Override
	public List<ChatMsgDTO> previouseChat(int cr_no) {
		return chatDAO.previouseChat(sqlSession, cr_no);
	}

	@Override
	public int saveMsg(ChatMsgDTO chatMsg) {
		return chatDAO.saveMsg(sqlSession, chatMsg);
	}

	@Override
	public ChatMsgDTO getSendMsg(ChatMsgDTO chatMsg) {
		return chatDAO.getSendMsg(sqlSession, chatMsg);
	}

}
