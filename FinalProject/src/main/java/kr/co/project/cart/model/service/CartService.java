package kr.co.project.cart.model.service;

import java.util.List;

import kr.co.project.cart.model.dto.CartDTO;

public interface CartService {
	
	int addCart(CartDTO cart);

	int deleteCart(int sc_no);

	int modifyCount(CartDTO cart);

	List<CartDTO> getCart(int mno);

	CartDTO checkCart(CartDTO cart);
}
