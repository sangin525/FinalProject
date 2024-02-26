<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet"
	href="/resources/css/recipeAdd/afterAddRecipe.css">
<script src="/resources/js/member/afterAddRecipe.js"></script>
</head>
<body class="afterRecipeBody">

	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>


	<div class="container">

		<div class="view_pic">
			<div class="centeredcrop">
				<img id="main_pic"
					src="/resources/uploads/recipe/${recipe.uploadName}">
			</div>
			<div class="user_info2">
				<a class="info_user"><img
					src="/resources/uploads/member/${recipeChefProfile.uploadName}"></a>
			</div>
			<span class="user_infoName">${recipe.memberNickName}</span>
		</div>

		<div class="view_summary">
			<h3>${recipe.title}</h3>
			<div class="view_summary_in" id="recipeIntro">${recipe.introduction }</div>
			<div class="view_summary_info">
				<span class="view_summary_info1">${recipe.person}</span> <span
					class="view_summary_info2">${recipe.time}</span> <span
					class="view_summary_info3">${recipe.difficulty}</span> <br> <br>
				<br>
			</div>
			<div class="btn_list">
				<form action="/recipe/scrapRecipe.do?rno=${recipe.rno}"
					method="POST">
					<button type="submit">
						<img src="/resources/uploads/스크랩사진누끼.png"><span>스크랩<b
							class="st2"></b>
						</span>
					</button>
					<button onclick="#">
						<img src="/resources/uploads/공유사진누끼.png"><span>공유</span>
					</button>
					<button onclick="#">
						<img src="/resources/uploads/댓글사진누끼.png"> <span>댓글 <b
							class="st3">${commentCount}</b>
						</span>
					</button>
				</form>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="cont_ingre2">
			<div class="best_tit">
				<b>재료</b>&nbsp;<span>Ingredients</span>

			</div>
			<div class="ready_ingre" id="divConfirmedMaterialArea">
				<b class="readyIngre">[재료]</b>
				<ul>
					<c:forEach begin="0" end="${ fn:length(ingredient)-1}"
						varStatus="status">
						<li>${ingredient[status.index]}<span class="ingre_unit">${ingredientWeight[status.index]}</span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="cont_ingre2">
			<div class="best_tit">
				<b>카테고리</b>&nbsp;<span>Category</span>
			</div>
			<div class="ready_ingre" id="divConfirmedMaterialArea">
				<b class="readyIngre">[카테고리]</b>
				<ul>
					<li>음식 종류 <span class="ingre_unit">${recipe.foodCategory }</span></li>
					<li>상황별<span class="ingre_unit">${recipe.situationCategory }</span></li>
					<li>조리 방법<span class="ingre_unit">${recipe.howCategory }</span></li>
					<li>주재료<span class="ingre_unit">${recipe.ingredientCategory}</span></li>
				</ul>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="view_step">
			<div class="view_title">
				<b>조리순서</b>&nbsp;<span>Steps</span>
			</div>
			<ol>
				<c:forEach begin="0" end="${ fn:length(sequence)-1}"
					varStatus="status">
					<li>
						<div class="stepSubtitle">
							${sequence[status.index]}
							<c:if test="${not empty photoList[status.index]}">
								<div class="stepImage">
									<img
										src="/resources/uploads/recipe/${photoList[status.index].fileName}">
								</div>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>

	</div>



	<div class="container">
		<div class="profile">
			<div class="profile_title">
				<b>레시피 작성자</b>&nbsp;<span>About the writer</span>
			</div>
		</div>

		<div class="profile_pic">
			<a href="#"><img
				src="/resources/uploads/member/${recipeChefProfile.uploadName}"></a>

			<div class="profile_cont">
				<p class="cont_name">
					<a href="#">${recipe.memberNickName}</a>
				</p>
				<p class="cont_intro">요리연구가/푸드콘텐츠디렉터</p>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="commentList">
		<div class="comment_title">
				<b>댓글</b>&nbsp;<span>Comment</span>
			</div>
			<c:forEach var="item" items="${comment}" varStatus="status">
				<div class="reply_list">
					<div class="media-left">
					
						<c:if test="${not empty memberResult }">
							<a href="#"> <img class="profile_picture"
								src="/resources/uploads/member/${memberResult[status.index].uploadName}"></a>
						</c:if>
					</div>
					
					<div class="media-body">

						<h4 class="media-heading">
							<c:choose>
								<c:when test="${item.star eq 5}">
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
								</c:when>

								<c:when test="${item.star eq 4}">
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: lightgray;">★</span>
								</c:when>

								<c:when test="${item.star eq 3}">
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
								</c:when>

								<c:when test="${item.star eq 2}">
									<span style="color: goldenrod;">★</span>
									<span style="color: goldenrod;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
								</c:when>

								<c:when test="${item.star eq 1}">
									<span style="color: goldenrod;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
									<span style="color: lightgray;">★</span>
								</c:when>
							</c:choose>

							<br> <br> <b class="info_name_f">${item.comment}</b>
							${item.rcInDate} <a onclick="#"></a><span></span>
							<a>신고</a>
						</h4>
						<br>
					</div>
				</div>


			</c:forEach>
		</div>


		<div class="comment-section">

		<div class="comment_title">
    <h2>댓글 남기기</h2>
			</div>
			<form id="comment-form" method="post"
				action="/recipe/comment.do?rno=${recipe.rno}">
				<input type="hidden" id="star" name="star">
				<div class="commentPic">
					<img src="/resources/uploads/member/${sessionScope.uploadName}">
				</div>



        <div class="commentPic">
            <img src="/resources/uploads/member/${sessionScope.uploadName}">
        </div>
        <div class="comment">
            <div class="rating">
                <span onclick="ratingTest(5);">★</span><span
                    onclick="ratingTest(4);">★</span><span onclick="ratingTest(3);">★</span><span
                    onclick="ratingTest(2);">★</span><span onclick="ratingTest(1);">★</span>
            </div>
            <input type="hidden" name="star" id="star">
            <textarea class="commentTextbox" name="comment"
                placeholder="코멘트 및 후기를 써주세요!"></textarea>
            <button class="comment_submit" type="submit">댓글작성</button>
        </div>
    </form>
</div>
</div>
	
	<div class="container">
		<c:if test="${sessionScope.memberNickName == recipe.memberNickName}">
			<div class="recipe_btn">
				<button type="submit"
					onclick="location.href='/recipe/editForm.do?rno=${recipe.rno}'">게시글
					수정</button>
				<button type="submit"
					onclick="location.href='/recipe/delete.do?rno=${recipe.rno}'">게시글
					삭제</button>
			</div>
		</c:if>
	</div>








	<br>
	<br>
	<br>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>
<script>
function ratingTest(rating) {
    var starValue = document.getElementById("star");
    starValue.value = rating;
}

</script>