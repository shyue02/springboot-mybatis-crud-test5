package site.metacoding.firstapp.domain;

import java.util.List;

import site.metacoding.firstapp.web.dto.response.UserOrderListDto;

public interface OrdersDao {
	public Orders findById(Integer ordersId);
	public List<Orders> findAll(Integer userId);	// userId로 어떤 구매자의 구매 상품 목록을 보여줌 
	public void insert(Orders orders);
	public void update(Orders orders);
	public void deleteById(Integer ordersId);
	public List<UserOrderListDto> findAllOrders();		// 모든 구매자의 구매 목록 보여줌 - 관리자 권한
}
