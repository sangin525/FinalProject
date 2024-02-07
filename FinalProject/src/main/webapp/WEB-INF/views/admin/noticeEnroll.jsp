<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">
<link rel="stylesheet" href="/resources/css/admin/admin.css">
<link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/admin/admin.js"></script>

</head>
<body>

	<%@ include file="../../views/common/header.jsp" %>
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
<div class="adminContainer">	
	<div class="container">
	<div class="board_wrap">
        <div class="board_title">
            <strong>공지사항 작성</strong>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" value="관리자" disabled></dd>
                    </dl>
                   
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력"></textarea>
                </div>
                <br>
                 <input type="file" name="upload">
                 <br>
            </div>
            <div class="bt_wrap">
                <a href="foodFriendDetail" class="on">등록</a>
                <a href="foodFriendList" onclick="history.back()">취소</a>
            </div>
        </div>
    </div>
    </div>
</div>
			
	

	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
