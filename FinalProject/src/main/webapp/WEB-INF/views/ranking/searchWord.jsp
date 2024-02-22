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
		<c:set var="row" value="1" />
		<c:choose>
			<c:when test="${empty searchList}">
				<p>인기검색어가 없습니다.</p>
			</c:when>		
			<c:otherwise>
			<c:forEach var="item" items="${searchList}">
		<li class="searchWordRanking">
			<div class="searchWordRank">
			<p class="searchWordNum"><b>${row}</b></p>
				<a>	${item.searchText}</a>
			</div>
		</li>
		<c:set var="row" value="${row+1}"/>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</ul>
	</div>
</div>
<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>