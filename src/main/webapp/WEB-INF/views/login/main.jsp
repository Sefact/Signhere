<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignHere</title>
<link rel="stylesheet" href="css/index.css" />
<script src="/resources/js/document.js"></script>
</head>
<body>
	<div class="screen">
		<section id="section1">
			<nav>Top Nav Bar</nav>
		</section>
		<section class="mainScreen">
			<div class ="sideNavBar">
				<button onclick="waitApproval()">결재문 작성</button>
				<nav>
					<ol class="sideBarBtn">
						<li>내가보낸 결재</li>
						<li><a href="javascript:void(0);" onclick="writeApproval();">결제 대기함</a></li>
						<li>결재 진행함</li>
						<li>완료 문서함</li>
						<li>반려 문서함</li>
						<li>참조열람 문서함</li>
						<li>보류 문서함</li>
						<li>내가보낸 협조문</li>
						<li>공문 수신함</li>
						<li>개인 보관함</li>
						<li><a href="javascript:void(0);" onclick="setEntrust();">위임권 관리</a></li>
					</ol>
				</nav>
			</div>
			<div class="contents">
				Main Screen 사이드바가 있으면 여기에 화면 내용을 넣어주세요.
			</div>
		</section>		
	</div>
</body>
</html>