<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/recipeAdd/addRecipe.css">
</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>
			<%@ include file="../../views/common/nav.jsp" %>

	<form action="/goods/addGoods.do" method="post" enctype="multipart/form-data" novalidate>
		
		상품이름: <input type="text" name="g_name"> <br>		
		상품설명: <input type="text" name="g_introduce"> <br>
		상품정가: <input type="number"  id="regularPrice" name="g_regular_price"><br>
		상품 판매가: <input type="number" id="sellingPrice" name="g_price"> <br>
		재고: <input type="text" name="g_stock"><br>
		<br><br><br>
		할인율 :<input type="number" id="discountRate" name="g_dcRate" ><br><br><br>
		
		<input type="file" name="upload">
		<br><br><br>
		
		
		
		<button type="button"  onclick="calculateDiscountRate()">할인율</button>
		<br><br><br>
		<button type="button" id="cancelBtn" onclick="history.back()">취소</button>
		<br><br><br>
		<button type="submit">작성</button>

	</form>


</body>
<script type="text/javascript">

	function calculateDiscountRate() {
		
		let sellingPrice = document.getElementById("sellingPrice").value;
		let regularPrice = document.getElementById("regularPrice").value;
		
		
		if (sellingPrice >= regularPrice) {
			return 0;
		} else {
			let discountRate = parseInt(((regularPrice - sellingPrice) / regularPrice) * 100);
			console.log("할인율: " + discountRate + "%");
			let g_dcRate = document.getElementById("discountRate")
			g_dcRate.value = discountRate;
		}
	}

</script>
</html>