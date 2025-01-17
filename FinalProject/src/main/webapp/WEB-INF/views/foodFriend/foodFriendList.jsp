<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>

	<div class="container">
		<div class="board_wrap">
			<div class="board_title">
				<strong>밥친구 게시판</strong> <a href="/foodMate/addFoodMateForm.do"
					class="register">등록</a>
				<p>같이 밥 먹을 친구를 구해보세요.</p>
			</div>
			<div class="board_list_wrap">
				<div class="board_list">
					<c:choose>
						<c:when test="${empty list}">
							<p>등록된 글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<div class="top">
								<div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">글쓴이</div>
								<div class="date">작성일</div>
								<div class="count">조회</div>
							</div>

							<c:forEach var="item" items="${list }">
								<div
									onclick="location.href='/foodMate/foodMateDetail.do?fno=${item.fno}'">
									<div class="num">${row}</div>
									<div class="title">${item.title }</div>
									<div class="writer">${item.writer }</div>
									<div class="date">${item.indate }</div>
									<div class="count">${item.views }</div>
								</div>

								<c:set var="row" value="${row -1}" />
							</c:forEach>
						</c:otherwise>
					</c:choose>
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
									href="/foodMate/foodMateList.do?cpage=${pi.cpage-1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item <c:if test="${pi.cpage eq page}">active</c:if>">
							<a class="page-link" href="/foodMate/foodMateList.do?cpage=${page}">${page}</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pi.cpage eq pi.maxPage}">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/foodMate/foodMateList.do?cpage=${pi.cpage+1}"
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
