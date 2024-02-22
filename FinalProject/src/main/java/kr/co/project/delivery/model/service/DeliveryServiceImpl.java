package kr.co.project.delivery.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.delivery.model.dao.DeliveryDAO;
import kr.co.project.delivery.model.dto.DeliveryDTO;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private DeliveryDAO deliveryDAO;

	@Override
	public int saveDelivery(DeliveryDTO delivery) {
		return deliveryDAO.saveDelivery(sqlSession,delivery);
	}
	
	@Override
	public List<DeliveryDTO> deliveryList(int mno){
		return deliveryDAO.deliveryList(sqlSession,mno);
	}
	
//	@Override
//	public DeliveryDTO defaultDelivery(int mno) {
//		
//	}

}
