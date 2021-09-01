<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가보낸결재</title>
<link rel="stylesheet" href="css/index.css" />
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
						<li>보류 문서함</a>></li>
						<li>내가보낸 협조문</li>
						<li>공문 수신함</li>
						<li>개인 보관함</li>
						<li>위임권 관리</li>
					</ol>
				</nav>
			</div>
			<div class="contents">
				<div class="searchBox">
					<div class="inputBox">
						<div>
							<label for="dmNum">문서번호</label>	
							<input type="text" name="dmNum"/>
							<label for="dmTitle">제목</label>
							<input type="text" name="dmTitle">
						</div>
						<button>검색</button>
					</div>
					<div>
						<label for="apCode">문서상태</label>
						<select name="apCode">
							<option>페이지 로드시 db에서받아옴</option>
						</select>
						<label for="dmCode">문서종류</label>
						<select name="dmCode">
							<option>페이지 로드시 db에서받아옴</option>
						</select>
						<label for="dmDateStart">START DATE</label>
						<input type="date" name="dmDateStart" />
						<label for="dmDateEnd">END DATE</label>
						<input type="date" name="dmDateEnd" />
					</div>
				</div>
				<hr>
				<div>
					검색결과 들어가는 칸입니다.
					<button>페이지 이동</button> 
				</div>
			</div>
		</section>		
	</div>
</body>
</html>