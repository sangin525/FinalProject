<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../views/common/head.jsp" %>
</head>
<body>

	<%@ include file="../views/common/header.jsp" %>
	
	
	<div >
		<div class="main_video">
			Video output space
		</div>
	</div>
<button class="btn" onclick="window.location.href='/recipe/addRecipeForm.do'" type="button" >글쓰기</button>
	<div>
		
	</div>
	<div>
		${m_no}
		<p>best 레시피</p>
		<div>
		<p>내용</p>
		</div>
	</div>
	<div>
		<p>추천 레시피</p>
		<div>
		<p>내용</p>
		</div>
	</div>
	<div>
		<p>레시피 분류</p>
		<div>
		<p>내용</p>
		</div>
	</div>
	<div>
		<p>최근 본 레시피</p>
		<div>
		<p>내용</p>
		</div>
	</div>
	<%@ include file="../views/common/footer.jsp" %>
</body>
</html>
