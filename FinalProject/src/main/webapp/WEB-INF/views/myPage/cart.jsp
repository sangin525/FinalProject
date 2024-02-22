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
	<%@ include file="../../views/common/nav.jsp"%>

	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
			<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>
				<div class="content">
					<div class="chef_cont">
						<ul class="myPageNav">
							<li><a>장바구니</a></li>
						</ul>
						<hr />
						<br>
						<div class="result">
							<c:choose>
								<c:when test="${empty cartList}">
									<div class="result_none">
										<img src="/resources/uploads/카트.png">
										<p>카트가 비었습니다.</p>
										신선한 재료를 구매하실 수 있습니다. <br> <br>
										<button type="button" onclick="location.href='/products'"class="btn-lg btn-primary">쇼핑하러 가기</button>
									</div>
								</c:when>
								<c:otherwise>
									<section class="cart">
										<div class="cart__information">
											<ul>
												<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
												<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
												<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
											</ul>
										</div>
										<table class="cart__list">
											<thead>
												<tr>
													<td><input type="checkbox" id="checkAll"></td>
													<td colspan="1">이미지</td>
													<td>상품정보</td>
													<td>수량</td>
													<td>적립</td>
													<td>상품금액</td>
													<td>배송비</td>
													<td>삭제</td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${cartList}">
													<tr class="cart__list__detail">
														<td><input type="checkbox" class="itemCheck"value="${item.sc_no}"></td>
														<td><img src="/resources/uploads/goods/${item.g_file_name}"></td>
														<td>
															<p>${item.g_name}</p> <span class="price">${item.g_price}원</span>
															<span style="text-decoration: line-through; color: lightgray;">${item.g_regular_price}</span>
														</td>
														<td>
															<form action="/cart/modifyCount.do" method="post"
																name="${item.g_name}modify">
																<input type="hidden" value="${item.sc_no}" name="sc_no">
																<input type="hidden" id="scPriceVal${item.sc_no}"value="${item.sc_price}" name="sc_price">
																<div class="quantity">
																	<button type="button" class="minus-btn" onclick="decreaseQuantity(${item.sc_no},${item.g_price})">-</button>
																	<input type="text" id="scCountVal${item.sc_no}"value="${item.sc_count}" name="sc_count" readonly>
																	<button type="button" class="plus-btn" onclick="increaseQuantity(${item.sc_no},${item.g_price})">+</button>
																</div>
																<input type="hidden" value="${item.m_no}" name="m_no">
																<input type="hidden" value="${item.g_no}" name="g_no">
																<input type="hidden" value="${item.g_name}" name="g_no">
																<input type="hidden" value="${item.g_price}" name="g_no">
																<input type="hidden" value="${item.g_regular_price}"name="g_no">
																<button type="submit" id="changeCount"class="correct-btn">수정</button>
															</form>
														</td>
														<td><span class="point">119원</span></td>
														<td><span id="PriceVal${item.sc_no}" class="price">${item.sc_price}원</span></td>
														<td>무료</td>
														<td><button class="delete-btn"onclick="deleteCartItem(${item.sc_no})">삭제</button>
														<td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="cart__mainbtns">
											<button class="cart__bigorderbtn left" onclick="location.href='/products'">쇼핑 계속하기</button>
											<button class="cart__bigorderbtn right">결제하기</button>
										</div>
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
<script type="text/javascript">
function increaseQuantity(productId, price) {
	// 수량을 변경합니다.
	var quantityElement = document.getElementById('scCountVal' + productId).value;   // VALUE : 1
	quantityElement = Number(quantityElement) + 1;
	var priceElement = document.getElementById('scPriceVal' + productId);
	priceElement.value = quantityElement * price;
}

function decreaseQuantity(productId, price) {
	// 수량을 변경합니다.
	var quantityElement = document.getElementById('scCountVal' + productId).value;   // VALUE : 1
	quantityElement = Number(quantityElement) - 1;
	var priceElement = document.getElementById('scPriceVal' + productId);
	priceElement.value = quantityElement * price;
}

function deleteCartItem(sc_no) {
	var confirmation = confirm("정말로 삭제하시겠습니까?");
	if (confirmation) {
		window.location.href = "/cart/deleteCart.do?sc_no=" + sc_no;
	}
}

$(".cart__bigorderbtn.right").on("click", function(e){
	e.preventDefault(); // 기본 이벤트를 막아서 페이지 이동을 막습니다.

	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart__list__detail").each(function(index, element){
		if($(element).find(".itemCheck").is(":checked") === true){	//체크여부
			let sc_no = $(element).find("input[name='sc_no']").val();
			let sc_count = $(element).find("input[name='sc_count']").val();

			// 주문 번호와 상품의 sc_no, sc_count를 form에 입력
 			/* let sc_no_input = "<input name='SCtoODTO[" + orderNumber + "].sc_no' type='number' value='" + sc_no + "'>"; */ 
			let sc_no_input = "<input name='sc_no' type='number' value='" + sc_no + "'>";
			form_contents += sc_no_input;
			
 			/* let sc_count_input = "<input name='SCtoODTO[" + orderNumber + "].sc_count' type='number' value='" + sc_count + "'>"; */ 
			let sc_count_input = "<input name='sc_count' type='number' value='" + sc_count + "'>"; 
			form_contents += sc_count_input;
			
			orderNumber += 1;
		}
	});	
	// 주문 정보를 포함하는 폼을 생성합니다.
	let order_form = $("<form action='/order/cartToOrder.do' method='post'></form>");
	order_form.html(form_contents);
	// 폼을 문서에 추가하고 제출합니다.
	$("body").append(order_form);
	order_form.submit();
});
</script>
</html>