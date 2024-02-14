package kr.co.project.foodMate.controller;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.chat.model.dto.ChatRoomDTO;
import kr.co.project.chat.model.service.ChatServiceImpl;
import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.session.SessionMessage;
import kr.co.project.common.upload.FoodMateUploadFile;
import kr.co.project.foodMate.model.dto.FoodMateDTO;
import kr.co.project.foodMate.model.service.FoodMateServiceImpl;
import kr.co.project.member.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/foodMate")
public class FoodMateController {

	private static final String BOARD_NAME = "foodMate\\";

	@Autowired
	private FoodMateServiceImpl foodMateService;

	@Autowired
	private SessionMessage sessionMessage;

	@Autowired
	private ChatServiceImpl chatService;

	@Autowired
	private MemberServiceImpl memberService;

	@GetMapping("/foodMateList.do")
	public String foodMateList(FoodMateDTO food, @RequestParam(value = "cpage", defaultValue = "1") int cpage,
			Model model, HttpSession session) {

		int listCount = foodMateService.selectListCount(food);

		int pageLimit = 10;
		int boardLimit = 15;

		int row = listCount - (cpage - 1) * boardLimit;

		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);

		List<FoodMateDTO> list = foodMateService.selectListAll(pi, food);
		for (FoodMateDTO item : list) {
			String indate = item.getIndate().substring(0, 10);
			item.setIndate(indate);
		}
		model.addAttribute("row", row);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "/foodFriend/foodFriendList";
	}

	@GetMapping("/addFoodMateForm.do")
	public String addFoodMateForm() {
		return "/foodFriend/foodFriendEnroll";
	}

	@PostMapping("/addFoodMate.do")
	public String addFoodMate(FoodMateDTO food, MultipartFile upload, List<MultipartFile> multiFileList,
			HttpSession session, Model model) throws IllegalStateException, IOException {

		food.setWriter((String) session.getAttribute("memberNickName"));
		food.setMno((int) session.getAttribute("mno"));

		if (!upload.isEmpty()) {
			FoodMateUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, food, null);

		}
		int result = foodMateService.enrollFoodMate(food);
		if (result > 0) {
			System.out.println("성공");
		} else {
			System.out.println("실패");

		}
		return "redirect:/foodMate/foodMateList.do";
	}

	@GetMapping("/foodMateDetail.do")
	public String foodMateDetail(@RequestParam(value = "fno") int fno, HttpSession session, Model model,
			HttpServletRequest request) {

		FoodMateDTO result = foodMateService.detailFoodMate(fno);
		List<FoodMateDTO> comresult = foodMateService.selectComment(fno);

		if (!Objects.isNull(result)) {//게시글이 있다면
			if (!Objects.isNull(comresult)) {//댓글
				int commentCount = foodMateService.commentCount(fno);
				model.addAttribute("comment", comresult);
				model.addAttribute("commentCount", commentCount);
			}
			int first_m_no = result.getMno();// 게시물 작성자(주인)
			int second_m_no = (int) session.getAttribute("mno");// 사용자

			if (first_m_no == second_m_no) {// 게시물 작성자와 사용자가 동일하다면
				List<ChatRoomDTO> myChatRoomList = chatService.myChatRoomList(second_m_no);// 주인 참여한 모든 채팅방
				for (ChatRoomDTO chatR : myChatRoomList) {// 채팅방 참여자 이름 구하기
					String second_m_name = memberService.selectMember(chatR.getSecond_m_no()).getName();
					chatR.setSecond_m_name(second_m_name);
				}
				model.addAttribute("cr_no", 0); // 넘겨주는 cr_no은 0
				model.addAttribute("myChatRoomList", myChatRoomList);// 주인 참여한 모든 채팅방
				model.addAttribute("food", result);
				return "/foodFriend/foodFriendDetail";
			} else {// 게시물 작성자와 사용자가 다르다면
				ChatRoomDTO chatRoom = new ChatRoomDTO();
				chatRoom.setFirst_m_no(first_m_no);
				chatRoom.setSecond_m_no(second_m_no);
				try {// 만든 채팅방이 있을때
					int this_cr_no = chatService.tellmeCRNO(chatRoom);
					model.addAttribute("cr_no", this_cr_no);
					model.addAttribute("food", result);
					return "/foodFriend/foodFriendDetail";
				} catch (NullPointerException e) {// 만든 채팅방이 없을때
					model.addAttribute("cr_no", 0);// 넘겨주는 cr_no은 0
					model.addAttribute("food", result);
					return "/foodFriend/foodFriendDetail";
				}
			}
		} else {//게시글이 없어용
			System.out.println("실패");
			return "/foodFriend/foodFriendList";
		}
	}

	@GetMapping("/foodMateEditForm.do")
	public String foodMateEditForm(@RequestParam(value = "fno") int fno, Model model) {
		FoodMateDTO result = foodMateService.editFormBoard(fno);

		if (!Objects.isNull(result)) {
			model.addAttribute("food", result);
			return "/foodFriend/foodFriendEdit";
		} else {
			return "common/error";
		}
	}

	@PostMapping("foodMateEdit.do")
	public String foodMateEdit(MultipartFile upload, FoodMateDTO food, HttpSession session) {
//		String writer = foodMateService.selectWriter(food);
//		String loginWriter = (String) session.getAttribute("memberNickName");
		int result = 0;

		if (!upload.isEmpty()) {
			String fileName = foodMateService.selectFileName(food.getFno());
			boolean deleteFile = FoodMateUploadFile.deleteFile(fileName, BOARD_NAME);
			if (deleteFile) {
				FoodMateUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, food, null);
				result = foodMateService.editBoard(food);
			}
		} else if (upload.isEmpty()) {
			result = foodMateService.editBoardEmptyUpload(food);
		}
		if (result == 1) {
			System.out.println("수정성공");
			return "redirect:/foodMate/foodMateList.do";
		} else {
			System.out.println("수정실패");
			return "home";
		}
	}

	@GetMapping("/foodMateDelete.do")
	public String foodMateDelete(@RequestParam(value = "fno") int fno, HttpSession session) {
		int result = 0;
		String fileName = foodMateService.selectFileName(fno);
		if (fileName != null) {
			boolean deleteFile = FoodMateUploadFile.deleteFile(fileName, BOARD_NAME);
			if (deleteFile) {
				result = foodMateService.deleteBoard(fno);
			}

		} else {
			result = foodMateService.deleteBoard(fno);
		}

		if (result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패 ㅜㅜ");
		}
		return "redirect:/foodMate/foodMateList.do";
	}

	@PostMapping("/comment.do")
	public String comment(@RequestParam(value = "fno") int fno, HttpSession session, FoodMateDTO food, Model model) {

		food.setCommentWriter((String) session.getAttribute("memberNickName"));
		food.setMno((int) session.getAttribute("mno"));
		System.out.println(food.getCommentWriter());

		int result = 0;
		result = foodMateService.addComment(food);

		if (result > 0) {
			System.out.println("댓글 작성완료");
		} else {
			System.out.println("댓글 작성실패");
		}
		return "redirect:/foodMate/foodMateList.do";
	}

}
