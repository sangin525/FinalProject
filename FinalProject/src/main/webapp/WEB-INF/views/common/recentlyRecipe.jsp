<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="mainContainer">
		<div class="recently-div">
		<p class="main-Title">최근에 본 레시피</p>
		<ul class="recentlyList">
			<c:forEach var="item" items="${recentRecipe }">
				<li class="recently-li">
					<div class="recently-img">
						<a>
							<img src="/resources/uploads/recipe/${item.uploadName }" class="rank-image">
						</a>
					</div>
					<div class="recipeTitle">${item.title }</div>
					<div class="recipeTitle">${item.memberNickName }</div>
					
				</li>
			</c:forEach>
		<li class="recently-li">
			<div>
				<a>
					<img src="/resources/uploads/고양이그림.png" class="rank-image">
				</a>
			</div>
			<div class="recipeTitle">레시피 제목</div>
			
		</li>
		<li class="recently-li">
			<div>
				<a>
					<img src="/resources/uploads/고양이그림.png" class="rank-image">
				</a>
			</div>
			<div class="recipeTitle">레시피 제목</div>
		
		</li>
		<li class="recently-li">
			<div>
				<a>
					<img src="/resources/uploads/고양이그림.png" class="rank-image">
				</a>
			</div>
			<div class="recipeTitle">레시피 제목</div>
			
		</li>
		<li class="recently-li">
			<div>
				<a>
					<img src="/resources/uploads/고양이그림.png" class="rank-image">
				</a>
			</div>
			<div class="recipeTitle">레시피 제목</div>
			
		</li>
		</ul>
		</div>
	</div>
