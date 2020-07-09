<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main :: ITBANK</title>
    <link rel="stylesheet" href="${cpath }/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
</head>
<body>
    <header>
        <div class="titleLogo"><a href="${cpath }/">I T B A N K</a></div>
        <nav>
            <ul>
                <li>
                	<c:if test="${empty sessionScope.login }">
                    	<a href="${cpath }/login.jsp">LOGIN</a>
	                    <ul>
	                            <li><a href="#">Find ID</a></li>
	                            <li><a href="#">Reset Password</a></li>
	                            <li><a href="#">Join</a></li>
	                    </ul>
                    </c:if>
                    <c:if test="${not empty sessionScope.login }">
                    	<a href="#">${login.username }</a>
                    	<ul>
                            <li><a href="#">LOGOUT</a></li>
                    	</ul>
                    </c:if>
                </li>
                <li><a href="#">ALBUMS</a>
                    <ul>
                        <li><a href="#">미아</a></li>
                        <li><a href="#">마쉬멜로우</a></li>
                        <li><a href="#">Boo</a></li>
                        <li><a href="#">좋은 날</a></li>
                        <li><a href="#">너랑 나</a></li>
                        <li><a href="#">분홍신</a></li>
                        <li><a href="#">금요일에 만나요</a></li>
                        <li><a href="#">팔레트</a></li>
                    </ul>
                </li>
                <li><a href="${cpath }/board/">BOARD</a></li>
                <li><a href="#">ADMIN</a></li>
            </ul>
        </nav>
    </header>