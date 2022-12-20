<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>상품 상세보기 페이지</h3>
	<form action="/orders/${detail.productId}" method="post" >
		<input name="ordersid" type="hidden" value="${detail.productId}">
		<input name="ordersName" type="hidden" value="${detail.productName}">
		<input name="ordersPrice" type="hidden" value="${detail.productPrice}">
		<table class="table table-striped">
			<thead>
				<tr>	
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품수량</th>
					<c:if test="${principal.role == 'user'}">
						<th>구매수량</th>
					</c:if>
			 	</tr>
			</thead>
			<tbody>
				<tr>
					<td>${detail.productName}</td>
					<td>${detail.productPrice}</td>
					<td>${detail.productQty}</td>
					<c:if test="${principal.role == 'user'}">
						<td width="150">
							<input name="ordersQty" type="number"  min="1" class="form-control">	
						</td>
					</c:if>
				</tr>
			</tbody>
		</table>
		<c:if test="${principal.role == 'user'}">
			<button type="submit" class="btn btn-primary">구매하기</button>
		</c:if>
	</form>
	<div class="d-flex">
		<c:if test="${principal.role == 'admin' }">
				<a href="/product/${detail.productId}/edit" class="btn btn-warning">상품수정</a>
				<form action="/product/${detail.productId}/delete" method="post">
					<button type="submit"  class="btn btn-danger">상품삭제</button>
				</form>
		</c:if>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>