<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h3>유저 목록 페이지</h3>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>구매자 이름</th>
				<th>구매자 비밀번호 </th>
				<th>구매자 이메일</th>
				<th>회원</th>
				<th>구매자 회원가입일</th>
				<th>회원삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="userlist" items="${userlist}">
				<tr>
					<td>${userlist.userName}</td>
					<td>${userlist.userPassword}</td>
					<td>${userlist.userEmail}</td>
					<td>${userlist.role}</td>
					<td>${userlist.createdAt}</td>
					<td>
						<form action="/userListForm/${userlist.userId}/delete" method="post">
							<button type="submit"  class="btn btn-danger">회원 삭제</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../layout/footer.jsp"%>