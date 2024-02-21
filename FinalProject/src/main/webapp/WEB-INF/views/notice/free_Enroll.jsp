<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/notice/notice.css">
<%@ include file="../../views/common/smarteditor.jsp"%>
<script src="/resources/js/board/board.js"></script>
</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>
	<div class="container">
		<form action="/free/freeEnroll" method="POST" enctype="multipart/form-data" novalidate>
			<div class="notice_wrap">
				<div class="notice_title">
					<strong>글 작성</strong>
					<p>여러분들의 재미난 글을 자유롭게 작성하세요</p>
				</div>

				<div class="notice_write_wrap">
					<div class="notice_write">
						<div class="title">
							<dl>
								<dt>제목</dt>
								<dd>
									<input name="title" type="text" placeholder="제목 입력">
								</dd>
							</dl>
						</div>

					</div><br>
					<div class="cont" id="smarteditor">
						<textarea name="contents" id="editorTxt" placeholder="내용을 입력해주세요."></textarea>
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
		</form>
	</div>





	<%@ include file="../../views/common/footer.jsp"%>


</body>


</html>