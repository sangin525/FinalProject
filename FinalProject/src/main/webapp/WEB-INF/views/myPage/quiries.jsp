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
						<li><a>문의하기</a>
					</ul>
					<hr />
					<br>
					<div class="contactBox">
						<c:choose>
							<c:when test="${not empty scrapRecipeList}">
								<div class="result">
									<a href="after_addRecipe"> <!-- src 바꿔야한다 -->
										<div class="contactUs">
											<p class="contact">접수</p>
											<p class="contactName">접수이름</p>
											<p class="contactDate">접수 날짜: 2024-02-02</p>
										</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="cont_list">
									<div class="result_none">
										<img src="resources/uploads/문의.png">
										<p>궁금하신 사항은 언제든지 문의하세요!</p>
										최선을 다해 답변 드리겠습니다.<br>
										<button type="button"
											onclick="location.href='/contectUs'"
											class="btn-lg btn-primary">문의하기</button>
									</div>
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