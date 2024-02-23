package kr.co.project.member.model.service;

import java.util.List;
import java.util.Objects;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.member.model.dao.MemberDAO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dao.RecipeDAO;
import kr.co.project.recipe.model.dto.RecipeDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private RecipeDAO recipeDao;
	
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

	public int memberNickNameUpdate(MemberDTO member,RecipeDTO recipe) {
		
		int result1 = memberDao.memberNickNameUpdate(sqlSession,member);
		System.out.println("a : " + Objects.isNull(recipe));
		System.out.println("b : " + Objects.isNull(recipeDao));
		int result2 = recipeDao.memberNickNameUpdate(sqlSession,recipe);
		if(result1==1&&result2==1) {
			System.out.println("성공");		
		}
		return 1;
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

	public int memberUpdate(MemberDTO member) {
		
		return memberDao.memberUpdate(sqlSession,member);
	}

	public String selectFileName(MemberDTO member) {
		
		return memberDao.selectFileName(sqlSession,member);
	}

	public MemberDTO memberProfile(int mno) {
		
		return memberDao.memberProfile(sqlSession,mno);
	}

	public List<MemberDTO> categoryMember(int mno) {
		
		return memberDao.categoryMember(sqlSession,mno);
	}

	public MemberDTO memberList(int mno) {
		
		return memberDao.memberList(sqlSession,mno);
	}

	public MemberDTO logMember(int mno) {
		
		return memberDao.logMember(sqlSession,mno);
	}

	
	
	
}
