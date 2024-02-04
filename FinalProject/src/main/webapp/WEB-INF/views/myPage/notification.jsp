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

	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="container">
			<ul class="menu">
				<li><a href="myRecipes">레시피</a></li>
				<li><a href="scrapRecipe">스크랩한 레시피</a></li>
				<li><a href="notification">밥친구알림</a></li>
				<li><a href="quiries">문의</a></li>
				<li><a href="orders">주문조회</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="fixProfile">회원정보 수정</a></li>
			</ul>

			<div class="result">
						<c:choose>
							<c:when test="${not empty scrapRecipeList}">
									<div class="result">
								<a href="after_addRecipe">
									<img src="/resources/uploads/고양이그림.png" class="recipe-image">
									<div class="recipe-info">
										<p class="recipe-title">탕후루</p>
										<p class="recipe-date">스크랩한 날짜: 2024-02-01</p>
									</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="/resources/uploads/알림사진.png">
									<p>두근두근~ 알림을 확인해주세요!</p>
									직접 쓴 레시피 및 토크에 올린 글에 다른 회원의 댓글이 달리면 알림에 표시되어 쉽게 확인할 수 있습니다.<br>
									<button type="button"
										onclick="location.href='/foodFriend'"
										class="btn-lg btn-primary">밥친구 구하러가기</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

		</div>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>