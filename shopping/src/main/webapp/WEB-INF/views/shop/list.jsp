<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>배틀그라운드 쇼핑몰</title>

	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/user/default.css" />
	<link rel="stylesheet" href="/resources/css/user/shop/list.css" />
	
	<link rel="icon" href="/resources/images/gun.png" />
</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
		
		<section id="container">
			<aside id="aside">
				<%@ include file="../include/aside.jsp"%>
			</aside>
			
			<div id="container_box">
				<section id="content">
					<ul>
						<c:forEach items="${list }" var="list">
						<li>
							<div class="goodsThumb">
								<a href="/shop/view?n=${list.gdsNum }"><img src="${list.gdsThumbImg }"></a>
							</div>
							<div class="goodsName">
								<a href="/shop/view?n=${list.gdsNum }">${list.gdsName }</a>
							</div>
							<div class="goodsHit">
								<a href="/shop/view?n=${list.gdsNum }">조회수 ${list.hit }</a>
							</div>
						</li>
						</c:forEach>
					</ul>
				</section>
			</div>
		</section>
	</div>
	
	<%@ include file="../include/TopBtn.jsp" %>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
	<script>
		if($("#root").height() >= 500){
			$("#footer").css("position", "relative");
		}
	</script>
</body>
</html>