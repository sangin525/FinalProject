<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp" %>

	<div class="container">
			<h3>글쓰기</h3>
			<hr>
			<br>

			<form class="register-form">
				<div class="enrollTitle">
					<input type="text" class="title-form"
						name="title" id="exampleFormControlInput1" placeholder="제목을 입력하세요.">
				</div>
				<div class="enrollContent">
					<textarea name="content" id="editorTxt" class="content-form"
						rows="13" cols="10" placeholder="내용을 입력해주세요"></textarea>
				</div>
				
				<input type="file" name="upload"/>
				
				<div class="row">
					<div class="text-center">
						<button type="button" class="cancelBtn" onclick="history.back()">취소</button>
						<button type="submit" onclick="save()" class="agreeBtn">작성</button>
					</div>
				</div>
			</form>
			</div>
			
	

	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
