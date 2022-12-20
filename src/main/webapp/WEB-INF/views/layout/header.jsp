<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/product">🍑쇼핑몰🍑</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">상품목록</a>
					<c:choose>
						<c:when test="${empty principal}">
							<li class="nav-item"><a class="nav-link" href="/loginForm">구매자 로그인</a></li>					
							<li class="nav-item"><a class="nav-link" href="/adminloginForm">관리자 로그인</a></li>			
						</c:when>
						<c:when test="${principal.role == 'user' }">	<!-- 구매자 로그인 시 -->
							<li class="nav-item"><a class="nav-link" href="/orders/ordersList">구매목록</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li> 									
						</c:when>
						<c:otherwise>	<!-- 관리자 로그인 시 -->
 							<li class="nav-item"><a class="nav-link" href="/product/add">상품등록</a></li> 
							<li class="nav-item"><a class="nav-link" href="/userListForm">유저 목록</a></li>
							<li class="nav-item"><a class="nav-link" href="/userOrderListForm">구매 목록</a></li>
							<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>	
				</ul>
			</div>
		</div>
	</nav>