<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>

	<div id="common_header">
		<%@ include file="./nav.jsp"%>
		<a href="/">logo</a>
		<div id="login_logout">
			<a href="/recipe/addRecipeForm.do">레시피 등록</a>
			<c:choose>
				<c:when test="${sessionScope.memberName != null}">
					<a href="/MyPageForm.do" class="Main_a">마이페이지</a>
					<a href="/SignOut.do" class="Main_a">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="/member/login.do">로그인</a>
					<a href="/member/registerForm.do">회원가입</a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</header>