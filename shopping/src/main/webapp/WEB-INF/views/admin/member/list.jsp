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
	<link rel="stylesheet" href="/resources/css/admin/goods/list.css">
	
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
				<table>
					<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>전화번호</th>
							<th>주소1</th>
							<th>주소2</th>
							<th>주소3</th>
							<th>가입날짜</th>
							<th>등급</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList }" var="memberList">
						<tr>
							<td>${memberList.userId }</td>
							<td>${memberList.userName }</td>
							<td>${memberList.userPhon }</td>
							<td>${memberList.userAddr1 }</td>
							<td>${memberList.userAddr2 }</td>
							<td>${memberList.userAddr3 }</td>
							<td><fmt:formatDate value="${memberList.regDate }" pattern="YYYY-MM-DD" /></td>
							<td>${memberList.verify }</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
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
		if($("#root").height() >= 800){
			$("#footer").css("position", "relative");
		}
	</script>

</body>
</html>
