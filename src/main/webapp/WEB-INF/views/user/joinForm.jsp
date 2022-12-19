<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form action="/join" method="post">
		<div class="mb-3 mt-3">
			<input name="userName" type="text" class="form-control" placeholder="아이디를 입력해주세요" maxlength="20">
		</div>
		<div class="mb-3">
			<input name="userPassword" type="password" class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="20">
		</div>
		<div class="mb-3">
			<input name="userEmail" type="email" class="form-control" placeholder="이메일을 입력해주세요" maxlength="20">
		</div>
		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>

<%@ include file="../layout/footer.jsp"%>
