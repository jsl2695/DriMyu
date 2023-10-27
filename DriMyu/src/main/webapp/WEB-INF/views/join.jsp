<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${cpath}resources/css/index.css">
  <script type="text/javascript"></script>
  <style type="text/css"> 
  .form-group{font-style: 22px;}
  .btn1235{display: inline-block;
			    margin : 7px;
			    font-weight: 400;
			    text-align: center;
			    white-space: nowrap;
			    vertical-align: middle;
			    -ms-touch-action: manipulation;
			    touch-action: manipulation;
			    cursor: pointer;
			    background-image: none;
			    border: 1px solid transparent;
			    padding: 6px 12px;
			    font-size: 14px;
			    line-height: 1.42857143;
			    border-radius: 4px;
			    -webkit-user-select: none;
			    -moz-user-select: none;
			    -ms-user-select: none;
			    user-select: none;
			    }
  </style>
  
</head>
<body>
<%@ include file="topCon.jsp" %>
<div class="bradcumbContent page-header-box">
            <p>Share Your Thoughts Freely</p>
            <h2>회원 가입</h2>
        </div>
<section class="fs_snb_contents">
    <div class="blog-area section-padding-100">
        <div id="contents" class="type1">
   <div class="user_input" >
       <div class="box"style="display: flex; justify-content: center; width: 800px;">
        <form action="${cpath}/register.do" method="post">
            <!-- 아이디 -->
            <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" class="form-control" id="id" name="id" required>
            </div>
            
            <!-- 비밀번호 -->
            <div class="form-group">
                <label for="pw">비밀번호:</label>
                <input type="password" class="form-control" id="pw" name="pw" required>
            </div>
            
            <!-- 이름 -->
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <!-- 전화번호 -->
            <div class="form-group">
                <label for="phone">전화번호:</label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <!-- 지역 -->
            <div class="form-group">
                <label>지역:</label>
                <input type="radio" name="region" value="남아메리카" required> 남아메리카
                <input type="radio" name="region" value="북아메리카" required> 북아메리카
                <input type="radio" name="region" value="아시아" required> 아시아
                <input type="radio" name="region" value="아프리카" required> 아프리카
                <input type="radio" name="region" value="오세아니아" required> 오세아니아
                <input type="radio" name="region" value="유럽" required> 유럽
                <input type="radio" name="region" value="중동" required> 중동
            </div>
            
            <!-- 성별 -->
            <div class="form-group">
                <label>성별:</label>
                <input type="radio" name="gender" value="M" required> 남자
                <input type="radio" name="gender" value="F" required> 여자
            </div>
            
            <!-- 생년월일 -->
            <div class="form-group">
                <label for="birthdate">생년월일:</label>
                <input type="date" class="form-control" id="birthdate" name="birthdate" required>
            </div>

            <!-- 선호작품 -->
            <div class="form-group">
                <label for="title">선호작품:</label>
                <input type="text" class="form-control" id="title" name="title">
            </div>

            <!-- 선호카테고리 -->
            <div class="form-group">
                <label for="subCategory">선호카테고리:</label>
                <input type="text" class="form-control" id="subCategory" name="subCategory">
            </div>

            <!-- 등록 버튼 -->
            <button type="submit" class="btn btn-outline-primary">회원가입</button>
        </form>
   </div>
   </div>
</div>
</div>    
</section>
<%@ include file="tailCon.jsp" %>
</body>
</html>
