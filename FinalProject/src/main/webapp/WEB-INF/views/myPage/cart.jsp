<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script src="/resources/js/myPage/fixProfile.js"></script>

</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>

	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="container">
			<%@ include file="../../views/myPage/myPageMenu.jsp"%>
			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>장바구니</a></li>
					</ul>
					<hr />
					<br>
					<div class="result">
						<c:choose>
							<c:when test="${empty cart}">
								<section class="cart">
									<div class="cart__information">
										<ul>
											<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
											<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
											<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시
												확인해 주시기 바랍니다.</li>
										</ul>
									</div>
									<table class="cart__list">
										<form>
											<thead>
												<tr>
													<td><input type="checkbox" id="checkAll"></td>

													<td colspan="1">이미지</td>
													<td>상품정보</td>
													<td>수량</td>
													<td>적립</td>
													<td>상품금액</td>
													<td>배송비</td>
												</tr>
											</thead>
											<tbody>
												<tr class="cart__list__detail">
													<td><input type="checkbox" class="itemCheck"></td>
													<td><img src="/resources/uploads/고양이그림.png"></td>
													<td>
														<p>한일 내솥 일체형 가열식 가습기 퓨어팟2</p> <span class="price">119,000원</span>
														<span
														style="text-decoration: line-through; color: lightgray;">139,000</span>
													</td>
													<td>
														<div class="quantity">
															<button class="minus-btn" type="button" name="button">-</button>
															<input type="text" name="name" value="1" readonly>
															<button class="plus-btn" type="button" name="button">+</button>
														</div>
													</td>
													
													<td><span class="point">119원</span></td>
													<td><span class="price">119,000원</span></td>
													<td>무료</td>
												</tr>
											</tbody>
										</form>
									</table>
									<div class="cart__mainbtns">
										<button class="cart__bigorderbtn left"
											onclick="location.href='/products'">쇼핑 계속하기</button>
										<button class="cart__bigorderbtn right" onclick="location.href='/productPayment'">결제하기</button>
									</div>
								</section>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="/resources/uploads/카트.png">
									<p>맛있는 음식을 만들어보세요.</p>
									신선한 재료를 구매하실 수 있습니다. <br> <br>
									<button type="button" onclick="location.href='/products'"
										class="btn-lg btn-primary">쇼핑하러 가기</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>
	</div>


	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>