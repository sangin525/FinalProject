package kr.co.project.cart.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.cart.model.dao.CartDAO;
import kr.co.project.cart.model.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CartDAO cartDAO;

	@Override
	public int addCart(CartDTO cart) {//
		return cartDAO.addCart(sqlSession, cart);
	}

	@Override
	public int deleteCart(int sc_no) {//
		return cartDAO.deleteCart(sqlSession, sc_no);
	}

	@Override
	public int modifyCount(CartDTO cart) {//
		return cartDAO.modifyCount(sqlSession, cart);
	}

	@Override
	public List<CartDTO> getCart(int mno) {//
		return cartDAO.getCart(sqlSession, mno);
	}

	@Override
	public CartDTO checkCart(CartDTO cart) {//해야함
		return cartDAO.checkCart(sqlSession, cart);
	}
	
	@Override
	public CartDTO getCartInfo(int sc_no) {
		return cartDAO.getCartInfo(sqlSession, sc_no);
	}
	
}
