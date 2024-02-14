<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="myNav" class="overlay">
  <div class="overlay-content">
    <a href="/recipe/rankingRecipe.do">레시피 랭킹</a>
    <a href="/recipe/categoryList.do">분류</a>
    <a href="/products">상품 구매하기</a>
    <a href="/foodFriend">밥친구</a>
    <a href="/noticeBoard">게시판</a>
  </div>
</div>

<span onclick="toggleNav()" class="nav-button">
  <img src="/resources/uploads/nav버튼.png" class="nav-image">
</span>
