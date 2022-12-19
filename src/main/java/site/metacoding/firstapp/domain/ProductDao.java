package site.metacoding.firstapp.domain;

import java.util.List;

import site.metacoding.firstapp.web.dto.request.OrdersDto;

public interface ProductDao {
    public Product findById(Integer productId);
    public List<Product> findAll();
    public int insert(Product product);
    public int update(Product product);
    public int deleteById(Integer productId);
   
    public Product findByProductName(String productName);
    
    public void productQtyUpdate(OrdersDto ordersDto);
}