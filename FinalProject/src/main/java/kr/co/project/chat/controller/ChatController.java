package kr.co.project.chat.controller;

import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.project.chat.model.dto.ChatRoomDTO;
import kr.co.project.chat.model.service.ChatServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/chat")
public class ChatController {

	private Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	private ChatServiceImpl chatService;

	@Autowired
	private MemberServiceImpl memberService;

	@PostMapping("/createChatRoom.do")
	public String createChatRoom(ChatRoomDTO chatRoom, HttpSession session) {

		int m_no = (int) session.getAttribute("mno");
		chatRoom.setFirst_m_no(m_no);

		int result = chatService.createChatRoom(chatRoom);

		if (result > 0) {// 생성성공

			int this_cr_no = chatService.tellmeCRNO(chatRoom);// 생성한 채팅방번호 알기

			return "redirect:/chat/enterChatRoom.do?cr_no=" + this_cr_no;
		} else {// 생성실패
			return "/chat/main";
		}
	}

	@GetMapping("/enterChatRoom.do")
	public String enterChatRoom(@RequestParam(value = "cr_no") int cr_no, Model model) {
		ChatRoomDTO chatRoom = chatService.enterChatRoom(cr_no);

		if (!Objects.isNull(chatRoom)) {// 조회한 채팅방이 있을때
			MemberDTO firstMember = memberService.findMember(chatRoom.getFirst_m_no());
			MemberDTO secondMember = memberService.findMember(chatRoom.getSecond_m_no());

			model.addAttribute("chatRoom", chatRoom);
			model.addAttribute("firstMember", firstMember);
			model.addAttribute("secondMember", secondMember);

			return "/chat/chatRoom";

		} else {// 이 번호로된 채팅방 없을경우
			return "/chat/main";
		}
	}

	@RequestMapping("/chatRoom.do")
	public String chat(Model model) {
		logger.info("[Controller]:/chat/chatRoom.do");
		return "chat/chatRoom";
	}
}
