<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/common/main.css">
<title>Home</title>
<script src="/resources/js/common/nav.js"></script>
<script src="/resources/js/member/register.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="/resources/js/common/alert.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

<script>
    /* // JSP에서 넘어온 값이 없을 경우 null을 반환하므로, 이를 문자열 "null"이 아닌 null과 비교해야 합니다. */
    const msg = '<%= request.getAttribute("msg") %>';
    const status = '<%= request.getAttribute("status") %>';

    if(msg !== "null" && status !== "null") {
        $(document).ready(function() {
            alertFunc(msg, status);
        });
    }
</script>