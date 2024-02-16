<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/member.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp" %>
<div class="registerContainer">
	<div class="registerContain">
		<h2 class="register_h2">회원가입</h2>
		<form action="/member/register.do" method="post" class="needs-validation" id="registerForm" novalidate="">
		<div class = "postCodeFind">
			<div class="memberInputbox">
				<input type="email" id="email" name="email" onkeyup="" autocomplete="off"><label
					for="email" class="register_label">이메일</label>
					<span id="emailMsg"></span>
			</div>
			<button class="registerFormBtn" onclick="checkEmail()" type="button">중복확인</button>
		</div>
			<div class="memberInputbox">
				<input type="password" id="password" name="pwd" onkeyup="validatePassword()" autocomplete="off"> <label
					for="password" class="register_label">비밀번호</label>
					<span id="passwordHelpInline" class="form-text"> 비밀번호는
				8~20자 길이로 문자와 숫자와 특수문자[@$!%*?&\#]를 포함해야 하며 공백, 이모티콘을 포함할 수 없습니다. </span><br>
				<span id="PwdMsg"></span>
			</div>
			<div class="memberInputbox">
				<input type="password" id="passwordCheck" name="pwd2" onkeyup="validatePassword()" autocomplete="off">
				<label for="passwordCheck" class="register_label">비밀번호확인</label>
				<span id="pwdcheckMsg"></span>

			</div>
			
			<div class="memberInputbox">
				<input type="text" id="name" name="name" autocomplete="off"> <label
					for="name" class="register_label">이름</label>
			</div>
			<div class = "postCodeFind">
			<div class="memberInputbox">
				<input type="text" id="nickname" name="nickname" autocomplete="off"> <label
					for="nickName" class="register_label">닉네임</label>
				<span id="nicknameMsg"></span>
			</div>
				<button class="registerFormBtn" onclick="checkNickName()" type="button">중복확인</button>
			</div>
			<div class="memberInputbox">
			
				<input type="text" id="phone" name="phone" autocomplete="off"> <label
					for="phone" class="register_label">전화번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="birth" name="age" autocomplete="off"> <label
					for="birth" class="register_label">나이</label>
			</div>
			<div class="memberInputbox">
				<span>성별</span>
				<select name="gender">
				<option value="성별">성별</option>
				<option value="남자">남자</option>
				<option value="여자">여자</option>
				</select>
				
			</div>
			<div class = "postCodeFind">
				<div class="memberInputbox">
					<input type="text" id="postcode"  autocomplete="off">
					<label for="postcode" class="register_label">우편번호</label>
				</div>
				<button type="button" onclick="execDaumPostcode()" class="registerFormBtn">우편번호 찾기</button>
			</div>
			<div class="memberInputbox">
				<input type="text" id="address" name="address" autocomplete="off">
				<label for="address" class="register_label">주소</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="detailAddress" name="detailAddress" autocomplete="off"> <label
					for="detailAddress" class="register_label">상세주소</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="extraAddress" autocomplete="off"> <label
					for="extraAddress" class="register_label">참고항목</label>
			</div>
			<br>
			<div class="btn_group">
				<button type="submit" class="registerBtn">
					<span>회원가입</span>
				</button>
			</div>
			</form>
	</div>
</div>
<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>

<script>
let pwdFlag = false;
let pwdCheckFlag = false;
let emilFlag = false;
let nicknameFlag = false;

function flagCheck() {
	let submitBtn = document.getElementById('submit-btn');
    if (pwdFlag && emailFlag && pwdCheckFlag && nicknameFlag) {
        submitBtn.removeAttribute("disabled");
    } else {
        submitBtn.setAttribute("disabled", "true");
    }
}

// 비밀번호 유효성 검사
function validatePassword() {
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{6,20}$/;
	const password = document.getElementById("password").value;	
	const msg = document.getElementById("PwdMsg");
	
	const passwordChk = document.getElementById("passwordCheck").value;
	const pwdChkMsg = document.getElementById("pwdcheckMsg");
	
	if(passwordRegex.test(password)) {
		msg.innerHTML = "사용 가능한 비밀번호입니다.";
		msg.style.color = "green";
		pwdFlag = true;
	} else {
		msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
		msg.style.color = "red";
		pwdFlag = false;
	}
	if(password === passwordChk) {
		pwdChkMsg.innerHTML = "패스워드가 동일합니다.";
		pwdChkMsg.style.color = "green";
		pwdCheckFlag = true;
	} else {
		pwdChkMsg.innerHTML = "패스워드가 동일하지 않습니다.";
		pwdChkMsg.style.color = "red";
		pwdCheckFlag = false;
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

function checkNickName() {
	const nickname = $("#nickname").val();
	const nicknameMsg = $("#nicknameMsg");
	
	$.ajax({
		type: "POST",
		url: "/member/checkNickName.do",
		data: {nickname : nickname},
		success : function(response){
			if(response == "available"){
				nicknameMsg.html("사용 가능한 닉네임입니다.").css("color","green");
				nicknameFlag = true;
			}else{
				console.log(response);
				nicknameMsg.html("이미 사용중인 닉네임입니다.").css("color","red");
				nicknameFlag = false
			}
		},
		error : function() { }
	});
	
		flagCheck();
}


</script>