<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<html>
<head>
	<%@ include file="../../views/common/head.jsp" %>
	<link rel="stylesheet" href="/resources/css/member/member.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp" %>

<div class="registerContainer">
	<div class="registerContain">
		<h2 class="register_h2">회원가입</h2>
		<form class="registerForm">
		<div class = "postCodeFind">
			<div class="memberInputbox">
				<input type="email" id="email" onkeyup="validateEmail()" autocomplete="off">
				<label for="email" class="register_label">이메일</label>
				<span id="emailMsg"></span>
			</div>
				<button class="registerFormBtn" onclick="" type="button">중복확인</button>
		</div>
			<div class="memberInputbox">
				<input type="password" id="password" onkeyup="validatePassword()" autocomplete="off">
				<label for="password" class="register_label">비밀번호</label>
				<span id="passwordHelpInline" class="form-text"> 비밀번호는
				8~20자 길이로 문자와 숫자와 특수문자[@$!%*?&\#]를 포함해야 하며 공백, 이모티콘을 포함할 수 없습니다. </span><br>
				<span id="PwdMsg"></span>
			</div>
			<div class="memberInputbox">
				<input type="password" id="passwordCheck" onkeyup="validatePassword()" autocomplete="off">
				<label for="passwordCheck" class="register_label">비밀번호확인</label>
				<span id="PwdcheckMsg"></span>
			
			</div>
			<div class="memberInputbox">
				<input type="text" id="name" autocomplete="off">
				<label for="name" class="register_label">이름</label>
			</div>
			<div class = "postCodeFind">
			<div class="memberInputbox">
				<input type="text" id="nickName" autocomplete="off">
				<label for="nickName" class="register_label">닉네임</label>
			</div>
				<button class="registerFormBtn" onclick="" type="button">중복확인</button>
			</div>
			<div class="memberInputbox">
				<input type="text" id="phone" autocomplete="off">
				<label for="phone" class="register_label">전화번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="birth" autocomplete="off">
				<label for="birth" class="register_label">생년월일</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="gender" autocomplete="off">
				<label for="gender" class="register_label">성별</label>
			</div>
			<div class = "postCodeFind">
				<div class="memberInputbox">
					<input type="text" id="postcode" autocomplete="off">
					<label for="postcode" class="register_label">우편번호</label>
				</div>
				<button type="button" onclick="execDaumPostcode()" class="registerFormBtn">우편번호 찾기</button>
			</div>
			<div class="memberInputbox">
				<input type="text" id="address" autocomplete="off">
				<label for="address" class="register_label">주소</label>
			</div>
			<div class="postCodeFind">
			<div class="memberInputbox">
				<input type="text" id="detailAddress" autocomplete="off">
				<label for="detailAddress" class="register_label">상세주소</label>
			</div>
			<div class="memberInputbox" id="exAddr">
				<input type="text" id="extraAddress" autocomplete="off">
				<label for="extraAddress" class="register_label">참고항목</label>
			</div>
			</div>
			<br>
			<div class="btn_group">
			<button type="submit" class="registerBtn"><span>회원가입</span></button>
			</div>
	</div>
</div>

</body>
</html>

