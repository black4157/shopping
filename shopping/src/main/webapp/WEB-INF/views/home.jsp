<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>배틀그라운드 쇼핑몰</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/css/user/default.css" />
	
	<link rel="icon" href="/resources/images/gun.png" />
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
			
			<div class="slide">
				<img id="back" src="/resources/images/slide/back.png" alt="" width="100">
				<ul>
					<li><a href="shop/view?n=83"><img src="/resources/images/slide/1.png" alt=""></a></li>
					<li><img src="/resources/images/slide/2.png" alt=""></li>
					<li><img src="/resources/images/slide/3.png" alt=""></li>
					<li><img src="/resources/images/slide/4.png" alt=""></li>
					<li><img src="/resources/images/slide/5.png" alt=""></li>
					<li><img src="/resources/images/slide/6.png" alt=""></li>
				</ul>
				<img id="next" src="/resources/images/slide/next.png" alt="" width="100">
			</div>
			<script>
				$(document).ready(function(){
					var imgs;
					var img_count;
					var img_position = 1;

					imgs = $(".slide ul");
					img_count = imgs.children().length;

					$("#back").click(function(){
						back();
					});
					$("#next").click(function(){
						next();
					});

					function back(){
						if(1 < img_position){
							imgs.animate({
								left: "+=400px"
							});
							
						img_position--;
						} else{
							imgs.animate({
								left: "-=2000px"
							});
							img_position = 6;
							//alert("첫 사진입니다.");
						}
					}
					
					function next(){
						if(img_count > img_position){
							imgs.animate({
								left: "-=400px"
						});
							
						img_position++;
						} else{
							imgs.animate({
								left: "+=2000px"
							});
							img_position = 1;
							//alert("마지막 사진입니다.");
						}
					}
				});
			</script>
			
			<div class="GoodsPopular">
				<h2>★ ☆ 인 기 상 품 ☆ ★</h2>
				<div>
					<c:forEach items="${populargoodslist}" var="populargoodslist" varStatus="status">
					<c:if test="${populargoodslist.hit ge 1 && status.count le 5 }">
					<li>
						<c:choose>
							<c:when test="${status.count eq 1}"><h3>1st(${populargoodslist.hit})</h3></c:when>
							<c:when test="${status.count eq 2}"><h3>2nd(${populargoodslist.hit})</h3></c:when>
							<c:when test="${status.count eq 3}"><h3>3rd(${populargoodslist.hit})</h3></c:when>
							<c:when test="${status.count eq 4}"><h3>4th(${populargoodslist.hit})</h3></c:when>
							<c:when test="${status.count eq 5}"><h3>5th(${populargoodslist.hit})</h3></c:when>
						</c:choose>
						
						<a href="/shop/view?n=${populargoodslist.gdsNum }">
							<img src="${populargoodslist.gdsThumbImg}">
							${populargoodslist.gdsName}
						</a>
						
					</li>
					</c:if>
					</c:forEach>
				</div>
			</div>
			
		</section>
	</div>
	
	<!-- top버튼 -->
	<button type="button" href="#" id="TopBtn"><img src="/resources/images/top.png" id="TopImg"></button>
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
			<%@ include file="include/footer.jsp"%>
		</div>
	</footer>
	<script>
		if($("#root").height() >= 550){
			$("#footer").css("position", "relative");
		}
	</script>
</body>
</html>
