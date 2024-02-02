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

			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>나의 레시피</a></li>
						<div class="list">
							<a href="#">최신순</a><a href="#">조회순</a>
						</div>
					</ul>
					<hr />
					<br>
					<div class="result">
						<c:choose>
							<c:when test="${not empty recipeList}">
									<div class="result">
									<a href="after_addRecipe">
									<img src="/resources/uploads/고양이그림.png" class="recipe-image">
									<div class="recipe-info">
										<p class="recipe-title">탕후루</p>
										<p class="recipe-date">작성날짜: 2024-02-01</p>
									</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="https://recipe1.ezmember.co.kr/img/none_recipe.png">
									<p>레시피를 직접 올려보세요!</p>
									자랑하고 싶은 나만의 레시피! 공유하고 싶은 멋진 레시피를 올려 주세요.<br><br>
									<button type="button"
										onclick="location.href='/recipe/addRecipeForm.do'"
										class="btn-lg btn-primary">레시피 등록하기</button>
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