package kr.co.project.chat.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.project.chat.model.dto.ChatMsgDTO;
import kr.co.project.chat.model.service.ChatServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Autowired
	private ChatServiceImpl chatService;

	@Autowired
	private MemberServiceImpl memberService;

	//
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 입장 방 번호 알기
		int cr_no = extractCr_no(session);
		System.out.println(cr_no);
		// 전에대화 갖고 와
		List<ChatMsgDTO> previousChat = chatService.previouseChat(cr_no);
		ObjectMapper objectMapper = new ObjectMapper();

		sessionList.add(session);

		logger.info("{} 연결됨", session.getId());
		System.out.println(session.getId() + "님 채팅 서버 연결 되었습니다.");
		
		// CharMsgDTO에 image 관련된 변수
		for (ChatMsgDTO chatMsg : previousChat) {
			String m_name = memberService.selectMember(chatMsg.getM_no()).getName();
			List<MemberDTO> memberImg = memberService.memberImage(chatMsg.getM_no());
			for(MemberDTO msgImg : memberImg) {
				System.out.println("채팅방 멤버번호"+msgImg.getMno());
				System.out.println("채팅방 멤버사진"+msgImg.getUploadName());
				
				chatMsg.setCm_imagePath(msgImg.getUploadPath());
				chatMsg.setCm_imageName(msgImg.getUploadName());
				chatMsg.setCm_imgOrigin(msgImg.getUploadOrigin());
			}
			// chatMsg.getM_no()로 member테이블에 m_no가 해당하는애 이미지 컬럼 값 가져오기
			
			// chatMsg에 setter로 이미지 값 넣기
			chatMsg.setM_name(m_name);
			String jsonMessage = objectMapper.writeValueAsString(chatMsg);
			session.sendMessage(new TextMessage(jsonMessage));
		}
//		System.out.println("jsonmessage" + jsonMessage);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {}받음", session.getId(), message.getPayload());

		// 받아오는 메세지
		String payload = message.getPayload();
		System.out.println(payload);

		ObjectMapper objectMapper = new ObjectMapper();
		ChatMsgDTO chatMsg = objectMapper.readValue(payload, ChatMsgDTO.class);

//		System.out.println("cm_no : " + chatMsg.getCm_no());
//		System.out.println("cr_no : " + chatMsg.getCr_no());
//		System.out.println("m_no : " + chatMsg.getM_no());
//		System.out.println("cm_message : " + chatMsg.getCm_message());
//		System.out.println("cm_send_time : " + chatMsg.getCm_send_time());
//		System.out.println("m_name : " + chatMsg.getM_name());

		int result = chatService.saveMsg(chatMsg);

		if (result > 0) {
			ChatMsgDTO getSendMsg = chatService.getSendMsg(chatMsg);
			getSendMsg.setM_name(chatMsg.getM_name());
			MemberDTO memberImg2 = memberService.memberImage2(getSendMsg.getM_no());
			getSendMsg.setCm_imageName(memberImg2.getUploadName());
			getSendMsg.setCm_imagePath(memberImg2.getUploadPath());
			getSendMsg.setCm_imgOrigin(memberImg2.getUploadOrigin());
			System.out.println("입력한 사람 번호"+getSendMsg.getM_no());
			
			String jsonMessage = objectMapper.writeValueAsString(getSendMsg);
			
			for (WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(jsonMessage));
				
			}
		}else {
			System.out.println("메세지 저장에 실패함");
		}

	}

	//
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
	}

	private int extractCr_no(WebSocketSession session) {
		String uri = session.getUri().toString();
		String[] uriParts = uri.split("/");
		return Integer.parseInt(uriParts[uriParts.length - 1]);

	}

}
