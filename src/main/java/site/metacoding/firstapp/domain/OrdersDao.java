package site.metacoding.firstapp.domain;

import java.util.List;

public interface OrdersDao {
	public Orders findById(Integer ordersId);
	public List<Orders> findAll(Integer userId);	// userId로 어떤 구매자의 구매 상품 목록을 보여줌 
	public void insert(Orders orders);
	public void update(Orders orders);
	public void delete(Integer ordersId);
}
