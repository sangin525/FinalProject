package kr.co.project.chef.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.chef.model.dto.ChefDTO;
import kr.co.project.member.model.dto.MemberDTO;

@Repository
public class ChefDAO {

	public int registerChef(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.insert("chefMapper.registerChef",mno);
	}

//	public int selectMember(SqlSessionTemplate sqlSession, MemberDTO member) {
//		
//		return sqlSession.selectOne("chefMappe.selectMember",member);
//	}

}
