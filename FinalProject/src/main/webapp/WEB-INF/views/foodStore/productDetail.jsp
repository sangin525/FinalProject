<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodStore/foodStore.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/js/foodStore/foodStore.js"></script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
			<%@ include file="../../views/common/nav.jsp" %>

	<div class="productContainer">
		<div class="productContents">
			<div class="product-view">
				<div class="product-top-section">
					<div class="product-view-pic">
						<div class="product-view-pic-zoom">
							<a class="product-main-img"> <img src="/resources/uploads/goods/${goods.g_file_name}"> </a>
						</div>
						<div class="product-sub-img">
							<img src="/resources/uploads/goods/${goods.g_file_name}"> 
						<c:forEach var="item" items="${thumbnailList}">    
						 	<img src="/resources/uploads/goods/${item.gp_file_name}"> 
						</c:forEach>

                         <!--    <img src="/resources/uploads/category/cate1_02.png"> 
                            <img src="/resources/uploads/category/cate1_03.png"> 
                            <img src="/resources/uploads/category/cate1_04.png"> 
                            <img src="/resources/uploads/category/cate1_05.png"> -->
						</div>
					</div>
					<form method="post" id="goodsform" action="">
						<div class="product-info">
							<div class="product-view-info">
								<h3>${goods.g_name}</h3>
								<p>${goods.g_introduce}</p>
								<div class="product-view-pricebox">
									<input type="hidden" id="g_price" value="${goods.g_price}">
									<input type="hidden" id="g_r_price" value="${goods.g_regular_price}">
									<p class="dc">${goods.g_dcRate}%</p>
									<p class="price">${goods.g_price}<b>원</b></p>
									<p class="del">${goods.g_regular_price}원</p>
								</div>
								<div class="info-delivery-area">
									<dl class="info-delivery">
										<dt><img src="/resources/uploads/배송아이콘.png">배송</dt>
										<dd>무료배송</dd>
									</dl>
								</div>
								<div class="option-display-area">
									<table class="option-display-table">
										<tbody class="option-display-tbody">
											<tr>
												<td colspan="2"><span>${goods.g_name}</span></td>
											</tr>
											<tr>
												<td colspan="2">
                                                <strong class="g_price">${goods.g_price}</strong> 
                                                <span class="count"> 
												<span class="count-btn">
												<button type="button" class="down-product">감소</button> 
												<input type="text" class="product-count" value="1" name="sc_count">
												<button type="button" class="up-product">증가</button>
												</span>
                                                <input type="hidden" name="sc_price" id="sc_price" value="${goods.g_price}" readonly>
                                                <input type="hidden" name="g_no" value="${goods.g_no}" readonly>
                                                <input type="hidden" name="m_no" value="${m_no}" readonly>
                                                <input type="hidden" class="product-count" value="1" name="g_count" readonly>
												</span>
                                                </td>
											</tr>
										</tbody>
									</table>
									<div class="price-total-area">
										<div class="price-total"> <span class="pt_price">${goods.g_price} 원</span></div>
									</div>
									<div class="payment-btn-box">
										<button type="button" class="go_to_cart" onclick="goCart()">장바구니</button>
										<button type="button" class="go_to_payment" onclick="goOrder()">결제하기</button>
                                        <button type="submit" id="gotoguy" style="display: none;"></button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="product-detail-box">
					<ul class="product-detail-ul">
						<li><a href="#detail-img" class="active">상세정보</a></li>
						<li><a href="#review">후기</a></li>
						<li><a href="#refund">배송환불</a></li>
						<li><a href="#inquiry">문의</a></li>
					</ul>
				</div>
				<div class="detail-img" id=detail-img>
						<c:forEach var="item" items="${detailedImagelList}">    
						 	<img src="/resources/uploads/goods/${item.gp_file_name}"> 
						</c:forEach>
				<!-- 	<img src="/resources/uploads/가습기.jpg"> 
                    <img src="/resources/uploads/가습기2.jpg"> 
                    <img src="/resources/uploads/가습기3.jpg"> 
                    <img src="/resources/uploads/가습기4.jpg"> 
                    <img src="/resources/uploads/가습기5.jpg"> -->

				</div>
				<div class="detail-img-pull">
					<a>상세정보 더보기</a>
				</div>

				<%@ include file="../../views/foodStore/productReview.jsp"%>
				<%@ include file="../../views/foodStore/questions.jsp"%>
		<c:if test="${sessionScope.type == 0}">
		<div class="questionsEnroll-btn">
			<button type="submit" onclick="location.href='/goods/updateProduct'">상품 수정</button>
			<button type="submit" onclick="location.href='/goods/delete.do?g_no=${goods.g_no}'">상품 삭제</button>
		</div>
		</c:if>
			</div>
		</div>
	</div>
	<div class="topBtnDiv">
		<div class="latestProduct">
			<p>최근본상품</p>
		</div>
		<br> <br>
		<button class="topBtn" type="button" onclick="topScroll()">>></button>
	</div>

    <%@ include file="../../views/common/footer.jsp"%>
    <h3>${goods.g_stock}</h3>
</body>

<script>

function goCart(){
    document.getElementById("goodsform").action="/cart/addCart.do";
    document.getElementById("gotoguy").click();
}
function goOrder(){
    document.getElementById("goodsform").action="/order/goToOrder.do";
    document.getElementById("gotoguy").click();
}

</script>

</html>