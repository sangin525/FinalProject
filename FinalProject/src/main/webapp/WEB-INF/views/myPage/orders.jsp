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
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="kr.co.project.order.model.dto.OrderDetailDTO"%>
	<%@ page import="kr.co.project.order.model.dto.OrderDTO"%>
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
					</div>

					<%
					ArrayList<OrderDTO> orderList = (ArrayList<OrderDTO>) request.getAttribute("orderList");
					ArrayList<OrderDetailDTO> orderDetailList = (ArrayList<OrderDetailDTO>) pageContext.findAttribute("orderDetailList");
					for (OrderDTO order : orderList) {
							int o_no = order.getO_no();
					%>

					<p>주문 번호:<%=order.getO_no()%></p>
					<p>주문 날짜:<%=order.getO_order_date()%></p>
					<br>

					<%
							for (OrderDetailDTO orderDetail : orderDetailList) {
								if (orderDetail.getO_no() == o_no) {
					%>

					<p>주문상세번호:<%=orderDetail.getOd_no()%></p>
					<p>가격:<%=orderDetail.getOd_price()%></p>
					<p>주문물품수량:<%=orderDetail.getOd_count()%></p>
					<p>주문번호:<%=orderDetail.getO_no()%></p>
					<p>상품번호:<%=orderDetail.getG_no()%></p>
					<br>

					<%
							}
						}
					%>

					<p>결제 금액:<%=order.getO_payment_amount()%></p>
					<br> <br> <br>

					<%
					}
					%>

					<div class="rightBar">
						<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>