<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/foodFriend/foodFriend.css">


</head>
<body>
	<%@ include file="../../views/common/header.jsp" %>
  <main>
    <div class="container">
      <h3 onclick="window.location.href='/foodFriendDetail'">밥친구 구하기</h3>
      <hr>
      <br>
      <table class="table">
        <thead>
          <tr >
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
          </tr>
        </thead>          
        <div class="writeFriend">
          <button class="btnWrite" onclick="window.location.href='/foodFriendEnroll'" type="button">글쓰기</button>
        </div>
      </table>
    </div>
  </main>





	
	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
