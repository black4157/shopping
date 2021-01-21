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
					<li><img src="/resources/images/slide/1.png" alt=""></li>
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
								left: "+=800px"
							});
							
						img_position--;
						} else{
							alert("첫 사진입니다.");
						}
					}
					
					function next(){
						if(img_count > img_position){
							imgs.animate({
								left: "-=800px"
						});
							
						img_position++;
						} else{
							alert("마지막 사진입니다.");
						}
					}
				});
			</script>
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
			<%@ include file="include/footer.jsp"%>
		</div>
	</footer>
	<script>
		if($("#root").height() >= 420){
			$("#footer").css("position", "relative");
		}
	</script>
</body>
</html>
