<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form action="/user/profile" method="post">
		<input name="id" type="hidden" value="${userProfile.userId}" />
		<div class="mb-3 mt-3">
			<span>아이디</span>
			<input type="text" class="form-control" placeholder="Enter username" value="${userProfile.userName}"
				readonly="readonly">
		</div>
		<div class="mb-3">
			<span>비밀번호</span>
			<input name="userPassword" type="password" class="form-control" placeholder="Enter password"
				value="${userProfile.userPassword}">
		</div>
		<div class="mb-3">
			<span>이메일</span>
			<input name="userEmail" type="email" class="form-control" placeholder="Enter email"
				value="${userProfile.userEmail}">
		</div>
		<button name="btnUpdate" type="submit" class="btn btn-primary">회원수정완료</button>
	</form>
	<c:if test="${principal.role == 'user' }">
	<br>
		<form action="/user/profile/delete" method="post">
			<button name="btnDelete" type="submit" class="btn btn-danger">회원탈퇴</button>
		</form>
	</c:if>
</div>


<%@ include file="../layout/footer.jsp"%>