<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

	<title>관리자모드</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>

	<link rel="stylesheet" href="/resources/css/admin/index.css">
	<link rel="stylesheet" href="/resources/css/admin/shop/allReply.css">

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
				<ul>
					<c:forEach items="${reply }" var="reply">
					<li>
						<div class="replyInfo">
							<p>
								<span>작성자</span>${reply.userName } (${reply.userId })
								<span>작성된 상품</span><a href="/shop/view?n=${reply.gdsNum }">바로가기</a>
							</p>
						</div>
						
						<div class="replyContent">
							${reply.repCon }
						</div>
						
						<div class="replyControll">
							<form role="form" method="post" class="replyDel">
								<input type="hidden" name="repNum" value="${reply.repNum }" />
								<input type="button" class="delete_${reply.repNum }_btn" value="삭제">
								<script>
									$(".delete_${reply.repNum }_btn").click(function(){
										var confirmtest = confirm("정말로 삭제하시겠습니까?");
										if(confirmtest == true){
											$(".replyDel").submit();
										} else {
											return;
										}
									});
								</script>
							</form>
						</div>
					</li>
					</c:forEach>
				</ul>
			</div>
		</section>
	</div>
	
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
