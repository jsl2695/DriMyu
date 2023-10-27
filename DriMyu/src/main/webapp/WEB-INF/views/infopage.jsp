<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>

<html lang="en">

<head>
    <!-- Title -->
    <title>여행정보 드리뮤</title>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/bike.png">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css">
    <style>
        p{height: 60px;}
		.bgimgre{
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;}
        
        
        .single-album img {
    	width: 100%;
    	height: 180px;
			}
    </style>
    
    <script type="text/javascript">
    $(document).ready(function(){
        // 서버에서 작품 목록을 가져와서 화면에 표시
        touristSpotsList();
    });

    // 서버에서 작품 목록을 가져오는 함수
    function touristSpotsList() {
        $.ajax({
            url: "${cpath}/touristSpots",  // 서버의 /works 경로에 GET 요청
            type: "get",
            dataType: "json",
            success: function(data) {
                // 서버에서 받은 데이터를 가지고 generateMediaItems 함수 호출
                console.log(data);
                generateMediaItems(data); // 데이터 전달
            },
            error: function() {
                alert("관광지 목록 통신 실패");
            }
        });
    }

    // 작품 목록을 HTML로 생성하는 함수
    function generateMediaItems(data) {
        var bList = ""; // bList 초기화

        $.each(data, function(index, obj){
            bList += "<div class='col-12 col-sm-4 col-md-3 col-lg-2 single-album-item " + obj.location + "'>";
            bList += "<div class='single-album'>";
            bList += "<a href='#' data-toggle='modal' data-target='#myModa" + obj.idx + "'>";
            bList += "<img src='${cpath}/resources/img/gggimg/" + obj.touristName +".jpg' alt=''>";
            bList += "<div class='album-info'>";
            bList += "<h5>" + obj.touristName + "</h5>";
            bList += "<p>" + obj.location + "</p>";
            bList += "</a>";
            bList += "</div>";
            bList += "</div>";
            bList += "</div>";
        });

        // oneMusic-albums 클래스를 가진 요소에 bList를 추가
        $(".ggg1235").html(bList);
    }
    
    $(document).ready(function(){
        $('.catagory-menu a').on('click', function(e){
            e.preventDefault(); // 기본 이벤트(링크 이동) 방지

            var filterValue = $(this).data('filter'); // 클릭된 링크의 data-filter 값 가져오기
            $('.single-album-item').hide(); // 모든 항목 숨기기
            $(filterValue).show(); // 해당 카테고리의 항목만 표시
        });
    });

    
    
    </script>
    
    
    
    
    


</head>

<body>
						<%@ include file="topCon.jsp" %>

        <div class="bradcumbContent page-header-box">
            <p>Enjoy the Korea in your life</p>
            <h2>DriMyu info</h2>
        </div>


    <!-- ##### Album Catagory Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <div class="row">
            	<div class="col-12">
                    <div class="oneMusic-cool-facts-area">
                        <div class="row" style="margin-right: -12%; margin-left: 12%;">

                            <!-- Single Cool Facts -->
                            <div class="col-12 col-sm-6 col-lg-2">
                                <div class="single-cool-fact">
                                    <div class="scf-text">
                                        <h2>+<span class="counter">28433</span></h2>
                                        <p>여행지 데이터</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Cool Facts -->
                            <div class="col-12 col-sm-6 col-lg-2">
                                <div class="single-cool-fact">
                                    <div class="scf-text">
                                        <h2><span class="counter">19</span>k</h2>
                                        <p>방문자수</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Cool Facts -->
                            <div class="col-12 col-sm-6 col-lg-2">
                                <div class="single-cool-fact">
                                    <div class="scf-text">
                                        <h2><span class="counter">1541</span></h2>
                                        <p>테그정보</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Cool Facts -->
                            <div class="col-12 col-sm-6 col-lg-2">
                                <div class="single-cool-fact">
                                    <div class="scf-text">
                                        <h2><span class="counter">25</span>mil</h2>
                                        <p>검색수</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Cool Facts -->
                            <div class="col-12 col-sm-6 col-lg-2">
                                <div class="single-cool-fact">
                                    <div class="scf-text">
                                        <h2><span class="counter">280</span></h2>
                                        <p>k-컨텐츠 촬영지</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            	<div class="col-md-6">
		            <div id="piechart1" style="width: 100%; height: 500px;"></div>
		            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		            <script type="text/javascript">
		                google.charts.load('current', {'packages':['corechart']});
		                google.charts.setOnLoadCallback(drawChart1);
		
		                function drawChart1() {
		                    var data = google.visualization.arrayToDataTable([
		                    	['키워드', '빈도수'],
		                        ['자연', 1938],
		                        ['레포츠', 3418],
		                        ['문화 역사', 3774],
		                        ['음식과 음료', 19756],
		                        ['숙소', 2804],
		                        ['쇼핑,시장', 1184],
		                        ['체험', 1963],
		                        ['캠핑,글램핑', 1856],
		                        ['관광지', 8698]
		                    ]);
		
		                    var options = {
		                        title: '여행지 키워드 빈도'
		                    };
		
		                    var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
		
		                    chart.draw(data, options);
		                }
		            </script>
		        </div>
		        <div class="col-md-6">
		            <div id="piechart2" style="width: 100%; height: 500px;"></div>
		            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		            <script type="text/javascript">
		                google.charts.load('current', {'packages':['corechart']});
		                google.charts.setOnLoadCallback(drawChart2);
		
		                function drawChart2() {
		                    var data = google.visualization.arrayToDataTable([
		                        ['지역', '관광지 갯수'],
		                        ['경기', 5665],
		                        ['강원', 3343],
		                        ['서울', 2978],
		                        ['경상도', 4565], // 경남(2414) + 경북(2151)
		                        ['전라도', 3378], // 전남(1907) + 전북(1471)
		                        ['충청도', 2705], // 충남(1527) + 충북(1178)
		                        ['제주', 1504],
		                        ['인천', 1242],
		                        ['부산', 952],
		                        ['대구', 687],
		                        ['대전', 505],
		                        ['울산', 363],
		                        ['광주', 354],
		                        ['세종', 165]
		                    ]);
		
		                    var options = {
		                        title: '지역별 관광지'
		                    };
		
		                    var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
		
		                    chart.draw(data, options);
		                }
		            </script>
		        </div>
                <div class="col-12">
                    <div class="browse-by-catagories catagory-menu d-flex flex-wrap align-items-center mb-70">
                        <a href="#" data-filter="*" class="active">전체</a>
                        <a href="#" data-filter=".서울" >서울</a>
                        <a href="#" data-filter=".부산">부산</a>
                        <a href="#" data-filter=".대구">대구</a>
                        <a href="#" data-filter=".인천">인천</a>
                        <a href="#" data-filter=".광주">광주</a>
                        <a href="#" data-filter=".대전">대전</a>
                        <a href="#" data-filter=".울산">울산</a>
                        <a href="#" data-filter=".세종">세종</a>
                        <a href="#" data-filter=".경기">경기</a>
                        <a href="#" data-filter=".강원">강원</a>
                        <a href="#" data-filter=".충북">충북</a>
                        <a href="#" data-filter=".충남">충남</a>
                        <a href="#" data-filter=".전북">전북</a>
                        <a href="#" data-filter=".전남">전남</a>
                        <a href="#" data-filter=".경북">경북</a>
                        <a href="#" data-filter=".경남">경남</a>
                        <a href="#" data-filter=".제주">제주</a>
                    </div>
                </div>
            </div>

            <div class="row oneMusic-albums  ggg1235">
        		

            </div>
             


    </section>
    <!-- ##### Album Catagory Area End ##### -->




</body>

</html>