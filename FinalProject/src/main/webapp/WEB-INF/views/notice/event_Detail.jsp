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
						<pre><c:out value="${event.e_contents }" /></pre>
					</div>
				</div>
				<div class="bt_wrap">
					<a href="/admin/eventList" class="on">목록</a> 
				</div>
			</div>
		</div>

		<div class="comment_title">
			댓글 <span>${ecommentCount}</span>

		</div>
		<div class="commentList">
			<c:forEach var="item" items="${eventComment }" varStatus="status">
			<div class="reply_list">
				<div class="media-left">
					<c:if test="${not empty memberResult }">
						<a href="#"> <img class="profile_picture" src="/resources/uploads/member/${memberResult[status.index].uploadName}"></a>
					</c:if>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<b class="info_name_f">${item.ecWriter }</b> <span>${item.ecIndate }</span> <a
							onclick="#"></a>
					</h4>
					${item.ecComment} <br>
				</div>

			</div>
			</c:forEach>
		</div>

		<div class="comment-section">
			<h2>댓글 남기기</h2>
			<form id="comment-form" action="/admin/addEventComment?eno=${event.eno}" method="post">
				<div class="commentPic">
					<img src="/resources/uploads/member/${sessionScope.uploadName}">
				</div>
				<div class="comment">


					<textarea class="commentTextbox" name="ecComment"
						placeholder="댓글을 작성하세요."></textarea>
					<button class="comment_submit" type="submit">댓글작성</button>
				</div>
			</form>
		</div>
		

		
	</div>

<div class="pageNav">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${pi.cpage eq 1}">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/admin/eventDetail?eno=${event.eno }&cpage=${pi.cpage-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        
        <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
		    <li class="page-item <c:if test="${pi.cpage eq page}">active</c:if>">
		        <a class="page-link" href="/admin/eventDetail?eno=${event.eno }&cpage=${page}">${page}</a>
		    </li>
		</c:forEach>
        
        <c:choose>
            <c:when test="${pi.cpage eq pi.maxPage}">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/admin/eventDetail?eno=${event.eno }&cpage=${pi.cpage+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
