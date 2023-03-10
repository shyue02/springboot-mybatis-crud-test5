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
			<a class="navbar-brand" href="/product">๐์ผํ๋ชฐ๐</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/">์ํ๋ชฉ๋ก</a>
					<c:choose>
						<c:when test="${empty principal}">
							<li class="nav-item"><a class="nav-link" href="/loginForm">๊ตฌ๋งค์ ๋ก๊ทธ์ธ</a></li>					
							<li class="nav-item"><a class="nav-link" href="/adminloginForm">๊ด๋ฆฌ์ ๋ก๊ทธ์ธ</a></li>			
						</c:when>
						<c:when test="${principal.role == 'user' }">	<!-- ๊ตฌ๋งค์ ๋ก๊ทธ์ธ ์ -->
							<li class="nav-item"><a class="nav-link" href="/orders/ordersList">๊ตฌ๋งค๋ชฉ๋ก</a></li>
							<li class="nav-item"><a class="nav-link" href="/user/profile">ํ์์ ๋ณด</a></li> 	
							<li class="nav-item"><a class="nav-link" href="/logout">๋ก๊ทธ์์</a></li> 									
						</c:when>
						<c:otherwise>	<!-- ๊ด๋ฆฌ์ ๋ก๊ทธ์ธ ์ -->
 							<li class="nav-item"><a class="nav-link" href="/product/add">์ํ๋ฑ๋ก</a></li> 
							<li class="nav-item"><a class="nav-link" href="/userListForm">์ ์  ๋ชฉ๋ก</a></li>
							<li class="nav-item"><a class="nav-link" href="/userOrderListForm">๊ตฌ๋งค ๋ชฉ๋ก</a></li>
							<li class="nav-item"><a class="nav-link" href="/user/profile">ํ์์ ๋ณด</a></li> 	
							<li class="nav-item"><a class="nav-link" href="/logout">๋ก๊ทธ์์</a></li>
						</c:otherwise>
					</c:choose>	
				</ul>
			</div>
		</div>
	</nav>