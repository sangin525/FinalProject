<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/admin.css">
<link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/admin/admin.js"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
		<%@ include file="../../views/common/nav.jsp" %>
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
	<div class="adminContainer">
<div class="managingPostsContainer">
	<h2>게시글 관리</h2>
	<div class="postCategoryBtn">
		<button onclick="location.href='/admin/adminNotice'">공지사항</button>
		<button onclick="location.href='/free/adminFree'">자유게시판</button>
		<button onclick="location.href='/admin/adminEvent'">이벤트게시판</button>
	</div>
	
	<div class="update-delete-btn">
		<button class="board_update_btn">수정</button>					<!-- notice, free, event -->
		<button onclick="" class="board_delete_btn">삭제</button> <!-- 체크박스에 따라 이동 /notice/delete.do?boardIdx=" + boardNum; -->
	</div>
	
	
	
	<div id="board_Modal" class="board_modal">
		<form id="modalForm" method="POST" enctype="multipart/form-data"><!-- action은 자바스크립트에서 입력되기 때문에 빼고 입력해야함 -->
			
			<div class="modal_container">
			
				<table class="questionsTable">
								<colgroup>
									<col style="width:15%">
									<col style="width:85%">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" class="boardTitle" id="boardTitle" name="title" value="">
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>
											<input name="writer" type="text" value="관리자" disabled>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
			                                 <textarea class="boardContent"  id="boardContent" name="contents" value=""></textarea>
										</td>
									</tr>
									<tr>
										<th>파일</th>
										<td>
			                                 <input type="file" name="upload" value="">
										</td>
									</tr>
									
								</tbody>
							</table>
				<div class="modal_btn">
					<button type="submit">수정</button>
					<button class="close" type="button">취소</button>
				</div>
			</div>
		</form>
	</div>
<div class="notice_List">
	<div class="noticeTable">
		<table>
			<thead>
				<tr>
					<th class="boardcheck">선택</th>
					<th class="boardNum">글번호</th>
					<th class="boardTit">제목</th>
					<th class="boardWriter">작성자</th>
					<th class="boardDate">작성일</th>
					<th class="boardView">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">1</td>
							<td class="boardTit">공지사항</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="noticeContent">
							공지사항 내용입니다.
						</div>
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">2</td>
							<td class="boardTit">공지사항2</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="noticeContent">
							공지사항2 내용입니다.
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${list}" varStatus="status">
						<tr id="row">
							<input type="hidden" id="hiddenAcno" value="${item.acno }">
							<input type="hidden" id="hiddenTitle" value="${item.title}">
							<input type="hidden" class="noticeContent_${status.index +1}" id="hiddenContents" value="${item.contents}">
							<input type="hidden" id="hiddenFileName" value="${item.fileName}">
							
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">${row}</td>
							<td class="boardTit">${item.title}</td>
							<td class="boardWriter">관리자</td>							
							<td class="boardDate">${item.indate}</td>
							<td class="boardView">${item.views}</td>
						</tr>
							<c:set var="row" value="${row -1}"/>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>
	<br>
<div class="pageNav">
	<ul class="pagination">
		<c:choose>
			<c:when test="${pi.cpage eq 1}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/admin/adminNotice?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item <c:if test="${pi.cpage eq page}">active</c:if>"><a class="page-link"
				href="/admin/adminNotice?cpage=${page}">${page}</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/admin/adminNotice?cpage=${pi.cpage+1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
</div>
</div>	
<%@ include file="../../views/common/footer.jsp" %>
</body>

</html>