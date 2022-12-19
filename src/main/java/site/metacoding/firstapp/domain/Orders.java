package site.metacoding.firstapp.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class Orders {
	private Integer ordersId;
	private String ordersName;
	private Integer ordersPrice;
	private Integer ordersQty;
	private Integer productId;
	private Integer userId;
	private Timestamp createdAt;
	
	
	public Orders(String ordersName, Integer ordersPrice, Integer ordersQty, Integer productId, Integer userId) {
		this.ordersName = ordersName;
		this.ordersPrice = ordersPrice;
		this.ordersQty = ordersQty;
		this.productId = productId;
		this.userId = userId;
	}
}
