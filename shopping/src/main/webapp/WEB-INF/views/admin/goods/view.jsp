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
	<link rel="stylesheet" href="/resources/css/admin/goods/view.css">

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
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">
				<h2>상품 조회</h2>
	
				<form role="form" method="post" autocomplete="off">
				
				<input type="hidden" name="n" value="${goods.gdsNum }" />
					<div class="inputArea"> 
						<label>1차 분류</label>
						<span class="category1"></span>   
						     
						<label>2차 분류</label>
						<span class="category2">${goods.cateCode}</span>
					</div>
					
					<div class="inputArea">
						<label for="gdsName">상품명</label>
						<span>${goods.gdsName}</span>
					</div>
					
					<div class="inputArea">
						<label for="gdsPrice">상품가격</label>
						<span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
					</div>
					
					<div class="inputArea">
						<label for="gdsStock">상품수량</label>
						<span><fmt:formatNumber value="${goods.gdsStock}" pattern="###,###,###"/></span>
					</div>
					
					<div class="inputArea">
						<label for="gdsDes">상품소개</label>
						<!--  <span>${goods.gdsDes}</span>-->
						<div class="gdsDes">${goods.gdsDes }</div>
					</div>
					
					<div class="inputArea">
						<label for="gdsImg">이미지</label>
						<p>원본이미지</p>
						<img src="${goods.gdsImg }" class="oriImg"/>
						
						<p>썸네일</p>
						<img src="${goods.gdsThumbImg }" class="thumbImg"/>
					</div>
					
					<div class="inputArea">
						<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
					</div>
				</form>
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
	
	<script>
		var formObj = $("form[role='form']");

		$("#modify_Btn").click(function(){
			formObj.attr("action", "/admin/goods/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#delete_Btn").click(function(){
			var con = confirm("정말로 삭제하시겠습니까?");
			if(con){
				formObj.attr("action", "/admin/goods/delete");
				formObj.submit();
			}
		});
		
	</script>
</body>
</html>
