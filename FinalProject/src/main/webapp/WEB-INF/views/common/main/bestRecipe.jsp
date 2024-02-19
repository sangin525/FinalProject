<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="mainContainer">
	<div class="slick_slide">
		<p class="main-Title">Best 레시피</p>
		<img src="/resources/uploads/icon_arrow3_pre.png"
			class="icon_arrow3_pre1">
		<ul class="recipeList">
			<c:choose>
				<c:when test="${bestRecipe != null}">
				<c:forEach var="item" items="${bestRecipe}">
			<li class="recipeRanking">
				<!-- <p class="rankingNum">
					<b></b>
				</p> -->
				<div>
					<a> <img src="/resources/uploads/recipe/${item.uploadName}" class="rank-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
					</a>
				</div>
				<div class="recipeTitle">${item.title }</div>
				<div class="chefName">
					<a><img src="/resources/uploads/recipe/${item.uploadName}" class="ChefPicture">${item.memberNickName}</a>
				</div>
				<div class="RecipeScore">
					<span>별점 : ${item.star }</span> <span>리뷰수 :${item.commentCount} </span> <span>조회수 : ${item.views }</span>
				</div>
			</li>
				</c:forEach>
				</c:when>
			</c:choose>
		</ul>
		<img src="/resources/uploads/icon_arrow3_next.png"
			class="icon_arrow3_next1">
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.recipeList').slick({
			infinite : true,
			slidesToShow : 4,
			slidesToScroll : 1,
			prevArrow : $('.icon_arrow3_pre1'),
			nextArrow : $('.icon_arrow3_next1'),
			dots : false,
			responsive : [ {
				breakpoint : 1024,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 1,
					infinite : true,
					dots : false
				}
			}, {
				breakpoint : 600,
				settings : {
					slidesToShow : 2,
					slidesToScroll : 1,
					dots : false
				}
			}, {
				breakpoint : 480,
				settings : {
					slidesToShow : 1,
					slidesToScroll : 1,
					dots : false
				}
			} ]
		});
	});
</script>