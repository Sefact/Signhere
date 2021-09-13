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
        <h2 class="text-center">Sign Here</h2>   
        <div class="form-group has-error">
        	<input type="text" class="form-control" name="cmCode" placeholder="회사코드:사업자번호 10자리 (하이픈제외)" required="required" onBlur="dupCmCodeCheckblur()">
        </div>
        	<input id="dupBtnCmCode" type="button" value="중복체크" onClick="dupCmCodeCheck()" />
        	<div id="dupBtnCmCode2"></div>
		<div class="form-group">
            <input type="text" class="form-control" name="cmName" placeholder="회사이름" required="required">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="userId" placeholder="아이디" required="required" onBlur="dupUserIdCheckBlur()">
            <div id="conditionId">ID는 영소문자로 시작하여 12자 이하여야 합니다.</div>
            <input id= "dupBtnUserId" type="button" value="중복체크" onClick="dupUserIdCheck()" />
            <div id="dupBtnUserId2"></div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="userName" placeholder="이름" onBlur="nameCheck(this)">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="userPwd" placeholder="비밀번호"  onBlur="pwdValidate(this)">
        </div>
       <div id="pwdMsg"></div>
        <div class="form-group">
            <input type="password" class="form-control" name="userPwd2" placeholder="비밀번호 확인" onBlur="pwdConfirm()">
        </div>
         <div id="pwdMsg2"></div>
        <div class="form-group">
            <input type="text" class="form-control" name="userMail" placeholder="이메일" required="required">
        </div>       
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="requestSignUp()">확인</button>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="sendUserInfo()">취소</button>
        </div>
	</div>
</body>
</html>