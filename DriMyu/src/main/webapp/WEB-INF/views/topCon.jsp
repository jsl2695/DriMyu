<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en" >

<head>
<meta charset="UTF-8">
<head>
	<!-- Title -->
    <title>드리뮤 홈</title>
    
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/bike.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/swiper.min.css">
	<link rel="stylesheet" href="${cpath}/resources/css/common.css">
	<link rel="stylesheet" href="${cpath}/resources/css/curation.css">
	<link rel="stylesheet" href="${cpath}/resources/css/설문조사.css">
    <link rel="stylesheet" href="${cpath}/resources/css/index.css">
    
    <style>
    .bgimgre{
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;}
    </style>

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis"></div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="maininfo" class="nav-brand">DriMyu</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    
                                    <li><a href="infopage">여행지 정보</a>

                                    </li>
                                    <li><a href="DriMyuinfo">AI드리뮤</a>
                                    </li>
                                    <li><a href="boardList">자유게시판</a></li>
                                    

                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
									<c:choose>
									      <c:when test="${empty sessionScope.loginMember}">
									            <!-- 로그인이 되어 있지 않을 때 보여질 부분 -->
									            <a href="${cpath}/loginPage" class="btn">로그인</a>
									        </c:when>
									        <c:otherwise>
									            <!-- 로그인이 되어 있을 때 보여질 부분 -->
									            <div class="form-group">
									                <a href="${cpath}/userInfoPage.do" class="btn ">${sessionScope.loginMember.id}</a>
								            		<a href="${cpath}/logout.do" class="btn ">로그아웃</a>
								            		
									            </div>
									        </c:otherwise>
									</c:choose>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    
    
    
	<section class="breadcumb-area bgimgre bg-overlay" style="background-image: url(${cpath}/resources/img/core-img/광화문.jpg);">
    </section>
    
    <!-- jQuery-2.2.4 js -->
    <script src="${cpath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${cpath}/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${cpath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${cpath}/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${cpath}/resources/js/active.js"></script>
</body>
</html>