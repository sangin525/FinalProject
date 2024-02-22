package kr.co.project.delivery.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.project.delivery.model.dto.DeliveryDTO;

@Repository
public class DeliveryDAO {

	public int saveDelivery(SqlSessionTemplate sqlSession, DeliveryDTO delivery) {
		return sqlSession.insert("DeliveryMapper.saveDelivery", delivery);
	}

	public List<DeliveryDTO> deliveryList(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectList("DeliveryMapper.deliveryList", mno);
	}

}
