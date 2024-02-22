package kr.co.project.delivery.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryDTO {
	
	int d_no;
	int m_no;
	String d_name; 
	String d_postal_address;
	String d_address;
	String d_detailAdress; 
	String d_phone; 
	String d_request; 
	int d_defaultDelivery; 

}
