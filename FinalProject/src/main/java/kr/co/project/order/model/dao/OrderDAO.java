package kr.co.project.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.order.model.dto.OrderDTO;

@Repository
public class OrderDAO {

	public int insertOrder(SqlSessionTemplate sqlSession, OrderDTO order) {
		return sqlSession.insert("orderMapper.insertOrder",order);
	}

}
