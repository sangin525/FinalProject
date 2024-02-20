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
				<strong>이벤트게시판</strong>

			</div>
			<div class="notice_view_wrap">
				<div class="notice_view">
					<div class="title">${event.title }</div>
					<div class="info">
						<dl>
							<dt>번호: ${event.eno }</dt>
							<dd></dd>
						</dl>
						<dl>
							<dt>글쓴이: 관리자</dt>
							<dd></dd>
						</dl>
						<dl>
							<dt>작성일: ${event.e_indate }</dt>
							<dd>2021.1.16</dd>
						</dl>
						<dl>
							<dt>조회: ${event.e_views }</dt>
							<dd>33</dd>
						</dl>
					</div>
					<div class="cont">
						<c:if test ="${not empty event.e_file_name }">
						<img src="/resources/uploads/event/${event.e_file_name }"><br> 
						</c:if>
						${event.e_contents }
					</div>
				</div>
				<div class="bt_wrap">
					<a href="/eventBoard" class="on">목록</a> <a href="eventEdit">수정</a>
				</div>
			</div>
		</div>

		<div class="comment_title">
			댓글 <span>21</span>

		</div>
		<div class="commentList">

			<div class="reply_list">
				<div class="media-left">
					<a href="#"> <img class="profile_picture"
						src="/resources/uploads/레시피등록대표사진.gif"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<b class="info_name_f">바비</b> <span>2024-1-29 07:32</span> <a
							onclick="#">답글</a>
					</h4>
					바비 <br>
				</div>


			</div>
		</div>

		<div class="comment-section">
			<h2>댓글 남기기</h2>
			<form id="comment-form">
				<div class="commentPic">
					<img src="/resources/uploads/레시피등록대표사진.gif">
				</div>
				<div class="comment">


					<textarea class="commentTextbox" name="comment"
						placeholder="댓글을 작성하세요."></textarea>
					<button class="comment_submit">댓글작성</button>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
