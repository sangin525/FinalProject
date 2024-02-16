<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/notice/notice.css">


</head>
<body>

	<%@ include file="../../views/common/header.jsp"%>
		<%@ include file="../../views/common/nav.jsp" %>
	<div class="container">
		<div class="notice_wrap">
        <div class="notice_title">
            <strong>게시글 수정</strong>
        </div>
        <div class="notice_write_wrap">
            <div class="notice_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" value="글 제목이 들어갑니다"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" placeholder="글쓴이 입력" value="바비"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력">
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.</textarea>
                </div>
                <br>
                <input type="file" name="upload">
                <br>
            </div>
            <div class="bt_wrap">
                <a href="eventDetail" class="on">수정</a>
                <a href="eventDetail" onclick="history.back()">취소</a>
            </div>
        </div>
    </div>
    </div>



	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
