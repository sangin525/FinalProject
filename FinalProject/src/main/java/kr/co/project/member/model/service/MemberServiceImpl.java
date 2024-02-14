package kr.co.project.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.member.model.dao.MemberDAO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dto.RecipeDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public MemberDTO loginMember(MemberDTO member) {
		
		return memberDao.loginMember(sqlSession,member);
	}

	@Override
	public int registerMember(MemberDTO member) {
		
		return memberDao.registerMember(sqlSession,member);
	}

	@Override
	public int checkEmail(String email) {
		
		return memberDao.checkEmail(sqlSession,email);
	}

	@Override
	public MemberDTO findMember(int idx) {
		
		return memberDao.findMember(sqlSession,idx);
	}

	@Override
	public int checkNickName(String nickname) {
		
		return memberDao.checkNickName(sqlSession,nickname);
	}

	public int memberEmailUpdate(MemberDTO member) {
		
		return memberDao.memberEmailUpdate(sqlSession,member);
		
	}

	public MemberDTO selectMember(int mno) {
		
		return memberDao.selectMember(sqlSession,mno);
	}

	public int memberNickNameUpdate(MemberDTO member) {
		
		return memberDao.memberNickNameUpdate(sqlSession,member);
	}

	public int secessionMember(MemberDTO member) {
		
		return memberDao.secessionMember(sqlSession,member);
	}

	public int chefCount(MemberDTO member) {
	
		return memberDao.chefCount(sqlSession,member);
	}

	public List<MemberDTO> chefRank(PageInfo pi, MemberDTO member) {
		
		return memberDao.chefRank(sqlSession,pi,member);
	}

	

	public int selectMember2(MemberDTO member) {
		
		return memberDao.selectMember2(sqlSession,member);
	}
	
	
}
