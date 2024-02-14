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

//	@RequestMapping("/checkChatRoom.do")
//	public String checkChatRoom(int mno,HttpSession session) {
//		
////		ChatRoomDTO checkKey = new ChatRoomDTO();
////		checkKey.set
////		chatService.checkChatRoom
//	}

	@PostMapping("/createChatRoom.do")
	public String createChatRoom(ChatRoomDTO chatRoom, HttpSession session) {
		int host = chatRoom.getFirst_m_no();// 게시글 작성자
		int guest = (int) session.getAttribute("mno");// 사용자

		if (host == guest) {// 작성자와 사용자가 같을때
			System.out.println("작성자는 방을 만들수 없습니다.");
			return "redirect:/foodMate/foodMateList.do";
		} else {// 작성자와 사용자가 같을때
			chatRoom.setSecond_m_no(guest);
			int result = chatService.createChatRoom(chatRoom);// 채팅방생성

			if (result > 0) {// 생성성공
				int this_cr_no = chatService.tellmeCRNO(chatRoom);// 생성한 채팅방번호 알기
				return "redirect:/chat/enterChatRoom.do?cr_no=" + this_cr_no;
			} else {// 생성실패
				return "redirect:/foodMate/foodMateList.do";
			}
		}
	}

	@GetMapping("/enterChatRoom.do")
	public String enterChatRoom(@RequestParam(value = "cr_no") int cr_no, Model model, HttpSession session) {
		ChatRoomDTO chatRoom = chatService.enterChatRoom(cr_no);

		if (!Objects.isNull(chatRoom)) {// 들어갈 채팅방이 있을때
			MemberDTO firstMember = memberService.findMember(chatRoom.getFirst_m_no());// 밥친구 작성자(첫째)
			MemberDTO secondMember = memberService.findMember(chatRoom.getSecond_m_no());// 작성글 들어와 채팅친놈 (둘째)
			int mno = (int) session.getAttribute("mno");
			MemberDTO user = memberService.findMember(mno);// 현재 사용자
			
			model.addAttribute("chatRoom", chatRoom);
			model.addAttribute("firstMember", firstMember);
			model.addAttribute("secondMember", secondMember);
			model.addAttribute("user", user);
			
			if (mno == secondMember.getMno()) {// 사용자랑 둘째랑 같을때
				System.out.println("둘째 입장");
				return "/foodFriend/foodFriendConv";
			} else if (mno == firstMember.getMno()) {// 사용자가 첫째랑 같을때
				System.out.println("첫째 입장");
				return "/foodFriend/foodFriendConv";
			} else {
				System.out.println("잘못된 접근입니다.");
				return "redirect:/foodMate/foodMateList.do";
			}

		} else {// 이 번호로된 채팅방 없을경우
			return "redirect:/foodMate/foodMateList.do";
		}
	}

	@RequestMapping("/chatRoom.do")
	public String chat(Model model) {
		logger.info("[Controller]:/chat/chatRoom.do");
		return "/foodFriend/foodFriendConv";
	}
}
