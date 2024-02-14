<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
<link rel="stylesheet" href="/resources/css/notice/notice.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp" %>
	<div class="container">
	<div class="notice_wrap">
        <div class="notice_title">
            <strong>글 작성</strong>
            <p>밥친구를 구하는 게시글을 써보세요</p>
        </div>
        <div class="notice_write_wrap">
            <div class="notice_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" placeholder="글쓴이 입력"></dd>
                    </dl>
                   
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력"></textarea>
                </div>
                <br>
                 <input type="file" name="upload">
                 <br>
            </div>
            <div class="bt_wrap">
                <a href="noticeDetail" class="on">등록</a>
                <a href="noticeBoard" onclick="history.back()">취소</a>
            </div>
        </div>
    </div>
    </div>

			
	

	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
