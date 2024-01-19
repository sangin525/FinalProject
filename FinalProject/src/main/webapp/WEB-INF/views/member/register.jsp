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
		<form class="registerForm">
			<div class="memberInputbox">
				<input type="text" id="email" placeholder="이메일을 입력해주세요.">
				<label for="email" class="register_label">이메일</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="password" placeholder="이메일을 입력해주세요.">
				<label for="password" class="register_label">비밀번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="email" placeholder="이메일을 입력해주세요.">
				<label for="name" class="register_label">이름</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="nickName" placeholder="이메일을 입력해주세요.">
				<label for="nickName" class="register_label">닉네임</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="phone" placeholder="이메일을 입력해주세요.">
				<label for="phone" class="register_label">전화번호</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="birth" placeholder="이메일을 입력해주세요.">
				<label for="birth" class="register_label">생년월일</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="gender" placeholder="이메일을 입력해주세요.">
				<label for="gender" class="register_label">성별</label>
			</div>
			<div class="memberInputbox">
				<input type="text" id="addr" placeholder="이메일을 입력해주세요.">
				<label for="addr" class="register_label">주소</label>
			</div>
			<br>
			<div class="btn_group">
			<button type="submit" class="registerBtn"><span>회원가입</span></button>
			</div>
	</div>
</div>

</html>









</html>