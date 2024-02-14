<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/ranking/ranking.css">
	 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</head>
<body>

	<%@ include file="../views/common/header.jsp" %>

	<%@ include file="../views/common/nav.jsp" %>
	



<%@ include file="../views/common/main/bestRecipe.jsp" %>
<%@ include file="../views/common/main/recommendedRecipe.jsp" %>
<%@ include file="../views/common/main/mainCategory.jsp" %>
<%@ include file="../views/common/recentlyRecipe.jsp" %>


	<%@ include file="../views/common/footer.jsp" %>
	

</body>
</html>
