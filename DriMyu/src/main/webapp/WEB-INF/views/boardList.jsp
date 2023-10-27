<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>자 유  게 시 판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
  
  <script type="text/javascript">
     // 지금 실행되는 html문서가 실행이 되면 바로 돌아가도록
     // (현재 부트스트랩 덕분에 제이쿼리 사용 가능한 상태)
     // function(){} 과 같은 표현 ()=>{} 람다식, 함수형 프로그래밍
     $(document).ready(function(){
        // 함수 호출
        boardList();
     });
     
     // ajax를 실행할 함수 정의
     function boardList() {
      $.ajax({
         url : "${cpath}/board",
         type : "get",
         // data : 보내줄 데이터 없음
         dataType : "json",
         // 응답이 성공했을때 callBack()함수 호출하는데
         // ajax안에서 함수 실행할때는 ()를 적지않는다!!!
         success : callBack,
         error : function() {
            alert("게시글 목록 통신 실패")
         }
      }); // ajax 끝
        
   } // boardList함수 끝
   
   // boardList의 ajax 통신이 완료되면(성공하면) 실행될 함수
   function callBack(data){
      // data : ajax통신의 결과를 가지고 있음
      console.log(data);
   
      var bList = "<table class='table table-hover'>";
      bList += "<tr>"
         bList += "<td>번호</td>"
         bList += "<td>제목</td>"
         bList += "<td>작성자</td>"
         bList += "<td>작성일</td>"
         bList += "<td>조회수</td>"
         
      bList += "</tr>"
      
      // {idx: 6, title: '엔터가 있는 글', content: '안\r\n녕\r\n하\r\n세\r\n요'}
      // json에서 '엔터가 있는 글' 꺼내오려면 데이터 요소.title
      // $.each(데이터, 데이터를 처리할수 있는 함수);
      $.each(data, function(boardIdx, obj) {
         // index는 요소의 몇번째인지, obj는 요소가 담김
         // obj.title ==> '엔터가 있는 글'
         bList += "<tr>";
         bList += "<td>"+obj.boardIdx+"</td>";
         // a태그를 누르면 다른 자바스크립트 함수로 이동
         // javascript:함수이름
         bList += "<td><a href='javascript:cview("+ obj.boardIdx +")'>"+obj.boardTitle+"</a></td>";
         bList += "<td>"+obj.id+"</td>";
         bList += "<td>"+obj.created+"</td>";
         bList += "<td id='count"+ obj.boardIdx +"'>"+obj.views+"</td>";
         bList += "</tr>";
         
         // 게시글 내용
         bList += "<tr style='display:none' id='c"+ obj.boardIdx +"'>";
         bList += "<td>내용</td>";
         bList += "<td colspan='4'>";
         bList += "<text class='form-control' id='nc"+ obj.boardIdx +"' row='7'>"+obj.boardContent+"</text>";
         // 작성자와 로그인한 사람의 Name 일치하면 수정/삭제 가능
         if("${loginMember.id}" == obj.id){
             bList += "<button class='btn btn-outline-primary' onclick='goUpdate("+ obj.boardIdx +")'>수정</button>&nbsp;"
             bList += "<button class='btn btn-outline-primary' onclick='goDel("+ obj.boardIdx +")'>삭제</button>&nbsp;"
         }
         bList += "<button class='btn btn-outline-primary' onclick='closeView("+ obj.boardIdx +")'>닫기</button>"
         bList += "</td>";
         bList += "<tr>";

         // 게시글 수정 폼 (초기에는 숨김)
          bList += "<tr style='display:none' id='update-form" + obj.boardIdx + "'>";
          bList += "<td>수정</td>";
          bList += "<td colspan='4' class='update-form'>";
          bList += "<input class='form-control' id='title"+ obj.boardIdx +"' value='"+obj.boardTitle+"'>";
          bList += "<textarea class='form-control' id='content" + obj.boardIdx + "' rows='7'>"+obj.boardContent+"</textarea>";
          bList += "<button class='btn btn-sm btn-success' onclick='updateBoard("+ obj.boardIdx +")'>저장</button>&nbsp;";
          bList += "<button class='btn btn-sm btn-danger' onclick='cancelUpdate(" + obj.boardIdx + ")'>취소</button>";
          bList += "</td>";
          bList += "</tr>";
         
      }); // each끝
      
      // 글쓰기 버튼
      bList += "<tr>";
         bList += "<td colspan='5'>";
         bList += "<button class='btn btn-outline-primary' onclick='goForm()'>글쓰기</button>";
         bList += "</td>";
      bList += "</tr>";
      bList += "</table>";      
      $("#list").html(bList);
   } // callBack 함수 끝
     
   function cview(boardIdx) {
       // 제목을 클릭하면 보여주고 아니면 안보여주고 하는 CSS 변경
       if ($("#c" + boardIdx).css('display') == 'none') {
           // 게시글 내용을 보여줄 때 조회수를 +1씩 증가시키는 요청
           $.ajax({
               url: "${cpath}/updateCount/" + boardIdx, // PathVariable
               type: "get",
               dataType: "", // 보내줄 idx는 요청에 같이 보낼 예정
               success: function (vo) {
                   // 조회수 증가 통신이 성공하면
                   // 조회수 text를 +1씩 올려주거나
                   // 아니면 데이터베이스에 갱신된 조회수를 다시 불러와야 함.
                   console.log(vo);
                   $("#count" + boardIdx).text(vo.views);
               },
               error: function () {
                   alert("조회수 갱신 통신 실패");
               }
           }); // 조회수 Ajax 끝
           $("#c" + boardIdx).css('display', 'table-row');
       } else {
           $("#c" + boardIdx).css('display', 'none')
       }
   }

   // 게시글 내용을 닫을 때 호출되는 함수
   function closeView(boardIdx) {
       // 해당 게시글 내용 숨기기
       $("#c" + boardIdx).css('display', 'none');
   }
   
   
   // 글쓰기 버튼을 누르면 게시글 목록은 없어지고, 글쓰기 폼은 보여주고
   function goForm(){
      // 게시글 목록 div의 아이디는 list
      // 글쓰기 폼 div의 아이디는 wform
      $("#list").css("display", "none");
      $("#wform").css("display", "block");      
   }
   
   
   // 글쓰기 폼에서 등록버튼을 누르면
   // form태그에 담긴 데이터는 js코드로 가져오고
   // 글쓰기 폼은 없어지고, 게시글 목록이 보여지도록
   function insertFn(){
      // title, content, writer 다 가져오려면 반복반복...한꺼번에 하고싶음
      // form태그에 담겨있는 내용을 가져온다.
      var fData = $("#frm").serialize(); // 직렬화
      console.log(fData);
      $.ajax({
         url : "${cpath}/board",
         type : "post",
         data : fData,
         // dataType : 받아올 데이터 없음
         // 글쓰고 나면 새로 데이터베이스에서 게시글 목록 가져오는 일
         success : boardList,
         error:function(){
            alert("글쓰기 통신 실패")
         }
         
      }); // ajax끝
      $("#list").css("display", "block");
      $("#wform").css("display", "none");
      
      // 글쓰기 등록을 하고 나면 아직도 input 태그들에 내용이 남아있음
      // 글 리셋
      // .trigger("click") 클릭을 강제로 실행하는 함수
      $("#reset").trigger("click");
   } // insertFn 함수 끝
   
   
   function goDel(boardIdx){
      $.ajax({
         url : "${cpath}/board/"+boardIdx, // PathVariable로 넘김
         type : "delete",
         // data : {"idx" : idx}, 으로 넘기면 idx=5 식으로 넘어감
         success : boardList,
         error : function(){
            alert("글쓰기 통신 실패")
         }
      });
   } // goDel 함수 끝
   
   // 글의 내용만 받아와서 수정
   function goUpdate(boardIdx) {
       // 게시글 내용 폼을 숨기고 수정 폼을 표시
       $("#c" + boardIdx).css('display', 'none');
       $("#update-form" + boardIdx).css('display', 'table-row');
   } // goUpdate 함수 끝
   
   function updateBoard(boardIdx) {
       var newTitle = $("#title" + boardIdx).val();
       var newContent = $("#content" + boardIdx).val();

       // AJAX를 사용하여 수정된 내용을 서버에 전송
       $.ajax({
           url: "${cpath}/board",
           type: "put",
           contentType: "application/json;charset=utf-8",
           data: JSON.stringify({ "boardIdx": boardIdx, "boardTitle": newTitle, "boardContent": newContent }),
           success: function () {
               // 수정 폼 숨기기
               $("#update-form" + boardIdx).css('display', 'none');

               // 수정된 내용을 게시글 내용에 업데이트
               $("#nc" + boardIdx).text(newContent);

               // 수정된 내용을 게시글 목록에 업데이트
               $("#title" + boardIdx).text(newTitle);

               // 게시글 수정 완료 후, 최신 게시글 목록을 다시 불러오는 함수 호출
               boardList();
           },
           error: function () {
               alert("글 수정 통신 실패");
           }
       });
   }
   
   function cancelUpdate(boardIdx) {
       // 수정 폼 숨기고 게시글 내용 폼을 표시
       $("#update-form" + boardIdx).css('display', 'none');
       $("#c" + boardIdx).css('display', 'table-row');
   }
   
   function cancelFn() {
       // 글쓰기 폼 숨기기
       $("#wform").css("display", "none");
       
       // 글쓰기 목록 보여주기
       $("#list").css("display", "block");
       
       // 입력 폼 초기화 (입력한 내용 초기화)
       $("#frm")[0].reset();
   }

  </script>

  
</head>
<body>
<%@ include file="topCon.jsp" %>
 
<div class="bradcumbContent page-header-box">
            <p>Share Your Thoughts Freely</p>
            <h2>자 유  게 시 판</h2>
        </div>
<section class="events-area section-padding-100">
   <div class="container">
     <div class="panel panel-default">
       <div class="panel-heading">
         <input type="text" id="searchKeyword" placeholder="제목 검색">
           <button onclick="searchBoard()">검색</button>
           <div id="pagination"></div>
      </div>
       <div class="panel-body" id="list" style="display:block">Panel Content</div>
       
       <div class="panel-body" id="wform" style="display:none">
          <form class="form-horizontal" id="frm">
           <div class="form-group">
             <label class="control-label col-sm-2" for="boardTitle">제목:</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
             </div>
           </div>
           <div class="form-group">
             <label class="control-label col-sm-2" for="boardContent">내용:</label>
             <div class="col-sm-10">
               <textarea id="boardContent" name="boardContent" class="form-control" rows="12" ></textarea>
             </div>
           </div>
           <div class="form-group">
             <label class="control-label col-sm-2" for="id">작성자:</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="writer" name="id" 
                        readonly="readonly" value="${loginMember.id}">
             </div>
           </div>
          
           <div class="form-group">
             <div class="col-sm-offset-2 col-sm-10">
             <!-- form 태그가 action으로 이동하지 못하게 type을 button으로 수정 -->
               <button type="button" class="btn btn-outline-primary" onclick="insertFn()">글쓰기</button>
               <button type="reset" class="btn btn-outline-primary" id="reset" onclick="cancelFn()">취소</button>
             </div>
           </div>
         </form>
       </div>
       <div class="panel-footer">by.드리뮤</div>
     </div>
   </div>
</section>
<%@ include file="tailCon.jsp" %>
</body>
</html>