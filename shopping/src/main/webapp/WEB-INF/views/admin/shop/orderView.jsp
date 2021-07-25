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
	<link rel="stylesheet" href="/resources/css/admin/shop/orderView.css">

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
				<div class="orderInfo">
					<c:forEach items="${orderView }" var="orderView" varStatus="status">
						<c:if test="${status.first }">
							<p><span>주문자</span>${orderView.userId }</p>
							<p><span>수령인</span>${orderView.orderRec }</p>
							<p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2 } ${orderView.userAddr3 }</p>
							<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount }" /> 원</p>
							<p><span>상태</span>${orderView.delivery }</p>
							
							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
									<input type="hidden" name="orderId" value="${orderView.orderId }" />
									<input type="hidden" name="delivery" class="delivery" value="" />
	 							
									<button type="button" class="delivery1_btn">배송 중</button>
									<button type="button" class="delivery2_btn">배송 완료</button>
									
									<script>
										$(".delivery1_btn").click(function(){
											$(".delivery").val("배송 중");
											run();
										});
		
										$(".delivery2_btn").click(function(){
											$(".delivery").val("배송 완료");
											run();
										});
		
										function run(){
											$(".deliveryForm").submit();
										}
									</script>
									
								</form>
							</div>
						</c:if>
					</c:forEach>
				</div>
				
				<ul class="orderView">
					<c:forEach items="${orderView }" var="orderView">
					<li>
						<div class="thumb">
							<img src="${orderView.gdsThumbImg }" />
						</div>
						
						<div class="gdsInfo">
							<p>
								<span>상품명</span>${orderView.gdsName } <br />
								<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice }" /> 원<br />
								<span>구입 수량</span> ${orderView.cartStock } 개 <br />
								<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원
							</p>
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
