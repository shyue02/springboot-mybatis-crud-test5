<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>구매 목록 페이지</h3>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>구매 상품명</th>
				<th>구매 상품가격</th>
				<th>구매 상품수량</th>
				<th>구매취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderlist" items="${ordersproduct}">
				<tr>
					<td>${orderlist.ordersName}</td>
					<td>${orderlist.ordersPrice}</td>
					<td>${orderlist.ordersQty}</td>
					<td>
						<form action="/orders/${orderlist.ordersId}/cancle" method="post">
							<input type = "hidden" name="ordersId" value="${orderlist.ordersId}">							
							<input type = "hidden" name="ordersName" value="${orderlist.ordersName}">						
							<input type = "hidden" name="ordersPrice" value="${orderlist.ordersPrice}">	
							<input type = "hidden" name="ordersQty" value="${orderlist.ordersQty}">
							<input type ="hidden" name="productId" value="${orderlist.productId}">								
							<button type="submit"  class="btn btn-danger">구매취소</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../layout/footer.jsp"%>