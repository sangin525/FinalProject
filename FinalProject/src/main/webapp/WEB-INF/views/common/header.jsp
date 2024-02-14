<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>

	<div id="common_header">
		<%@ include file="./nav.jsp"%>
		<div class="main-logo">
		<a href="/">logo</a>
		<form action="${sessionScope.action}" method="GET" role="search" >
			<input type="search" class="searchCategory" name="searchText">
			<button type="submit" class="searchBtn">검색</button>
			<select class="btn btn-outline-success" name="searchCategory" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">
			      <option value="title">제목</option>
			      <option value="ingredientCategory">재료</option>
			      <option value="memberNickName">작성자</option>
			</select>
		</form>
		</div>
		<div id="login_logout">
			<c:choose>
				<c:when test="${sessionScope.memberName != null}">
					<a href="/recipe/addRecipeForm.do" class="Main_a">레시피 등록</a>
					<a href="/member/MyPageForm.do" class="Main_a">마이페이지</a>
					<a href="/member/logOut.do" class="Main_a">로그아웃</a>
					<a href="/memberList">관리자페이지</a>
				</c:when>
				<c:otherwise>

					<a href="/member/loginForm.do" class="Main_a">로그인</a>
					<a href="/member/registerForm.do" class="Main_a">회원가입</a>

				</c:otherwise>
			</c:choose>

		</div>
	</div>
</header>