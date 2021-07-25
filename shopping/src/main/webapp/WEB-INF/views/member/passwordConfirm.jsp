<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
	</div>
	
	<section id="content">
		<form role="form" method="post" autocomplete="off" class="loginForm">
			<input type="hidden" id="userId" name="userId" value="${member.userId }" style="ime-mode:disabled;"/>
			
			<div class="input_area">
				<input type="password" id="userPass" name="userPass" required="required" placeholder="PW" style="ime-mode:disabled;"/>
			</div>

			<button type="submit" id="signin_btn" name="sign_btn">수정하기</button>

			<c:if test="${msg == false }">
				<p style="color:#f00;">비밀번호가 틀립니다.</p>
			</c:if>
		</form>
	</section>
	
	<%@ include file="../include/TopBtn.jsp" %>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>

</body>
</html>