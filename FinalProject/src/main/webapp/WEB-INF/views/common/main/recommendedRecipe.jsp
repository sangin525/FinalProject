<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<div class="mainContainer">
		<div class="slick_slide">
		<p>추천 레시피</p>
		<img src="/resources/uploads/icon_arrow3_pre.png" class="icon_arrow3_pre2">
		<ul class="randomRecipe">
		<li class="recommendedRecipe-li">
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
		<li class="recommendedRecipe-li">
			<p class="rankingNum"><b>2</b></p>
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
		<li class="recommendedRecipe-li">
			<p class="rankingNum"><b>3</b></p>
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
		<li class="recommendedRecipe-li">
			<p class="rankingNum"><b>4</b></p>
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
		<li class="recommendedRecipe-li">
			<p class="rankingNum"><b>4</b></p>
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
		<img src="/resources/uploads/icon_arrow3_next.png" class="icon_arrow3_next2">
		</div>
	</div>
<script type="text/javascript">
    $(document).ready(function(){
        $('.randomRecipe').slick({
          infinite: true,
          slidesToShow: 4,
          slidesToScroll: 1,
          prevArrow: $('.icon_arrow3_pre2'),
          nextArrow: $('.icon_arrow3_next2'),
          dots: false,
          responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                infinite: true,
                dots: false
              }
            },
            {
              breakpoint: 600,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1,
                dots: false
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: false
              }
            }
          ]
        });
      });
</script>