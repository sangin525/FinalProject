<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">

</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp" %>
	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
		<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>

			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>밥친구 알림</a></li>
					</ul>
					<hr />
					<br>
					<div class="result">
						<c:choose>
							<c:when test="${not empty scrapRecipeList}">
								<div class="result">
									<a href="after_addRecipe">  <!-- src 바꿔야한다 -->
									<img src="/resources/uploads/고양이그림.png" class="chef-image">
										<div class="recipe-info">
											<p class="lastDetail">chefNickName</p>
											<p class="lastDate">대화 날짜: 2024-02-02</p>
										</div>
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="result_none">
									<img src="/resources/uploads/알림사진.png">
									<p>두근두근~ 알림을 확인해주세요!</p>
									직접 쓴 레시피 및 토크에 올린 글에 다른 회원의 댓글이 달리면 알림에 표시되어 쉽게 확인할 수 있습니다.<br><br>
									<button type="button" onclick="location.href='/foodFriend'"
										class="btn-lg btn-primary">밥친구 구하러가기</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					</div>
				</div>
			</div>
			<div class="rightBar">
			<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
		</div>
		</div>
	</div>


	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>