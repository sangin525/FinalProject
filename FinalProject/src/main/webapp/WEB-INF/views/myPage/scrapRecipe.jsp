<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<%@ include file="../../views/common/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/myPage.css">

</head>
<body class="Main_body">

	<%@ include file="../../views/common/header.jsp"%>
	<%@ include file="../../views/common/nav.jsp"%>


	<div class="myPage">
		<h2>마이페이지</h2>
		<div class="myPageContain">
			<div class="container">
				<%@ include file="../../views/myPage/myPageMenu.jsp"%>


            <div class="content">
               <div class="chef_cont">
                  <ul class="myPageNav">
                     <li><a>스크랩한 레시피</a></li>

                  </ul>
                  <hr />
                  <br>
                  <div class="result">
                     <c:choose>
                        <c:when test="${not empty scraplist}">
                           <c:forEach var="item" items="${scraplist}">
                              
                                 <div class="result">
                                 <a onclick="location.href='/member/detail.do?rno=${item.rno}'">
                                    <img src="/resources/uploads/recipe/${item.uploadName}"
                                       class="recipe-image"
                                       onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
                                    <div class="recipe-info">
                                    <p class="">요리제목 : ${item.title}</p>
                                    <p class="">쉐프이름 : ${item.memberNickName}</p>
                                    <p class="">스크랩 날짜 : ${item.scrapDate}</p>
                                    <%-- <button type="button"
                                    onclick="location.href='/recipe/scrapRecipeDelete?frno=${item.frno}'">
                                    스크랩   삭제</button> --%>
                                 </div>
                              </a>
                              </div>
                              <c:set var="row" value="${row-1 }" />
                           </c:forEach>
                           <!--    <a href="after_addRecipe">
                           <img src="/resources/uploads/고양이그림.png" class="recipe-image">
                           <div class="recipe-info">
                              <p class="recipe-title">탕후루</p>
                              <p class="recipe-date">스크랩한 날짜: 2024-02-01</p>
                           </div></div> -->
                        </c:when>
                        <c:otherwise>
                           <div class="result_none">
                              <img src="/resources/uploads/스크랩사진누끼.png">
                              <p>사람들의 레시피를 스크랩해보세요!</p>
                              레시피를 스크립하고 두고두고 맛있는 레시피로 요리해보세요.<br> <br>
                              <button type="button"
                                 onclick="location.href='/ranking_recipe'"
                                 class="btn-lg btn-primary">레시피 구경하러가기</button>
                           </div>

                        </c:otherwise>
                     </c:choose>
                  </div>


					</div>

				</div>
				<div class="pageBtn">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pi.cpage eq 1}">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/recipe/scrapRecipeList.do?cpage=${pi.cpage-1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item"><a class="page-link"
								href="/recipe/scrapRecipeList.do?cpage=${page}">${page}</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${pi.cpage eq pi.maxPage}">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/recipe/scrapRecipeList.do?cpage=${pi.cpage+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<div class="rightBar">
				<%@ include file="../../views/myPage/mypageSidebar.jsp"%>
			</div>
		</div>
	</div>
	<!-- <div class="result_none">
									<img src="/resources/uploads/스크랩사진누끼.png">
									<p>사람들의 레시피를 스크랩해보세요!</p>
									레시피를 스크립하고 두고두고 맛있는 레시피로 요리해보세요.<br><br>
									<button type="button"
										onclick="location.href='/ranking_recipe'"
										class="btn-lg btn-primary">레시피 구경하러가기</button>
								</div>  -->


   <%@ include file="../../views/common/footer.jsp"%>
</body>
</html>