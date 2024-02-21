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
				<strong>자유게시판</strong>

			</div>
			<div class="notice_view_wrap">
				<div class="notice_view">
					<div class="title">${free.title }</div>
					<div class="info">
						<dl>
							<dt>번호: ${free.flno }</dt>
						</dl>
						<dl>
							<dt>글쓴이: ${free.writer }</dt>
						</dl>
						<dl>
							<dt>작성일: ${free.indate }</dt>
						</dl>
						<dl>
							<dt>조회: ${free.views }</dt>
						</dl>
					</div>
					<div class="cont">

						

						<c:if test ="${not empty free.fileName }">
						<img src="/resources/uploads/free/${free.fileName}">
						</c:if>
						${free.contents}

					</div>
				</div>
				<div class="bt_wrap">
					<c:if test="${sessionScope.memberNickName == free.writer}">
						<a href="/free/freeDelete?flno=${free.flno}">삭제</a>
						<a href="/free/freeEditForm?flno=${free.flno}">수정</a>
						<a href="/free/freeList" class="on">목록</a> 
					</c:if>
					
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
