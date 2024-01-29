<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="mainContainer" style="height: 150px">
		<div class="slick_slide" style="height: 150px;">
		<p>레시피 분류</p>
		<img src="/resources/uploads/icon_arrow3_pre.png" class="icon_arrow3_pre3">
		<ul class="categoryList">
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_03.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">국/탕</div>
		</li>
		
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_07.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">메인반찬</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_08.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">면/만두</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_09.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">밑반찬</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_10.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">밥/죽/떡</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_18.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">퓨전</div>
		</li>
		
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_13.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">스프</div>
		</li>
		
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_15.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">양식</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_16.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">찌개</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_05.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">건어물류</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_06.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">디저트</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_14.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">양념/소스/잼</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_11.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">빵</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_12.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">샐러드</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_17.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">차/음료/술</div>
		</li>
		
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_02.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">과자</div>
		</li>
		<li class="mainCategoryLi">
			<div>
				<a>
					<img src="/resources/uploads/category/cate1_04.png" class="category-image">
				</a>
			</div>
			<div class="recipeTitle">기타</div>
		</li>
		</ul>
		<img src="/resources/uploads/icon_arrow3_next.png" class="icon_arrow3_next3">
		</div>
	</div>

<script type="text/javascript">
    $(document).ready(function(){
        $('.categoryList').slick({
          infinite: true,
          slidesToShow: 8,
          slidesToScroll: 1,
          prevArrow: $('.icon_arrow3_pre3'),
          nextArrow: $('.icon_arrow3_next3'),
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