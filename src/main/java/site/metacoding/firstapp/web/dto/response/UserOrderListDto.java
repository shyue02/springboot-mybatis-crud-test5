package site.metacoding.firstapp.web.dto.response;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.Orders;

@Setter
@Getter
public class UserOrderListDto {
	private String userName;
	private String ordersName;
	private Integer ordersPrice;
	private Integer ordersQty;	
	private Timestamp createdAt;
}