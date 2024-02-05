package kr.co.project.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.member.model.dto.MemberDTO;

@Repository
public class MemberDAO {

	public MemberDTO loginMember(SqlSessionTemplate sqlSession, MemberDTO member) {
		
		return sqlSession.selectOne("memberMapper.loginMember",member);
	}

	public int registerMember(SqlSessionTemplate sqlSession, MemberDTO member) {
		
		return sqlSession.insert("memberMapper.registerMember",member);
	}

//	public int registerMember(SqlSessionTemplate sqlSession, MemberDTO member) {
//		int result1 = sqlSession.insert("memberMapper.registerMember",member);
//		int reuslt2 = sqlSession.insert("memberMapper.registerMember",member);
//		if(result1 == 1 && reuslt2 == 1) {
//			return 1;
//		} else {
//			return 0;
//		}
//		return sqlSession.insert("memberMapper.registerMember",member);
//	}
	
	
	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.checkEmail",email);
	}

	public MemberDTO findMember(SqlSessionTemplate sqlSession, int idx) {
		
		return sqlSession.selectOne("memberMapper.findMember",idx);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickname) {
		
		return sqlSession.selectOne("memberMapper.checkNickName",nickname);
	}

	public int plusRecipeCount(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("memberMapper.plusRecipeCount", mno);
	}

	public int memberEmailUpdate(SqlSessionTemplate sqlSession, MemberDTO member) {
		
		return sqlSession.update("memberMapper.memberEmailUpdate", member);
	}

	public MemberDTO selectMember(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("memberMapper.selectMember",mno);
	}

	public int memberNickNameUpdate(SqlSessionTemplate sqlSession, MemberDTO member) {
	
		return sqlSession.update("memberMapper.memberNickNameUpdate",member);
	}

	public int secessionMember(SqlSessionTemplate sqlSession, MemberDTO member) {
	
		return sqlSession.update("memberMapper.secessionMember",member);
	}

	
}
