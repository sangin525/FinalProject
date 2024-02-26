<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>


</head>

<body id="bodyId" data-crno="${chatRoom.cr_no}" data-mno="${user.mno}"
	data-name="${user.name}">
	<%@ include file="../../views/common/header.jsp"%>

	<%@ include file="../../views/common/nav.jsp"%>

	<div class="container">

		<input id="sender" type="hidden" value="${user.name}" readonly>

		<div class="chat-container">
			<div class="chat-header">
				<h2>1대1 채팅방</h2>
			</div>
			<div class="chat-description">
				<p>이 채팅방은 1대1 대화를 위한 공간입니다. 친절하게 대화해주세요.</p>
			</div>

			<div id="chatBox" class="chat-box clearBox"></div>

			<div class="chat-input">
				<input id="messageInput" type="text" placeholder="메시지를 입력하세요."
					value="">
				<button id="sendButton">전송</button>
			</div>
		</div>
	</div>

	<br>
	<br>
	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>
<script src="/resources/js/foodFriend/foodFriend.js"></script>