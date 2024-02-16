package kr.co.project.admin.controller;

import java.io.IOException;
import java.util.List;

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
			
		
		return "home";
	}
	
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
		System.out.println(eventList);
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
		System.out.println(list);
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
		return"admin/memberList";
	}
	
	@GetMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam(value="acno")int acno,
								AdminDTO admin,MemberDTO member){
	
		
		
		
		return "home";
	
		
}
	@PostMapping("/noticeUpdate.do")
	public String noticeEdit(
			AdminDTO admin,MemberDTO member,Model model,HttpSession session
			,MultipartFile upload) {
		int result = 0;
		
		if (!upload.isEmpty()) {
			
			System.out.println(admin.getTitle());
			System.out.println(admin.getAcno());
			System.out.println(admin.getContents());
			String fileName = adminService.selectFileName(admin.getAcno());
			System.out.println("a:  +" + fileName);
			boolean deleteFile = AdminUploadFile.deleteFile(fileName, BOARD_NAME);
			
			System.out.println(deleteFile);
			if(deleteFile) {
				AdminUploadFile.uploadMethod(upload, null, member, session, BOARD_NAME, null, admin);
				result = adminService.updateNotice(admin);	
			} else if(upload.isEmpty()) {
				result = adminService.updateNoticeEmpty(admin);
			}
			if(result == 1) {
				System.out.println("수정성공");
				return "redirect:/admin/adminNotice";
			}else {
				System.out.println("수정실패");
				return "home";
			}
		}
		
		return "home";
	}
	

}