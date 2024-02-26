<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="shipping_Questions_box">
	<ul class="shipping_Questions">
		<li><a class="accordion_i_tit" id="refund">배송/환불/교환</a>
			<div class="openblock_content">
				<dl>
					<dt>
						<h3>배송안내</h3>
					</dt>
					<dd>
						<div class="admin_msg">
							<p>&gt; 배송사 : 롯데택배 (일반택배상품)</p>
							<p>&nbsp;</p>
							<p>&gt; 배송비 : 배송비 무료 (제주 및 도서산간 지역의 경우 3,000~5,000원 추가비용이
								발생됩니다.)</p>
							<p>&nbsp;</p>
							<p>&gt; 배송은 영업일 기준 1~3일 소요되며(주말 제외), 택배사의 사정에 따라 1~2일 정도 지연될
								수 있습니다.</p>
						</div>
					</dd>

					<dt>
						<h3>환불안내</h3>
					</dt>
					<dd>
						<div class="admin_msg">
							<p>&gt; 교환/반품 신청은 제품수령 후 7일 이내 가능합니다.</p>
							<p>&nbsp;</p>
							<p>&gt; 변심 반품배송비 6,000원</p>
							<p>&nbsp;</p>
							<p>&gt; 개봉시 단순변심 절대 불가합니다. 꼭 참고 부탁드립니다.</p>
							<p>&nbsp;</p>
							<p>&gt; 상품 불량, 파손, 누락, 오배송의 경우 사진촬영 부탁드립니다.</p>
							<p>&nbsp;</p>
							<p>&gt; 상품 불량인 경우는 배송비를 포함한 전액환불 됩니다.</p>
							<p>&nbsp;&nbsp;</p>
							<p>&gt; 상품별 출고지/수거지가 상이하여 네이버페이 결제는 자동수거가 불가하므로 고객센터로 문의
								부탁드립니다.</p>
							<p>&nbsp;</p>
							<p>&gt; 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및
								반품이 불가능합니다.</p>
							<p>&nbsp;</p>
							<p>&gt; 고객센터 010-0000-0000로 전화주시면 안내 가능합니다.</p>
						</div>
					</dd>

					<dt>
						<h3>AS안내</h3>
					</dt>
					<dd>
						<div class="admin_msg">
							<p>상담전화 : 010-0000-0000</p>
						</div>
					</dd>

					<dt>
						<h3>교환/반품시 주의사항</h3>
					</dt>
					<dd>
						<div class="admin_msg">
							<p>
								<strong><span style="font-size: 10pt;">- 판매 업체마다
										반품 회수지와 택배사가 다르므로 네이버페이로 결제하셨을 경우 반품접수가 불가합니다. (고객센터로 문의하시기
										바랍니다.)</span></strong>
							</p>
						</div>
					</dd>

					<dt>
						<h3>판매자 정보</h3>
					</dt>
					<dd>
						<table style="width: 100%;">
							<tbody>
								<tr>
									<th style="width: 150px;">상호 / 대표</th>
									<td>주식회사 진수성찬/ 이상인</td>
									<th style="width: 150px;">사업장 소재지</th>
									<td>경기도안양</td>
								</tr>
								<tr>
									<th style="width: 150px;">e-mail</th>
									<td>sangin525@naver.com</td>
									<th style="width: 150px;">연락처</th>
									<td>000-0000-0000</td>
								</tr>
								<tr>
									<th style="width: 150px;">통신판매업 신고번호</th>
									<td>2024-경기안양-0001</td>
									<th style="width: 150px;">사업자번호</th>
									<td>123-45-67890</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div></li>
		<li><a class="accordion_i_tit2" id="inquiry">문의</a>
			<div class="productQuestions">
				<ul>
				<c:forEach var="item" items="${inquiryList }">
				<c:choose>
				<c:when test="${empty inquiryList }">
					<p>문의내역이 없습니다.</p>
				</c:when>
				<c:when test="${item.i_secret eq 'y' and sessionScope.type eq 0 or item.m_no eq sessionScope.mno}">
				
				<li><a class="productQuestions_a">
							<div class="accordion_q_tit2"> 문의제목 : ${item.i_title}</div>
							<div class="accordion_q_tit1">
							<input type="hidden" value="${item.i_secret}">
							<span class="questions-nickName">이메일 : ${item.i_email }</span>
								<span class="questions-nickName">닉네임 : ${item.i_writer }</span> 
								<span class="questions-date">날짜 : ${item.i_in_date }</span> 
								<span class="questions-answer">비밀글 : ${item.i_secret }</span>
								<span class="questions-answer">답변여부 : ${item.i_answerCheck }</span>
							</div>
					</a>
						<div class="questionsDetail">
							<div id="boardContent" class="goods_board_view">
								<div class="contents_holder">
							<pre><c:out value="${item.i_contents }" /></pre>
									<div class="btn_view_qna_box"></div>
								</div>
								
								<div class="js_data_comment_row">
									<div class="reply_box">
										<div class="item_list_summary">
											<div>
												<b class="rv_cont_name"></b> <span class="rv_cont_date"></span>
											</div>
										</div>
										<c:forEach var="item2" items="${adminAnswer}">
											<c:if test="${item.i_no == item2.i_no }">
												<dl class="contents_holder answer">
													<pre><c:out value="${item2.aa_answer }" /></pre>
												</dl>
											</c:if>
										</c:forEach>
										
									</div>
								</div>
								
								<div class="comment_box"></div>
							</div>
						</div></li>
				</c:when>
				
				 <c:when test="${item.i_secret eq 'n'}">
				
				
				<li><a class="productQuestions_a">
							<div class="accordion_q_tit2"> 문의제목 : ${item.i_title}</div>
							<div class="accordion_q_tit1">
							<input type="hidden" value="${item.i_secret}">
							<span class="questions-nickName">이메일 : ${item.i_email }</span>
								<span class="questions-nickName">닉네임 : ${item.i_writer }</span> 
								<span class="questions-date">날짜 : ${item.i_in_date }</span> 
								<span class="questions-answer">비밀글 : ${item.i_secret }</span>
								<span class="questions-answer">답변여부 : ${item.i_answerCheck }</span>
							</div>
					</a>
						<div class="questionsDetail">
							<div id="boardContent" class="goods_board_view">
								<div class="contents_holder">
									<textarea class="contents_textarea">
										${item.i_contents}
									</textarea>
									<div class="btn_view_qna_box"></div>
								</div>
								
								<div class="js_data_comment_row">
									<div class="reply_box">
										<div class="item_list_summary">
											<div>
												<b class="rv_cont_name"></b> <span class="rv_cont_date"></span>
											</div>
										</div>
										<c:forEach var="item2" items="${adminAnswer}">
											<c:if test="${item.i_no == item2.i_no }">
												<textarea class="contents_holder answer">
													${item2.aa_answer }
												</textarea>
											</c:if>
										</c:forEach>
										
									</div>
								</div>
								
								<div class="comment_box"></div>
							</div>
						</div></li>
			
			</c:when> 
					
				</c:choose>
				</c:forEach> 
				</ul>
				
				<br>
				<button id="q_modal_btn">문의하기</button>
				<div class="pagination-box">
					<ul class="pagination">
						<!-- <li class="page-item">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li> -->
					</ul>
				</div>
				
				<div class="questionsModal" id="q_modal">
					<div class="q_modal_content">
					<div class="questionsTit">
						<h4>상품문의 쓰기</h4>
					</div>
					<form action="/goods/addInquiry" method="post">
					<input type="hidden" name="g_no" value="${goods.g_no }">
						<div class="productTit">
							<img src="/resources/uploads/고양이그림.png">
							<h5>상품제목 : ${goods.g_name }</h5>
						</div>
						<div class="writeBox">
							<table class="questionsTable">
								<colgroup>
									<col style="width:15%">
									<col style="width:85%">
								</colgroup>
								<tbody>
									<tr>
										<th>작성자</th>
										<td>
											<input type="text" name="i_writer" value=${memberNickName } placeholder="작성자 입력" class="questionsInput">
										</td>
									</tr>
									
									<tr>
										<th>이메일</th>
										<td>
											<input type="text" name="i_email"  placeholder="이메일 입력" class="questionsInput">
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" name="i_title" placeholder="제목 입력" class="questionsSubTit">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
											<div class="form_element">
			                                  	 <input type="checkbox" name="i_secret" value="y" id="input_check" class="checkbox" onchange="disableHiddenInput()" checked="checked">
    <input type="hidden" name="i_secret" value="n" id="input_check_hidden">
			                                    <label for="secret" class="check_s on">비밀글</label>
			                                </div>
											<textarea class="questionsText" name="i_contents">
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
								<button type="submit">작성</button>
								<button type="button" onclick="history.back()" class="close2">취소</button>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</li>
	</ul>
</div>

<script>
disableHiddenInput();

function disableHiddenInput() {
    var checkbox = document.getElementById("input_check");
    var hiddenInput = document.getElementById("input_check_hidden");

    if (checkbox.checked) {
        hiddenInput.disabled = true;
    } else {
        hiddenInput.disabled = false;
    }
}


</script>