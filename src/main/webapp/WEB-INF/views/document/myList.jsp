<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignHere</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<h1>myList</h1>
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
			<div class="searchBox">
				<input type="text" id="documentNumber" class="box" name="" placeholder="문서번호를 입력해 주세요."/>
				<input type="text" id="documenttitle" class="box" name="" placeholder="문서제목을 입력해 주세요."/>
				<input type="text" id="documentWriter" class="box" name="" placeholder="작성자를 입력해 주세요."/>
				<input type="button" value="검색" class="button" name="" onClick="searchText()"/>
				<label for="documentStatus">문서상태</label>
				<select id="documentStatus" name="documentStatus" size="1">
					<option value="">문서상태</option>
					<option value="대기">대기</option>
					<option value="진행">진행</option>
					<option value="완료">완료</option>
					<option value="반려">반려</option>
					<option value="보류">보류</option>
				</select>
				<label for="documentType">문서종류</label>
				<select id="documentType" name="documentType" size="1">
					<option value="">문서종류</option>
					<option value="기안">기안</option>
					<option value="시행">시행</option>
				</select>
				<label for="startDate">StartDate</label>
				<input type="date" id="startDate" name="startDate" value="yyyy-mm-dd"/>
				<label for="endDate">EndDate</label>
				<input type="date" id="endDate" name="endDate" value="yyyy-mm-dd"/>			
				</div>
		</section>		
	</div>
</body>
</html>