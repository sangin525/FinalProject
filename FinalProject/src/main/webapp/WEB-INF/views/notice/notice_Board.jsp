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
	<div class="navbar">

		<a href="/admin/noticeList">공지사항</a>
		<a href="/notice/free_Board">자유게시판</a>
		<a href="/admin/eventList">이벤트게시판</a>
		<a href="/notice/customer_Service">고객센터</a>
	</div>

	<div class="container">
		<div class="notice_wrap">
			<div class="notice_title">
				<strong>공지사항</strong>
				<p>최신 정보를 확인하세요.</p>
			</div>
			<div class="notice_list_wrap">
				<div class="notice_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
					<div>
						<div class="num">1</div>
						<div class="title">
							<a href="/noticeDetail">글 제목이 들어갑니다.</a>
						</div>
						<div class="writer">김이름</div>
						<div class="date">2021.1.15</div>
						<div class="count">33</div>
					</div>
				</div>
				<div class="notice_page">
					<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
					<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="num">4</a> <a
						href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
						href="#" class="bt last">>></a>
				</div>
			</div>
			<div class="bt_wrap">
				<a href="noticeEnroll" class="on">등록</a>
			</div>
		</div>
	</div>
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

	<%@ include file="../../views/common/footer.jsp" %>



</body>
</html>