<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Join</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script src="/resources/js/authentication.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="/webjars/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
	<!-- JQuery -->
	<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
	<!-- popper.js -->
	<script src="/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
	<link href="/resources/css/login/login.css" rel="stylesheet">
	
</head>
<body>   
<form action="/callFindPwd" method="post" name="all">  
    <div class="login-form">
        <h2 class="text-center">Find Password</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" name="userId" placeholder="아이디" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="userMail" placeholder="이메일" required="required">
        </div>
        </div>
        <div class="form-group">      
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="confirmPassword(${message})">비밀번호 찾기</button>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="cancelPassword()">메인으로</button>
        </div>
	</div>
	</form>
</body>
</html>