package kr.co.project.chef.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.chef.model.dao.ChefDAO;
import kr.co.project.chef.model.dto.ChefDTO;
import kr.co.project.member.model.dto.MemberDTO;

@Service
public class ChefServiceImpl implements ChefService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChefDAO chefDao;
		
	
	@Override
	public int registerChef(int mno) {
		
		return chefDao.registerChef(sqlSession,mno);
	}


//	@Override
//	public int selectMember(MemberDTO member) {
//		
//		return chefDao.selectMember(sqlSession,member);
//	}

}
