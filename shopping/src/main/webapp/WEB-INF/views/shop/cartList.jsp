<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>장바구니 - 배틀그라운드 쇼핑몰</title>

	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/user/default.css" />
	<link rel="stylesheet" href="/resources/css/user/shop/cartList.css" />

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
			<div id="container_box">
				<section id="content">
					<ul>
						<li>
							<div class="allCheck">
								<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
								
								<script>
									$("#allCheck").click(function(){
										var chk = $("#allCheck").prop("checked");
										if(chk){
											$(".chBox").prop("checked", true);
										} else {
											$(".chBox").prop("checked", false);
										}
									});
								</script>
							</div>
							
							<div class="delBtn">
								<button type="button" class="selectDelete_btn">선택 삭제</button>
								
								<script>
									$(".selectDelete_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");

										if(confirm_val){
											var checkArr = new Array();

											$("input[class='chBox']:checked").each(function(){
												checkArr.push($(this).attr("data-cartNum"));
											});

											$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : { chbox : checkArr},
												success : function(result){
													if(result == 1){
														location.href = "/shop/cartList";
													} else{
														alert("삭제 실패");	
													}
												}
											});
										}
									});
								</script>
							</div>
						</li>
						<c:set var="sum" value="0" />
						<c:forEach items="${cartList }" var="cartList">
						<li>
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum }" />
								
								<script>
									$(".chBox").click(function(){
										$("#allCheck").prop("checked", false)
									});
								</script>
							</div>
							
							<div class="thumb">
								<img src="${cartList.gdsThumbImg }">
							</div>
							
							<div class="gdsInfo">
								<p>
									<span>상품명 : </span>${cartList.gdsName}<br />
									<span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice }" /> 원<br />
									<span>구입 수량 : </span>${cartList.cartStock } 개<br />
									<span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock }"/> 원
								</p>
								
								<div class="delete">
									<button type="button" class="delete_${cartList.cartNum }_btn" data-cartNum="${cartList.cartNum }">삭제</button>
									
									<script>
										$(".delete_${cartList.cartNum }_btn").click(function(){
											var confirm_val = confirm("정말 삭제하시겠습니까?");

											if(confirm_val){
												var checkArr = new Array();

												checkArr.push($(this).attr("data-cartNum"));

												$.ajax({
													url : "/shop/deleteCart",
													type : "post",
													data : {chbox : checkArr},
													success : function(result){
														if(result == 1){
															location.href="/shop/cartList";
														} else {
															alert("삭제 실패");
														}
													}
												});
											}
										});
									</script>
								</div>
							</div>
						</li>
						<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock) }" />
						</c:forEach>
					</ul>
					
					<div class="listResult">
						<div class="sum">
							총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum }" />원
						</div>
						
						<div class="orderOpne">
							<button type="button" class="orderOpne_btn">주문 정보 입력</button>
							
							<script>
								$(".orderOpne_btn").click(function(){
									$(".orderInfo").slideDown();
									//$(".orderOpne_btn").slideUp();
								});
							</script>
						</div>
					</div>
					
					<div class="orderInfo">
						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="amount" value="${sum }" />
							
							<div class="inputArea">
								<label for="">수령인</label>
								<input type="text" name="orderRec" id="orderRec" required="required" value="${member.userName}"/>
							</div>
							
							<div class="inputArea">
								<label for="orderPhon">수령인 연락처</label>
								<input type="text" name="orderPhon" id="orderPhon" required="required" value="${member.userPhon}"/>
							</div>
							
							<!-- <div class="inputArea">
								<label for="userAddr1">우편번호</label>
								<input type="text" name="userAddr1" id="userAddr1" required="required" />
							</div>
							
							<div class="inputArea">
								<label for="userAddr2">1차 주소</label>
								<input type="text" name="userAddr2" id="userAddr2" required="required" />
							</div>
							
							<div class="inputArea">
								<label for="userAddr3">2차 주소</label>
								<input type="text" name="userAddr3" id="userAddr3" required="required" />
							</div> -->
							
							<div class="inputArea">
								<p>
									<input type="text" name="userAddr1" id="sample2_postcode" placeholder="우편번호" value="${member.userAddr1}">
									<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
								</p>
								
								<p>
									<input type="text" name="userAddr2" id="sample2_address" placeholder="주소" value="${member.userAddr2}"><br>
									<input type="text" name="userAddr3" id="sample2_detailAddress" placeholder="상세주소" value="${member.userAddr3}">
									<input type="text" id="sample2_extraAddress" placeholder="참고항목">
								</p>
								
								<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
								<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
								</div>
							</div>
							<div class="inputArea">
								<button type="submit" class="order_btn">주문</button>
								<button type="button" class="cancel_btn">취소</button>
								
								<script>
									$(".cancel_btn").click(function(){
										$(".orderInfo").slideUp();
										//$(".orderOpne_bnt").slideUp();
									});
							</script>
							</div>
						</form>
					</div>
				</section>
				
				<aside id="aside">
					<%@ include file="../include/aside.jsp"%>
				</aside>
			</div>
		</section>
	</div>
	
	<%@ include file="../include/TopBtn.jsp" %>
	
	<%@ include file ="../include/kakaoAddr.jsp" %>
	
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
	
</body>
</html>