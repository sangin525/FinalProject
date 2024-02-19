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
        	<form action="/free/freeEdit" method="post" enctype="multipart/form-data" novalidate>
            <div class="notice_write">
            <input type="hidden" name="flno" value="${free.flno }">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="title" type="text" placeholder="제목 입력" ></dd>
                    </dl>
                </div>
               
                <div class="cont">
                    <textarea name="contents" placeholder="내용 입력"></textarea>
                </div>
                <br>
                <input type="file" name="upload">
                <br>
            </div>
           <div class="bt_wrap">                
                <button type="submit">수정</button>
               	<button type="button" onclick="history.back()">취소</button>                
            </div>
        	</form>        
        </div>
    </div>
    </div>



	<%@ include file="../../views/common/footer.jsp"%>


</body>
</html>
