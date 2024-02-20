<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/ranking/ranking.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</head>
<body>

	<%@ include file="../views/common/header.jsp"%>

	<%@ include file="../views/common/nav.jsp" %>
	
<div class="homeContainer">
    <c:forEach var="item" items="${bestRecipe}" varStatus="loop">
        <img src="/resources/uploads/recipe/${item.uploadName}" class="homeImg" data-rno="${item.rno}">
    </c:forEach>
</div>

<script>
let index = 0;
const images = document.getElementsByClassName('homeImg');

// 처음에는 모든 이미지를 숨깁니다.
for (let i = 0; i < images.length; i++) {
	images[i].style.opacity = '0';
	images[i].style.zIndex = '0';
}

// 첫 번째 이미지만 보여줍니다.
images[0].style.opacity = '1';
images[0].style.zIndex = '1';

setInterval(function() {
	// 현재 이미지를 숨기고 다음 이미지를 보여줍니다.
	images[index].style.opacity = '0';
	images[index].style.zIndex = '0';
	index = (index + 1) % images.length;
	images[index].style.opacity = '1';
	images[index].style.zIndex = '1';
}, 3000);

// 이미지 클릭 이벤트
for (let i = 0; i < images.length; i++) {
	images[i].addEventListener('click', function() {
		const rno = this.getAttribute('data-rno'); // 해당 이미지의 rno 값을 가져옴
		location.href = '/recipe/detail.do?rno=' + rno;
	});
}
</script>


	<div style="margin-top: 620px;">
	<%@ include file="../views/common/main/bestRecipe.jsp"%>
	<%@ include file="../views/common/main/recommendedRecipe.jsp"%>
	<%@ include file="../views/common/main/mainCategory.jsp"%>
	<%@ include file="../views/common/recentlyRecipe.jsp"%>
	</div>


	<%@ include file="../views/common/footer.jsp"%>


</body>
</html>
