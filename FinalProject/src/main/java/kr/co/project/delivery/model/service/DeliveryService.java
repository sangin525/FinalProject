package kr.co.project.delivery.model.service;

import java.util.List;

import kr.co.project.delivery.model.dto.DeliveryDTO;

public interface DeliveryService {

	int saveDelivery(DeliveryDTO delivery);

	List<DeliveryDTO> deliveryList(int mno);

}
