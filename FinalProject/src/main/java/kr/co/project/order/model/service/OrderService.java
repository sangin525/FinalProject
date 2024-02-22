package kr.co.project.order.model.service;

import java.util.List;

import kr.co.project.order.model.dto.OrderDTO;
import kr.co.project.order.model.dto.OrderDetailDTO;

public interface OrderService {

	int insertOrder(OrderDTO order);
	
	int insertOrderDetail(OrderDetailDTO orderDetail);

	OrderDTO getO_no(OrderDTO order);

	List<OrderDTO> getOrderList(int m_no);

	List<OrderDetailDTO> getOrderDetailList(int o_no);

}
