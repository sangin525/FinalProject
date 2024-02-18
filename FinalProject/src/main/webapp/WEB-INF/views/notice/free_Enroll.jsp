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
	<%@ include file="../../views/common/nav.jsp" %>
			
			
	<div class="container">
	<div class="notice_wrap">
        <div class="notice_title">
            <strong>글 작성</strong>
            <p>여러분들의 의견을 자유롭게 적어주세요</p>
        </div>
        <form action="/free/freeEnroll" method="POST" enctype="multipart/form-data" novalidate>
        <div class="notice_write_wrap">
        
            <div class="notice_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" placeholder="제목 입력"></dd>
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
                <button type="submit">등록</button>
                <button type="button" onclick="history.back()"></button>
            </div>
            
        </div>
        </form>
    
    </div>
    </div>

			
	

	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
