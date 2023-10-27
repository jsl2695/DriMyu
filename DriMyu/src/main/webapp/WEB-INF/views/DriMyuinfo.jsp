<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en" >

<head>
	<!-- Title -->
    <title>AI 드리뮤</title>
    
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
    .row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: nowrap;
    margin-right: -15px;
    margin-left: -15px;
    justify-content: center;    
        
    </style>

</head>

<body>

     <%@ include file="topCon.jsp" %>

    <div class="bradcumbContent page-header-box">
        <p>Enjoy the Korea in your life</p>
        <h2>DriMyu choice</h2>
    </div>

    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        <div class="container">
            <div class="row">


                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                        </div>
                        <div class="event-text"onclick="infoa()">
                            <h4>추천 드리뮤</h4>
                            <div class="event-meta-data">
                                <img src="${cpath}/resources/img/core-img/전국지도.jpg" alt="">
                                <a href="DriMyuA" class="event-place"></a>
                                <a href="DriMyuA" class="event-date"></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Event Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            
                        </div>
                        <div class="event-text" onclick="infob()">
                            <h4>촬영지 드리뮤</h4>
                            <div class="event-meta-data">
                                <img src="${cpath}/resources/img/core-img/포스터세트.jpg" alt="">
                                <a href="DriMyuB" class="event-place"></a>
                                <a href="DriMyuB" class="event-date"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

    </section>
<script>
    function infoa() {
      window.location.href = "DriMyuA";
    }
    function infob() {
      window.location.href = "DriMyuB";
    }
    </script>

<%@ include file="tailCon.jsp" %>
</body>

</html>