package kr.co.project.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.admin.model.dto.AdminDTO;
import kr.co.project.admin.model.service.AdminServiceImpl;
import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.session.SessionMessage;
import kr.co.project.common.upload.AdminUploadFile;
import kr.co.project.common.upload.EventUploadFile;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final String BOARD_NAME = "admin\\";
	

	
	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private SessionMessage sessionMessage;
	
	@GetMapping("/adminNotice")
	public String adminNotice(AdminDTO admin,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			Model model, HttpSession session) {
		
		int listCount = adminService.selectListCount(admin);
		
		int pageLimit = 10;
		int boardLimit =15;
		
		int row = listCount-(cpage-1) * boardLimit;
//		admin.setWriter((int) session.getAttribute("memberNickName"));
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);		
		List<AdminDTO> list = adminService.selectListAll(pi,admin);
		for(AdminDTO item:list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
		}
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "/admin/adminNotice";
	
	}
	
	@GetMapping("/noticeList")
	public String noticeList(AdminDTO admin,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			Model model, HttpSession session) {
		
		int listCount = adminService.selectListCount(admin);
		
		int pageLimit = 10;
		int boardLimit =15;
		
		int row = listCount-(cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);		
		List<AdminDTO> list = adminService.selectListAll(pi,admin);
		for(AdminDTO item:list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
		}
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "/notice/notice_Board";
	}
	
	@GetMapping("/noticeEnrollForm")
	public String noticeEnrollForm() {
		return "/admin/noticeEnroll";
	}
	
	@PostMapping("/noticeEnroll")
	public String noticeEnroll(AdminDTO admin,HttpSession session,
								Model model,MultipartFile upload)throws IllegalStateException, IOException {
		admin.setMno((int) session.getAttribute("mno"));
		admin.setType((int) session.getAttribute("type"));
		final String BOARD_NAME="admin\\";
		if(admin.getType() == 0) {
		
			if(!upload.isEmpty()) {
				AdminUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, null, admin);		
			}
			int result = adminService.enrollNotice(admin);
			if(result>0) {
				model.addAttribute("msg","작성완료");
				model.addAttribute("status","success");
				System.out.println("공지사항 작성 완료");
			}else {
				model.addAttribute("msg","작성실패");
				model.addAttribute("status","error");
				System.out.println("공지사항 작성 실패");
			}
		}			
		else {
			System.out.println("관리자가 아님");
			model.addAttribute("msg","관리자계정으로 로그인하세요");
			model.addAttribute("status","error");
			return "home";
		}
			
		
		return "redirect:/admin/adminNotice";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam(value="acno") int acno,
								AdminDTO admin,MemberDTO member,
								Model model,
								HttpSession session) {
		
		AdminDTO result = adminService.detailNotice(acno);
		
		List<AdminDTO> adminComment = adminService.selectNoticeComment(acno);
		
		List<MemberDTO> commentProfile = new ArrayList<>();
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(adminComment)) {
				int ncommentCount = adminService.ncommentCount(acno);
				model.addAttribute("ncommentCount",ncommentCount);
				for(AdminDTO ad:adminComment) {
					MemberDTO resultProfile = memberService.memberList(ad.getMno());
					commentProfile.add(resultProfile);
					model.addAttribute("memberResult",commentProfile);
				}
			}
		}else {
			System.out.println("실패");
		}
		model.addAttribute("noticeComment",adminComment);
		model.addAttribute("notice",result);				
		return "/notice/notice_Detail";
	}
	
	@GetMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam(value="acno")int acno,
								AdminDTO admin,MemberDTO member){
	 
		int result = adminService.deleteNotice(acno);
		if(result == 1) {			
			System.out.println("삭 제 완 료");
		}
		else {
			System.out.println("삭 제 실 패");
		}
		
		return "redirect:/admin/adminNotice";
	
		
}
	
	@PostMapping("/noticeUpdate.do")
	public String noticeEdit(
			AdminDTO admin,MemberDTO member,Model model,HttpSession session
			,MultipartFile upload) {
		int result = 0;
		
		if (!upload.isEmpty()) {
			String fileName = adminService.selectFileName(admin.getAcno());
			boolean deleteFile = AdminUploadFile.deleteFile(fileName, BOARD_NAME);
			
			System.out.println(deleteFile);
			if(deleteFile) {
				AdminUploadFile.uploadMethod(upload, null, member, session, BOARD_NAME, null, admin);
				result = adminService.updateNotice(admin);	
			} 
			if(result == 1) {
				System.out.println("수정성공");
				return "redirect:/admin/adminNotice";
			}else {
				System.out.println("수정실패");
				return "home";
			}
		} else if(upload.isEmpty()) {  // 사용자가 파일수정을 안했을때
			result = adminService.updateNoticeEmpty(admin);
			System.out.println("파일수정안하고 성공");
			return "redirect:/admin/adminNotice";
		}
		
		return "home";
	}
	
	@PostMapping("/addNoticeComment")
	public String noticeComment(@RequestParam(value="acno")int acno,
				HttpSession session,AdminDTO admin,Model model) {
		
		admin.setNcWriter((String) session.getAttribute("memberNickName"));
		admin.setMno((int) session.getAttribute("mno"));
		
		int result = adminService.addNoticeComment(admin);
		
		if(result>0) {
			System.out.println("댓글 작성성공");
		}else {
			System.out.println("댓글 작성실패");
		}
		
		return "redirect:/admin/noticeList";
	}
	
	
	////////////////////////////여기부터 이벤트입니다////////////////////////////////////////////
	
	
	@GetMapping("/adminEvent")
	public String adminEvent(AdminDTO admin,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			Model model, HttpSession session) {
		
		int listCount = adminService.eventListCount(admin);
		System.out.println(listCount);
		int pageLimit = 10;
		int boardLimit =15;
		
		int erow = listCount-(cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		List<AdminDTO> eventList = adminService.eventListAll(pi,admin);
		
		for(AdminDTO item:eventList) {
			String indate = item.getE_indate().substring(0,10);
			item.setE_indate(indate);
		}
		model.addAttribute("erow",erow);
		model.addAttribute("eventList", eventList);
		model.addAttribute("pi", pi);
		
		return "/admin/adminEvent";
	}
	
	
	
	@GetMapping("/eventList")
	public String eventList(AdminDTO admin,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			Model model, HttpSession session) {
		
		int listCount = adminService.eventListCount(admin);
		System.out.println(listCount);
		int pageLimit = 10;
		int boardLimit =15;
		
		int row = listCount-(cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		List<AdminDTO> list = adminService.eventListAll(pi,admin);
		
		for(AdminDTO item:list) {
			String indate = item.getE_indate().substring(0,10);
			item.setE_indate(indate);
		}
		model.addAttribute("row",row);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "/notice/event_Board";
	}
	
	@GetMapping("/eventEnrollForm")
	public String eventEnrollForm() {
		
		return "/admin/eventEnroll";
	}
	
	@PostMapping("/eventEnroll")
	public String eventEnroll(AdminDTO admin,HttpSession session,
			Model model,MultipartFile upload)throws IllegalStateException, IOException {
		
		final String BOARD_NAME="event\\";
		
		admin.setMno((int) session.getAttribute("mno"));
		
		if(!upload.isEmpty()) {
			EventUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, null, admin);			
		}
		int result = adminService.enrollEvent(admin);
		
		if(result>0) {
			System.out.println("이벤트 등록 완료");
		}else {
			System.out.println("이벤트 등록 실패");			
		}
		
		return "home";
	}
	
	@GetMapping("/eventDetail")
	public String eventDetail(@RequestParam(value="eno") int eno,
								AdminDTO admin,MemberDTO member,
								Model model,
								HttpSession session) {
		
		AdminDTO event = adminService.detailEvent(eno);
		
		List<AdminDTO> eventComment = adminService.selectEventComment(eno);
		
		List<MemberDTO> commentProfile = new ArrayList<>();
		if(!Objects.isNull(event)) {
			if(!Objects.isNull(eventComment)) {
				int ecommentCount = adminService.ecommentCount(eno);
				model.addAttribute("ecommentCount",ecommentCount);
				for(AdminDTO ep:eventComment) {
					MemberDTO resultProfile = memberService.memberList(ep.getMno());
					commentProfile.add(resultProfile);
					model.addAttribute("memberResult",commentProfile);
				}
			}
			System.out.println("e게시글 들어오기 완료");
		}else {
			System.out.println("e게시글 들어오기 실패");
		}
	
		model.addAttribute("event",event);
		model.addAttribute("eventComment",eventComment);
		return "/notice/event_Detail";
	}
	
	@GetMapping("/eventDelete.do")
	public String eventDelete(@RequestParam(value="eno")int eno,
								AdminDTO admin,MemberDTO member){
	 
		int result = adminService.deleteEvent(eno);
		if(result == 1) {			
			System.out.println("삭 제 완료");
		}
		else {
			System.out.println("삭 제 실패");
		}
		
		return "redirect:/admin/adminEvent";
		
}

	@PostMapping("/eventUpdate.do")
	public String eventEdit(
			AdminDTO admin,MemberDTO member,Model model,HttpSession session
			,MultipartFile upload) {
		
		final String BOARD_NAME="event\\";
		
		int result = 0;
		
		if (!upload.isEmpty()) {	 			
				EventUploadFile.uploadMethod(upload, null, member, session, BOARD_NAME, null, admin);
				result = adminService.updateEvent(admin);				
			if(result == 1) {
				System.out.println("이미지수정성공");				
				System.out.println(admin.getE_file_name());
				return "redirect:/admin/adminEvent";
			}else {
				System.out.println("이미지수정실패");
				return "home";
			}
		} else if(upload.isEmpty()) {  // 사용자가 파일수정을 안했을때
			result = adminService.updateEventEmpty(admin);
			if(result == 1) {
				System.out.println("수정성공");
				return "redirect:/admin/adminEvent";
			}else {
				System.out.println("수정실패 ㅜㅜㅜn");
				return "home";
			}
			
		}
		
		return "home";
	}
	
	@PostMapping("/addEventComment")
	public String addEventComment(@RequestParam(value="eno")int eno,
				HttpSession session, AdminDTO admin,Model model) {
		
		admin.setEcWriter((String) session.getAttribute("memberNickName"));
		admin.setMno((int) session.getAttribute("mno"));
		
		int result = adminService.addEventComment(admin);
		
		if(result>0) {
			System.out.println("이벤트 댓글성공");
		}else {
			System.out.println("실패");
		}
		
		return"redirect:/admin/eventList";
	}
	
	
	
	
	@PostMapping("/productAnswer.do")
	public String productAnswer(@RequestParam(value="ino")int i_no,
			HttpSession session,AdminDTO admin,GoodsDTO goods,Model model) {
		System.out.println("Dd :" + goods.getI_contents());
		admin.setI_no(i_no);
		admin.setMno((int) session.getAttribute("mno"));
		
		goods.setI_no(i_no);
		goods.setM_no((int) session.getAttribute("mno"));
		int answer = adminService.addAnswer(admin,goods);
		
		if(answer>0) {
			System.out.println("문의 답변완료");
		}else {
			System.out.println("문의 작성실패");
		}
		
		return"redirect:/goods/adminInquiry";
	}
		
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/memberList")
	public String memberList(@RequestParam(value="cpage",defaultValue="1")int cpage,
			MemberDTO member,HttpSession session,
			Model model,AdminDTO admin) {
		
		int listCount = memberService.chefCount(member);
		
		int pageLimit = 12;
		int boardLimit = 12;
		
		int row = listCount - (cpage-1) * boardLimit;
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		List<MemberDTO> list = memberService.chefRank(pi, member);
		
		model.addAttribute("list",list);
		model.addAttribute("row",row);
		model.addAttribute("pi", pi);
		return"admin/memberList";
	}
	
	
	

}