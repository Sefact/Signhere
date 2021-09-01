<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서보여주기페이지</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="screen">
		<section id="section1">
			<nav>Top Nav Bar</nav>
		</section>
		<section class="mainScreen">
			<div class ="sideNavBar">
				<button>결재문 작성</button>
				<nav>
					<ol class="sideBarBtn">
						<li>내가보낸 결재</li>
						<li>결재 대기함</li>
						<li>결재 진행함</li>
						<li>완료 문서함</li>
						<li>반려 문서함</li>
						<li>참조열람 문서함</li>
						<li>보류 문서함</li>
						<li>내가보낸 협조문</li>
						<li>공문 수신함</li>
						<li>개인 보관함</li>
						<li>위임권 관리</li>
					</ol>
				</nav>
			</div>
			<div class="contents">
				<div id="decisionBtn">
					<button>반려</button>
					<button>결재</button>
					<button>보류</button>
				</div>
				<hr>
				<div id="dmFileSection">
					문서파일이 보이는 칸입니다
				</div>
			</div>
		</section>		
	</div>
</body>
</html>