<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>구매자 구매 목록 페이지</h3>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>구매자 이름</th>
				<th>구매 상품명</th>
				<th>구매 상품가격</th>
				<th>구매 상품수량</th>
				<th>구매 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="userorderlist" items="${userOrderList}">
				<tr>
					<td>${userorderlist.userName}</td>
					<td>${userorderlist.ordersName}</td>
					<td>${userorderlist.ordersPrice}</td>
					<td>${userorderlist.ordersQty}</td>
					<td>${userorderlist.createdAt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../layout/footer.jsp"%>