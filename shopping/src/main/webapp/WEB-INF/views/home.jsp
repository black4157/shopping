<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>nose</title>
	
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
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="include/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>
</html>
