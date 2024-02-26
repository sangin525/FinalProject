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
	<div class="deliveryContainer">
		<h2>배송관리</h2>
	<div class="deliveryTable">
		<table>
			<thead>
				<tr>
					<th>선택</th>
					<th>상태</th>
					<th>주문번호</th>
					<th>상품이름</th>
					<th>주문날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty orderList}">
						<tr>
							<td><input type="checkbox" class="deliveryDetail"></td>
							<td>택배예약</td>
							<td>1</td>
							<td>상품이름</td>
							<td>2024-02-06</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="deliveryDetail"></td>
							<td>택배예약</td>
							<td>2</td>
							<td>상품이름</td>
							<td>2024-02-06</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="deliveryDetail"></td>
							<td>택배예약</td>
							<td>3</td>
							<td>상품이름</td>
							<td>2024-02-06</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="deliveryDetail"></td>
							<td>택배예약</td>
							<td>4</td>
							<td>상품이름</td>
							<td>2024-02-06</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">주문이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
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
					href="/recipe/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
			<li class="page-item"><a class="page-link"
				href="/recipe/list.do?cpage=${page}">${page}</a></li>
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
		<div class="orderDetail">
			<div>
				<h4>주문정보</h4>
				<ul>
					<li>주문상품:<span>상품이름</span></li>
					<li>결제일:<span>2021-03-10 12:00</span></li>
					<li>받는분:<span>홍길동</span></li>
					<li>전화번호:<span>010-000-0000</span></li>
					<li>배송메모:<span>빠른배송 부탁드려요</span></li>
					<li>배송지:<span>경기도 안양시 만안구 안양로</span></li>
				</ul>
				<ul>
					<li>주문상품:<span>상품이름2</span></li>
					<li>결제일:<span>2021-03-10 12:00</span></li>
					<li>받는분:<span>홍길동</span></li>
					<li>전화번호:<span>010-000-0000</span></li>
					<li>배송메모:<span>빠른배송 부탁드려요</span></li>
					<li>배송지:<span>경기도 안양시 만안구 안양로</span></li>
				</ul>
				<ul>
					<li>주문상품:<span>상품이름3</span></li>
					<li>결제일:<span>2021-03-10 12:00</span></li>
					<li>받는분:<span>홍길동</span></li>
					<li>전화번호:<span>010-000-0000</span></li>
					<li>배송메모:<span>빠른배송 부탁드려요</span></li>
					<li>배송지:<span>경기도 안양시 만안구 안양로</span></li>
				</ul>
				<ul>
					<li>주문상품:<span>상품이름4</span></li>
					<li>결제일:<span>2021-03-10 12:00</span></li>
					<li>받는분:<span>홍길동</span></li>
					<li>전화번호:<span>010-000-0000</span></li>
					<li>배송메모:<span>빠른배송 부탁드려요</span></li>
					<li>배송지:<span>경기도 안양시 만안구 안양로</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>


<%@ include file="../../views/common/footer.jsp" %>
</body>

</html>