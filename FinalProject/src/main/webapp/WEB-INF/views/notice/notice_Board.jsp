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
			<%@ include file="../../views/common/nav.jsp" %>

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
					<c:choose>
					<c:when test="${empty list}">
						<p>등록된 공지사항이 없습니다.</p>
					</c:when>
					<c:otherwise>
					<c:forEach var="item" items="${list}">
					<div class="num">${row }</div>
						<div class="title">
						<a onclick="location.href='/admin/noticeDetail?acno=${item.acno}'">${item.title}</a>
						</div>
						<div class="writer">관리자</div>
						<div class="date">${item.indate }</div>
						<div class="count">${item.views }</div>
						<c:set var="row" value="${row -1}"/>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
				<!-- <div class="notice_page">
					<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
					<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="num">4</a> <a
						href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
						href="#" class="bt last">>></a>
				</div> -->
		
		</div>
	</div>
	
    

	<%@ include file="../../views/common/footer.jsp" %>



</body>
</html>