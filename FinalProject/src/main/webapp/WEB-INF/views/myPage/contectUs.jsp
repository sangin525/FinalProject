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
		<h2>문의하기</h2>
		<div class="container">
			<form class="content-form">
				<label for="title" class="title">제목:</label> <input type="text"
					id="title" name="title" class="content-title" required> <label
					 for="content">내용:</label>
				<textarea class="content" id="content" name="content" required></textarea>
				<input type="submit" class="contentBtn" value="문의하기">
			</form>

		</div>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>