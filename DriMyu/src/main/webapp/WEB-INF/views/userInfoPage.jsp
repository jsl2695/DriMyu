<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
       <script>
       // URL에서 error 파라미터를 가져옴
       const urlParams = new URLSearchParams(window.location.search);
       const error = urlParams.get("error");
   
       // error 파라미터가 1인 경우에만 에러 메시지 표시
       if (error === "1") {
           // 에러 메시지를 errorMessage div에 표시
           document.getElementById("errorMessage").innerText = "로그인에 실패하였습니다.";
       }
   </script>
</head>
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
                    <form>
                        <!-- ID -->
                        <div class="form-group">
                            <label for="id">ID:</label>
                            <input type="text" class="form-control" id="id" value="${loginMember.id}" readonly>
                        </div>
                        
                        <!-- Name -->
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" value="${loginMember.name}" readonly>
                        </div>
                        
                        <!-- Email -->
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" value="${loginMember.email}" readonly>
                        </div>

                        <!-- Phone -->
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="text" class="form-control" id="phone" value="${loginMember.phone}" readonly>
                        </div>

                        <!-- Region -->
                        <div class="form-group">
                            <label for="region">Region:</label>
                            <input type="text" class="form-control" id="region" value="${loginMember.region}" readonly>
                        </div>

                        <!-- Gender -->
                        <div class="form-group">
                      <label for="gender">Gender:</label>
                      <input type="text" class="form-control" id="gender" value="${loginMember.gender}" readonly>
                  </div>

                        <!-- Birthdate -->
                        <div class="form-group">
                            <label for="birthdate">Birthdate:</label>
                            <input type="date" class="form-control" id="birthdate" value="${loginMember.birthdate}" readonly>
                        </div>

                        <!-- Title -->
                        <div class="form-group">
                            <label for="title">Favorite Work:</label>
                            <input type="text" class="form-control" id="title" value="${loginMember.title}" readonly>
                        </div>

                        <!-- SubCategory -->
                        <div class="form-group">
                            <label for="subCategory">Favorite Category:</label>
                            <input type="text" class="form-control" id="subCategory" value="${loginMember.keyWord}" readonly>
                        </div>
                    </form>
                    
                    <div class="text-right">
                        <a href="${cpath}/editUserInfoPage.do" class="btn btn-outline-primary">정보 수정</a>
                        <a href="${cpath}/logout.do" class="btn btn-outline-primary">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="tailCon.jsp" %>
</body>
</html>