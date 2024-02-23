<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/admin.css">
<link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/admin/admin.js"></script>
<script>
function calculateDiscountRate() {
    let sellingPrice = parseInt(document.getElementById("sellingPrice").value);
    let regularPrice = parseInt(document.getElementById("regularPrice").value);
    console.log(sellingPrice >= regularPrice)
    if (sellingPrice >= regularPrice) {
        let g_dcRate = document.getElementById("discountRate")
        g_dcRate.value = 0;
    } else if(sellingPrice < regularPrice) {
        let discountRate = parseInt(((regularPrice - sellingPrice) / regularPrice) * 100);
        console.log("할인율: " + discountRate + "%");
        let g_dcRate = document.getElementById("discountRate")
        g_dcRate.value = discountRate;
    }
}
</script>
</head>

<body>
	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>
	<%@ include file="../../views/admin/adminSidebar.jsp"%>
	<div class="adminContainer">
		<div class="productRegistrationContainer">
			<div class="productRegistrationContain">
				<div class="registrationTit">
					<h2>상품 등록</h2>
				</div>
				<form action="/goods/manyPhotosGoods.do" method="post"
					enctype="multipart/form-data" novalidate>
					<div class="productInfoText">
						<input type="text" name="g_name" placeholder="상품이름을 입력해주세요." > 
						<input type="text" name="g_introduce" placeholder="상품설명을 입력해주세요."> 
						<input type="number" name="g_regular_price" id="regularPrice" placeholder="상품 정가를 입력해 주세요." > 
						<input type="number" name="g_price" id="sellingPrice" placeholder="판매가를 입력해주세요" > 
						<input type="number" name="g_stock" placeholder="재고를 입력하세요"> 
						<input type="number" name="g_dcRate" id="discountRate"  placeholder="할인율" readonly >
					</div>
					<span>상품 카테고리를 선택해주세요.</span> <select class="productType" required>
						<option value="">선택해주세요.</option>
						<option value="채소">채소</option>
						<option value="쌀/잡곡">쌀/잡곡</option>
						<option value="소고기/돼지고기">소고기/돼지고기</option>
						<option value="닭/오리/계란">닭/오리/계란</option>
						<option value="생선류">생선류</option>
						<option value="오징어/낙지">오징어/낙지</option>
						<option value="조개류/갑각류">조개류/갑각류</option>
						<option value="건어물">건어물</option>
						<option value="견과류">견과류</option>
					</select>
					<div class="productImg">
						<div class="content-column">
							<label for="photo" class="form-label"> 상품사진을 업로드해주세요.</label>
							<div class="file-input-container">
								<div id="productPreviewContainer">
									<label for="productImg1" class="product-upload"> 
									<img src="/resources/uploads/더하기.png" alt="Upload">
									</label> 
									<input type="file" id="productImg1" name=multiFileList accept='image/*' class="product-input" /> 
									<label for="productImg2" class="product-upload"> 
									<img src="/resources/uploads/더하기.png" alt="Upload">
									</label> 
									<input type="file" id="productImg2" name="multiFileList"accept='image/*' class="product-input" />
									<label for="productImg3" class="product-upload"> 
									<img src="/resources/uploads/더하기.png" alt="Upload">
									</label> 
									<input type="file" id="productImg3" name="multiFileList" accept='image/*' class="product-input" /> 
									<label for="productImg4" class="product-upload"> 
									<img src="/resources/uploads/더하기.png" alt="Upload">
									</label> 
									<input type="file" id="productImg4" name="multiFileList" accept='image/*' class="product-input" /> 
									<label for="productImg5" class="product-upload"> 
									<img src="/resources/uploads/더하기.png" alt="Upload">
									</label> 
									<input type="file" id="productImg5" name="multiFileList" accept='image/*' class="product-input" />
								</div>
							</div>
						</div>
					</div>
					<div class="productInfoImg">
						<div class="content-column">
							<label for="photo" class="form-label"> 상품 상세정보 사진을
								업로드해주세요.</label>
							<div class="file-input-container">
								<div id="infoPreviewContainer">
									<label for="productImg1" class="info-upload"> <img
										src="/resources/uploads/더하기.png" alt="Upload">
									</label> <input type="file" id="productImg1" name="multiFileList"
										accept='image/*' class="info-input" /> <label
										for="productImg2" class="info-upload"> <img
										src="/resources/uploads/더하기.png" alt="Upload">
									</label> <input type="file" id="productImg2" name="multiFileList"
										accept='image/*' class="info-input" /> <label
										for="productImg3" class="info-upload"> <img
										src="/resources/uploads/더하기.png" alt="Upload">
									</label> <input type="file" id="productImg3" name="multiFileList"
										accept='image/*' class="info-input" /> <label
										for="productImg4" class="info-upload"> <img
										src="/resources/uploads/더하기.png" alt="Upload">
									</label> <input type="file" id="productImg4" name="multiFileList"
										accept='image/*' class="info-input" /> <label
										for="productImg5" class="info-upload"> <img
										src="/resources/uploads/더하기.png" alt="Upload">
									</label> <input type="file" id="productImg5" name="multiFileList"
										accept='image/*' class="info-input" />
								</div>
							</div>
							<p class="img-p">• 최대 5개까지 첨부하실 수 있습니다.</p>
							<p class="img-p">• 첨부가능 파일 : jpg, png, gif, jpeg (용량 5MB)</p>
						</div>
					</div>
					<div class="productRegistrationBtn">
						<button type="button" onclick="calculateDiscountRate()">할인율</button>
						<button type="button" id="cancelBtn" onclick="history.back()">취소</button>
						<button type="submit">등록하기</button>
					</div>
				</form>
	
			</div>
		</div>
	</div>
	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>