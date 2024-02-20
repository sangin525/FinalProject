<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>

	<div id="common_header" class="common_header">
		<div class="main-logo">
		<a href="/"><img src="/resources/uploads/로고사진.png"></a>
		<form action="${sessionScope.action}" method="get" role="search" class="">
			<input type="search" class="searchCategory" name="searchText" value="">
			<button type="submit" class="searchBtn">검색</button>
		</form>
		</div>
		
		
		<div id="login_logout">
			<c:choose>
				<c:when test="${sessionScope.memberName != null}">
					<c:choose>
						<c:when test="${sessionScope.type == 0}">
							<a href="/admin/memberList" class="Main_a">관리자페이지</a>
							<a href="/member/logOut.do" class="Main_a">로그아웃</a>
							<a href="/member/MyPageForm.do" class="Main_a">마이페이지</a>
							<a href="/recipe/addRecipeForm.do" class="Main_a">레시피 등록</a>
						</c:when>
						<c:otherwise>
							<a href="/recipe/addRecipeForm.do" class="Main_a">레시피 등록</a>
							<a href="/member/MyPageForm.do" class="Main_a">마이페이지</a>
							<a href="/member/logOut.do" class="Main_a">로그아웃</a>
						</c:otherwise>
					</c:choose>

				</c:when>
				<c:otherwise>

					<a href="/member/loginForm.do" class="Main_a">로그인</a>
					<a href="/member/registerForm.do" class="Main_a">회원가입</a>

				</c:otherwise>
			</c:choose>

		</div>
	</div>
</header>