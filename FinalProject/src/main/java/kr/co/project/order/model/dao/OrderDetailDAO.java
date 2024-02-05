package kr.co.project.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.order.model.dto.OrderDetailDTO;

@Repository
public class OrderDetailDAO {

	public int insertOrderDetail(SqlSessionTemplate sqlSession, OrderDetailDTO orderDetail) {

		return sqlSession.insert("orderDetailMapper.insertOrderDetail", orderDetail);
	}

}
