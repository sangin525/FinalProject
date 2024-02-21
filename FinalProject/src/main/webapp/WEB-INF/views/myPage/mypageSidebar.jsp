<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="/resources/js/myPage/myPage.js"></script>




</head>
<body>

	<div class="myhome_main">
		<div class="myhome_main_img"></div>
		<div class="myhome_main_info">
			<div class="myhome_pic">
				<c:choose>
					<c:when test ="${result.uploadName eq null}">
				<a class="myhome_profile"> 
					<img src="/resources/uploads/non_profile.png">
				</a> 
				<a class="myhome_camera"> 
					<img src="/resources/uploads/camera.png">
				</a>
					</c:when>
					<c:otherwise>
						<a class="myhome_profile"> 
						<img src="/resources/uploads/member/${result.uploadName}">
						</a>
					</c:otherwise>
				</c:choose>
			</div>
			<p class="myhome_nickName">
				<b>${result.nickname}</b> 
				<a class="myhome_infoText"> 
					<span>${result.introduce}</span>
				</a>
			</p>
			<br>
			<div class="totalView">
				<span>내 레시피 총 조회수 : ${viewSum}</span>
			</div>
		</div>
	</div>

	<div class="modal-dialog">
			<form action="/member/memberProfileUp" method="POST" enctype="multipart/form-data" novalidate>
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">프로필 사진 / 자기소개 편집</h4>
			</div>
			<div class="modal-body">
				<div>
					<div class="addpicture">
						<a class="upload_pic">
							<img src="https://recipe1.ezmember.co.kr/img/mobile/2023/btn_pic.png" alt="사진첩" width="60">
						</a>
						<a class="delete_pic">
							<img src="https://recipe1.ezmember.co.kr/img/mobile/2023/btn_del.png" alt="삭제" width="60">
						</a>
					</div>
					<img id="vProfileImageModalSrc" src="/resources/uploads/non_profile.png">
				</div>
				<div style="margin-top: 10px; display: block;">
					<input type="file" name="upload" id="file_1" style="display: none;">
					<p class="self_info">
						<a href="javascript:void(0)" onclick="$('#self_intro').val('')">
							<img src="https://recipe1.ezmember.co.kr/img/mobile/2022/icon_close2.png" width="22" alt="삭제">
						</a>
						<input type="text" id="self_intro" name="introduce" value="" class="input-sm" maxlength="100"
							placeholder="자기소개를 100자 이내로 작성해 주세요.">
					</p>
					<div class="myhome_modal_btn">
						<button type="button" class="btn_bottom_st2 st2">취소</button>
						<button type="submit" class="btn_bottom_st2">저장</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>


</body>
</html>