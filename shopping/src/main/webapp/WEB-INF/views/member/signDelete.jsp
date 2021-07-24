<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
	<title>로그인 - 배틀그라운드 쇼핑몰</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
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
			<form role="form" method="post" autocomplete="off" class="loginForm" name="loginForm">
				<div class="input_area">
					<div id="title">
						<p>아이디</p>
					</div>
					<input type="email" id="userId" name="userId" required="required" placeholder="ID" style="ime-mode:disabled;"/>
				</div>
	
				<div class="input_area">
					<div id="title">
						<p>비밀번호</p>
					</div>
					<input type="password" id="userPass" name="userPass" required="required" placeholder="PW" style="ime-mode:disabled;"/>
				</div>
	
				<button type="submit" id="signdelete_btn" name="sign_btn">→</button>
				
				<c:if test="${msg == 'id fail' || msg == 'password fail'}">
					<p style="color:#f00;">계정 인증에 실패했습니다.</p>
				</c:if>
				<c:if test="${msg == 'success'}">
					<script>
						alert("탈퇴되었습니다.");
					</script>
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