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

</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>
	<div class="container">
		<div class="content">
			<h2>결제 내역</h2>
			<br> <br>
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
								<span style="text-decoration: line-through; color: lightgray;">139,000</span>
							</td>
							<td>
								<div class="quantity">
									<button class="minus-btn" type="button" name="button">-</button>
									<input name="name" value="1" readonly>
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
		</div>

		<div class="delivery_info">
			<div class="order_zone_tit">
				<h4>배송정보</h4>
			</div>

			<div class="order_table_type shipping_info">
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
											id="shippingBasic"> <label for="shippingBasic"
											class="choice_s">기본 배송지</label></li>
										<li><input type="radio" name="shipping"
											id="shippingRecently"> <label for="shippingRecently"
											class="choice_s">최근 배송지</label></li>
										<li><input type="radio" name="shipping" id="shippingNew">
											<label for="shippingNew" class="choice_s on">직접 입력</label></li>
										<li><input type="radio" name="shipping"
											id="shippingSameCheck"> <label
											for="shippingSameCheck" class="choice_s">주문자정보와 동일</label></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="important">받으실분</span></th>
							<td><input type="text" id="receiverName" name="receiverName"
								data-pattern="gdEngKor" maxlength="20" class="myInput"></td>
						</tr>
						<tr>
							<th scope="row"><span class="important">받으실 곳</span></th>
							<td class="member_address">
								<div class="address_postcode">
									<input type="text" name="receiverZonecode" id="postcode"
										readonly="readonly" class="myInput"> <input
										type="hidden" name="receiverZipcode" id="zipcode"> <span
										id="receiverZipcodeText" class="old_post_code"></span>
									<button type="button" class="btn_post_search"
										onclick="execDaumPostcode()">우편번호검색</button>
								</div>
								<div class="address_input">
									<input type="text" name="receiverAddress" id="address"
										readonly="readonly" class="myInput"> <input
										type="text" name="receiverAddressSub" id="extraAddress"
										class="myInput">
								</div>
								<div class="memberInputbox">
									<input type="text" id="detailAddress" name="detailAddress"
										autocomplete="off" class="myInput"> <label
										for="detailAddress" class="register_label">상세주소</label>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><input type="text" id="receiverPhone"
								name="receiverPhone" class="myInput"></td>
						</tr>
						<tr>
							<th scope="row"><span class="important">휴대폰 번호</span></th>
							<td><input type="text" id="receiverCellPhone"
								name="receiverCellPhone" class="myInput"></td>
						</tr>
						<tr>
							<th scope="row">남기실 말씀</th>
							<td class="td_last_say">
								<div style="position: relative;">
									<input type="text" id="orderMemo" name="orderMemo"
										autocomplete="off/" class="myInput">

								</div>
							</td>
						</tr>
					</tbody>
				</table>
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
									value="jxbkc123" data-pattern="gdEngKor" maxlength="20"
									class="myInput"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" id="phoneNum" name="orderPhone"
									value="" maxlength="20" class="myInput"></td>
							</tr>
							<tr>
								<th scope="row"><span class="important">휴대폰 번호</span></th>
								<td><input type="text" id="mobileNum" name="orderCellPhone"
									value="" maxlength="20" class="myInput"></td>
							</tr>
							<tr>
								<th scope="row"><span class="important">이메일</span></th>
								<td class="member_email"><input type="text"
									name="orderEmail" value="" class="myInput"></td>
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
								<tr>
									<th scope="row">상품 합계 금액</th>
									<td><strong id="totalGoodsPrice" class="order_payment_sum">36,800원</strong>
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
												<label for="useMileageAll" class="check_s">전액 사용하기</label> <span
													class="money_use_sum">(보유 적립금 : 0 원)</span>
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
										class="order_payment_sum">36,800</strong>원</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br><br>
				
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
				<div class="paymentButton">
					<button class="myButton">결제하기</button>
				</div>
			</div>
		</div>

	</div>


	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>

<script>
	function triggerInputEvent(element) {
		var event = new Event('input', {
			bubbles : true,
			cancelable : true,
		});

		element.dispatchEvent(event);
	}
</script>