<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
   
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
		
			<div class="form-row">
				<div class="form-group col-md-8">
					<button type="button" class="btn btn-primary btn-block" id="">문서 종류 및 결재선 수정</button>
				</div>
				<div class="form-group col-md-4">
					<button type="button" class="btn btn-primary btn-block" onClick="saveDocFiles()" id="">문서 저장</button>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label>문서제목</label>
					<input type="text" class="form-control" id="" value="${sessionScope.docBean.dmTitle}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>문서번호</label>
					<input type="text" class="form-control" id="" value="${sessionScope.tempList[0].dmNum}" disabled/>
				</div>
				<div class="form-group col-md-6">
					<label>날짜</label>
					<input type="text" class="form-control" id="" value="${sessionScope.tempList[0].dmDate}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>작성자</label>
					<input type="text" class="form-control" id="" value="${sessionScope.docBean.dmWriter}" disabled/>
				</div>
				<div class="form-group col-md-4">
					<label>참조자</label>
					<!-- <input type="text" class="form-control" id="" value="${sessionScope.docBean.rfBean[0].rdId}" disabled/>  -->
					<select class="form-control">
						<option value="${sessionScope.docBean.rfBean[0].rdName}">${sessionScope.docBean.rfBean[0].rdName}</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label>문서종류</label>
					<input type="text" class="form-control" id="" placeholder="${sessionScope.docBean.dmCode}" disabled/>
				</div>
			</div>
			
			<div class="form-row" >
			<form name ="fileList" enctype="multipart/form-data" action="/upLoadDocFiles" method="post">
				<div class="form-group col-md-12">
					<input type="file"  name="file" id="upLoadedFile"  onChange="setThumbnail(event)" multiple="multiple" />				
				</div>
			</form>
			</div>
			<div class="form-row">
				<div id="image_container"></div>
			</div>			
			<div class="form-row">
				<div class="form-group col-md-4"> 
					<span>기안자:<c:out value="${sessionScope.userName}"></c:out></span>
					<span>부서:<c:out value="${sessionScope.dpName}"></c:out></span>
					<span>직급:<c:out value="${sessionScope.grName}"></c:out></span>
				</div>
				<c:forEach var = "aplList" items="${sessionScope.aplList}">
					<div class="form-group col-md-4">
						<span>결재자:<c:out value="${aplList.userName}"></c:out></span>
						<span>부서:<c:out value="${aplList.dpName }"></c:out></span>
						<span>직급:<c:out value="${aplList.grName }"></c:out></span>
					</div>
				</c:forEach>
			</div>
		
	</div>
	
	<!-- <canvas style="border: 1px solid black; width:200px; height:200px;" id="iputCanvas">
				</canvas>
				<button id="clear">지우기</button>
				<button id="confirm">확인</button> -->
				
	<!-- add Department modal -->
	<div id="apCommentModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">결제의견</h4>
          </div>
          <div class="modal-body">
         	<textarea name="acReason" rows="6" cols="40"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" onClick="showSignatureModal()" id="requestAddDepBtn" class="btn btn primary">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
<script src="/resources/js/document/myDraft.js"></script>  
<!-- 사인패드 library -->
</html>