<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
    <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <h2>TITLE</h2>
                    <ul class="big_menu">
                        <li>회원관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="/memberList">회원목록</a></li>
                            <li><a href="#">회원등급</a></li>
                            <li><a href="">포인트</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>상품관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="/productList">상품목록</a></li>
                            <li><a href="/productRegistration">상품등록</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>주문관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">주문목록</a></li>
                            <li><a href="#">배송관리</a></li>
                            <li><a href="#">취소/교환/환불/반품</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>게시판관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">게시판 목록</a></li>
                            <li><a href="#">공지사항 등록</a></li>
                            <li><a href="#">게시글 관리</a></li>
                            <li><a href="#">문의사항 답변</a></li>
                        </ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>