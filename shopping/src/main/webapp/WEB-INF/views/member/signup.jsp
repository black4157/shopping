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
				<form role="form" method="post" autocomplete="off" class="loginForm" name="loginForm">
					<div class="input_area">
						<div id="title">
							<p>아이디</p>
						</div>
						<input type="email" id="userId" name="userId" required="required" placeholder="아이디를 입력해 주세요. (test@gmail.com)" />
						<button type="button" class="idChk" id="idChk" value="N">중복확인</button> 
					</div>
					
		
					<div class="input_area">
						<div id="title">
							<p>비밀번호</p>
						</div>
						<input type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해 주세요." required="required" />
					</div>
				
					<div class="input_area">
						<div id="title">
							<p>닉네임</p>
						</div>
						<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해 주세요." required="required" />
					</div>
		
					<div class="input_area">
						<div id="title">
							<p>연락처</p>
						</div>
						<input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해 주세요." required="required" />
					</div>
					
					<div class="input_area">
						<p>
						<input type="text" name="userAddr1" id="sample2_postcode" placeholder="우편번호">
						<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" id="PostCodeBtn">
						</p>
					</div>
					
					<div class="input_area">
						<div id="title">
							<p>주소</p>
						</div>
						<input type="text" name="userAddr2" id="sample2_address" placeholder="주소">
					</div>
					
					<div class="input_area">
						<div id="title">
							<p>상세주소</p>
						</div>
						<input type="text" name="userAddr3" id="sample2_detailAddress" placeholder="상세주소">
					</div>
						
					<button type="button" id="signup_btn" name="signup_btn">회원가입</button>
					
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
					
					<%@ include file = "../include/spacecheck.jsp" %>
					
					<script>
						$("#signup_btn").click(function(){
							
							var signupConfirm = false;
							
							if(check()) {
								signupConfirm = true;	
							}

							if(signupConfirm == true) {
								inputConfirm = confirm("입력하신 정보가 맞습니까?");
								if(inputConfirm){
									$(".loginForm").submit();
								} else { return; }
							} 
						});

						$("#idChk").click(function(){
							$.ajax({
								url: "/member/idChk",
								type: "post",
								dataType: "json",
								data: {"userId" : $("#userId").val()},
								success: function(data){
									if(data == 1){
										alert("중복된 아이디입니다.");
									} else if($("#userId").val() == ""){
										alert("아이디를 입력해 주세요.");
									} else if(data == 0){
										$("#idChk").attr("value", "Y");
										alert("사용가능한 아이디입니다.");
									} 
								}
							})
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
