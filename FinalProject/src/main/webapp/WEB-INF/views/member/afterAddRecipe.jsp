<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/recipeAdd/afterAddRecipe.css">
<script src="/resources/js/member/afterAddRecipe.js"></script>
</head>
<body class="afterRecipeBody">

	<%@ include file="../../views/common/header.jsp"%>


	<div class="container">
	
		<div class="view_pic">
			<div class="centeredcrop">
				<img id="main_pic" src="/resources/uploads/recipe/${recipe.uploadName}">
			</div>
			<div class="user_info2">
				<a class="info_user"><img src="/resources/uploads/레시피등록대표사진.gif"></a>
			</div>
			<span class="user_infoName">${memberNickName}</span>
		</div>

		<div class="view_summary">
			<h3>${recipe.title}</h3>
			<div class="view_summary_in" id="recipeIntro">${recipe.introduction }</div>
			<div class="view_summary_info">
				<span class="view_summary_info1">${recipe.person}</span> <span
					class="view_summary_info2">${recipe.time}</span> <span
					class="view_summary_info3">${recipe.difficulty}</span> <br> <br> <br>
			</div>
			<div class="btn_list">
				<a href="#" onclick=""> <img
					src="/resources/uploads/스크랩사진누끼.png"> <span>스크랩 <b
						class="st2">204</b></span></a> <a onclick=""> <img
					src="/resources/uploads/공유사진누끼.png"><span>공유</span></a> <a
					href="#"> <img src="/resources/uploads/댓글사진누끼.png"> <span>댓글
						<b class="st3">${commentCount}</b>
				</span></a>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="cont_ingre2">
			<div class="best_tit">
				<b>재료</b><span> Ingredients</span>

			</div>
			<div class="ready_ingre" id="divConfirmedMaterialArea">
				<ul>
					<b class="readyIngre">[재료]</b>
					<c:forEach begin="0" end="${ fn:length(ingredient)-1}" varStatus="status">
						<li>${ingredient[status.index]}<span class="ingre_unit">${ingredientWeight[status.index]}</span></li>
					</c:forEach>					
				</ul>

			
			</div>

		
		</div>
	</div>


	<div class="container">
		<div class="view_step">
			<div class="view_title">
				<b>조리순서</b><span>Steps</span>
			</div>
		</div>
		<div id="stepDiv1" class="view_step">		
			<c:forEach begin="0" end="${ fn:length(sequence)-1}" varStatus="status">
				<ul>
				<li>${sequence[status.index]}</li>
				</ul>
			</c:forEach>
			
			</div>
			
			 <c:forEach var="item" items="${photoList}">
			 <div class="stepImage">
				<img src="/resources/uploads/recipe/${item.fileName}">
			</div> 
			 </c:forEach>
		</div>
		<!-- 
		<div id="stepDiv2" class="view_step">
			<div class="stepSubtitle">2. 김치도 먹기 좋은 크기로 쫑쫑 썹니다.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>


		</div>
		<div id="stepDiv3" class="view_step">
			<div class="stepSubtitle">3. 냄비에 들기름 2수저와 된장 1수저 넣고 수저로 섞어주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv4" class="view_step">
			<div class="stepSubtitle">4. 섞은 양념은 약불에서 짙은 갈색이 될때까지 볶아줍니다.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv5" class="view_step">
			<div class="stepSubtitle">5. 썰어놓은 고기와 설탕 1/2수저 넣고 중불로 올려 볶아주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv6" class="view_step">
			<div class="stepSubtitle">6. 고기 겉면이 익을 때까지 잘 볶아주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv7" class="view_step">
			<div class="stepSubtitle">7. 썰어놓은 김치를 넣고 열심히 볶아주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv8" class="view_step">
			<div class="stepSubtitle">8. 양념과 수분이 다 졸아들 때까지만 볶으시면 됩니다.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv9" class="view_step">
			<div class="stepSubtitle">9. 물 800ml를 넣고 강불로 끓여주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		<div id="stepDiv10" class="view_step">
			<div class="stepSubtitle">10. 강불에서 팔팔 끓으면 뚜껑 덮고 약불로 줄여 20분간
				끓여주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
		 -->
	</div>


	<div class="container">
		<div class="profile">
			<div class="profile_title">
				<b>레시피 작성자</b><span>About the writer</span>
			</div>
		</div>

		<div class="profile_pic">
			<a href="#"><img src="/resources/uploads/레시피등록대표사진.gif"></a>

			<div class="profile_cont">
				<p class="cont_name">
					<a href="#">${recipe.memberNickName}</a>
				</p>
				<p class="cont_intro">요리연구가/푸드콘텐츠디렉터</p>
			</div>
		</div>
	</div>

	<div class="container">
	<c:if test="${sessionScope.memberNickName == recipe.memberNickName}">
		<div class="comment_title">
			<button type="submit" onclick="location.href='/recipe/editForm.do?rno=${recipe.rno}'">게시글 수정</button>
			<button type="submit" onclick="location.href='/recipe/delete.do?rno=${recipe.rno}'">게시글 삭제</button>			
		</div>
	</c:if>
		<br>
		<div class="comment_title">
			댓글 <span></span>
		</div>
		

		<div class="commentList">

			 <c:forEach var="item" items="${comment}">
				<div class="reply_list">
					<div class="media-left">
						<a href="#"> <img class="profile_picture" src="/resources/uploads/레시피등록대표사진.gif"></a>
					</div>
							 ${item.comname}
					<div class="media-body">
						<h4 class="media-heading">
						
							<b class="info_name_f">${item.comment}</b> ${item.rcInDate}<span></span>
							<a onclick="#">답글</a><span></span>	<a>신고</a>
						</h4>
						 <br>
					</div>
					</div>


			</c:forEach> 
			</div>


			<div class="comment-section">
				<h2>댓글 남기기</h2>

				<form id="comment-form" method="post" action="/recipe/comment.do?rno=${recipe.rno}">
					<input type="hidden" id="star" name="star">
					<div class="commentPic"><img src="/resources/uploads/레시피등록대표사진.gif"></div>

					<div class="comment">
						<div class="rating">
							<span id="star" onclick="ratingTest(5);">★</span><span onclick="ratingTest(4);">★</span><span onclick="ratingTest(3);">★</span><span onclick="ratingTest(2);">★</span><span onclick="ratingTest(1);">★</span>
						</div>

					</div>
						<textarea class="commentTextbox" name="comment"
							placeholder="코멘트 및 후기를 써주세요!"></textarea>
						<button type="submit" class="comment_submit">댓글작성</button>

				</form>
					</div>
			</div>

		







	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
<script>
function ratingTest(rating) {
	// 1. hidden 요소 가져오기
	let star = document.getElementById("star");
	
	// 2. 가져온 요소의 value 바꾸기
	
}
</script>