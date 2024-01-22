<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/ranking/ranking.css">
<script src="/resources/js/ranking/ranking.js"></script>
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>

<div class="rankingContainer">
	<div class="rankingContain">
	<ul class="rankingMenu">
		<li class="RankingList"><a>레시피</a></li>
		<li class="RankingList"><a>검색어</a></li>
		<li class="RankingList"><a>쉐프</a></li>
		<ul class="RankingType">
			<li class="rankingSubType"><a>일간</a></li>
			<li class="rankingSubType"><a>주간</a></li>
			<li class="rankingSubType"><a>월간</a></li>
		</ul>
	</ul>
	
	<ul>
		<li class="recipeRanking">
			<p class="rankingNum"><b>1</b></p>
			<div>
				<a>
					<img src="/resources/uploads/고양이그림.png" class="rank-image">
				</a>
			</div>
			<div class="recipeTitle">레시피 제목</div>
			<div class="chefName">
				<a><img src="/resources/uploads/고양이그림.png" class="ChefPicture">쉐프이름</a>
			</div>
			<div class="RecipeScore">
				<span>별점</span>
				<span>리뷰수</span>
				<span>조회수</span>
			</div>
		</li>
	</ul>
	</div>
</div>

</body>
</html>