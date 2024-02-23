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
<script src="/resources/js/admin/admin3.js"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
		<%@ include file="../../views/common/nav.jsp" %>
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
	<div class="adminContainer">
<div class="managingPostsContainer">
	<h2>문의사항</h2>
	
	<div class="update-delete-btn">
		<button class="board_answer_btn">답변하기</button>					<!-- notice, free, event -->
	</div>
	<div id="board_Modal" class="board_modal">
		<form method="post" id="modalForm"><!-- action은 자바스크립트에서 입력되기 때문에 빼고 입력해야함 -->
			<div class="modal_container">
			<input type="hidden" class="boardNum" id="boardNum" value=""> <!-- idx 값 들어감 -->
				<table class="questionsTable">
								<colgroup>
									<col style="width:15%">
									<col style="width:85%">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" class="boardTitle" name="aa_title" id="boardTitle" value="">
										</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>
											<input type="text" class="boardWriter" name="aa_writer" id="boardWriter" value="">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
			                                 <textarea class="boardContent" id="boardContents" name="aa_contents" disabled></textarea>
										</td>
									</tr>
									<tr>
										<th>답변</th>
										<td>
			                                 <textarea class="boardAnswer" name="aa_answer" id="boardAnswer"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="modal_btn">
					<button type="submit">작성</button>
					<button class="close" type="button">취소</button>
				</div>
			</div>
		</form>
	</div>
<div class="answer_List">
	<div class="answerTable">
		<table>
			<thead>
				<tr>
					<th class="boardcheck">선택</th>
					<th class="boardNum">글번호</th>
					<th class="boardTit">제목</th>
					<th class="boardwriter">작성자</th>
					<th class="boardDate">작성일</th>
					<th class="boardAnswer">답변여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty adminInquiryList}">
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">1</td>
							<td class="boardTit">문의사항</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardAnswer">답변완료</td>
						</tr>
						<div class="answerContent">
							문의사항 내용입니다.
						</div>
						<tr>
							<td><input type="checkbox" class="Detail"></td>
							<td class="boardNum">2</td>
							<td class="boardTit">문의사항2</td>
							<td class="boardwriter">관리자</td>
							<td class="boardDate">2024-02-06</td>
							<td class="boardAnswer">답변대기</td>
						</tr>
						<div class="answerContent">
							문의사항2 내용입니다.
						</div>
					</c:when>
					<c:otherwise>
					<c:forEach var="item" items="${adminInquiryList}" varStatus="status">					
						
						<tr id="row">
						<td><input type="checkbox" class="Detail">
							<input type="hidden" id="hiddenino" value="${item.i_no }">
							<input type="hidden" id="hiddenTitle" value="${item.i_title}">
							<input type="hidden" class="noticeContent" id="hiddenContents" value="${item.i_contents}">
							<input type="hidden" id="hiddenSecret" value="${item.i_secret}">
							<input type="hidden" id="hiddenAnswerCheck" value="${item.i_answerCheck}">
							<input type="hidden" class="boardContents" value="${item.i_contents}">
						
						</td>
							<td class="boardNum">${row}</td>
							<td class="boardTit">${item.i_title}</td>
							<td class="boardwriter">${item.i_writer }</td>							
							<td class="boardDate">${item.i_in_date}</td>
							<td class="boardView">${item.i_answerCheck}</td>
							<c:set var="row" value="${row -1}"/>
						</tr>
					</c:forEach>
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
</div>	
<%@ include file="../../views/common/footer.jsp" %>
</body>

</html>