<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/myPage/fixProfile.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>
	<div class="container">
		<div class="content">
			<h2>결제 내역</h2>
			<br> <br>
			<table class="cart__list">
				<thead>
					<tr>
						<td colspan="1">이미지</td>
						<td>상품정보</td>
						<td>수량</td>
						<td>적립</td>
						<td>상품금액</td>
						<td>배송비</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${cartList != NULL}">
							<c:forEach var="item" items="${cartList }">
								<tr class="cart__list__detail">
									<td><img
										src="/resources/uploads/goods/${item.g_file_name}"></td>
									<td>
										<p>${item.g_name}</p> <span class="price">${item.g_price}원</span>
										<span style="text-decoration: line-through; color: lightgray;">${item.g_regular_price}</span>
									</td>
									<td>
										<div class="quantity">
											<input name="name" value="${item.sc_count}" readonly>
										</div>
									</td>
									<td><span class="point">119원</span></td>
									<td><span class="price">${item.sc_price}원</span></td>
									<td>무료</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${goodsInfo != NULL}">
									<tr class="cart__list__detail">
										<td><img src="/resources/uploads/goods/${goodsInfo.g_file_name}">
										</td>
										<td>
											<p>${goodsInfo.g_name}</p> <span class="price">${goodsInfo.g_price}원</span>
											<span
											style="text-decoration: line-through; color: lightgray;">${goodsInfo.g_regular_price}</span>
										</td>
										<td>
											<div class="quantity">
												<input name="name" value="${g_count}" readonly>
											</div>
										</td>
										<td><span class="point">119원</span></td>
										<td><span class="price">${section_Price}원</span></td>
										<td>무료</td>
									</tr>
								</c:when>
								<c:otherwise>
									<p>잘못된 접근입니다.</p>
									<br>
									<button type="button" onclick="location.href='/products'"
										class="btn-lg btn-primary">쇼핑하러 가기</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="delivery_info">
			<div class="order_zone_tit">
				<h4>배송정보</h4>
			</div>
			<div class="order_table_type shipping_info">
				<form action="/delivery/deliverySave.do" method="POST">
					<table class="table_left shipping_info_table">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">배송지 확인</th>
								<td>
									<div class="form_element">
										<ul>
											<li><input type="radio" name="shipping"
												id="shippingBasic" onchange="shippingBasicChange()">
												<label for="shippingBasic" class="choice_s">기본배송지</label></li>
											<li><input type="radio" name="shipping"
												id="shippingRecently"> <label for="shippingRecently"
												class="choice_s">최근 배송지</label></li>
											<li><input type="radio" name="shipping" id="shippingNew">
												<label for="shippingNew" class="choice_s on">직접 입력</label></li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="important">받으실분</span></th>
								<td><input type="text" id="receiverName" name="d_name"
									data-pattern="gdEngKor" maxlength="20" class="myInput"></td>
							</tr>
							<tr>
								<th scope="row"><span class="important">받으실 곳</span></th>
								<td class="member_address">
									<div class="address_postcode">
										<input type="text" name="d_postal_address" id="postcode"
											readonly="readonly" class="myInput"> <input
											type="hidden" name="receiverZipcode" id="zipcode"> <span
											id="receiverZipcodeText" class="old_post_code"></span>
										<button type="button" class="btn_post_search"
											onclick="execDaumPostcode()">우편번호검색</button>
									</div>
									<div class="address_input">
										<input type="text" name="d_address" id="address"
											readonly="readonly" class="myInput"> <input
											type="text" name="receiverAddressSub" id="extraAddress"
											class="myInput">
									</div>
									<div class="memberInputbox">
										<input type="text" id="detailAddress" name=d_detailAdress
											autocomplete="off" class="myInput"> <label
											for="detailAddress" class="register_label">상세주소</label>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="important">휴대폰 번호</span></th>
								<td><input type="text" id="receiverCellPhone"
									name="d_phone" class="myInput"></td>
							</tr>
							<tr>
								<th scope="row">남기실 말씀</th>
								<td class="td_last_say">
									<div style="position: relative;">
										<input type="text" id="orderMemo" name="d_request"
											autocomplete="off/" class="myInput">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					기본배송지여부 <input type="number" name="d_defaultDelivery">
					<button type="submit" id="deliverySave">배송지 저장</button>
				</form>
			</div>
			<br>
			<div class="order_info">
				<div class="order_zone_tit">
					<h4>주문자 정보</h4>
				</div>
				<div class="order_table_type">
					<table class="table_left">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="important">주문하시는 분</span></th>
								<td><input type="text" name="orderName" id="orderName"
									value="${memberInfo.name }" data-pattern="gdEngKor"
									maxlength="20" class="myInput"></td>
							</tr>
							<tr>
								<th scope="row"><span class="important">휴대폰 번호</span></th>
								<td><input type="text" id="mobileNum" name="orderCellPhone"
									value="${memberInfo.phone }" maxlength="20" class="myInput">
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="important">이메일</span></th>
								<td class="member_email"><input type="text"
									name="orderEmail" value="${memberInfo.email}" class="myInput"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div class="payment_info">
					<div class="order_zone_tit">
						<h4>결제정보</h4>
					</div>
					<div class="order_table_type">
						<table class="table_left">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: 85%;">
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${cartList != NULL}">
										<tr>
											<th scope="row">상품 합계 금액</th>
											<td><strong id="allGoodsPrice" class="order_payment_sum">${totalGoodsPrice
																	}원</strong>
											</td>
										</tr>
										<tr>
											<th scope="row">배송비</th>
											<td><span id="totalDeliveryCharge">0</span>원 <span
												class="multi_shipping_text"></span></td>
										</tr>
										<tr>
											<th scope="row">적립금 사용</th>
											<td>
												<div class="order_money_use">
													<b><input type="text" name="useMileage"
														onblur="gd_mileage_use_check('y', 'y', 'y', 'y');"
														disabled="disabled"> 원</b>
													<div class="form_element">
														<input type="checkbox" id="useMileageAll"
															onclick="gd_mileage_use_all();" disabled="disabled">
														<label for="useMileageAll" class="check_s">전액 사용하기</label>
														<span class="money_use_sum">(보유 적립금 : 0 원)</span>
													</div>
													<em class="money_use_txt js-mileageInfoArea"></em>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">예상 적립금</th>
											<td><span id="">184원</span></td>
										</tr>
										<tr>
											<th scope="row">최종 결제 금액</th>
											<td><strong id="totalPayPrice" class="order_payment_sum">${totalGoodsPrice}</strong>원
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${goodsInfo != NULL}">
												<tr>
													<th scope="row">상품 합계 금액</th>
													<td><strong id="totalGoodsPrice"
														class="order_payment_sum">${section_Price}원</strong></td>
												</tr>
												<tr>
													<th scope="row">배송비</th>
													<td><span id="totalDeliveryCharge">0</span>원 <span
														class="multi_shipping_text"></span></td>
												</tr>
												<tr>
													<th scope="row">적립금 사용</th>
													<td>
														<div class="order_money_use">
															<b><input type="text" name="useMileage"
																onblur="gd_mileage_use_check('y', 'y', 'y', 'y');"
																disabled="disabled"> 원</b>
															<div class="form_element">
																<input type="checkbox" id="useMileageAll"
																	onclick="gd_mileage_use_all();" disabled="disabled">
																<label for="useMileageAll" class="check_s">전액
																	사용하기</label> <span class="money_use_sum">(보유 적립금 : 0 원)</span>
															</div>
															<em class="money_use_txt js-mileageInfoArea"></em>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">예상 적립금</th>
													<td><span id="">184원</span></td>
												</tr>
												<tr>
													<th scope="row">최종 결제 금액</th>
													<td><strong id="totalSettlePrice"
														class="order_payment_sum">${section_Price}</strong>원</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td>잘못된 접근입니다</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<br> <br>
				<div>
					<div class="order_agree">
						<div class="form_element">
							<input type="checkbox" name="allAgreeLogin" id="allAgreeLogin"
								class="require"> <label for="allAgreeLogin"
								class="check_s">결제 필수사항 동의</label>
						</div>
						<div class="order_zone_tit">
							<h5>상품 공급사 개인정보 제공 동의에 대한 내용을 확인 하였으며 이에 동의합니다.</h5>
						</div>
						<div class="order_agree_cont" style="padding-bottom: 3px;">
							<div class="join_agreement_box">
								<input type="hidden" id="termAgreePrivateProvider"
									name="termAgreePrivateProvider" class="require">
								<div class="agreement_box">
									- 제공받는 자 : (주)만개의레시피 / 상품공급사<br> - 이용목적 : 판매자와 구매자의 거래의
									원활한 진행, 본인의사의확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등<br>
									- 제공항목 : 구매자 이름, 전화번호, ID, 휴대폰번호, 이메일주소, 상품 구매정보, 상품 수취인 정보(이름,
									주소, 전화번호)<br> - 보유/이용기간 : 배송완료 후 한달
								</div>
							</div>
						</div>
						<div class="order_zone_tit">
							<input type="hidden" id="termAgree_orderCheck" class="require">
							<h5>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</h5>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${cartList != NULL}">
						<div class="paymentButton">
							<button class="myButton"
								onclick="requestPay(${totalGoodsPrice},'${nameForPay}')">결제하기</button>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${goodsInfo != NULL}">
								<div class="paymentButton">
									<button class="myButton"
										onclick="requestPay(${section_Price},'${goodsInfo.g_name}')">결제하기</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="paymentButton">
									<button class="myButton" onclick="requestPay(1000,'성기정')">결제하기</button>
								</div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<c:choose>
			<c:when test="${cartList != NULL}">
				<form action="/order/makeOrderFromCart.do" method="post">
					<input type="hidden" name="sc_noForOrder" value="${sc_noForOrder}">
					<input type="hidden" name="o_recipient_name" value="${defaultDelivery.d_name}"> 
					<input type="hidden" name="o_postal_address" value="${defaultDelivery.d_postal_address}"> 
					<input type="hidden" name="o_address" value="${defaultDelivery.d_address}"> 
					<input type="hidden" name="o_detailed_address" value="${defaultDelivery.d_detailAdress}"> 
					<input type="hidden" name="o_recipient_phone" value="${defaultDelivery.d_phone}"> 
					<input type="hidden" id="o_payment_amount" name="o_payment_amount" value="">
					<button type="submit" id="makeOrder" style="display: none;"></button>
				</form>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${goodsInfo != NULL}">
						<form action="/order/makeOrderFromGoods.do" method="post">
							<input type="hidden" name="g_no" value="${goodsInfo.g_no}">
							<input type="hidden" name="g_count" value="${g_count}"> <input
								type="hidden" name="section_Price" value="${section_Price}">
							<input type="hidden" name="o_recipient_name" value="${defaultDelivery.d_name}">
							<input type="hidden" name="o_postal_address" value="${defaultDelivery.d_postal_address}">
							<input type="hidden" name="o_address" value="${defaultDelivery.d_address}">
							<input type="hidden" name="o_detailed_address" value="${defaultDelivery.d_detailAdress}"> 
							<input type="hidden" name="o_recipient_phone" value="${defaultDelivery.d_phone}"> 
							<input type="hidden" id="o_payment_amount" name="o_payment_amount" value="">
							<button type="submit" id="makeOrder" style="display: none;"></button>
						</form>
					</c:when>
					<c:otherwise>
						<form action="/order/makeOrder.do" method="post">
							<input type="hidden" name="o_recipient_name"
								value="${defaultDelivery.d_name}"> <input type="hidden"
								name="o_postal_address"
								value="${defaultDelivery.d_postal_address}"> <input
								type="hidden" name="o_address"
								value="${defaultDelivery.d_address}"> <input
								type="hidden" name="o_detailed_address"
								value="${defaultDelivery.d_detailAdress}"> <input
								type="hidden" name="o_recipient_phone"
								value="${defaultDelivery.d_phone}"> <input type="hidden"
								id="o_payment_amount" name="o_payment_amount" value="">
							<button type="submit" id="makeOrder" style="display: none;"></button>
						</form>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="../../views/common/footer.jsp"%>
</body>

</html>
<script>
	function triggerInputEvent(element) {
		var event = new Event('input', {
			bubbles: true,
			cancelable: true,
		});
		element.dispatchEvent(event);
	}
</script>
<script>
	function shippingBasicChange() {
		var checkbox = document.getElementById("shippingBasic");
		var deliverySave = document.getElementById("deliverySave");
		var receiverName = document.getElementById("receiverName");
		var postcode = document.getElementById("postcode");
		var address = document.getElementById("address");
		var detailAddress = document.getElementById("detailAddress");
		var receiverCellPhone = document.getElementById("receiverCellPhone");
		var orderMemo = document.getElementById("orderMemo");
		if (checkbox.checked) {
			console.log("체크박스가 선택되었습니다!");
			deliverySave.disabled = true;
			receiverName.value = "${ defaultDelivery.d_name }";
			postcode.value = "${ defaultDelivery.d_postal_address}";
			address.value = "${ defaultDelivery.d_address }";
			detailAddress.value = "${ defaultDelivery.d_detailAdress }";
			receiverCellPhone.value = "${ defaultDelivery.d_phone }";
			orderMemo.value = "${ defaultDelivery.d_request }";
		} else {
			console.log("체크박스가 선택 해제되었습니다!");
			deliverySave.disabled = false;
			receiverName.value = "";
			postcode.value = "";
			address.value = "";
			detailAddress.value = "";
			receiverCellPhone.value = "";
			orderMemo.value = "";
		}
	}
</script>
<script type="text/javascript">
var IMP = window.IMP;
IMP.init('imp88413461');
var today = new Date();
var hours = today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;

function requestPay(amount, name) {
	IMP.request_pay({
		pg: 'kakaopay.TC0ONETIME',//pg사
		pay_method: 'kakaopay',//결제수단
		merchant_uid: "IMP" + makeMerchantUid,//가맹점 주문번호
		name: name,//결제대상 제품명
		amount: amount, //결제금액
		//custom_data /object//사용자 정의 데이타
		buyer_email: "${memberInfo.email}",//주문자이메일
		buyer_name: "${memberInfo.name}",//주문자명
		buyer_tel: "${memberInfo.phone}",//주문자 연락처
		buyer_addr: '서울특별시 강남구 삼성동',//주문자 주소
		buyer_postcode: '123-456',//주문자 우편
	}, function (rsp) {
		if (rsp.success) {
			console.log(rsp);
			console.log("성공");
			document.getElementById("o_payment_amount").value=amount;
			document.getElementById("makeOrder").click();
		} else {
			console.log(rsp);
			console.log("실패");
			alert("결제에 실패했습니다. 에러 내용 : " + rsp.error_msg);
		}
	});
}
</script>