<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/category/category.css">
<link rel="stylesheet" href="/resources/css/ranking/ranking.css">
<script src="/resources/js/category/category.js"></script>
</head>
<body>
<%@ include file="../../views/common/header.jsp"%>

<table class="categotyTable">
	<colgroup>
		<col width="100px;">
		<col>
	</colgroup>
	<tbody>
		<tr>
			<th class="categoryType">
				<span>종류별</span>
				<span>상황별</span>
				<span>재료별</span>
				<span>방법별</span>
			</th>
			<td>
				<div class="categoryContain">
					<div class="categoryList1">
						<a>전체</a>
						<a>밑반찬</a>
						<a>메인반찬</a>
						<a>국/탕</a>
						<a>찌개</a>
						<a>디저트</a>
						<a>면/만두</a>
						<a>밥/죽/떡</a>
						<a>퓨전</a>
						<a>김치/젓갈/장류</a>
					    <a>양념/소스/잼</a>
					    <a>양식</a>
					    <a>샐러드</a>
					    <a>스프</a>
					    <a>빵</a>
					    <a>과자</a>
					    <a>차/음료/술</a>
					    <a>기타</a>
					</div>
					<div class="categoryList2">
						<a>전체</a>
						<a>일상</a>
						<a>초스피드</a>
						<a>손님접대</a>
						<a>술안주</a>
						<a>다이어트</a>
						<a>도시락</a>
						<a>영양식</a>
						<a>간식</a>
						<a>야식</a>
					    <a>푸드스타일링</a>
					    <a>해장</a>
					    <a>명절</a>
					    <a>이유식</a>
					    <a>기타</a>
					</div>
					<div class="categoryList3">
						<a>전체</a>
						<a>볶음</a>
						<a>끓이기</a>
						<a>부침</a>
						<a>조림</a>
						<a>무침</a>
						<a>비빔</a>
						<a>찜</a>
						<a>절임</a>
						<a>튀김</a>
					    <a>삶기</a>
					    <a>굽기</a>
					    <a>데치기</a>
					    <a>회</a>
					    <a>기타</a>
					</div>
					<div class="categoryList4">
						<a>전체</a>
						<a>소고기</a>
						<a>돼지고기</a>
						<a>닭고기</a>
						<a>육류</a>
						<a>채소류</a>
						<a>해물류</a>
						<a>달걀/유제품</a>
						<a>가공식품류</a>
						<a>쌀</a>
					    <a>밀가루</a>
					    <a>건어물류</a>
					    <a>버섯류</a>
					    <a>과일류</a>
					    <a>콩/견과류</a>
					    <a>곡류</a>
					    <a>기타</a>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>
<div style="text-align:center;">
	<a>
		<span class="categoryToggle" onclick="toggleCategory()">카테고리 열기</span>
	</a>
</div>


<div class="rankingContainer">
	<div class="rankingContain">

	<ul class="recipeList">
	<c:choose>
		<c:when test="${empty list }">
			<div>
				<h3 class="text-center">등록된 글이 없습니다.</h3>
			</div>
		</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${list}">
		<li class="recipeRanking">
			<!--  
			<p class="rankingNum"></p>
			-->
			<div>
				<a>
					<img src="/resources/uploads/recipe/${item.uploadName}" class="rank-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
				</a>
			</div>
			<div class="recipeTitle">${item.title}</div>
			<div class="chefName">
				<a><img src="/resources/uploads/고양이그림.png" class="ChefPicture">${item.memberNickName }</a>
			</div>
			<div class="RecipeScore">
				<span>요리번호 : ${item.rno}</span>
				<span>별점</span>
				<span>조회수 : ${item.views}</span>
			</div>
		</li>
					<c:set var="row" value="${row-1 }"/>
				</c:forEach>
			</c:otherwise>
	</c:choose>
	<!-- 
	
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
	 -->
	 
	 
	</ul>
	
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
						      <a class="page-link" href="/recipe/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
				    	<li class="page-item">
				    		<a class="page-link" href="/recipe/list.do?cpage=${page}">${page}</a>
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
						      <a class="page-link" href="/recipe/list.do?cpage=${pi.cpage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
		</ul>
	

	</div>
</div>

</body>
</html>