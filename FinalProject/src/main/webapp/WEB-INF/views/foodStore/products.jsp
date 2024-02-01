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
			<ul class="products-ul">
				<li>
					<a href="/productDetail">
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a>
						<img src="/resources/uploads/고양이그림.png">
						<div class="product-caption">
							<div>상품명</div>
							<div>
								<span style="color: red;">20%</span>
								<strong>9,900원</strong>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>


	</div>
	
	<%@ include file="../../views/common/footer.jsp" %>
	

</body>
</html>
