<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
   <form action="/login" method="post">
      <div class="mb-3 mt-3">
         <input name="userName"  type="text" class="form-control" placeholder="아이디를 입력해주세요" >
      </div>
      <div class="mb-3">
         <input name="userPassword" type="password" class="form-control" placeholder="비밀번호를 입력해주세요">
      </div>
      <button type="submit" class="btn btn-primary">구매자 로그인</button>
      <a class="btn btn-primary" href="/joinForm">구매자 회원가입</a>
   </form>
</div>

<%@ include file="../layout/footer.jsp"%>