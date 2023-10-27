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
    
    	#areaul > li> label{margin: 7px; height: 60px}
    	
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
    

</head>

<body>
    <!-- Preloader -->
        <!-- ##### Header Area Start ##### -->
    <%@ include file="topCon.jsp" %>
   
        <div class="bradcumbContent page-header-box">
            <p>let's start right now</p>
            <h2>AI 추천 드리뮤</h2>
        </div>
    </section>
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
			                        <strong class="step_tit">지역선택</strong>
			                            <ul id="areaul">
							               <li>
							                   <input type="radio" id="area_chk1" name="areaChk" value="서울">
							                       <label for="area_chk1">
							                       <span>서울</span>
							                       </label>
							               </li>
							               <li>
								             <input type="radio" id="area_chk6" name="areaChk" value="부산">    
								             <label for="area_chk6"><span>부산</span></label>
								             </li>
								             <li>    
								             <input type="radio" id="area_chk4" name="areaChk" value="대구">    
								             <label for="area_chk4"><span>대구</span></label>
								             </li>
								             <li>
								             <input type="radio" id="area_chk2" name="areaChk" value="인천">
								              <label for="area_chk2"><span>인천</span></label>
								              </li>
								              <li>    
								              <input type="radio" id="area_chk5" name="areaChk" value="광주">
								               <label for="area_chk5"><span>광주</span></label>
								               </li>
								               <li>    
								               <input type="radio" id="area_chk3" name="areaChk" value="대전"> 
								                <label for="area_chk3"><span>대전</span></label>
								                </li>
								                <li>    
								                <input type="radio" id="area_chk7" name="areaChk" value="울산">
								                <label for="area_chk7"><span>울산</span></label>
								                </li>
								                <li>    
								                <input type="radio" id="area_chk8" name="areaChk" value="세종">    
								                <label for="area_chk8"><span>세종</span></label>
								                </li>
								                <li>    <input type="radio" id="area_chk31" name="areaChk" value="경기">    
								                <label for="area_chk31"><span>경기</span></label>
								                </li>
								                <li>    
								                <input type="radio" id="area_chk32" name="areaChk" value="강원">    
								                <label for="area_chk32"><span>강원</span></label></li>
								                <li>    <input type="radio" id="area_chk33" name="areaChk" value="충북">    
								                <label for="area_chk33"><span>충북</span></label>
								                </li>
								                <li>    
								                <input type="radio" id="area_chk34" name="areaChk" value="충남">
								                 <label for="area_chk34"><span>충남</span></label>
		                                        </li>
		                                        <li>    
		                                        <input type="radio" id="area_chk37" name="areaChk" value="전북">    
		                                        <label for="area_chk37"><span>전북</span></label>
		                                        </li>
		                                        <li>    
		                                        <input type="radio" id="area_chk38" name="areaChk" value="전남">    
		                                        <label for="area_chk38"><span>전남</span></label>
		                                        </li>
		                                        <li>    
		                                        	 <input type="radio" id="area_chk35" name="areaChk" value="경북">
		                                            <label for="area_chk35"><span>경북</span></label>
		                                         </li>
		                                         <li>
		                                            <input type="radio" id="area_chk36" name="areaChk" value="경남">
		                                            <label for="area_chk36"><span>경남</span></label>
		                                          </li>
		                                           <li>    
		                                               <input type="radio" id="area_chk39" name="areaChk" value="제주">
		                                               <label for="area_chk39"><span>제주</span></label>
		                                            </li>
                                            </ul>
			                            
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

	<%@ include file="tailCon.jsp" %>
	<!-- ##### Footer Area End ##### -->

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
   showLoadingPage(); // 로딩 화면을 보여줍니다.
 
   setTimeout(function() {
     var surveyData = {
    	selectedRadio : document.querySelector('input[name="areaChk"]:checked'),

       selectedCategories: selectedCategories,
       recommendationCount: recommendationCount
     };
      console.log(surveyData); // 여기서 surveyData를 출력합니다.
      
     // 결과를 데이터베이스로 보냅니다.
     /*sendResultToDB(surveyData); */

     // 로딩이 끝났으므로 로딩 화면을 숨깁니다.
	     document.getElementById("loadingPage").classList.remove("active");

	     // 결과 페이지로 이동합니다.
	     window.location.href = 'Resultpage'; // 결과 페이지의 실제 경로로 대체해야 합니다.
   });  // 2초 후에 결과를 처리합니다.
 }
 
   function showLoadingPage() {
     document.getElementById("page" + currentPage).classList.remove("active");
     document.getElementById("loadingPage").classList.add("active");
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
   
   
   //플라스크용
   
/*       function finish() {
	    showLoadingPage();

	    var surveyData = {
	        	selectedRadio : document.querySelector('input[name="areaChk"]:checked'),

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
	} */
   
</script>

</body>

</html>