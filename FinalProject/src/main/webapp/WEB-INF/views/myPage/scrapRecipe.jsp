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
			<%@ include file="../../views/myPage/myPageMenu.jsp"%>

			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>스크랩한 레시피</a></li>
						
					</ul>
						<hr />
					<br>
					<div class="result">
						<c:choose>
							<c:when test="${empty list}">
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
								<c:forEach var="item" items="${list }">
								<li class="recipeRanking">
								<div class="RecipeScore">
									<img src="/resources/uploads/recipe/${item.uploadName}" class="rank-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
									<span>요리제목 : ${item.title}</span>
									<span>요리 조회수 : ${item.views}</span>
									<span>스크랩 날짜 : ${item.scrapDate}</span>
									
									</div>			
								</li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

					</div>
				</div>
			</div>

		</div>
	</div>

								<!-- <div class="result_none">
									<img src="/resources/uploads/스크랩사진누끼.png">
									<p>사람들의 레시피를 스크랩해보세요!</p>
									레시피를 스크립하고 두고두고 맛있는 레시피로 요리해보세요.<br><br>
									<button type="button"
										onclick="location.href='/ranking_recipe'"
										class="btn-lg btn-primary">레시피 구경하러가기</button>
								</div> -->


	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>