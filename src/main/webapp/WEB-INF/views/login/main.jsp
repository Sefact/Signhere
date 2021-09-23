<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SignHere</title>
	
	<!-- Resources JS -->
	<script src="/resources/js/login/main.js"></script>
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
	<!-- websocket -->
	<script src="/resources/js/index.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<body>
	<!-- fix -->
	<jsp:include page="../utils/navigation.jsp" />
	<jsp:include page="../utils/chart.jsp" />
	<button id="notifySendBtn">웹소켓 테스트</button>
</body>
</html>