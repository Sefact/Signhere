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

    <div class="login-form">
        <h2 class="text-center">Change Password</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" name="userId" placeholder="아이디" required="required">
        </div>
            <div class="form-group">
            <input type="password" class="form-control" name="userPwd" placeholder="비밀번호"  onBlur="pwdValidate(this)">
        </div>
       <div id="pwdMsg"></div>
        <div class="form-group">
            <input type="password" class="form-control" name="userPwd2" placeholder="비밀번호 확인" onBlur="pwdConfirm()">
        </div>
         <div id="pwdMsg2"></div>
        </div>      
        <div class="form-group">      
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="reConfirmPassword()">비밀번호 변경</button>
           
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="cancelPassword()">메인으로</button>
        </div>
	</div>

</body>
</html>