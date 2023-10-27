<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html >

<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>AI 드리뮤</title>

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
    
    <style type="text/css">
    	
    	#img_siz{
    			height: 300px; 
    			width: -webkit-fill-available; 
    			max-width: 100%;
    			}
    	#page1 > label{font-size: 28px;
					    text-align: center;
					    font-weight: 800;
					    color: black;
					    }
    	#recommendationCounts {
			    text-align: center;
			    /* display: flex;
			    justify-content: center;
			    align-items: center;
			    height: 100vh; */
			}
    </style>
    
     <script type="text/javascript">
     // 지금 실행되는 html문서가 실행이 되면 바로 돌아가도록
     // (현재 부트스트랩 덕분에 제이쿼리 사용 가능한 상태)
     // function(){} 과 같은 표현 ()=>{} 람다식, 함수형 프로그래밍 
		$(document).ready(function(){
		    // 서버에서 작품 목록을 가져와서 화면에 표시
		    worksList();
		});

		// 서버에서 작품 목록을 가져오는 함수
		function worksList() {
		    $.ajax({
		        url: "${cpath}/works",  // 서버의 /works 경로에 GET 요청
		        type: "get",
		        dataType: "json",
		        success: function(data) {
		            // 서버에서 받은 데이터를 가지고 generateMediaItems 함수 호출
		            console.log(data)
		            generateMediaItems(data);
		        },
		        error: function() {
		            alert("작품 목록 통신 실패");
		        }
		    });
		}
		
		var mediaData = []; // 서버에서 받아온 데이터를 저장할 배열
		


		function fetchDataFromServer() {
		    $.ajax({
		        url: "${cpath}/works",
		        type: "get",
		        dataType: "json",
		        success: function(data) {
		            // 서버에서 받은 데이터를 가공하여 mediaData 배열에 저장
		            for (var i = 0; i < data.length; i++) {
		                var item = data[i];
		                var formattedItem = {
		                    workID: item.workID,
		                    mediaType: item.mediaType,
		                    title: item.title,
		                    location: item.location,
		                    location2: item.location2
		                };
		                mediaData.push(formattedItem);
		            }

		            // 데이터를 받아온 후에 목록을 생성
		            generateMediaItems();
		        },
		        error: function() {
		            alert("작품 목록 통신 실패");
		        }
		    });
		}

		// 페이지 로딩 시 서버에서 데이터를 받아옴
		$(document).ready(function(){
		    fetchDataFromServer();
		});
		


   </script>
    

</head>

<body>
    <!-- Preloader -->
        <!-- ##### Header Area Start ##### -->
    <%@ include file="topCon.jsp" %>
    <!-- ##### Latest Albums Area Start #####-->
        <!-- <section class="breadcumb-area bg-img bg-overlay" 상단 이상발생시 수정 -->
        <div class="bradcumbContent page-header-box">
            <p>let's start right now</p>
            <h2>AI 드리뮤</h2>
        </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="fs_snb_contents">
        <div class="blog-area section-padding-100">
            <div id="contents" class="type1">
			    <div class="user_input">
			        <div class="box">
			            <div class="visu">
			                <img src="./resources/img/bg-img/블루배경.jpg" class="pc" alt="" id= "img_siz">
			                <img src="./resources/img/bg-img/블루배경.jpg" class="mo" alt="" id= "img_siz">
			            </div>
			            
			            <div class="select_area">
			                <ul id="areaul">
								<div class="page" id="page1">
								    <strong class="step_num">01<em>03</em></strong>
								    <strong class="step_tit">선호 영화 및 드라마</strong>
								    <label for="mediaType">미디어 유형 선택:</label>
								    <select id="mediaType" name="mediaType" onchange="generateMediaItems()">
								        <option>콘텐츠유형</option>
								        <option value="M">영화</option>
								        <option value="D">드라마</option>
								    </select>
								    <br>
								    <div id="mediaItems">
								        <!-- 영화나 드라마에 해당하는 항목들이 여기에 표시됩니다 -->
								    </div>
								
			                        <li style="width: 700px;margin-left: 30%;">
			                        	<button onclick="nextPage()">다음</button>
			                        </li>
			                    </div>
			                    <div class="page" id="page2">
			                        <strong class="step_num">02<em>03</em></strong><strong class="step_tit">관심 카테고리</strong>
			                        <li>
			                            <div id="categoryItems">
			                            <!-- 카테고리 항목들이 여기에 표시됩니다 -->
			                            </div>
			                        </li>
			                        
			                        <li style="width: 700px; margin-left: 10%;">
			                        	<button onclick="prevPage()">이전</button>
			                        	<button onclick="nextPage()">다음</button>
			                        </li>
			                    </div>
			                    <div class="page" id="page3">
			                        <strong class="step_num">03<em>03</em></strong><strong class="step_tit">여행지 추천 갯수 선택</strong>
			                        <div id="recommendationCounts">
			                            <div class="recommendation-count" onclick="selectRecommendationCount(3)">3</div>
			                            <div class="recommendation-count" onclick="selectRecommendationCount(5)">5</div>
			                            <div class="recommendation-count" onclick="selectRecommendationCount(7)">7</div>
			                            <div class="recommendation-count" onclick="selectRecommendationCount(9)">9</div>
			                        </div>
			                        
			                        <li style="width: 700px; margin-left: 10%;">
			                        	<button onclick="prevPage()">이전</button>
			                        	<button onclick="finish()">완료</button>
			                        </li>
			                    </div>
			                        
			                    <div class="loading-page" id="loadingPage">
			                    <h1>로딩 중...</h1>
			                    <!-- 로딩 중 화면 내용 -->
			                    </div>
			                </ul>
			            </div>
			            
			
			            <!-- <div class="btn_type1"><a href="javascript:Gostep(2);" class="btn1">다음</a> -->
			            </div>
			        </div>
			    </div>
			</div>
        </div>
    </section>


    <!-- ##### Blog Area End ##### -->

    <!-- ##### Footer Area Start ##### -->

 <script>
 var currentPage = 1;
 var recommendationCount = 0;
 var selectedCategories = [];
 var selectedMediaItem = ''; 
 

 function nextPage() {
   if (currentPage < 3) {
     if (currentPage == 1) {
       var selectedItems = document.getElementsByName('mediaItem');
       selectedItems.forEach(function(item) {
         if (item.checked) {
           selectedMediaItem = item.value;
         }
       });
     }
     if (currentPage == 2 && selectedCategories.length !== 3) {
       alert('카테고리를 3개 선택해주세요.');
       return;
     }
     document.getElementById("page" + currentPage).classList.remove("active");
     currentPage++;
     document.getElementById("page" + currentPage).classList.add("active");
   }
 }

 function prevPage() {
   if (currentPage > 1) {
     document.getElementById("page" + currentPage).classList.remove("active");
     currentPage--;
     document.getElementById("page" + currentPage).classList.add("active");
   }
 }

 function setRecommendationCount(count) {
   recommendationCount = count;
   showLoadingPage();
   setTimeout(finish, 2000);
 }


 function finish() {
	    showLoadingPage();

	    setTimeout(function() {
	        var surveyData = {
	            selectedMediaType: selectedMediaType,
	            selectedMediaItem: selectedMediaItem,
	            selectedMediaLocation: selectedMediaLocation,
	            selectedMediaLocation2: selectedMediaLocation2,
	            selectedCategories: selectedCategories,
	            recommendationCount: recommendationCount
	        };
	        console.log(surveyData);
	        // surveyData를 세션에 저장
	        sessionStorage.setItem('surveyData', JSON.stringify(surveyData));

	        // 결과 페이지로 이동
	        window.location.href = 'Resultpage'; 
	    }, 2000);
	}

   
   function showLoadingPage() {
     document.getElementById("page" + currentPage).classList.remove("active");
     document.getElementById("loadingPage").classList.add("active");
   }
   
   var selectedMediaType = ""; // 선택된 미디어 타입을 저장할 변수

   function generateMediaItems() {
       selectedMediaType = document.getElementById("mediaType").value; // 선택된 미디어 타입을 저장
       var mediaItemsContainer = document.getElementById("mediaItems");
       console.log(mediaData);
       var html = "<br><br><h2>" + selectedMediaType + " 목록</h2><ul>";

       $.each(mediaData, function(index, item) {
           if (item.mediaType === selectedMediaType) {
               html += "<li class='media-item' onclick='selectMediaItem(this)' data-title='" + item.title + "'>";
               html += "<img src='${cpath}/resources/img/Kconimg/" + item.title + ".png' alt='" + item.title + "'>" + item.title + "</li>";
           }
       });

       html += "</ul>";
       mediaItemsContainer.innerHTML = html;
   }
// 선택된 미디어 아이템의 타이틀을 저장하는 변수
   var selectedMediaItem = "";

   // 선택된 미디어 아이템의 위치를 저장하는 변수
   var selectedMediaLocation = "";
   var selectedMediaLocation2 = "";

   // ...

   function selectMediaItem(item) {
       var mediaItems = document.querySelectorAll(".media-item");
       mediaItems.forEach(function(item) {
           item.classList.remove("selected");
       });

       item.classList.add("selected");

       // 선택된 아이템의 타이틀과 위치를 저장
       selectedMediaItem = item.dataset.title;

       // mediaData 배열에서 선택된 아이템을 찾아 위치 정보를 가져옴
       var selectedItem = mediaData.find(function(item) {
           return item.title === selectedMediaItem;
       });

       // 위치 정보를 가져와서 변수에 저장
       if (selectedItem) {
           selectedMediaLocation = selectedItem.location;
           selectedMediaLocation2 = selectedItem.location2;
       }

       // 이후에 selectedMediaItem과 selectedMediaLocation을 활용할 수 있습니다.
   }

   
   function toggleMediaItem(item) {
     item.classList.toggle("selected");
     var mediaName = item.querySelector("div").textContent;
     var index = selectedMediaItems.indexOf(mediaName);
     if (index !== -1) {
       selectedMediaItems.splice(index, 1);
     } else {
       selectedMediaItems.push(mediaName);
     }
   }
 
   function generateCategoryItems() {
	   var categoryItemsContainer = document.getElementById("categoryItems");
	   var dummyData = ["자연", "레포츠", "숙소", "쇼핑과 시장", "음식과 음료", "문화와 역사", "체험", "캠핑과 글램핑", "관광지"];
	   var html = "";
	   dummyData.forEach(function(item) {
	     html += "<div class='category-item' onclick='toggleCategory(this)'><img src='./resources/img/" + item + ".jpg' alt='" + item + "'><div>" + item + "</div></div>";
	   });
	   categoryItemsContainer.innerHTML = html;
	  }
 
   function toggleCategory(item) {
     item.classList.toggle("selected");
     var categoryName = item.querySelector("div").textContent;
     var index = selectedCategories.indexOf(categoryName);
     if (index !== -1) {
       selectedCategories.splice(index, 1);
     } else {
       selectedCategories.push(categoryName);
     }
   }
 
   function selectRecommendationCount(count) {
     var counts = document.querySelectorAll(".recommendation-count");
     for (var i = 0; i < counts.length; i++) {
       counts[i].classList.remove("selected");
     }
     recommendationCount = count;
     this.event.target.classList.add("selected");
   }
 
   document.getElementById("page1").classList.add("active");
   generateCategoryItems();

/*  //플라스크용  
   function finish() {
	    showLoadingPage();

	    var surveyData = {
	        selectedMediaType: selectedMediaType,
	        selectedMediaItem: selectedMediaItem,
	        selectedMediaLocation: selectedMediaLocation,
	        selectedCategories: selectedCategories,
	        recommendationCount: recommendationCount
	    };

	    console.log(surveyData);

	    $.ajax({
	        url: '/submit_survey',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({surveyData: surveyData}),
	        success: function(response) {
	            console.log(response);
	            document.getElementById("loadingPage").classList.remove("active");
	            window.location.href = 'Resultpage';
	        }
	    });
	}
 */
   
   
</script>
  
<%@ include file="tailCon.jsp" %>
</body>

</html>