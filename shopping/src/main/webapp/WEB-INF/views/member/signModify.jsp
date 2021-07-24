<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
	<title>회원가입 - 배틀그라운드 쇼핑몰</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/user/default.css">
	<link rel="stylesheet" href="/resources/css/member/signin.css">
	
	<link rel="icon" href="/resources/images/gun.png" />
</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	
		<section id="container">
			<div id="container_box">
				<form role="form" method="post" autocomplete="off" class="loginForm">
				
					<div class="input_area">
						<div id="title">
							<p>아이디</p>
						</div>
						<input type="email" id="userId" name="userId" placeholder="아이디를 입력해 주세요. (test@gmail.com)" value="${member.userId }" required="required" readonly/>
					</div>
		
					<div class="input_area">
						<div id="title">
							<p>비밀번호</p>
						</div>
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해 주세요." required="required" value="${member.userPass }"/>
					</div>
		
					<div class="input_area">
						<div id="title">
							<p>닉네임</p>
						</div>
						<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해 주세요." required="required" value="${member.userName }" />
					</div>
		
					<div class="input_area">
						<div id="title">
							<p>연락처</p>
						</div>
						<input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해 주세요." required="required" value="${member.userPhon }"/>
					</div>
					
					<div class="input_area">
						<p>
						<input type="text" name="userAddr1" id="sample2_postcode" placeholder="우편번호" value="${member.userAddr1 }">
						<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" id="PostCodeBtn">
						</p>
					</div>
					
					<div class="input_area">
						<div id="title">
							<p>주소</p>
						</div>
						<input type="text" name="userAddr2" id="sample2_address" placeholder="주소" value="${member.userAddr2 }">
					</div>
					
					<div class="input_area">
						<div id="title">
							<p>상세주소</p>
						</div>
						<input type="text" name="userAddr3" id="sample2_detailAddress" placeholder="상세주소" value="${member.userAddr3 }">
					</div>
						
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
					
					<button type="button" id="signup_btn" name="signup_btn">수정</button>
					<button type="button" id="signcancel_btn" name="signcancel_btn">수정</button>
					<button type="button" id="signdelete_btn" name="signdelete_btn">회원 탈퇴</button>
					
					<script>
						$("#signup_btn").click(function(){
							var signupConfirm = confirm("입력하신 내용은 확실하나요?");
		
							if(signupConfirm == true) {
								$(".loginForm").submit();
							} else { return; }
						});

						$("#signcancel_btn").click(function(){
							location.href = "/";
						});
						
						$("#signdelete_btn").click(function(){
							var signdeleteConfirm = confirm("정말로 탈퇴하시겠습니까?");

							if(signdeleteConfirm){
								location.href = "./signDelete";
							}
						});
					</script>
					
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
		if($("#root").height() >= 800){
			$("#footer").css("position", "relative");
		}
	</script>
	
	<%@ include file = "../include/kakaoAddr.jsp" %>
</body>
</html>
