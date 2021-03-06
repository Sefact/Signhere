<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Reference Approval</title>
	
	<!-- Resources JS -->
	<script src="/resources/js/login/main.js"></script>
	<script src="/resources/js/document/searchAndList.js"></script>
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
</head>
<body>
	<jsp:include page="../utils/navigation.jsp" />
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<h1 class="page-header">참조문서함</h1>

	<form>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서번호</label>
			</div>
			<div class="form-group col-md-11">
				 <input type="text" class="form-control" name="dmNum" placeholder="문서번호">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">제목</label>
			</div>
			<div class="form-group col-md-11">
				 <input type="text" class="form-control" id="dmTitle" name="dmTitle" placeholder="제목">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서상태</label>
			</div>
			<div class="form-group col-md-5">
				<select name="apCode" id ="apCode"
					class="form-control">
					<option>선택</option>
					<option value="P">진행</option>
					<option value="C">완료</option>
					<option value="R">반려</option>
					<option value="D">보류</option>
					<option value="F">회수</option>
				</select>
			</div>
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서종류</label>
			</div>
			<div class="form-group col-md-5">
				<select name="dmCode" id="dmCode"
					class="form-control">
					<option>선택</option>
					<option value="D">기안</option>
					<option value="E">시행</option>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">날짜</label>
			</div>
			<div class="form-group col-md-5">
				<input type="date" class="form-control" name="dmDate"/>
			</div>
			<div class="form-group col-md-5">
				<input type="date" class="form-control" name="dmDate"/>
			</div>
			<div class="form-group col-md-1">
				<input type="button" class="btn btn-primary" value="Search" onClick="searchText('','RF')"/>
			</div>
		</div>
		
	</form>
	

		<h2 class="sub-header">문서 목록</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>문서종류</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody id ="docListBody">
			<c:forEach var="docList" items="${docList}">
				<tr>
					<td><a href="/documentBox?dmNumCheck=${docList.dmNum}" ><c:out value="${docList.dmNum }"/></a></td>
					<td><a href="/documentBox?dmNumCheck=${docList.dmNum}" ><c:out value="${docList.dmTitle }"/></a></td>
					<td><c:out value="${docList.dmCode }"/></td>				
					<td><c:out value="${docList.dmWriter }"/></td>
					<td><c:out value="${docList.dmDate }"/></td>
				</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<ul class="btn-group pagination">
				    <c:if test="${pagination.prev }">
				    <li>
				        <a href='<c:url value="/apReferenceList?page=${pagination.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
				    </li>
				    </c:if>
				    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/apReferenceList?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pagination.next && pagination.endPage >0 }">
				    <li>
				        <a href='<c:url value="/apReferenceList?page=${pagination.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
				    </li>
				    </c:if>
		</ul>
	</div>
</body>
</html>