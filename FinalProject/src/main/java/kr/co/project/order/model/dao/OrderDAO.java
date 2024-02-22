package kr.co.project.order.model.dao;

import java.util.List;

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

	public List<OrderDTO> getOrderList(SqlSessionTemplate sqlSession, int m_no) {
		return sqlSession.selectList("orderMapper.getOrderList", m_no);
	}

	public List<OrderDetailDTO> getOrderDetailList(SqlSessionTemplate sqlSession, int o_no) {
		return sqlSession.selectList("orderMapper.getOrderDetailList", o_no);
	}

}
