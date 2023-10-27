<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Lifelike 회원 정보 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${cpath}/resources/css/index.css">
</head>
<script>
$(document).ready(function() {
    // Form submit 이벤트 리스너
    $('form').on('submit', function(e) {
        e.preventDefault();  // 폼 기본 제출을 막습니다.

        $.ajax({
            url: $(this).attr('action'),  // /updateUserInfo.do
            type: 'post',
            data: $(this).serialize(),  // 폼 데이터 직렬화
            dataType: 'json',  // JSON 데이터를 받아옴
            success: function(response) {
                if (response.success) {  // 성공적으로 수정되었는지 확인
                    window.location.href = "${cpath}/userInfoPage.do";  // 회원 정보 페이지로 리다이렉션
                }
        });
    });
});

</script>
<body>
<%@ include file="topCon.jsp" %>
<div class="bradcumbContent page-header-box">
    <p>Share Your Thoughts Freely</p>
    <h2>회원 정보</h2>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
    
    <form action="${cpath}/updateUserInfo.do" method="post">
        <!-- 아이디 (readonly) -->
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" id="id" name="id" value="${loginMember.id}" readonly>
        </div>
        
        <!-- 비밀번호 -->
        <div class="form-group">
            <label for="pw">비밀번호:</label>
            <input type="password" class="form-control" id="pw" name="pw" value="${loginMember.pw}" required>
        </div>
        
        <!-- 이름 -->
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" class="form-control" id="name" name="name" value="${loginMember.name}" required>
        </div>
        
        <!-- 전화번호 -->
        <div class="form-group">
            <label for="phone">전화번호:</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${loginMember.phone}" required>
        </div>

        <!-- 이메일 -->
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="email" class="form-control" id="email" name="email" value="${loginMember.email}" required>
        </div>
         
        
        <!-- 지역 -->
        <div class="form-group">
            <label>지역:</label>
            <input type="radio" name="region" value="남아메리카" ${loginMember.region == '남아메리카' ? 'checked' : ''} required> 남아메리카
            <input type="radio" name="region" value="북아메리카" ${loginMember.region == '북아메리카' ? 'checked' : ''} required> 북아메리카
            <input type="radio" name="region" value="아시아" ${loginMember.region == '아시아' ? 'checked' : ''} required> 아시아
            <input type="radio" name="region" value="아프리카" ${loginMember.region == '아프리카' ? 'checked' : ''} required> 아프리카
            <input type="radio" name="region" value="오세아니아" ${loginMember.region == '오세아니아' ? 'checked' : ''} required> 오세아니아
            <input type="radio" name="region" value="유럽" ${loginMember.region == '유럽' ? 'checked' : ''} required> 유럽
            <input type="radio" name="region" value="중동" ${loginMember.region == '중동' ? 'checked' : ''} required> 중동
        </div>
        
        <div class="form-group">
            <label for="id">성별:</label>
            <input type="text" class="form-control" id="gender" name="gender" value="${loginMember.gender}" readonly>
        </div>
        <div class="form-group">
            <label for="id">생년월일:</label>
            <input type="date" class="form-control" id="birthdate" name="birthdate" value="${loginMember.birthdate}" readonly>
        </div>
        <!-- 선호작품 -->
        <div class="form-group">
            <label for="title">선호작품:</label>
            <input type="text" class="form-control" id="title" name="title" value="${loginMember.title}">
        </div>

        <!-- 선호카테고리 -->
        <div class="form-group">
            <label for="subCategory">선호카테고리:</label>
            <input type="text" class="form-control" id="subCategory" name="subCategory" value="${loginMember.keyWord}">
        </div>

        <!-- 수정 버튼 -->
      <div class="text-right">
      	<button type="submit" class="btn btn-outline-primary">수정</button>   
      
      <!-- 취소 버튼 -->
      	<a href="${cpath}/userInfoPage.do" class="btn btn-outline-primary">취소</a>
      </div>
    	</form>
    
</div>
</div>
</div>
</div>
</div>

<%@ include file="tailCon.jsp" %>
</body>
</html>