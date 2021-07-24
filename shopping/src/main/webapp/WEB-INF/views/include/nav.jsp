<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
<c:if test="${member == null }">
	<li><a href="/member/signin">로그인</a></li>
	<li><a href="/member/signup">회원가입</a></li>
</c:if>

<c:if test="${member != null }">
	<li><b>${member.userName } </b>님 환영합니다.</li>
	
	<c:if test="${member.verify == 9}">
		<li><a href="/admin/index">관리자 화면</a></li> 
	</c:if>
	
	<c:if test="${member.verify == 0}">
		<li><a href="/member/passwordConfirm">회원정보 수정</a></li>
	</c:if>

	<li><a href="/shop/cartList">장바구니 리스트</a></li>
	<li><a href="/shop/orderList">주문 리스트</a></li>
	<li><a href="/member/signout">로그아웃</a></li>
</c:if>
</ul>