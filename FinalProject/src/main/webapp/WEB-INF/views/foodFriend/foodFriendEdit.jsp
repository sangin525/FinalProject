<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>

	<main>
		<div class="container">
			<h3>수정</h3>
			<hr>
			<br>

			<form action="/foodFriendEdit" method="post" class="edit">
				<input type="hidden">

				<div class="editControl">
					<input type="text" class="editTitle" name="title"
						id="exampleFormControlInput1"
						placeholder="제목을 입력하세요.">
				</div>
				<div id="editControl">
					<textarea name="content" id="editorTxt" class="editContnet" placeholder="내용을 입력해주세요">content</textarea>

				</div>

				<input type="file" name="upload">

				<div class="row">
					<div class="col text-center">
						<button type="button" class="cancelBtn" onclick="history.back()">취소</button>
						<button type="submit" onclick="save()" class="editBtn">수정</button>
					</div>
				</div>
			</form>
	</main>



	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
