<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="myPageContain">
<div class="container">
<%@ include file="../../views/myPage/myPageMenu.jsp"%>
<div class="content">
<div class="chef_cont">
<ul class="nav">
<li><a>장바구니</a></li>
</ul>
<hr/>
<br>
<div class="result">
<c:choose>
<c:when test="${empty cartList}">
<div class="result_none">
<img src="/resources/uploads/카트.png">
<p>카트가 비었습니다.</p>
신선한 재료를 구매하실 수 있습니다. <br> <br>
<button type="button" onclick="location.href='/products'" class="btn-lg btn-primary">쇼핑하러 가기</button>
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
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${cartList}">
<tr class="cart__list__detail">
<td><input type="checkbox" class="itemCheck"></td>
<td><img src="/resources/uploads/goods/${item.g_file_name}"></td>
<td>
<p>${item.g_name}</p> <span class="price">${item.g_price}원</span>
<span style="text-decoration: line-through; color: lightgray;">${item.g_regular_price}</span>
</td>
<td>
<div class="quantity">
<!-- <button class="minus-btn" id="minus-btn" type="button" name="button">-</button> -->
<input type="text" name="name" value="${item.sc_count}" readonly>
<!-- <button class="plus-btn" id="plus-btn" type="button" name="button">+</button> -->
</div>
</td>
<td><span class="point">119원</span></td>
<td><span class="price">${item.sc_price}원</span></td>
<td>무료</td>
</tr>
<form action="/cart/modifyCount.do" method="post" name="${item.g_name}modify">
<input type="number" value="${item.sc_no}" name="sc_no" readonly><br>
<input type="number" id="PriceVal${item.sc_no}" value="${item.sc_price}" name="sc_price" readonly><br>
<input type="number" id="CountVal${item.sc_no}" value="${item.sc_count}" name="sc_count" readonly><br>
<input type="number" value="${item.m_no}" name="m_no" readonly><br>
<input type="number" value="${item.g_no}" name="g_no" readonly><br>
<input type="text" value="${item.g_name}" name="g_no" readonly><br>
<input type="number" value="${item.g_price}" name="g_no" readonly><br>
<input type="number" value="${item.g_regular_price}" name="g_no" readonly><br>
<button type="submit" id="changeCount">장바구니수정</button><br>
</form>

<input type="number" id="scCountVal${item.sc_no}" value="${item.sc_count}"><br>
<input type="number" id="scPriceVal${item.sc_no}" value="${item.sc_price}" readonly><br>
<button onclick="changeQuantity(${item.sc_no},${item.g_price})">1+수량변경</button><br>

<a href="/cart/deleteCart.do?sc_no=${item.sc_no}">삭제</a>

</c:forEach>
</tbody>
</table>
<div class="cart__mainbtns">
<button class="cart__bigorderbtn left" onclick="location.href='/products'">쇼핑 계속하기</button>
<button class="cart__bigorderbtn right" onclick="location.href='/productPayment'">결제하기</button>
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
<script>

function changeQuantity(productId, price) {
// 수량을 변경합니다.
var quantityElement = document.getElementById('scCountVal' + productId);
var currentQuantity = quantityElement.value;
var newQuantity = (Number(currentQuantity) + 1);
quantityElement.value = newQuantity;
// 가격을 변경합니다.
var totalPrice = newQuantity * price;
var priceElement = document.getElementById('scPriceVal' + productId);
priceElement.value = totalPrice;
//form안으로 넣어주기
var CountVal = document.getElementById('CountVal'+productId);
CountVal.value=newQuantity;
var PriceVal = document.getElementById('PriceVal'+productId);
PriceVal.value=totalPrice;
}

</script>
</html>