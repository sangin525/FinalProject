<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/notice/notice.css">
<%@ include file="../../views/common/smarteditor.jsp"%>
</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>
	<div class="container">
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
								<input type="text" placeholder="제목 입력">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input type="text" placeholder="글쓴이 입력">
							</dd>
						</dl>
						<br>

					</div>
					<form action="/free/freeEnrollForm" method="post">
					<div class="cont" id="smarteditor">
						<textarea name="editorTxt" id="editorTxt" placeholder="내용 입력"></textarea>
					</div>
					</form>
					<br> <input type="file" id="file" name="upload"
						style="display: none;"> <label for="file"
						class="file-upload">파일 업로드</label> <br>
				</div>
				<div class="bt_wrap">
					<a href="freeDetail" class="on">등록</a> <a href="freeBoard"
						onclick="history.back()">취소</a>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="../../views/common/footer.jsp"%>


</body>


</html>
