<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="rankingMenu">
	<li class="RankingList"><a href="/recipe/rankingRecipe.do">레시피</a></li>
	<li class="RankingList"><a href="/ranking/searchWord">검색어</a></li>
	<li class="RankingList"><a href="/ranking/chef">쉐프</a></li>
	<ul class="RankingType">
		<li class="rankingSubType"><a>일간</a></li>
		<li class="rankingSubType"><a>주간</a></li>
		<li class="rankingSubType"><a>월간</a></li>
	</ul>
</ul>