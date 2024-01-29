<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>

		<div id="common_header">
			<%@ include file="./nav.jsp" %>
				<a href="/">logo</a>
			<div id="login_logout">
			<a href="/recipe/addRecipeForm.do">레시피 등록</a>
				<a href="member_login">로그인</a>
				<a href="/member/registerForm.do">회원가입</a>
			</div>
		</div>
	</header>