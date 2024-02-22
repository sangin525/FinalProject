<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">

</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>
	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
			<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>
				<div class="content">
					<div class="chef_cont">
						<ul class="myPageNav">
							<li><a>주문조회</a></li>
						</ul>
						
						
						<c:choose>
							<c:when test="${orderDetailList != NULL}">
								<c:forEach var="item" items="${orderDetailList}">
										주문상세번호:${item.od_no}<br>
										금액:${item.od_price}<br>
										주문물품수량:${item.od_count}<br>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="/resources/uploads/카트.png">
									<p>주문한 상품이 없습니다.</p>
									신선한 재료와 원하시는 상품을 주문해보세요.<br> <br>
									<button type="button" onclick="location.href='/products'"
										class="btn-lg btn-primary">쇼핑하러 가기</button>
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${orderList != NULL}">
								<c:forEach var="item" items="${orderList}">
										주문상세번호:${item.o_no}<br>
										결제금액:${item.o_payment_amount}<br>
										받는사람이름:${item.o_recipient_name}<br>
								</c:forEach>

							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="/resources/uploads/카트.png">
									<p>주문한 상품이 없습니다.</p>
									신선한 재료와 원하시는 상품을 주문해보세요.<br> <br>
									<button type="button" onclick="location.href='/products'"
										class="btn-lg btn-primary">쇼핑하러 가기</button>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="rightBar">
							<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
						</div>
					</div>
				</div>
				<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>