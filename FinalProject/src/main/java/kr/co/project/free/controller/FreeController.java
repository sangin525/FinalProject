package kr.co.project.free.controller;

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

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.upload.FreeUploadFile;
import kr.co.project.free.model.dto.FreeDTO;
import kr.co.project.free.model.service.FreeServiceImpl;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.member.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/free")
public class FreeController {

	private static final String BOARD_NAME = "free\\";
	
	@Autowired
	private FreeServiceImpl freeService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	
	@GetMapping("/adminFree")
	public String adminNotice(FreeDTO free,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			Model model, HttpSession session) {
		
		int listCount = freeService.selectListCount(free);
		
		int pageLimit = 10;
		int boardLimit =15;
		
		int row = listCount-(cpage-1) * boardLimit;
//		admin.setWriter((int) session.getAttribute("memberNickName"));
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);		
		List<FreeDTO> list = freeService.selectListAll(pi,free);
		for(FreeDTO item:list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
		}
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "/admin/adminFree";
	
	}
	
	@GetMapping("/freeList")
	public String freeList(FreeDTO free, @RequestParam(value="cpage",defaultValue="1") 
						   int cpage,Model model, HttpSession session) {
		
		int listCount = freeService.selectListCount(free);
		
		int pageLimit = 10;
		int boardLimit =15;
		
		int row = listCount-(cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		List<FreeDTO> list = freeService.selectListAll(pi,free);
		for(FreeDTO item:list) {
			String indate = item.getIndate().substring(0,10);
			item.setIndate(indate);
		}
		model.addAttribute("row",row);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		return "/notice/free_Board";
	}
	
	@GetMapping("/freeEnrollForm")
	public String freeEnrollForm() {
		return "/notice/free_Enroll";
	}
	
	@PostMapping("/freeEnroll")
	public String freeEnroll(FreeDTO free,HttpSession session,
							Model model,MultipartFile upload)
							throws IllegalStateException, IOException{
		
		
		free.setMno((int) session.getAttribute("mno"));
		free.setWriter((String) session.getAttribute("memberNickName"));
		if(!upload.isEmpty()) {
			FreeUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, free, null);			
		}
		
		int result = freeService.enrollFree(free);
		if(result>0) {
			System.out.println("자게 작성완료");
		}else {
			System.out.println("자게 작성실패");
		}
		return "redirect:/free/freeList";
	}
	
	@GetMapping("/freeDetail")
	public String freeDetail(@RequestParam(value="flno")int flno,
			FreeDTO free,MemberDTO member,HttpSession session,
			Model model) {
		
		FreeDTO result = freeService.freeDetail(flno);
		
		List<FreeDTO> freeComment = freeService.selectComment(flno);
		
		List<MemberDTO> commentProfile = new ArrayList<>();
		if(!Objects.isNull(result)) {
			if(!Objects.isNull(freeComment)) {
				int commentCount = freeService.commentCount(flno);
				model.addAttribute("commentCount",commentCount);
				for(FreeDTO fp:freeComment) {
					MemberDTO resultProfile = memberService.memberList(fp.getMno());
					commentProfile.add(resultProfile);
					model.addAttribute("memberResult",commentProfile);
				}
			}
		}
		
		model.addAttribute("free",result);
		model.addAttribute("freeComment",freeComment);
		return "/notice/free_Detail";
	}
	
	@GetMapping("/freeDelete")
	public String freeDelete(@RequestParam(value="flno")int flno,
			FreeDTO free,MemberDTO member) {
		
		int result = freeService.freeDelete(flno);
		if(result == 1) {
			System.out.println("삭제성공");
		}else {
			System.out.println("실패");
		}
		
		
		return"redirect:/free/freeList";
	}
	
	@GetMapping("/freeEditForm")
	public String freeEditForm(@RequestParam(value="flno")int flno,Model model) {
			
			FreeDTO free = freeService.freeEditForm(flno);
			
			
			if(!Objects.isNull(free)) {
				model.addAttribute("free",free);
			
				return "/notice/free_Edit";
			}else {
				return "home";
			}
	}
	
	@PostMapping("/freeEdit")
	public String freeEdit(MultipartFile upload, FreeDTO free, HttpSession session) {
		
		int result=0;
		if(!upload.isEmpty()) {
			FreeUploadFile.uploadMethod(upload, null, null, session, BOARD_NAME, free, null);
			result = freeService.updateFree(free);
			System.out.println(free.getFileName());
			
			if(result == 1) {
				return "redirect:/free/freeList";
			}else {
				return "home";
			}
		}else if(upload.isEmpty()) {
			if(result==1) {				
				result = freeService.updateFreeEmpty(free);
				return "redirect:/free/freeList";
			}else {
				return "home";
			}
		}
		
		return  "home";
	}
	
	@PostMapping("/comment.do")
	public String comment(@RequestParam(value="flno")int flno,
			HttpSession session,FreeDTO free,Model model) {
		
		free.setFcwriter((String) session.getAttribute("memberNickName"));
		free.setMno((int) session.getAttribute("mno"));
		
		int result = freeService.addComment(free);
		
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/free/freeList";
	}
	
	
	
	
	
	
	
	
}
