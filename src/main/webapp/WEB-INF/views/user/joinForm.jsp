<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="mb-3 mt-3">
			<input id="userName" type="text" class="form-control" placeholder="아이디를 입력해주세요 (영어만 사용 가능)" maxlength="20">
			<button id ="btnUsernameSameCheck" class="btn btn-warning" type="button">아이디 중복체크</button>
		</div>
		<div class="mb-3">
			<input id="userPassword" type="password" class="form-control" placeholder="비밀번호를 입력해주세요 (띄어쓰기 사용X)" maxlength="20">
		</div>
		<div class="mb-3">
			<input id="userEmail" type="email" class="form-control" placeholder="이메일을 입력해주세요 (ID@emil.com)" maxlength="20">
		</div>
		<button id="btnJoin" type="button" class="btn btn-primary">회원가입</button>
	</form>
</div>

<script src ="/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>