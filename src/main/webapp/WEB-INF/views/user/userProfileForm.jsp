<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<input name="id" type="hidden" value="${userProfile.userId}" />
		<div class="mb-3 mt-3">
			<span>아이디</span>
			<input type="text" class="form-control" placeholder="Enter username" value="${userProfile.userName}"
				readonly="readonly">
		</div>
		<div class="mb-3">
			<span>비밀번호</span>
			<input name="password" type="password" class="form-control" placeholder="Enter password"
				value="${userProfile.userPassword}">
		</div>
		<div class="mb-3">
			<span>이메일</span>
			<input name="email" type="email" class="form-control" placeholder="Enter email"
				value="${userProfile.userEmail}">
		</div>
		<button id="btnUpdate" type="button" class="btn btn-primary">회원수정완료</button>
		<button id="btnDelete" class="btn btn-danger">회원탈퇴</button>
	</form>
</div>


<%@ include file="../layout/footer.jsp"%>