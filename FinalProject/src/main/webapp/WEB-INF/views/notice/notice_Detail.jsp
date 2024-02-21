<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/notice/notice.css">
<script src="/resources/js/foodFriend/foodFriend.js"></script>

</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
			<%@ include file="../../views/common/nav.jsp" %>
	<div class="container">
		<div class="board_wrap">
			<div class="notice_title">
				<strong>공지사항</strong>

			</div>
			<div class="notice_view_wrap">
				<div class="notice_view">
					<div class="title">${notice.title }</div>
					<div class="info">
						<dl>
							<dt>번호: ${notice.acno}</dt>
							<dd>${notice.acno}</dd>
						</dl>
						<dl>
							<dt>글쓴이: 관리자</dt>
							<dd>관리자</dd>
						</dl>
						<dl>
							<dt>작성일: ${notice.indate }</dt>
							<dd>${notice.indate }</dd>
						</dl>
						<dl>
							<dt>조회: ${notice.views }</dt>
							<dd>${notice.views }</dd>
						</dl>
					</div>
					<div class="cont">
						<c:if test ="${not empty notice.fileName }">
						<img src="/resources/uploads/admin/${notice.fileName }"><br> 
						</c:if>
						${notice.contents }
						
					</div>
				</div>
				<div class="bt_wrap">
					<a href="/admin/noticeList" class="on">목록</a> 
				</div>
			</div>
		</div>	
	</div>


	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
