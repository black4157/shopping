<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
	<title>로그인 - 배틀그라운드 쇼핑몰</title>
	
	<link rel="stylesheet" href="/resources/css/user/default.css" />
	<link rel="stylesheet" href="/resources/css/member/signin.css" />
	
	<link rel="icon" href="/resources/images/gun.png" />
</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	
		<%-- 
		
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav> 
		
		--%>
	
		<section id="content">
			<form role="form" method="post" autocomplete="off" class="loginForm">
				<div class="input_area">
					<h2>Login</h2>
					<input type="email" id="userId" name="userId" required="required" placeholder="ID" style="ime-mode:disabled;"/>
				</div>
	
				<div class="input_area">
					<input type="password" id="userPass" name="userPass" required="required" placeholder="PW" style="ime-mode:disabled;"/>
				</div>
	
				<button type="submit" id="signin_btn" name="sign_btn">로그인</button>
				<div class="bottomText">
			        Don't you have ID? <a href="/member/signup">sign up</a>
		        </div>
				<c:if test="${msg == false }">
					<p style="color:#f00;">로그인에 실패했습니다.</p>
				</c:if>
				
			</form>
		</section>
	</div>
	
	<%@ include file="../include/TopBtn.jsp" %>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
</body>
</html>