<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	function check() {
		var form = document.loginForm;

		if (form.userId.value == "") {
			alert("아이디를 입력해 주세요!");
			form.userId.focus();
			return false;
		}

		if (form.userPass.value == "") {
			alert("비밀번호를 입력해 주세요!");
			form.userPass.focus();
			return false;
		}

		if (form.userName.value == "") {
			alert("닉네임을 입력해 주세요!");
			form.userName.focus();
			return false;
		}

		if (form.userPhon.value == "") {
			alert("전화번호를 입력해 주세요!");
			form.userPhon.focus();
			return false;
		}

		if (form.userAddr1.value == "") {
			alert("주소를 입력해 주세요!");
			form.useraddr1.focus();
			return false;
		}

		if (form.userAddr2.value == "") {
			alert("상세주소를 입력해 주세요!");
			form.useraddr2.focus();
			return false;
		}

		if (form.userAddr3.value == "") {
			alert("상세주소를 입력해 주세요!");
			form.userAddr3.focus();
			return false;
		}

		return true;
	}
</script>
