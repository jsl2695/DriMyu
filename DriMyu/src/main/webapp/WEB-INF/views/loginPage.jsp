<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style type="text/css">
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
		.form-group{margin: 10px;
					padding: 7px}
		
		
			    
	
    </style>
</head>
<body>

<%@ include file="topCon.jsp" %>
<div class="bradcumbContent page-header-box">
            <p>Share Your Thoughts Freely</p>
            <h2>로 그 인 </h2>
        </div>

<section class="fs_snb_contents">
	<div class="blog-area section-padding-100">
	<div class="row">
		<div class="container mt-5">
		    <div class="row justify-content-center">
		        <div class="col-md-6">
		            <div class="card">
		                <div class="card-body">
		                    <form action="${cpath}/login.do" method="post">
		                        <div class="form-group">
		                            <label for="memId"style="font-size: 32px">ID:</label>
		                            <input type="text"style="font-size: 24px" class="form-control" id="memId" placeholder="ID를 입력해주세요" name="id">
		                        </div>
		                        <div class="form-group">
		                            <label for="memPw" style="font-size: 32px">PW:</label>
		                            <input type="password" style="font-size: 24px"class="form-control" id="memPw" placeholder="PW를 입력해주세요" name="pw">
		                        </div>
		                        <div class="text-right">
		                        	<button type="submit" class="btn btn-outline-primary">로그인</button>
							    	<a href="${cpath}/join"class="btn btn-outline-primary">회원가입</a>
								</div> 
							</form>                   
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
	</div>
</section>
<%@ include file="tailCon.jsp" %>
</body>
</html>