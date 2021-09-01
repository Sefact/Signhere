<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="/resources/js/authentication.js"></script>
</head>
<body>
	<input type="text" name="userId" placeholder="아이디"/>
	<input type="button" value="Send" onClick="sendUserInfo()" />
</body>
</html>