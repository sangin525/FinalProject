<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/admin.css">
<link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/admin/admin.js"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
		<%@ include file="../../views/common/nav.jsp" %>
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
<div class="adminContainer">
<h2 style="margin-left: 270px;">상품목록</h2>
	<div class="productTable">
		<table>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>할인율</th>
					<th>판매가격</th>
					<th>재고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="7">등록된 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${list}">
							<tr onclick="location.href='/goods/detail.do?g_no=${item.g_no}'">
								<td>${item.g_no}</td>
								<td>${item.g_name}</td>
								<td>${item.g_regular_price}원</td>
								<td>${item.g_dcRate} %</td>
								<td>${item.g_price} 원</td>
								<td>${item.g_stock}</td>
							</tr>
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
					href="/admin/productList?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link"
				href="/admin/productList?cpage=${page}">${page}</a></li>
		</c:forEach>

		<c:choose>
			<c:when test="${pi.cpage eq pi.maxPage}">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/admin/productList?cpage=${pi.cpage+1}" aria-label="Next"> <span
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