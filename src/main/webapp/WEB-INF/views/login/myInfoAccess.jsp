<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyInfoAccess</title>
	
	<!-- Resources JS -->
	<script src="/resources/js/login/main.js"></script>
	<script src="/resources/js/authentication.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="/webjars/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
	<!-- Jquery Core JS -->
	<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap Core JS -->
	<script src="/webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Font-Awesome -->
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Resources CSS -->
	<link href="/resources/css/login/main.css" rel="stylesheet">
</head>
<body>

<div class="form-group">

	<div class="message" style="text-align:center; font-size:30px; color:red;">${failMessage}</div>

       


		<input type="hidden" name="userId" value="${sessionScope.userId}">
            <input type="password" class="form-control" style="width: 30%; float:none; margin:0 auto" name="userPwd" placeholder="비밀번호">
        </div>
 
        
     
        <div class="form-group" style="text-align:center;">
            <button type="submit" class="btn btn-primary" onClick="myInfo()">내정보 수정 페이지</button>
		</div>


		

       
	
	
</body>
</html>