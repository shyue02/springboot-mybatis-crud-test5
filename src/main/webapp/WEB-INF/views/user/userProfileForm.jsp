<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<input id="userId" type="hidden" value="${userProfile.userId}" />
		<div class="mb-3 mt-3">
			<span>아이디</span>
			<input type="text" class="form-control" placeholder="Enter username" value="${userProfile.userName}"
				readonly="readonly">
		</div>
		<div class="mb-3">
			<span>비밀번호</span>
			<input id="userPassword" type="password" class="form-control" placeholder="Enter password"
				value="${userProfile.userPassword}">
		</div>
		<div class="mb-3">
			<span>이메일</span>
			<input id="userEmail" type="email" class="form-control" placeholder="Enter email"
				value="${userProfile.userEmail}">
		</div>
		<div>
			<button id="btnUpdate" type="button" class="btn btn-primary">회원수정완료</button>
			<c:if test="${principal.role == 'user' }">
				<button id="btnDelete" type="button" class="btn btn-danger">회원탈퇴</button>
			</c:if>
		</div>
	</form>
</div>

<script src ="/js/userProfile.js"></script>

<%@ include file="../layout/footer.jsp"%>