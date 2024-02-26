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
						<textarea readonly>
							${notice.contents }
						</textarea>
						
					</div>
				</div>
				<div class="bt_wrap">
					<a href="/admin/noticeList" class="on">목록</a> 
				</div>
				
				
				
			</div>
		</div>	
	

	<div class="comment_title">
			댓글 <span>${ncommentCount}</span>

		</div>
		<div class="commentList">
			<c:forEach var="item" items="${noticeComment }" varStatus="status">
			<div class="reply_list">
				<div class="media-left">
					<c:if test="${not empty memberResult }">
						<a href="#"> <img class="profile_picture" src="/resources/uploads/member/${memberResult[status.index].uploadName}"></a>
					</c:if>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<b class="info_name_f">${item.ncWriter }</b> <span>${item.ncIndate }</span> <a
							onclick="#"></a>
					</h4>
					${item.ncComment} <br>
				</div>

			</div>
			</c:forEach>
		</div>

		<div class="comment-section">
			<h2>댓글 남기기</h2>
			<form id="comment-form" action="/admin/addNoticeComment?acno=${notice.acno}" method="post">
				<div class="commentPic">
					<img src="/resources/uploads/member/${sessionScope.uploadName}">
				</div>
				<div class="comment">


					<textarea class="commentTextbox" name="ncComment"
						placeholder="댓글을 작성하세요."></textarea>
					<button class="comment_submit" type="submit">댓글작성</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
