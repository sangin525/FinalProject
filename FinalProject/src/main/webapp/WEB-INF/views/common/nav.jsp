<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="nav">
	<div class="nav-content">
		<a href="/recipe/rankingRecipe.do">레시피 랭킹</a> 
		<a href="/recipe/categoryList.do" onclick="resetCategory()">분류</a> 
		<a href="/products">상품 구매하기</a>
		<div class="dropdown">
			<a href="#">게시판</a>
			<div class="dropdown-content">
				<a href="/admin/noticeList">공지사항</a>
				<a href="/free/freeList">자유게시판</a>
				<a href="/admin/eventList">이벤트게시판</a>
			</div>
		</div>
		<a href="/foodMate/foodMateList.do">밥친구</a>

	</div>
</div>

<script>
function resetCategory() {
    sessionStorage.removeItem('activeCategoryNav1');
    sessionStorage.removeItem('activeCategoryNav2');
    sessionStorage.removeItem('activeCategoryNav3');
    sessionStorage.removeItem('activeCategoryNav4');
}
</script>