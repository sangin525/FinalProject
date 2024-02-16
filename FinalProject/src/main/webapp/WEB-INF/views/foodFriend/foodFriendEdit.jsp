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
		<%@ include file="../../views/common/nav.jsp" %>
	<div class="container">
		<div class="board_wrap">
        <div class="board_title">
            <strong>게시글 수정</strong>
        </div>
        <div class="board_write_wrap">
        	<form action="/foodMate/foodMateEdit.do" method="POST" enctype="multipart/form-data" novalidate>
        <input type="hidden" name="fno" value="${food.fno}">
            <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="title" type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>소개글</dt>
                        <dd><input name="introduction" type="text" placeholder="글쓴이 입력"></dd>
                    </dl>
                   
                </div>
                <div class="info">
                    <dl>
                        <dt>같이 먹을 음식</dt>
                        <dd><input name="food" type="text" placeholder="글쓴이 입력"></dd>
                    </dl>

                <div class="info">
                    <dl>
                        <dt>만날 시간</dt>
                        <dd><input name="time" type="text" placeholder="글쓴이 입력"></dd>
                    </dl>
                   
                </div>
                <div class="info">
                    <dl>
                        <dt>인원수</dt>
                        <dd><input name="personNumber" type="number" placeholder="글쓴이 입력"></dd>
                    </dl>
                   
                </div>
                <div class="info">
                    <dl>
                        <dt>나이제한</dt>
                        <dd><input name="ageLimit" type="number" placeholder="글쓴이 입력"></dd>
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
