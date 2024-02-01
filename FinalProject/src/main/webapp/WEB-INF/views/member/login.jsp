<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/member.css">
</head>

<body>
<%@ include file="../../views/common/header.jsp"%>

<div class="registerContainer">
	<div class="registerContain">
		<h2 class="register_h2">로그인</h2>
		<form action="/member/login.do" method="post">
			<div class="memberInputbox">
				<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요."> 
				<label for="email" class="register_label">이메일</label>
			</div>
			<div class="memberInputbox">
				<input type="password" id="pwd" name="pwd" placeholder="이메일을 입력해주세요.">
				<label for="password" class="register_label">비밀번호</label>
			</div>
		<br>
		<div class="btn_group">
			<button type="submit" class="registerBtn">
				<span>로그인</span>
			</button>
		</div>
		</form>
	</div>
</div>
<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>

