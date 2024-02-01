<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


	<div class="container">
		<div class="view_pic">
			<div class="centeredcrop">
				<img id="main_pic" src="/resources/uploads/레시피등록대표사진.gif">
			</div>
			<div class="user_info2">
				<a class="info_user"><img src="/resources/uploads/레시피등록대표사진.gif"></a>
			</div>
			<span class="user_infoName">바비</span>
		</div>

		<div class="view_summary">
			<h3>간단 콩나물반찬 콩나물요리 매운 콩나물무침 빨간 콩나물무침</h3>
			<div class="view_summary_in" id="recipeIntro">아삭 아삭한 식감은 살리고 나물
				특유의 비린내는 완벽하게 잡은 국민반찬 매운 콩나물무침입니다^^*</div>
			<div class="view_summary_info">
				<span class="view_summary_info1">3인분</span> <span
					class="view_summary_info2">15분 이내</span> <span
					class="view_summary_info3">초급</span> <br> <br> <br>
			</div>
			<div class="btn_list">
				<a href="#" onclick=""> <img
					src="/resources/uploads/스크랩사진누끼.png"> <span>스크랩 <b
						class="st2">204</b></span></a> <a onclick=""> <img
					src="/resources/uploads/공유사진누끼.png"><span>공유</span></a> <a
					href="#"> <img src="/resources/uploads/댓글사진누끼.png"> <span>댓글
						<b class="st3">0</b>
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
					<li><a>콩나물</a> <span class="ingre_unit">250g</span></li>
					<li><a>대파 흰부분 </a> <span class="ingre_unit">1/3개</span></li>
				</ul>

				<ul>
					<b class="readyngre">[콩나물 삶기]</b>

					<li><a>물</a> <span class="ingre_unit">1컵</span></li>

					<li><a>소금</a> <span class="ingre_unit">1스푼</span></li>

					<li><a>식용유</a> <span class="ingre_unit">1스푼</span></li>

				</ul>
				<ul>
					<b class="readyIngre">[무침양념]</b>

					<li><a>고춧가루</a> <span class="ingre_unit">1스푼</span></li>


					<li><a>국간장 </a> <span class="ingre_unit">0.5스푼</span></li>


					<li><a>참기름 </a> <span class="ingre_unit">1스푼</span></li>

					<li><a>깨소금 </a> <span class="ingre_unit">1스푼</span></li>

					<li><a>소금 </a> <span class="ingre_unit">3티스푼</span></li>


				</ul>
			</div>

			<div class="best_tit">
				<b>조리도구</b>
			</div>
			<div class="ready_ingre">
				<ul class="case1">
					<li>도마<span class="ingre_unit"></span></li>
					<li>조리용나이프<span class="ingre_unit"></span></li>
					<li>믹싱볼<span class="ingre_unit"></span></li>
					<li>채반<span class="ingre_unit"></span></li>
					<li>냄비<span class="ingre_unit"></span></li>
					<li>요리젓가락<span class="ingre_unit"></span></li>
					<li>완성접시<span class="ingre_unit"></span></li>
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
			<div class="stepSubtitle">1. 키친타올로 고기 핏물을 제거하고 먹기 좋은 크기로 숭덩숭덩
				잘라주세요.</div>
			<div class="stepImage">
				<img src="/resources/uploads/고양이그림.png">
			</div>

		</div>
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
					<a href="#">바비</a>
				</p>
				<p class="cont_intro">요리연구가/푸드콘텐츠디렉터</p>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="comment_title">
			댓글 <span>21</span>
		</div>

		<div class="commentList">

			<div class="reply_list">
				<div class="media-left">
					<a href="#"> <img class="profile_picture"
						src="/resources/uploads/레시피등록대표사진.gif"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<b class="info_name_f">바비</b> <span class="ratingStar">★ ★ ★ ★
							★</span> <span>2024-1-29 07:32</span> <a onclick="#">답글</a><span>|</span>
						<a>신고</a>
					</h4>
					바비 <br>
				</div>


			</div>

			<div class="comment-section">
				<h2>댓글 남기기</h2>
				<form id="comment-form">
					<div class="commentPic">
						<img src="/resources/uploads/레시피등록대표사진.gif">
					</div>
					<div class="comment">
						<div class="rating">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>

						<textarea class="commentTextbox" name="comment"
							placeholder="코멘트 및 후기를 써주세요!"></textarea>
						<button class="comment_submit">댓글작성</button>
					</div>
				</form>
			</div>

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