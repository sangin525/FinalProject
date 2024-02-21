package kr.co.project.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.order.model.dao.OrderDAO;
import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderDTO order) {
		return orderDAO.insertOrder(sqlSession, order);
	}
	
	@Override
	public int insertOrderDetail(OrderDetailDTO orderDetail) {
		return orderDAO.insertOrderDetail(sqlSession, orderDetail);
	}
	
	@Override
	public OrderDTO getO_no(OrderDTO order) {
		return orderDAO.getO_no(sqlSession, order);

	}

}
