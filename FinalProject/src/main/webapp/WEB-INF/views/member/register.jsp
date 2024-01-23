<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<html>
<head>
	<%@ include file="../../views/common/head.jsp" %>
</head>
	<%@ include file="../../views/common/header.jsp" %>

<div class="registerContainer">
	<div class="registerContain">
		<h2 class="register_h2">회원가입</h2>
		<form action="/member/register.do" method="post" class="needs-validation" novalidate="">
			<div class="memberInputbox">
				<input type="text" id="email" name="email" onkeyup="checkEmail()" placeholder="이메일을 입력해주세요.">
				<label for="email" class="register_label">이메일</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="password" name="pwd" onkeyup="validatePassword()" placeholder="이메일을 입력해주세요.">
				<label for="password" class="register_label">비밀번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="email" name="name" placeholder="이메일을 입력해주세요.">
				<label for="name" class="register_label">이름</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="nickName" name="nickname" placeholder="이메일을 입력해주세요.">
				<label for="nickName" class="register_label">닉네임</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="phone" name="phone" placeholder="이메일을 입력해주세요.">
				<label for="phone" class="register_label">전화번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="birth" name="age" placeholder="이메일을 입력해주세요.">
				<label for="birth" class="register_label">생년월일</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="gender" name="gender" placeholder="이메일을 입력해주세요.">
				<label for="gender" class="register_label">성별</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="addr" name="address" placeholder="이메일을 입력해주세요.">
				<label for="addr" class="register_label">주소</label>
			</div>
			<br>
			<div class="btn_group">
			<button type="submit" class="registerBtn"><span>회원가입</span></button>
			</div>
			</form>
	</div>
</div>

</html>

<script>
let pwdFlag = false;
let pwdCheckFlag = false;
let emilFlag = false


function flagCheck() {
	let submitBtn = document.getElementById('submit-btn');
    if (pwdFlag && emailFlag && pwdCheckFlag) {
        submitBtn.removeAttribute("disabled");
    } else {
        submitBtn.setAttribute("disabled", "true");
    }
}

// 비밀번호 유효성 검사
function validatePassword() {
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{6,20}$/;
	const password = document.getElementById("password").value;
	const msg = document.getElementById("pwdMsg");
	
	const passwordChk = document.getElementById("passwordChk").value;
	//const pwdChkMsg = document.getElementById("pwdChkMsg");
	
	if(passwordRegex.test(password)) {
		msg.innerHTML = "사용 가능한 비밀번호입니다.";
		msg.style.color = "green";
		pwdFlag = true;
	} else {
		msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
		msg.style.color = "red";
		pwdFlag = false;
	}
		
	flagCheck();
}

// 이메일 중복 확인 Ajax
function checkEmail() {
	const email = $("#email").val();
	const emailMsg = $("#emailMsg");
	const emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
	
	if(emailRegex.test(email)) {
		$.ajax({
			type: "POST",
			url: "/member/checkEmail.do",
			/* dataType: 'json',
			contentType : 'application/json', */
			data: { email : email },
			success : function(response) { 
				if(response == "available") {
					emailMsg.html("사용 가능한 이메일입니다.").css("color", "green");
					emailFlag = true;
				} else {
					console.log(response);
					emailMsg.html("이미 사용중인 이메일입니다.").css("color", "red");
					emailFlag = false;
				}
			},
			error : function() { }
		});
	} else {
		emailMsg.html("이메일 형식이 맞지 않습니다.").css("color", "red");
		emailFlag = false;
	}
	
	flagCheck();
}


</script>








