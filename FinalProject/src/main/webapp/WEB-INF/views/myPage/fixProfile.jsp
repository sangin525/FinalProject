<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="/resources/js/myPage/fixProfile.js"></script>




</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>

	<div class="fixProfile">
		<div class="container_profile">
			<h2>회원정보 수정</h2>
			<div class="showEmail">
				<p class="flexLine">
					<strong>jxbkc@naver.com&nbsp;</strong>
					<button id="btnUpdateEmail" type="button" class="btn_update">이메일
						수정</button>
				</p>

				<div id="updEmail" style="display: none;">
					<div id="emailFrms" class="form-group">
						<input type="text" class="form-control" id="id_email"
							placeholder="이메일"> <span id="emailStatus"
							class="form-control-feedback" aria-hidden="true"></span>
					</div>
					<p class="help-block">변경할 이메일을 입력해주세요.</p>
					<p class="flexLine">
						<button id="btnEmail" type="button" class="changeBtn">변경</button>
					</p>
				</div>
				<hr>
				<p class="flexLine">
					<strong>jxbkc123</strong>
						<button id="btnUpdateNick" type="button" class="btn_update btn_nick">닉네임
							수정</button>
				</p>
				<div id="updNick" style="display: none;">
					<div id="nickFrms" class="form-group">
						<input type="text" class="form-control" id="nm_user"
							placeholder="닉네임"> <span id="nickStatus"
							class="form-control-feedback" aria-hidden="true"></span>
					</div>
					<p class="help-block">
						닉네임은 변경후 24시간동안 다시 변경할 수 없습니다.<br>변경전에 잘 확인해 주세요.
					</p>
					<p class="flexLine">
						<button type="button" class="changeBtn">변경</button>
					</p>
				</div>
				<hr>
				<p class="flexLine">
					회원탈퇴
					<button type="button" class="changeBtn">탈퇴하기</button>
				</p>
			</div>
		</div>
	</div>





</body>
</html>