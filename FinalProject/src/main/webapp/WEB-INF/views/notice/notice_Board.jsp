<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/notice/notice.css">

</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>

	<div class="navbar">
		<a href="/noticeBoard">공지사항</a> <a href="">자유게시판</a> <a href="">이벤트게시판</a> <a
			href="">고객센터</a>
	</div>


	<div class="container">
		<div class="notice_wrap">
			<div class="notice_title">
				<strong>공지사항</strong>
				<p>최신 정보를 확인하세요.</p>
			</div>
			<div class="notice_list_wrap">
				<div class="notice_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<div>
						<div class="num">1</div>
						<div class="title">
							<a href="/noticeDetail">글 제목이 들어갑니다.</a>
						</div>
						<div class="writer">김이름</div>
						<div class="date">2021.1.15</div>
						<div class="count">33</div>
					</div>
				</div>
				<div class="notice_page">
					<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
					<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="num">4</a> <a
						href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
						href="#" class="bt last">>></a>
				</div>
			</div>
			<div class="bt_wrap">
				<a href="noticeEnroll" class="on">등록</a>
			</div>
		</div>
	</div>
	</div>

	<%@ include file="../../views/common/footer.jsp" %>



</body>
</html>