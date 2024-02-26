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
				<strong>이벤트게시판</strong>
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
						<p>등록된 공지사항이 없습니다.</p>
					</c:when>
					<c:otherwise>
					<c:forEach var="item" items="${list}">
					<div class="num">${row }</div>
						<div class="title">
						<a onclick="location.href='/admin/eventDetail?eno=${item.eno}'">${item.e_title}</a>
						</div>
						<div class="writer">관리자</div>
						<div class="date">${item.e_indate }</div>
						<div class="count">${item.e_views }</div>
						<c:set var="row" value="${row -1}"/>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			
		</div>
		<div class="pageNav">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${pi.cpage eq 1}">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/admin/eventList?cpage=${pi.cpage-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
								<li class="page-item <c:if test="${pi.cpage eq page}">active</c:if>"><a class="page-link"
									href="/admin/eventList?cpage=${page}">${page}</a></li>
							</c:forEach>

							<c:choose>
								<c:when test="${pi.cpage eq pi.maxPage}">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/admin/eventList?cpage=${pi.cpage+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
	</div>
	</div>
	<%@ include file="../../views/common/footer.jsp"%>

</body>
</html>