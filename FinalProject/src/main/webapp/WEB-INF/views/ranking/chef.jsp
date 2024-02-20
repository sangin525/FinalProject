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
	<%@ include file="../../views/common/nav.jsp" %>
<div class="rankingContainer">
	<div class="rankingContain">
<%@ include file="../../views/ranking/rankingNav.jsp"%>
	
	<ul class="recipeList">
		<c:choose>
			<c:when test="${empty list}">
				<h3 class = "text-center">등록된 쉐프가 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${list}">
		<li class="chefRanking">
			<div class="chefRank">
			<p class="chefNum"><b>${row}</b></p>
				<a><img src="/resources/uploads/member/${item.uploadName }" class="chef-image"
				onclick="location.href='/member/chefDetail?mno=${item.mno}'" ></a>
			</div>
			<div class="chefName">${item.nickname}</div>
		</li>		
		<c:set var="row" value="${row -1}"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>