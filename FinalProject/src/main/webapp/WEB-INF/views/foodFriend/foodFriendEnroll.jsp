<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">

<%@ include file="../../views/common/smarteditor.jsp"%>
<script src="/resources/js/board/board.js"></script>



</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>

	<%@ include file="../../views/common/nav.jsp"%>
	<div class="container">

		<form action="/foodMate/addFoodMate.do" method="POST"
			enctype="multipart/form-data" novalidate>
			<div class="board_wrap">
				<div class="board_title">
					<strong>글 작성</strong>
					<p>밥친구를 구하는 게시글을 써보세요</p>
				</div>
				<div class="board_write_wrap">
					<div class="board_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input name="title" type="text" placeholder="제목 입력">
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>소개글</dt>
								<dd>
									<input name="introduction" type="text" placeholder="글쓴이 입력">
								</dd>
							</dl>

						</div>
						<div class="info">
							<dl>
								<dt>같이 먹을 음식</dt>
								<dd>

									<input name="food" type="text" placeholder="음식 입력">
								</dd>
								<dt>만날 시간</dt>
								<dd>
									<input name="time" type="text" placeholder="시간 입력">
								</dd>
							</dl>
						</div>

						<div class="info">
							<dl>

								<dt>인원수</dt>
								<dd>
									<input name="personNumber" type="number" placeholder="인원 수 입력">
								</dd>
								<dt>나이제한</dt>
								<dd>
									<input name="ageLimit" type="number" placeholder="나이제한 입력">
								</dd>
							</dl>

						</div>


						<br>
						<div class="cont" id="smarteditor">
							<textarea name="contents" id="editorTxt"
								placeholder="내용을 입력해주세요."></textarea>
						</div>
						<br> <input type="file" id="file" name="upload"
							style="display: none;"> <label for="file"
							class="file-upload">파일 업로드</label> <span id="file-name"></span> <br>
					</div>
					<div class="bt_wrap">
						<button onclick="save()" type="submit">등록</button>
						<button type="button" onclick="history.back()">취소</button>


					</div>
				</div>
			</div>

		</form>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>
