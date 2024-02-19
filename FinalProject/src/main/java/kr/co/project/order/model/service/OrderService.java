package kr.co.project.order.model.service;

import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;

public interface OrderService {

	int insertOrder(OrderDTO order);
	
	int insertOrderDetail(OrderDetailDTO orderDetail);

}
