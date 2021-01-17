<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>배틀그라운드 쇼핑몰</title>
	
	<link rel="stylesheet" href="/resources/css/user/default.css" />
</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="include/header.jsp"%>
			</div>
		</header>
	
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="include/nav.jsp"%>
			</div>
		</nav>
	
		<section id="container">
			<aside id="aside">
				<%@ include file="include/aside.jsp"%>
			</aside>
		</section>
		
		
	</div>
	<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
</body>
</html>
