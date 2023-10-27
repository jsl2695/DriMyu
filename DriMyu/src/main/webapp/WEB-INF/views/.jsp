<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
		// 함수호출
		boardList();
	});
  	// Ajax를 실행할 함수
	function boardList() {
		$.ajax({
			
			url : "${cpath}/board",
			type : "get",
			// data : 보내줄 데이터 없음 
			dataType : "json",
			//응답이 성공했을때 callBack()함수 호출하는데
			// Ajax안에서 함수를 실행할때는 ()를 적지 않는다!!!
			success : callBack,
			error : function () {
				alert("게시글 목록 통신 실패ㅠ_ㅠ");
			}
			
			
		});//Ajax끝
		
	}//boardList함수 끝
	
	// boardList의 Ajax통신이 완료되면(성공하면) 실행될 함수
	function callBack(data) {
		// data : Ajax 통신의 결과를 가지고 있음
		console.log(data);
	
	 	var bList = "<table class='table table-hover'>";
	 	bList += "<tr>";
	 	bList += "<td>번호</td>";
	 	bList += "<td>제목</td>";
	 	bList += "<td>작성자</td>";
	 	bList += "<td>작성일</td>";
	 	bList += "<td>조회수</td>";
	 	bList += "</tr>";
	 	
	 	// {idx: 6  title: "엔터가 있는 글", content:'안\r\n녕\r\n하\r\n세\r\n요'}
	 	// json에서 '엔터가 있는글' 꺼내오려먄 데이터 요소. title
	 	// $.each(데이터, 데이터를 처리할수 있는 함수);
	 	
	 	$.each(data, function(index, obj){
	 		//index는 요소의 몇번째인지, obj는 요소가 담김
	 		//obj.title ==> '엔터가 있는글'
	 		bList += "<tr>";
	 		bList += "<td>"+obj.idx+"</td>";
	 		// a 태그를 누르면 다른 자바 스크립트 함수로 이동
	 		// javascript: 함수이름
	 		bList += "<td><a href='javascript:cview("+ obj.idx +")'>"+obj.title+"</a></td>";
	 		bList += "<td>"+obj.writer+"</td>";
	 		bList += "<td>"+obj.indate+"</td>";
	 		bList += "<td id='count"+obj.idx+"'>"+obj.count+"</td>";
	 		bList += "</tr>";
	 		
	 		//게시글 내용
	 		bList += "<tr style='display:none' id='c"+obj.idx+"'>";
	 		bList += "<td>내용</td>";
	 		bList += "<td colspan='4'>";
	 		bList += "<textarea class='form-control' id='nc"+obj.idx+"' row='7'>"+obj.content+"</textarea>";
	 		// 작성자와 로그인한 사람의 Name 일치하면 수정/삭제 가능
	 		if("${loginMember.memName}" == obj.writer){
		 		bList += "<button class='btn btn-sm btn-success' onclick='goUpdate("+obj.idx+")'>수정</button>&nbsp;"
		 		bList += "<button class='btn btn-sm btn-primary' onclick='goDel("+obj.idx+")'>삭제</button>&nbsp;"
	 		}else{
	 			bList += "<button disabled class='btn btn-sm btn-success' onclick='goUpdate("+obj.idx+")'>수정</button>&nbsp;"
		 		bList += "<button disabled class='btn btn-sm btn-primary' onclick='goDel("+obj.idx+")'>삭제</button>&nbsp;"
	 		}
	 		bList += "<button class='btn btn-sm btn-warning'>닫기</button>"
	 		bList += "</td>";
	 		bList += "</tr>";
	 	
	 	})//each 끝
	 	
		 	// 글쓰기 버튼
		 	bList += "<tr>";
		 	bList += "<td colspan='5'>";
		 	bList += "<button class='btn btn-sm btn-success' onclick='goForm()'>글쓰기</button>";
		 	bList += "</td>";
		 	bList += "</tr>";
		 	
		 	bList += "</table>";
		 	
		 	$("#list").html(bList);
		}// callBack 함수 끝
		
		// 게시글 제목을 누르면 게시글 내용이 나오도록
		function cview(idx) {
			// 제목을 클릭하면 보여주고 아니면 않보여주고 하는 css변경
			// 기본상태에서는 none으로 되어있는 css 변경
			// $("#c"+idx).css('display') --> display속성을 가져옴 
			// $("#c"+idx).css('display','none') --> 해당 선택자의 display속성을 none 설정 
			if($("#c"+idx).css('display')=='none'){
				// 게시글 내용을 보여줄때 조회수를 +1씩 증가시키는 요청
				$.ajax({
					url : "${cpath}/updateCount/"+idx,// PathVariable
					type : "get",
					dataType : "", //보내줄 idx는 요청에 같이 보낼 예정
					success : function (vo) {
						// 조회수 증가 통신이 성공하면 
						// 조회수 text를 +1 씩 올려주거나
						// 아니면 데이터베이스에 갱신된 조회수를 다시 불러와야함
						console.log(vo.count);
						$("#count"+idx).text(vo.count);
					},
					error : function () {
						alert("조회수 갱신 실패...");
					}
					
				})//조회수 ajax끝
				$("#c"+idx).css('display','table-row');
			}else {
				$("#c"+idx).css('display','none')
			}
	
		}//cview 함수 끝
		
		// 글쓰기 버튼을 누르면 게시글 목록은 없어지고, 글쓰기 폼은 보여주고
		function goForm() {
			// 게시글 목록 div의 아이디는 list
			// 글쓰기 폼 div의 아이디는 wform
			$("#list").css("display","none");
			$("#wform").css("display","block");
		}
		
		// 글쓰기 폼에서 등록버튼을 누르면 
		// form태그에 담긴 데이터는 js코드로 가져오고
		// 글쓰기 폼은 없어지고, 게시글 목록이 보여지도록
		function insertFn(){
			
			// title, content, writer 다 가지고 오려면 반복반복... 한꺼번에 하고 싶음.
			// form 태그에 담겨있는 내용을 가져온다.
			var fData = $("#frm").serialize();//직렬화
			console.log(fData);
			$.ajax({
				url : "${cpath}/board",
				type : "post",
				data : fData,
				//dataType : 받아올데이터 없음
				// 글쓰고 나면 새로 데이터 베이스에서 게시글 목록 가져오는 일
				success : boardList,
				error:function(){
					alert("글쓰기 통신 실패 ㅠㅠ");
				}
			})//ajax끝
			
			$("#list").css("display","block");
			$("#wform").css("display","none");
			
			// 글쓰기 등록을 하고 나면 아직도 input태그들에 내용이 남아있음
			// 글 리셋
			// trger("click") 클릭을 강제로 실행하는 함수
			$("#reset").trigger("click");
			
		}// insertFn 함수 끝
		
		function goDel(idx) {
			$.ajax({
				
				url : "${cpath}/board/"+idx, //PathVariable로 넘김
				type : "delete",
				//data : {"idx" : idx}, 으로 넘기면 idx=5 식으로 넘어감
				success : boardList, 
				error : function () {
					alert("글삭제 실패ㅠ_ㅠ")
				}
					
			});
			
		}//goDel함수 끝
		
		function goUpdate(idx) {
			//글의 내용만 받아와서 수정
		var newContent = $("#nc"+idx).val();
		console.log(newContent);
		
		$.ajax({
			
			url : "${cpath}/board",
			type : "put",
			contentType : "application/json;charset=utf-8",
			// js에서 json으로 형변환 함수 JSON.Stringify(데이터);
			data : JSON.stringify({"idx" : idx, "content" : newContent}),
			success : boardList,
			error : function () {
				alert("글쓰기 수정 실패...");
			}
		})
			
		}//goUpdate 함수 끝
		
		
	  </script>
  
</head>
<body>
  
<div class="container">
  <h2>재미...있는 스프링시간</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
		<c:choose>
			<c:when test="${empty loginMember}">
				 <form class="form-inline" action="${cpath}/login.do" method="post">
				    <div class="form-group">
				      <label for="memId">아이디:</label>
				      <input type="text" class="form-control" id="memId" placeholder="아이디 좀..." name="memId">
				    </div>
				    <div class="form-group">
				      <label for="memPw">비밀번호:</label>
				      <input type="password" class="form-control" id="memPw" placeholder="비밀번호도..." name="memPw">
				    </div>
				    
				    <button type="submit" class="btn btn-default">로그인</button>
				  </form>
			</c:when>
			<c:otherwise>
				<div class="form-group">
					<label>${loginMember.memName}님 환영합니다.</label>
					<a href="${cpath}/logout.do">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
    <div class="panel-body" id="list" style="display:block">Panel Content</div>
    
    <div class="panel-body" id="wform" style="display:none">
    	<form class="form-horizontal" id="frm">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="title">제목:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="content">내용:</label>
		    <div class="col-sm-10">
		      <textarea id="content" name="content" class="form-control" rows="10" ></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="writer" name="writer" 
		      			readonly="readonly" value="${loginMember.memName}">
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    <!-- form 태그가 action으로 이동하지 못하게 type을 button으로 수정 -->
		      <button type="button" class="btn btn-default" onclick="insertFn()">등록</button>
		      <button type="reset" class="btn btn-default" id="reset">취소</button>
		    </div>
		  </div>
		</form>
    </div>
    <div class="panel-footer">ps.이재승</div>
  </div>
</div>

</body>
</html>