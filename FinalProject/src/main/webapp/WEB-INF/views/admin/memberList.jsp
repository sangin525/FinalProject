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
	<div class="memberTable">
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>회원등급</th>
					<th>올린 레시피 수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td>1</td>
							<td>홍길동</td>
							<td>test@test.com</td>
							<td>010-0000-0000</td>
							<td>경기도 안양시 만안구 안양로</td>
							<td>실버</td>
							<td>1000</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${list}">
						<tr>
							<td>${row }</td>
							<td>${item.name}</td>
							<td>${item.email }</td>
							<td>${item.phone }</td>
							<td>${item.address }</td>
							<td>${item.grade }</td>
							<td>${item.recipeCount }</td>
						</tr>
						<c:set var="row" value="${row -1}"/>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
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
					href="/admin/memberList.do?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item <c:if test="${pi.cpage eq page}">active</c:if>"><a class="page-link"
				href="/admin/memberList.do?cpage=${page}">${page}</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/admin/memberList.do?cpage=${pi.cpage+1}" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
<%@ include file="../../views/common/footer.jsp" %>
</body>

</html>