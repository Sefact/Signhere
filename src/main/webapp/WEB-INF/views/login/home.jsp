<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<script src="/resources/js/authentication.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="/webjars/bootstrap/5.1.0/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<input type="text" name="userId" placeholder="아이디"/>
	<input type="text" name="userPwd" placeholder="비밀번호"/>
	<input type="button" value="Send" onClick="sendUserInfo()" />
	<table class="table table-hover">
		<thead class="thead-dark">
		<tr>
			<th>Sample</th>
		</tr>
	</table>
</body>
</html>