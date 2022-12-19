package site.metacoding.firstapp.web.dto.request;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.firstapp.domain.Orders;

@Setter
@Getter
public class OrdersDto {
	private String ordersName;
	private Integer ordersPrice;
	private Integer ordersQty;	
	private Integer productId;
	
	public Orders toEntity(Integer userId) {
		Orders orders = new Orders(this.ordersName, this.ordersPrice, this.ordersQty, this.productId, userId);
		return orders;
	}
}