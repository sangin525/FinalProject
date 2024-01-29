<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/member.css">
</head>

<body>
<%@ include file="../../views/common/header.jsp"%>

<div class="registerContainer">
	<div class="registerContain">
		<h2 class="register_h2">쉐프 아이디 등록</h2>
		<form action="/chef/register.do" method="post">
		<div class="btn_group">
		<div id="recipePhotoUpload" class="cont_pic2">
						<input type="hidden" name="chef_photo" id="chef_photo" value="">
						<input type="hidden" name="new_recipe_photo" id="new_recipe_photo"
							value=""> <input type="hidden" name="del_recipe_photo"
							id="del_recipe_photo" value="">

						<div id="recipePhoto">
							<img class="recipeImg" onclick="browseMainFile()"
								src="/resources/uploads/레시피등록대표사진.gif">
						</div>
					</div>
		
			<button type="submit" class="registerBtn">
				<span>쉐프 계정 생성</span>
			</button>
		</div>
		</form>
	</div>
</div>

</body>
</html>

