<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>New Member Info</title>
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
    <div class="login-form">
        <h2 class="text-center">Sign Here</h2>   
        <h2 class="text-center">초기설정</h2>   
       
  
		<div class="form-group">
            <input type="text" class="form-control" name="cmName" placeholder="회사이름" value="${sessionScope.cmName}" disabled>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="userName" placeholder="이름" value="${sessionScope.userName}"disabled>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="dpName" placeholder="부서" value ="${sessionScope.dpName}" disabled>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="grName" placeholder="직급" value ="${sessionScope.grName}"  disabled>
        </div>
            <div class="form-group">
            <input type="text" class="form-control" name="userMail" placeholder="이메일" onBlur="mailValidate()" > 
             <input id="dupBtnMail" type="button" value="중복체크" onClick="dupUserMailCheck()" />
             <div id="dupBtnUserMail2"></div>
        </div> 
        <div class="form-group">
            <input type="password" class="form-control" name="userPwd" placeholder="비밀번호" onBlur="pwdValidate(this)" >
        </div>
         <div id="pwdMsg"></div>
                <div class="form-group">
            <input type="password" class="form-control" name="userPwd2" placeholder="비밀번호확인" onBlur="pwdConfirm()">
        </div> 
        <div id="pwdMsg2"></div>       
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="requestNewInfo()">확인</button>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block" onClick="cancelNewInfo()">취소</button>
        </div>
        
        
         <button type="submit" class="btn btn-primary btn-deafult btn-block" onClick="logOut()" value="로그아웃">Logout</button>
	</div>
</body>
</html>