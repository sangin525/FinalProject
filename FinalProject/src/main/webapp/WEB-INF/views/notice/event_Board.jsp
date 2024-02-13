<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<%@ include file="../../views/common/head.jsp"%>

</head>
<body>
	<%@ include file="../../views/common/header.jsp"%>

	<div class="navbar">
		<a href="/admin/noticeList">공지사항</a>
		<a href="freeboard.html">자유게시판</a>
		<a href="/admin/eventList">이벤트게시판</a>
		<a href="contact.html">고객센터</a>
	</div>

	<section class="boardSection">
    <div>
            <p class="detailP">이벤트</p>
    </div>
            <c:choose>	
           		<c:when test="${empty list}">
           			<p>등록된 이벤트가 없습니다.</p>
           		</c:when>
           		<c:otherwise>
           			<c:forEach var="item" items="${list}">
            <div name="boardTitle" id="boardTitle" class="detailtitleText">이벤트제목 : ${item.e_title}</div>
            <div class="boardRightDiv">
                <input type="hidden" id="boardNo" name="boardNo" value="1">
                <input type="hidden" name="boardViews" value="게시판 제목">
                <input type="hidden" name="boardMemberNo" value="작성자 번호">
                <span class="boardSpan">
                    <img src="/resources/boardIcon/file-earmark.svg"/>
                    <p class="boardText">이벤트게시글 번호 : ${row}</p>
                    <img src="/resources/boardIcon/eye.svg"/>
                    <p class="boardText" id="boardViews" name="boardViews">조회수 : ${item.e_views}</p>
                </span>
                <span class="boardSpan2">
                    <span class="boardSpan">
                        <img src="/resources/boardIcon/person-fill.svg"/>
                        <p class="boardText" id="boardName" name="boardName"></p>
                    </span>
                    <span class="boardInDate">
                        <img src="/resources/boardIcon/calendar-fill.svg"/>
                        <p class="boardDateText" id="boardInDate" name="boardInDate">등록날짜 : ${item.e_indate}</p>
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