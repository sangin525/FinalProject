<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp" %>
<div class="container">
	<h1>게시판 상세보기</h1>
	<hr>

    <div class="detailTitle">

	<h2>title</h2>
    </div>
    <div class="detailContent">
        <p> content </p>
        <img src="/resources/uploads/고양이그림.png">
    </div>

    <div class="buttons">
        <a href="#" onclick="location.href='/foodFriendEdit'">수정</a>
        <a href="delete">삭제</a>
        <a onclick="history.back()">취소</a>
    </div>


    <h2>댓글 목록</h2>

    <h2>댓글 작성</h2>
    <form action="comment.jsp" method="post">
        <textarea name="content" placeholder="댓글 내용"></textarea>
        <button type="submit">댓글 작성</button>
    </form>
    </div>

	
	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
