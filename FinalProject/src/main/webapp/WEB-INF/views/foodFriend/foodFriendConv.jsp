<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">

</head>
<body>
	<%@ include file="../../views/common/header.jsp" %>
<div class="container">
    <div class="chat-container">
        <div class="chat-header">
            <h2>1대1 채팅방</h2>
        </div>
        <div id="chatBox" class="chat-box">
            
        </div>
        <div class="chat-input">
            <input id="messageInput" type="text" placeholder="메시지를 입력하세요." value="">	
            <button id="sendButton">전송</button>
        </div>
    </div>
</div>

	<%@ include file="../../views/common/footer.jsp"%>
<script src="/resources/js/foodFriend/foodFriend.js"></script>


</body>
</html>
