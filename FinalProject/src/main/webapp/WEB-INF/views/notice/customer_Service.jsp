<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>

</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp" %>
	<div class="navbar">
		<a href="notice.html">공지사항</a>
		<a href="freeboard.html">자유게시판</a>
		<a href="event.html">이벤트게시판</a>
		<a href="contact.html">고객센터</a>
	</div>

	<div class="board">
		<h1>공지사항</h1>
		<div class="post">
			<h2>게시글 제목 1</h2>
			<p>게시글 내용 1</p>
		</div>
		<div class="post">
			<h2>게시글 제목 2</h2>
			<p>게시글 내용 2</p>
		</div>
	</div>



</body>
</html>