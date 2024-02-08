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
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
	<div class="adminContainer">
<div class="managingPostsContainer">
	<h2>게시글 관리</h2>
	<div class="postCategoryBtn">
		<button>공지사항</button>
		<button>자유게시판</button>
		<button>이벤트게시판</button>
	</div>
	
	<div class="update-delete-btn">
		<button class="board_update_btn">수정</button>					<!-- notice, free, event -->
		<button class="board_delete_btn">삭제</button> <!-- 체크박스에 따라 이동 /notice/delete.do?boardIdx=" + boardNum; -->
	</div>
	<div id="board_Modal" class="board_modal">
		<form><!-- action은 자바스크립트에서 입력되기 때문에 빼고 입력해야함 -->
			<div class="modal_container">
			<input type="hidden" class="boardNum" id="boardNum" value=""> <!-- idx 값 들어감 -->
				<div class="boardTitle_modal">
					<label for="boardTitle">제목 : </label>
					<input type="text" class="boardTitle" id="boardTitle" value="">			
				</div>
				<div class="boardWriter_modal">
					<label for="boardWriter">작성자:</label>
					<input type="text" class="boardWriter" id="boardWriter" value="">
				</div>
				<div class="boardContent_modal">
					<label for="boardContent">내용:</label>
					<textarea class="boardContent" id="boardContent"></textarea>
				</div>
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
					<th class="boardwriter">작성자</th>
					<th class="boardDate">작성일</th>
					<th class="boardView">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty noticeList}">
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
						<tr>
							<td colspan="7">글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>

	<ul class="pagination">
		<c:choose>
			<c:when test="${pi.cpage eq 1}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link"
				href="/recipe/list.do?cpage=${page}">${page}1</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage+1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<div class="free_List">
	<div class="freeTable">
		<table>
			<thead>
				<tr>
					<th class="boardcheck">선택</th>
					<th class="boardNum">글번호</th>
					<th class="boardTit">제목</th>
					<th class="boardwriter">작성자</th>
					<th class="boardDate">작성일</th>
					<th class="boardView">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty freeList}">
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">1</td>
							<td class="boardTit">자유게시판</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="freeContent">
							자유게시판 내용입니다.
						</div>
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">2</td>
							<td class="boardTit">자유게시판2</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="freeContent">
							자유게시판2 내용입니다.
						</div>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>

	<ul class="pagination">
		<c:choose>
			<c:when test="${pi.cpage eq 1}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link"
				href="/recipe/list.do?cpage=${page}">${page}1</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage+1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<div class="event_List">
	<div class="eventTable">
		<table>
			<thead>
				<tr>
					<th class="boardcheck">선택</th>
					<th class="boardNum">글번호</th>
					<th class="boardTit">제목</th>
					<th class="boardwriter">작성자</th>
					<th class="boardDate">작성일</th>
					<th class="boardView">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty eventList}">
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">1</td>
							<td class="boardTit">이벤트</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="eventContent">
							이벤트 내용입니다.
						</div>
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">2</td>
							<td class="boardTit">이벤트2</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardView">10</td>
						</tr>
						<div class="eventContent">
							이벤트2 내용입니다.
						</div>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>

	<ul class="pagination">
		<c:choose>
			<c:when test="${pi.cpage eq 1}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link"
				href="/recipe/list.do?cpage=${page}">${page}1</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/recipe/list.do?cpage=${pi.cpage+1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</div>
</div>	
<%@ include file="../../views/common/footer.jsp" %>
</body>

</html>