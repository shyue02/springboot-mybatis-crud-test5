<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>상품 수정 페이지</h3>
	<form action="/product/${edit.productId}/edit" method="post">
		<input name="productId" type="hidden" value="${edit.productId}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품수량</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input name="productName" type="text"
						class="form-control" value="${edit.productName}"></td>
					<td><input name="productPrice" type="text"
						class="form-control" value="${edit.productPrice}"></td>
					<td><input name="productQty" type="text"
						class="form-control" value="${edit.productQty}"></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button type="submit" class="btn btn-primary">상품수정완료</button>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp"%>