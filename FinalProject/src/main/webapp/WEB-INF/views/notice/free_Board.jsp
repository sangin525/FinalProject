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
	<%@ include file="../../views/common/nav.jsp"%>

	<div class="container">
		<div class="notice_wrap">
			<div class="notice_title">
				<strong>자유게시판</strong>
				
				<a href="/free/freeEnrollForm" class="register">등록</a>
			
				<br>
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
							<p>등록된 글이 없습니다</p>
						</c:when>
						<c:otherwise>
						<c:forEach var="item" items="${list}">
						<div class="num">${row}</div>
						<div class="title">
							<a onclick="location.href='/free/freeDetail?flno=${item.flno}'">${item.title }</a>
						</div>
						<div class="writer">${item.writer }</div>
						<div class="date">${item.indate }</div>
						<div class="count">${item.views }</div>
						<c:set var="row" value="${row-1 }"/>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				
			</div>
		
		</div>
	</div>

	
	<%@ include file="../../views/common/footer.jsp"%>

</body>
</html>