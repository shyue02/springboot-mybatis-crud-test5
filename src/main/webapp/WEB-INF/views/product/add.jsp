<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>상품 등록 페이지</h3>
	<form>
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
					<td><input id="name" type="text"
						class="form-control" placeholder="상품명을 입력하세요"></td>
					<td><input id="price" type="text"
						class="form-control" placeholder="가격을 입력하세요"></td>
					<td><input id="qty" type="text"
						class="form-control" placeholder="수량을 입력하세요"></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<button id="btnProductSameCheck" type="button" class="btn btn-warning">상품명 중복 확인</button>
			<button id="btnInsert" type="button" class="btn btn-primary">상품등록</button>
		</div>
	</form>
</div>

<script src="/js/add.js"></script>
<%@ include file="../layout/footer.jsp"%>