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
						<hr />
						<br>
						<%-- <c:choose>
							<c:when test="${ empty list}">
								<c:forEach var="item" items="${cartList}">
						<tr class="cart__list__detail">
							<td><input type="checkbox" class="itemCheck"
								value="${item.sc_no}"></td>
							<td><img src="/resources/uploads/goods/${item.g_file_name}"></td>
							<td>
								<p>${item.g_name}</p> <span class="price">${item.g_price}원</span>
								<span style="text-decoration: line-through; color: lightgray;">${item.g_regular_price}</span>
							</td>
							<td>
								<form action="/cart/modifyCount.do" method="post"
									name="${item.g_name}modify">
									<input type="hidden" value="${item.sc_no}" name="sc_no">
									<input type="hidden" id="scPriceVal${item.sc_no}"
										value="${item.sc_price}" name="sc_price">
									<div class="quantity">
										<button type="button" class="minus-btn"
											onclick="decreaseQuantity(${item.sc_no},${item.g_price})">-</button>
										<input type="text" id="scCountVal${item.sc_no}"
											value="${item.sc_count}" name="sc_count" readonly>
										<button type="button" class="plus-btn"
											onclick="increaseQuantity(${item.sc_no},${item.g_price})">+</button>
									</div>
									<input type="hidden" value="${item.m_no}" name="m_no">
									<input type="hidden" value="${item.g_no}" name="g_no">
									<input type="hidden" value="${item.g_name}" name="g_no">
									<input type="hidden" value="${item.g_price}" name="g_no">
									<input type="hidden" value="${item.g_regular_price}"
										name="g_no">
									<button type="submit" id="changeCount" class="correct-btn">수정</button>
								</form>

							</td>
							<td><span class="point">119원</span></td>
							<td><span id="PriceVal${item.sc_no}" class="price">${item.sc_price}원</span></td>
							<td>무료</td>
							<td><button class="delete-btn"
									onclick="deleteCartItem(${item.sc_no})">상품취소</button>
							<td>
						</tr>
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
						</c:choose> --%>


						<div class="result">
							<c:choose>
								<c:when test="${not empty cartList}">
									<div class="result_none">
										<img src="/resources/uploads/카트.png">
										<p>구매한 상품이 없습니다.</p>
										신선한 재료와 원하시는 상품을 주문해보세요. <br> <br>
										<button type="button" onclick="location.href='/products'"
											class="btn-lg btn-primary">쇼핑하러 가기</button>
									</div>
								</c:when>
								<c:otherwise>
									<section class="cart">

										<table class="cart__list">
											<thead>
												<tr>

													<td colspan="1">이지</td>
													<td>상품정보</td>
													<td>수량</td>
													<td>적립</td>
													<td>상품금액</td>
													
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${cartList}">
													<tr class="cart__list__detail">
														<td><img src="/resources/uploads/goods/가습기.jsp"></td>
														<td>
															<p>가가가가가가습슶브기</p> <span class="price">3000원</span>
															<span
															style="text-decoration: line-through; color: lightgray;">3000원</span>
														</td>
														<td>
															<form action="/cart/modifyCount.do" method="post"
																name="${item.g_name}modify">
																<input type="hidden" value="${item.sc_no}" name="sc_no">
																<input type="hidden" id="scPriceVal${item.sc_no}"
																	value="${item.sc_price}" name="sc_price">
																<div class="quantity">
																	
																	<input type="text" id="scCountVal${item.sc_no}"
																		value="${item.sc_count}" name="sc_count" readonly>5개
																	
																</div>
																<input type="hidden" value="${item.m_no}" name="m_no">
																<input type="hidden" value="${item.g_no}" name="g_no">
																<input type="hidden" value="${item.g_name}" name="g_no">
																<input type="hidden" value="${item.g_price}" name="g_no">
																<input type="hidden" value="${item.g_regular_price}"
																	name="g_no">
																
															</form>

														</td>
														<td><span class="point">119원</span></td>
														<td><span id="PriceVal${item.sc_no}" class="price">${item.sc_price}원</span></td>
														
													</tr>

												</c:forEach>
											</tbody>
										</table>

									</section>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</div>
			</div>


			<div class="rightBar">
				<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
			</div>
		</div>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>