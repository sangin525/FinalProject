package kr.co.project.member.model.service;

import kr.co.project.member.model.dto.MemberDTO;

public interface MemberService {

	MemberDTO loginMember(MemberDTO member);
	
	public int registerMember(MemberDTO member);
	
	public int checkEmail(String email);
	
	public int checkNickName(String nickname);
	
	public MemberDTO findMember(int idx);
}
