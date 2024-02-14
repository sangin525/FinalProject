package kr.co.project.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.order.model.dao.OrderDetailDAO;
import kr.co.project.order.model.dto.OrderDetailDTO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Override
	public int insertOrderDetail(OrderDetailDTO orderDetail) {
		return orderDetailDAO.insertOrderDetail(sqlSession, orderDetail);
	}

}
