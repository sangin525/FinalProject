package kr.co.project.cart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.cart.model.dto.CartDTO;

@Repository
public class CartDAO {
	public int addCart(SqlSessionTemplate sqlSession, CartDTO cart) {
		return sqlSession.insert("cartMapper.addCart", cart);
	}

	public int deleteCart(SqlSessionTemplate sqlSession, int sc_no) {
		return sqlSession.delete("cartMapper.deleteCart", sc_no);
	}

	public int modifyCount(SqlSessionTemplate sqlSession, CartDTO cart) {
		return sqlSession.update("cartMapper.modifyCount", cart);
	}

	public List<CartDTO> getCart(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectList("cartMapper.getCart", mno);
	}

	public CartDTO checkCart(SqlSessionTemplate sqlSession,CartDTO cart) {
	
		return sqlSession.selectOne("cartMapper.checkCart", cart);
	}
	

}
