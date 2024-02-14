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

	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
		<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>

			<div class="content">
				<div class="chef_cont">
					<ul class="nav">
						<li><a>공개중</a></li>
						<div class="list">
							<a href="#">최신순</a><a href="#">조회순</a>
						</div>
					</ul>
						<hr />
					<br>
					<div class="cont_list">
						<div class="result_none">
							<img src="https://recipe1.ezmember.co.kr/img/none_recipe.png">
							<p>레시피를 직접 올려보세요!</p>
							자랑하고 싶은 나만의 레시피! 공유하고 싶은 멋진 레시피를 올려 주세요.<br>
							<button type="button" onclick="location.href='/recipe/addRecipeForm.do'" class="btn-lg btn-primary">
							레시피 등록하기</button>
						</div>

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