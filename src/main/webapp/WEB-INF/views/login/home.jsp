<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="/resources/js/authentication.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="/webjars/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
	<!-- Jquery Core JS -->
	<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap Core JS -->
	<script src="/webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Font-Awesome -->
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link href="/resources/css/login/login.css" rel="stylesheet">
	
</head>
<body>  
<div id="findMessage"> ${message}</div> 
    <div class="login-form">
        <h2 class="text-center">Login</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" name="userId" placeholder="Username" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="userPwd" placeholder="Password" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="sendUserInfo()">Sign in</button>
        </div>
        <p><a href="#">Lost your Password?</a></p>
        <p onClick="signUpPage()">Sign Up</p>
         <p onClick="findPwdPage()">Find Password</p>
	</div>
</body>
</html>