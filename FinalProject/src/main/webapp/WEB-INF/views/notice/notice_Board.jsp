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
		<a href="/admin/noticeList">공지사항</a>
		<a href="/notice/free_Board">자유게시판</a>
		<a href="/admin/eventList">이벤트게시판</a>
		<a href="/notice/customer_Service">고객센터</a>
	</div>


    <section class="boardSection">
    <div>
            <p class="detailP">공지사항</p>
    </div>
            <c:choose>	
           		<c:when test="${empty list}">
           			<p>등록된 공지사항이 없습니다.</p>
           		</c:when>
           		<c:otherwise>
           			<c:forEach var="item" items="${list}">
            <div name="boardTitle" id="boardTitle" class="detailtitleText">공지제목 : ${item.title}</div>
            <div class="boardRightDiv">
                <input type="hidden" id="boardNo" name="boardNo" value="1">
                <input type="hidden" name="boardViews" value="게시판 제목">
                <input type="hidden" name="boardMemberNo" value="작성자 번호">
                <span class="boardSpan">
                    <img src="/resources/boardIcon/file-earmark.svg"/>
                    <p class="boardText">공지번호 : ${row}</p>
                    <img src="/resources/boardIcon/eye.svg"/>
                    <p class="boardText" id="boardViews" name="boardViews">조회수 : ${item.views}</p>
                </span>
                <span class="boardSpan2">
                    <span class="boardSpan">
                        <img src="/resources/boardIcon/person-fill.svg"/>
                        <p class="boardText" id="boardName" name="boardName"></p>
                    </span>
                    <span class="boardInDate">
                        <img src="/resources/boardIcon/calendar-fill.svg"/>
                        <p class="boardDateText" id="boardInDate" name="boardInDate">등록날짜 : ${item.indate}</p>
                    </span>
                </span>
            </div>      
            			<c:set var="row" value="${row -1}"/>
           			</c:forEach>
           		</c:otherwise>
            </c:choose>
    </section>




</body>
</html>