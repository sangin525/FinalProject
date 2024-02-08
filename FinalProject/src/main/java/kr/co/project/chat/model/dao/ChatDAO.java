package kr.co.project.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.chat.model.dto.ChatRoomDTO;

@Repository
public class ChatDAO {

	public int createChatRoom(SqlSessionTemplate sqlSession, ChatRoomDTO chatRoom) {
		return sqlSession.insert("chatMapper.createChatRoom", chatRoom);
	}

	public int tellmeCRNO(SqlSessionTemplate sqlSession, ChatRoomDTO chatRoom) {
		return sqlSession.selectOne("chatMapper.tellmeCRNO", chatRoom);
	}

	public ChatRoomDTO enterChatRoom(SqlSessionTemplate sqlSession, int cr_no) {
		return sqlSession.selectOne("chatMapper.enterChatRoom", cr_no);
	}

}
