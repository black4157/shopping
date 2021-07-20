<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

	<title>관리자모드</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet"
		href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>

	<link rel="stylesheet" href="/resources/css/admin/index.css">
	<link rel="stylesheet" href="/resources/css/admin/shop/orderList.css">

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
			<aside>
				<%@ include file="../include/aside.jsp" %>
			</aside>
			<div id="container_box">
				<ul class="orderList">
					<c:forEach items="${orderList }" var="orderList">
					<li>
						<div>
							<p><span>주문번호</span><a href="/admin/shop/orderView?n=${orderList.orderId }">${orderList.orderId }</a></p>
							<p><span>주문자</span>${orderList.userId }</p>
							<p><span>수령자</span>${orderList.orderRec }</p>
							<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2 } ${orderList.userAddr3 }</p>
							<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount }" /> 원</p>
							<p><span>상태</span>${orderList.delivery }</p>
						</div>
					</li>
					</c:forEach>
				</ul>
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
		if($("#root").height() >= 486){
			$("#footer").css("position", "relative");
		}
	</script>
</body>
</html>
