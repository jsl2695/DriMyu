<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>결과</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/bike.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" type="text/css" href="css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/curation.css">
    <link rel="stylesheet" type="text/css" href="css/설문조사.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    .bgimgre{
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
        }
        
     .ct1235{display: flex;
 			justify-content: center;
 			    align-items: center;
 			}	
 	.mt1235{
 			margin: 15px 10px;
 			}
	.mt1235 > a > img {width: 480px; height: 300px;}
 	
    </style>
    
    
    
    <script type="text/javascript">

    //플라스크
/*  $.ajax({
        url: '/submit_survey',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({surveyData: surveyData}),
        success: function(response) {
            console.log(response);

            // 서버에서 반환한 결과값에 접근합니다.
            var resultMessage = response.message;
            console.log(resultMessage);

            document.getElementById("loadingPage").classList.remove("active");
            window.location.href = 'Resultpage';
        }
    }); */
    
    //DB연동 폼
    
    /*function generateMediaItems(data) {
    var bList = ""; // bList 초기화

    $.each(data, function(index, obj){
        bList += `
            <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item ${obj.location}">
                <div class="single-album">
                    <a href="#" data-toggle="modal" data-target="#myModal${obj.idx}">
                        <img src="${cpath}/resources/img/gggimg/${obj.touristName}.jpg" alt="">
                        <div class="album-info">
                            <h5>${obj.touristName}</h5>
                            <p>${obj.location}</p>
                        </div>
                    </a>
                </div>
            </div>
        `;
    });

    // oneMusic-albums 클래스를 가진 요소에 bList를 추가
    $(".ggg1235").html(bList);
}
// each 끝 */

    
    
    </script>

</head>

<body>
<%@ include file="topCon.jsp" %>
    
        <div class="bradcumbContent page-header-box">
            <p>Enjoy the Korea in your life</p>
            <h2>DriMyu choice</h2>
        </div>
    

    <!-- ##### Events Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>Categories</h5>
                            </div>
                            <div class="widget-content">
                                <ul>
                                    <img src="${cpath}/resources/img/워클샘플.png" alt="">
                                </ul>
                            </div>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>Tags</h5>
                            </div>
                            <div class="widget-content">
                                <ul class="tags">
                                    <li><a href="#">관광지</a></li>
                                    <li><a href="#">트레킹</a></li>
                                    <li><a href="#">레포츠</a></li>
                                    <li><a href="#">바다</a></li>
                                    <li><a href="#">자연</a></li>
                                    <li><a href="#">음식</a></li>
                                    <li><a href="#">맛집</a></li>
                                    
                                </ul>
                            </div>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#"><img src="img/bg-img/add.gif" alt=""></a>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#"><img src="img/bg-img/add2.gif" alt=""></a>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-lg-9 ">
                <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp ct1235" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div class="blog-post-thumb mt1235">
                            <a href="#"><img src="${cpath}/resources/img/gggimg/힐링파크 쑥섬쑥섬 (애도).jpg" alt=""></a>
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <!-- Post Title -->
                            <a href="#" class="post-title">힐링파크 쑥섬쑥섬 (애도)</a>
                            <!-- Post Meta -->
                            <div class="post-meta d-flex mb-30">
                            	<p class="post-author">By<a href="#"> 전남 고흥군</a></p>
                                <p class="tags"><a href="#">자연</a></p>
                            </div>
                            <!-- Post Excerpt -->
                            <p>바다 위 정원</p>
                        </div>
                    </div>
                    <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp ct1235" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div class="blog-post-thumb mt1235">
                            <a href="#"><img src="${cpath}/resources/img/gggimg/순천만 국가정원.jpg" alt=""></a>
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <!-- Post Title -->
                            <a href="#" class="post-title">순천만 국가정원</a>
                            <!-- Post Meta -->
                            <div class="post-meta d-flex mb-30">
                            	<p class="post-author">By<a href="#"> 전남 순천시</a></p>
                                <p class="tags"><a href="#">관광지</a></p>
                                
                            </div>
                            <!-- Post Excerpt -->
                            <p>대한민국 제 1호 국가정원, 순천만 국가정원</p>
                        </div>
                    </div>
                    <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp ct1235" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div class="blog-post-thumb mt1235">
                            <a href="#"><img src="${cpath}/resources/img/gggimg/목포근대역사관 1관.jpg" alt=""></a>
                        </div>
                        <!-- Blog Content -->
                        <div class="blog-content">
                            <!-- Post Title -->
                            <a href="#" class="post-title">목포근대역사관 1관</a>
                            <!-- Post Meta -->
                            <div class="post-meta d-flex mb-30">
                            	<p class="post-author">By<a href="#"> 전남 목포시</a></p>
                                <p class="tags"><a href="#">문화와 역사</a></p>
                            </div>
                            <!-- Post Excerpt -->
                            <p>나라를 빼앗긴 아픔을 기억하는 공간</p>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>


    <!-- ##### Footer Area Start ##### -->
  <%@ include file="tailCon.jsp" %>
  <!-- ##### Footer Area End ##### -->



</body>

</html>