<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	 <%@ include file="../../views/common/head.jsp" %>
	 <link rel="stylesheet" href="/resources/css/foodStore/foodStore.css">
	 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/foodStore/foodStore.js"></script>
</head>
<body>

	<%@ include file="../../views/common/header.jsp" %>
			<%@ include file="../../views/common/nav.jsp" %>
	<div class="storeContainer">
		<div class="storeTitle">
			<h2 class="storeTitle_m"> 상품 </h2>
		</div>
		<div class="storeCategory">
			<ul class="storeCategory-ul">
				<li class="storeCategory-li">
					<a>전체보기</a>
				</li>
				<li class="storeCategory-li">
					<a>채소</a>
				</li>
				<li class="storeCategory-li">
					<a>쌀/잡곡</a>
				</li>
				<li class="storeCategory-li">
					<a>소고기/돼지고기</a>
				</li>
				<li class="storeCategory-li">
					<a>닭/오리/계란</a>
				</li>
				<li class="storeCategory-li">
					<a>생선류</a>
				</li>
				<li class="storeCategory-li">
					<a>오징어/낙지</a>
				</li>
				<li class="storeCategory-li">
					<a>조개류/갑각류</a>
				</li>
				<li class="storeCategory-li">
					<a>건어물</a>
				</li>
				<li class="storeCategory-li">
					<a>견과류</a>
				</li>
			</ul>
		</div>
		
	
		<div class="storeList">
			<c:choose>
				<c:when test="${empty list}">
					<h3>등록된 상품이없습니다.</h3>
				</c:when>
				<c:otherwise>
					<ul class="products-ul">

						<c:forEach var="item" items="${list}">
						    <li class="products-li">
						        <a href="/goods/detail.do?g_no=${item.g_no}"> 
						            <img src="/resources/uploads/goods/${item.g_file_name}">
						            <div class="product-caption">
						                <input type="hidden" class="g_price" value="${item.g_price}">
						                <input type="hidden" class="g_r_price" value="${item.g_regular_price}">
						                <div>${item.g_name}</div> <br>
						                <div class="re_price">정상가: ${item.g_regular_price}원</div>                                    
						                <div>
						                    <span style="color: red;">${item.g_dcRate} %</span> 
						                    <strong class="price_g">판매가: ${item.g_price} 원</strong>
						                </div>
						            </div>
						        </a>
						    </li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
			<div class="pageNav">
	 		<ul class="pagination justify-content-center">
				 <c:choose>
				  		<c:when test="${pi.cpage eq 1}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
						    <li class="page-item">
						      <a class="page-link" href="/goods/list.do?cpage=${pi.cpage-1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
				    
				    <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
					    <c:choose>
					        <c:when test="${pi.cpage eq page}">
					            <li class="page-item active">
					                <a class="page-link" href="/goods/list.do?cpage=${page}">${page}</a>
					            </li>
					        </c:when>
					        <c:otherwise>
					            <li class="page-item">
					                <a class="page-link" href="/goods/list.do?cpage=${page}">${page}</a>
					            </li>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
				    
				    <c:choose>
					    <c:when test="${pi.cpage eq pi.maxPage}">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:when>
					    <c:otherwise>
  						    <li class="page-item">
						      <a class="page-link" href="/goods/list.do?cpage=${pi.cpage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:otherwise>
				    </c:choose>
		</ul>
		</div>
		</div>


	</div>
	
	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
