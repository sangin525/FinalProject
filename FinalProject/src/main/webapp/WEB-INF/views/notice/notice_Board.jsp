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

	<div class="navbar">
		<a href="/notice/notice_Board">공지사항</a>
		<a href="/notice/free_Board">자유게시판</a>
		<a href="/notice/event_Board">이벤트게시판</a>
		<a href="/notice/customer_Service">고객센터</a>
	</div>


    <section class="boardSection">
        <form id="notice-datail-form">
            <p class="detailP">공지사항</p>
            <div name="boardTitle" id="boardTitle" class="detailtitleText">게시판 제목</div>
            <div class="boardRightDiv">
                <input type="hidden" id="boardNo" name="boardNo" value="1">
                <input type="hidden" name="boardViews" value="게시판 제목">
                <input type="hidden" name="boardMemberNo" value="작성자 번호">
                <span class="boardSpan">
                    <img src="/resources/boardIcon/file-earmark.svg"/>
                    <p class="boardText">게시물 번호 : 1</p>
                    <img src="/resources/boardIcon/eye.svg"/>
                    <p class="boardText" id="boardViews" name="boardViews">조회수 : 100</p>
                </span>
                <span class="boardSpan2">
                    <span class="boardSpan">
                        <img src="/resources/boardIcon/person-fill.svg"/>
                        <p class="boardText" id="boardName" name="boardName">작성자 : 홍길동</p>
                    </span>
                    <span class="boardInDate">
                        <img src="/resources/boardIcon/calendar-fill.svg"/>
                        <p class="boardDateText" id="boardInDate" name="boardInDate">수정날짜 : 2024-01-24</p>
                    </span>
                </span>
            </div>
        </form>
    </section>




</body>
</html>