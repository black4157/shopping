<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>주문 리스트 - 배틀그라운드 쇼핑몰</title>

	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/user/default.css" />
	<link rel="stylesheet" href="/resources/css/user/shop/orderList.css" />
	
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
			<div id="container_box">
				<section id="content">
					<ul class="orderList">
						<c:forEach items="${orderList }" var="orderList">
						<li>
							<div>
								<p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId }">${orderList.orderId }</a></p>
								<p><span>수령인</span>${orderList.orderRec }</p>
								<p><span>주소</span>(${orderList.userAddr1 }) ${orderList.userAddr2 } ${orderList.userAddr3 }</p>
								<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount }" />원</p>
								<p><span>상태</span>${orderList.delivery }</p>
							</div>
						</li>
						</c:forEach>
					</ul>
				</section>
				
				<aside id="aside">
					<%@ include file="../include/aside.jsp"%>
				</aside>
			</div>
		</section>
	</div>
	
	<!-- top버튼 -->
	<button type="button" href="#" id="TopBtn">Top</button>
	<script>
		$(function() {
			$(window).scroll(function(){
				if($(this).scrollTop() > 200){
					$("#TopBtn").fadeIn();
				} else {
					$("#TopBtn").fadeOut();
				}
			});

			$("#TopBtn").click(function(){
				$("html, body").animate({
					scrollTop : 0
				},400);
			});
		});
	</script>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
	<script>
		if($("#root").height() >= 486){
			$("#footer").css("position", "relative");
		}
	</script>
</body>
</html>