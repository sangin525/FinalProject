<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">
<script src="/resources/js/myPage/fixProfile.js"></script>

</head>
<body class="Main_body">
	<%@ include file="../../views/common/header.jsp"%>
			<%@ include file="../../views/common/nav.jsp" %>

	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
		<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>

			<div class="content">
				<div class="chef_cont">
					<ul class="myPageNav">
						<li><a>문의하기</a></li>
						<li><button id="q_modal_btn">문의하기</button></li>
					</ul>
					<hr />
					<br>


					<div class="cont_list">
						<div class="result_none">
							<img src="/resources/uploads/문의.png">
							<p>궁금하신 사항은 언제든지 문의하세요!</p>
							최선을 다해 답변 드리겠습니다.<br>
							<button id="q_modal_bt" class="q_modal_btn">문의하기</button>
							<br>

							<div class="questionsModal" id="q_modal">
								<div class="q_modal_content">
									<div class="questionsTit">
										<h4>상품문의 쓰기</h4>
									</div>
									<form>
										<div class="productTit">
											<img src="/resources/uploads/고양이그림.png">
											<h5>상품제목</h5>
										</div>
										<div class="writeBox">
											<table class="questionsTable">
												<colgroup>
													<col style="width: 15%">
													<col style="width: 85%">
												</colgroup>
												<tbody>
													<tr>
														<th>작성자</th>
														<td><input type="text" placeholder="작성자 입력"
															class="questionsInput"></td>
													</tr>
																										<tr>
														<th>이메일</th>
														<td><input type="text" placeholder="이메일 입력"
															class="questionsInput"></td>
													</tr>
													<tr>
														<th>제목</th>
														<td><input type="text" placeholder="제목 입력"
															class="questionsSubTit"></td>
													</tr>
													<tr>
														<th>내용</th>
														<td>
															<div class="form_element">
																<input type="checkbox" name="isSecret" value="y"
																	id="secret" class="checkbox" checked="checked">
																<label for="secret" class="check_s on">비밀글</label>
															</div> <textarea class="questionsText">
주문하신 경우 양식에 맞게 항목을 기재해주시면 빠른 업무처리가 가능합니다.
휴일간 문의사항은 휴무일 이후 순차적으로 처리해드리겠습니다.
            
주문번호 : 
상품명 : 
주문자 이메일 : 
주문자 전화번호 : 
----------------------------------------------
											</textarea>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="questionsEnroll-btn">
												<button>작성</button>
												<button class="close2">취소</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			</div>
			<div class="rightBar">
			<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
		</div>
		</div>
	</div>



	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>