package kr.co.project.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;

@Repository
public class OrderDAO {

	public int insertOrder(SqlSessionTemplate sqlSession, OrderDTO order) {
		return sqlSession.insert("orderMapper.insertOrder", order);
	}

	public int insertOrderDetail(SqlSessionTemplate sqlSession, OrderDetailDTO orderDetail) {
		return sqlSession.insert("orderMapper.insertOrderDetail", orderDetail);
	}

	public OrderDTO getO_no(SqlSessionTemplate sqlSession, OrderDTO order) {
		return sqlSession.selectOne("orderMapper.getO_no", order);
	}

}
