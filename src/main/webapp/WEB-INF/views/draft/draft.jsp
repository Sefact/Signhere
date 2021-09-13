<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Draft</title>
	
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
</head>
<body>
	<jsp:include page="../utils/navigation.jsp" />
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Approval</h1>
		<form id="entForm">
			<div class="form-row">
				<div class="form-group col-md-8">
					<button type="button" class="btn btn-primary btn-block" id="">문서 종류 및 결재선 수정</button>
				</div>
				<div class="form-group col-md-4">
					<button type="button" class="btn btn-primary btn-block" id="">결재하기</button>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<input type="text" class="form-control" id="" value="${sessionScope.docBean.dmTitle}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="" placeholder="문서번호" disabled/>
				</div>
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="" placeholder="날짜" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<input type="text" class="form-control" id="" placeholder="작성자" disabled/>
				</div>
				<div class="form-group col-md-4">
					<input type="text" class="form-control" id="" placeholder="참조자" disabled/>
				</div>
				<div class="form-group col-md-4">
					<input type="text" class="form-control" id="" placeholder="문서번호" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<input type="file" class="form-control-file" id="" value="Upload"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="4">
					
					</select>
				</div>
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="4">
					
					</select>
				</div>
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="4">
					
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<textarea id="" class="form-control" rows="4">
					
					</textarea>
				</div>
				<div class="form-group col-md-4">
					<textarea id="" class="form-control" rows="4">
					
					</textarea>
				</div>
				<div class="form-group col-md-4">
					<textarea id="" class="form-control" rows="4">
					
					</textarea>
				</div>
			</div>
		</form>
	</div>
</body>
</html>