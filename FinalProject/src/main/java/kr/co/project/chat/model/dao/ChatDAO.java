package kr.co.project.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.chat.model.dto.ChatMsgDTO;
import kr.co.project.chat.model.dto.ChatRoomDTO;

@Repository
public class ChatDAO {

	public int createChatRoom(SqlSessionTemplate sqlSession, ChatRoomDTO chatRoom) {
		return sqlSession.insert("chatMapper.createChatRoom", chatRoom);
	}

	public int tellmeCRNO(SqlSessionTemplate sqlSession, ChatRoomDTO chatRoom) {
		return sqlSession.selectOne("chatMapper.tellmeCRNO", chatRoom);
	}

	public List<ChatRoomDTO> myChatRoomList(SqlSessionTemplate sqlSession, int second_m_no) {
		return sqlSession.selectList("chatMapper.myChatRoomList", second_m_no);
	}

	public ChatRoomDTO enterChatRoom(SqlSessionTemplate sqlSession, int cr_no) {
		return sqlSession.selectOne("chatMapper.enterChatRoom", cr_no);
	}

	public List<ChatMsgDTO> previouseChat(SqlSessionTemplate sqlSession, int cr_no) {
		return sqlSession.selectList("chatMapper.previouseChat", cr_no);
	}

	public int saveMsg(SqlSessionTemplate sqlSession, ChatMsgDTO chatMsg) {
		return sqlSession.insert("chatMapper.saveMsg", chatMsg);
	}

	public ChatMsgDTO getSendMsg(SqlSessionTemplate sqlSession, ChatMsgDTO chatMsg) {
		return sqlSession.selectOne("chatMapper.getSendMsg", chatMsg);
	}

}
