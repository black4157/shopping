<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
	<title>회원가입 - 배틀그라운드 쇼핑몰</title>
	
	<link rel="stylesheet" href="/resources/css/user/default.css">
	<link rel="stylesheet" href="/resources/css/member/signin.css">
	
	<link rel="icon" href="/resources/images/gun.png" />
</head>

<body>
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp"%>
		</div>
	</header>

	<section id="content">
		<form role="form" method="post" autocomplete="off" class="loginForm">
			<div class="input_area">
				<input type="email" id="userId" name="userId" placeholder="아이디를 입력해주세요 (이메일형식)" required="required" />
			</div>

			<div class="input_area">
				<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해주세요" required="required" />
			</div>

			<div class="input_area">
				<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />
			</div>

			<div class="input_area">
				<input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해주세요" required="required" />
			</div>

			<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>

		</form>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
</body>
</html>
