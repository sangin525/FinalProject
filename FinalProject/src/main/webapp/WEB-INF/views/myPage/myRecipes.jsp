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
						<li><a>올린 레시피 갯수 ${selectMember.recipeCount}</a></li>
						<div class="list">
							<a href="#">최신순</a><a href="#">조회순</a>
						</div>
					</ul>
					<hr />
					<br>
					<div class="result">
						<c:choose>
					<c:when test="${not empty list}">
								<c:forEach var="item" items="${list}">
									<div class="result">
									<a onclick="location.href='/member/detail.do?rno=${item.rno}'">
									<img src="/resources/uploads/recipe/${item.uploadName}"  class="recipe-image">
									<div class="recipe-info">
										<p class="">레시피 제목: ${item.title }</p>
										<p class="">레시피 올린 날짜: ${item.indate }</p>
										<p class="">레시피 번호 : ${item.rno }</p>
										<p class="">레시피 조회수 : ${item.views }</p>
									</div>
									</a>
								</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="https://recipe1.ezmember.co.kr/img/none_recipe.png">
									<p>레시피를 직접 올려보세요!</p>
									자랑하고 싶은 나만의 레시피! 공유하고 싶은 멋진 레시피를 올려 주세요.<br>
									<button type="button"
										onclick="location.href='/recipe/addRecipeForm.do'"
										class="btn-lg btn-primary">레시피 등록하기</button>
								</div>
							</c:otherwise> 						</c:choose>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div>
	<ul class="pagination justify-content-center">
				 <c:choose>
				  		<c:when test="${pi.cpage eq 1}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item">
						      <a class="page-link" href="/member/myRecipe.do.do?cpage=${pi.cpage-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
				    	<li class="page-item">
				    		<a class="page-link" href="/member/myRecipe.do?cpage=${page}">${page}</a>
			    		</li>
				    </c:forEach>
				    
				    <c:choose>
					    <c:when test="${pi.cpage eq pi.maxPage}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
  						    <li class="page-item">
						      <a class="page-link" href="/member/myRecipe.do?cpage=${pi.cpage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
		</ul>	
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>