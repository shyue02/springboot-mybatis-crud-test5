package site.metacoding.firstapp.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.Orders;
import site.metacoding.firstapp.domain.OrdersDao;
import site.metacoding.firstapp.domain.Product;
import site.metacoding.firstapp.domain.ProductDao;
import site.metacoding.firstapp.domain.User;
import site.metacoding.firstapp.web.dto.request.OrdersDto;

@RequiredArgsConstructor
@Controller
public class OrdersController {
	private final HttpSession session;
	private final OrdersDao ordersDao;
	private final ProductDao productDao;

	// 상품 구매 목록
	@GetMapping("/orders/ordersList")
	public String ordersListForm(Model model) {
		User principal = (User) session.getAttribute("principal");
		
//		List<Orders> getOrderList = ordersDao.findAll(principal.getUserId());
//		model.addAttribute("ordersproduct", getOrderList);
		model.addAttribute("ordersproduct", ordersDao.findAll(principal.getUserId()));
		
		return "orders/ordersList";
	}
	
	// 상품 구매하기
	@PostMapping("/orders/{productId}")
	public String ordersList(@PathVariable Integer productId, OrdersDto ordersDto) {
		User principal = (User) session.getAttribute("principal");
		
		if(principal == null) {
			return "redirect:/loginForm";
		}
		
		// 상품수량 - 구매수량 < 0
		Product productPS = productDao.findById(productId);
		if (productPS.getProductQty() - ordersDto.getOrdersQty() < 0) {
			return "redirect:/product/{productId}";
		} 
		
		// 상품 구매 -> 구매목록 페이지로
		productDao.productQtyUpdate(ordersDto);
		ordersDao.insert(ordersDto.toEntity(principal.getUserId()));
		return "redirect:/orders/ordersList";
	}
}