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
   <%@ page import="java.util.ArrayList"%>
   <%@ page import="kr.co.project.order.model.dto.OrderDetailDTO"%>
   <%@ page import="kr.co.project.order.model.dto.OrderDTO"%>
   <div class="myPage">
      <h2>마이페이지</h2>
      <div class="myPageContain">
         <div class="container">
            <%@ include file="../../views/myPage/myPageMenu.jsp"%>
            <div class="content">
               <div class="chef_cont">
                  <ul class="myPageNav">
                     <li><a>주문조회</a></li>
                  </ul>
                  <hr />
                  <br>
                  <div class="result">
                     <c:choose>
                        <c:when test="${not empty cartList}">
                           <div class="result_none">
                              <img src="/resources/uploads/카트.png">
                              <p>카트가 비었습니다.</p>
                              신선한 재료를 구매하실 수 있습니다. <br> <br>
                              <button type="button" onclick="location.href='/products'"
                                 class="btn-lg btn-primary">쇼핑하러 가기</button>
                           </div>
                        </c:when>
                        <c:otherwise>
                           <section class="cart">
                              <table class="cart__list">
                                 <thead>
                                    <tr>
                                       <td>이미지</td>
                                       <td>상품이름</td>                                       
                                       <td>물품수량</td>
                                       <td>가격</td>
                                    
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var="order" items="${orderList}">
                                       <tr class="cart__list__detail">
                                          <td>주문날짜:${order.o_order_date}</td>
                                          <br>
                                          <c:forEach var="orderDetail" items="${orderDetailList}">
                                             <c:if test="${orderDetail.o_no == order.o_no}">
                                                <img src="/resources/uploads/goods/${orderDetail.g_file_name}"> 
                                                <td>상품이름:${orderDetail.g_name}</td>
                                                <td>상품갯수:${orderDetail.od_count}</td>
                                                <td>가격:${orderDetail.od_price}</td>
                                                <br>
                                             </c:if>
                                          </c:forEach>
                                       </tr>
                                       <p>총 금액: ${order.o_payment_amount}</p>
                                       <br>
                                       <br>
                                       <br>
                                    </c:forEach>
                                 </tbody>
                              </table>
                           </section>
                        </c:otherwise>
                     </c:choose>
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