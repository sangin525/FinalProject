<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/addRecipe.css">
</head>
<body class="recipeBody">

	<%@ include file="../../views/common/header.jsp"%>

	<div class="addRecipeContainer">
		<div class="recipeContain">
			<h2 class="addRecipe">레시피 등록</h2>
			<form class="addRecipeForm">


				<div class="cont_box">
					<div id="recipePhotoUpload" class="cont_pic2">
						<input type="hidden" name="main_photo" id="recipe_photo" value="">
						<input type="hidden" name="new_recipe_photo" id="new_recipe_photo"
							value=""> <input type="hidden" name="del_recipe_photo"
							id="del_recipe_photo" value="">

						<div id="recipePhoto">
							<img class="recipeImg" onclick="browseMainFile()"
								src="/resources/uploads/레시피등록대표사진.gif">
						</div>
					</div>
					<div class="recipe_name">
						<p class="write_recipe">레시피 제목</p>
						<input type="text" id="cook_title" value="" class="form-control"
							placeholder="예) 소고기 미역국 끓이기">
					</div>
					<div class="recipe_intro">
						<p class="write_recipe">요리소개</p>
						<textarea id="cook_intro" class="intro_recipe"
							placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남편의 입맛에 맞게 고안했습니다."></textarea>
					</div>


					<div class="cont_line">
						<p class="write_recipe">카테고리</p>
						<select text="종류별">
							<option value="">종류별</option>
							<option value="">밑반찬</option>
							<option value="">메인반찬</option>
							<option value="">국/탕</option>
							<option value="">찌개</option>
							<option value="">디저트</option>
							<option value="">면/만두</option>
							<option value="">밥/죽/떡</option>
							<option value="">퓨전</option>
							<option value="">김치/젓갈/장류</option>
							<option value="">양념/소스/잼</option>
							<option value="">양식</option>
							<option value="">샐러드</option>
							<option value="">스프</option>
							<option value="">빵</option>
							<option value="">과자</option>
							<option value="">차/음료/술</option>
							<option value="">기타</option>
						</select> <select text="상황별">
							<option value="">상황별</option>
							<option value="">일상</option>
							<option value="">초스피드</option>
							<option value="">손님접대</option>
							<option value="">술안주</option>
							<option value="">다이어트</option>
							<option value="">도시락</option>
							<option value="">영양식</option>
							<option value="">간식</option>
							<option value="">야식</option>
							<option value="">푸드스타일링</option>
							<option value="">해장</option>
							<option value="">명절</option>
							<option value="">이유식</option>
							<option value="">기타</option>
						</select> <select text="방법별">
							<option value="">방법별</option>
							<option value="">볶음</option>
							<option value="">끓이기</option>
							<option value="">부침</option>
							<option value="">조림</option>
							<option value="">무침</option>
							<option value="">비빔</option>
							<option value="">찜</option>
							<option value="">절임</option>
							<option value="">튀김</option>
							<option value="">삶기</option>
							<option value="">굽기</option>
							<option value="">데치기</option>
							<option value="">회</option>
							<option value="">기타</option>
						</select> <select text="재료별">
							<option value="">재료별</option>
							<option value="">소고기</option>
							<option value="">돼지고기</option>
							<option value="">닭고기</option>
							<option value="">육류</option>
							<option value="">채소류</option>
							<option value="">해물류</option>
							<option value="">달걀/유제품</option>
							<option value="">가공식품류</option>
							<option value="">쌀</option>
							<option value="">밀가루</option>
							<option value="">건어물류</option>
							<option value="">버섯류</option>
							<option value="">과일류</option>
							<option value="">콩/견과류</option>
							<option value="">곡류</option>
							<option value="">기타</option>
						</select> <br> <br> <span class="guide"> 분류를 바르게 설정해주시면,
							이용자들이 쉽게 레시피를 검색할 수 있어요.</span>
					</div>
					<div class="cont_line">
						<p class="write_recipe">요리정보</p>
						<span>인원</span> <select name="cok_portion" id="cok_portion"
							text="인원">
							<option value="">인원</option>
							<option value="one">1인분</option>
							<option value="two">2인분</option>
							<option value="three">3인분</option>
							<option value="four">4인분</option>
							<option value="five">5인분</option>
							<option value="six">6인분이상</option>
						</select> <span>시간 </span> <select name="cok_time" id="cok_time"
							text="요리시간">
							<option value="">시간</option>
							<option value="ten">10분이내</option>
							<option value="twenty">20분이내</option>
							<option value="half-hour">30분이내</option>
							<option value="hour">60분이내</option>
							<option value="twoHour">2시간이상</option>
						</select> <span>난이도 </span> <select name="cok_degree" id="cok_degree"
							text="난이도">
							<option value="">난이도</option>
							<option value="everyOne">아무나</option>
							<option value="east">초급</option>
							<option value="normal">중급</option>
							<option value="hard">고급</option>
							<option value="veryHard">신의경지</option>
						</select>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="addRecipeContainer">

		<h2 class="addRecipe">레시피 등록</h2>
		<span class="guide">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
		<div>
			<br> <br>
			<ul id="ingredientList">
				<li ></li>
			</ul>

		</div>
	</div>
</body>
</html>