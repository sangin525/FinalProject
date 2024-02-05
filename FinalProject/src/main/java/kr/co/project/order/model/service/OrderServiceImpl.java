package kr.co.project.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.order.model.dao.OrderDAO;
import kr.co.project.order.model.dto.OrderDTO;

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

}
