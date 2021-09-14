<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<button type="button" id="approvalModify" class="btn btn-primary btn-block" >문서 종류 및 결재선 수정</button>
				</div>
				<div class="form-group col-md-4">
					<button type="button" class="btn btn-primary btn-block" id="">결재하기</button>
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
	
	<!-- modal -->
	<div id="modifyModal" role="dialog" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" class="close">&times;</button>
					<h4 class="modal-title">결재문</h4>
				</div>
				<div id="selMember" class="modal-body">
					<form>
						<div class="container-fluid">
							<div class="form-row">
								<div class="col-md-12">
									<label>Title</label>	
									<input type="text"class="form-control" name="modifyTitle" value="${sessionScope.docBean.dmTitle}"><br>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a onClick="">결재선(부서)</a>
									</label>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<select id="myModifyLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="mModifyLineSave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="mModifyLineDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="selMyModifyLine" name="selMyModifyLine" class="form-control" size="4">
										<c:forEach var="aplList" items="${sessionScope.aplMap}">
												<option value="<c:out value="${aplList.aplId}"></c:out>"><c:out value="${aplList.aplName}"></c:out></option>
										</c:forEach>
									</select>
								
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="modifyDPOnOff">결재선(타부서)</a>
									</label>
								</div>
							</div>
							<div class="form-row" id="modifyDepartment" style="display:none">
								<div class="form-group col-md-5">
									<select id="otherModifyLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="dpModifySave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="dpModifyDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="seldpModify" class="form-control" size="4">
										<c:forEach var="docList" items="${sessionScope.docMap}">
												<option value="<c:out value="${docList.aplId}"></c:out>"><c:out value="${docList.aplName}"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="rfModifyOnOff">참조자</a>
									</label>
								</div>
							</div>
							<div class="form-row" id="rfModifyForm" style="display:none">
								<div class="form-group col-md-5">
									<select id="rfModifyLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="rfModifySave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="rfModifyDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="selRfModifyLine" class="form-control" size="4">
										<c:forEach var="refList" items="${sessionScope.refMap}">
												<option value="<c:out value="${refList.rdId}"></c:out>"><c:out value="${refList.rdName}"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
								</div>
								<div class="form-group col-md-2">
									<label>기안</label>
									<input type="radio" name="dmCode" value="D"/>
								</div>
								<div class="form-group col-md-2">
									<label>시행</label>
									<input type="radio" name="dmCode" value="E"/>
								</div>
								<div class="form-group col-md-4">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<input type="button" id="modifyApproval" class="btn btn primary" value="Send"/>
					<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Load MyModifyModal -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#approvalModify').click(function() {
				var data = [{'apCheck': 'A', 'cmCode': ${sessionScope.cmCode}}];
				var json = JSON.stringify(data);
				var modalHtml = '';
				
				$.ajax({
					type: 'POST',
					url : '/writeDraft',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					var orgLength = Object.keys(data).length;

					$.each(data, function(index, value) {
						modalHtml += '<option value=' + value.userId + '>';
						modalHtml += value.userName;
						modalHtml += '</option>';
					});
					$('#myModifyLine').html(modalHtml);
					$('#modifyModal').modal('show');
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>
	
	<!-- Add MyModifyLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mModifyLineSave').click(function() {
			var myApCheck = $("#myModifyLine option:selected").text();
			var myApValue = $("#myModifyLine option:selected").val();
			var selMyAplHtml = '';
			selMyAplHtml += '<option value=' + myApValue + '>';
			selMyAplHtml += myApCheck;
			selMyAplHtml += '</option>';
			
			//selMyApprovalLine
			$('#selMyModifyLine').append(selMyAplHtml);
		})
	});
	</script>
	
	<!-- Remove MyModifyLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mModifyLineDel').click(function() {
			var selMyApCheck = $("#selMyModifyLine option:selected").val();

			$("#selMyModifyLine option[value="+ selMyApCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Show & Hide Other Department Modify Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#modifyDPOnOff').click(function() {
			var data = [{'apCheck': 'D', 'cmCode': ${sessionScope.cmCode}}];
			var json = JSON.stringify(data);
			var otherDPHtml = '';
			
			if($("#modifyDepartment").css("display") == "none"){
				$.ajax({
					type: 'POST',
					url : '/writeDraft',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					var orgLength = Object.keys(data).length;

					$.each(data, function(index, value) {
						otherDPHtml += '<option value=' + value.userId + '>';
						otherDPHtml += value.userName;
						otherDPHtml += '</option>';
					});
					$('#otherModifyLine').html(otherDPHtml);
				})
				.fail(function(data) {
					console.log("Fail");
				})
				
		        $('#modifyDepartment').show();  
		    } else {  
		        $('#modifyDepartment').hide();  
		    }
		})
	});
	</script>
	
	<!-- Add Department Modify Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#dpModifySave').click(function() {
			var otApCheck = $("#otherModifyLine option:selected").text();
			var otApValue = $("#otherModifyLine option:selected").val();
			var selOtAplHtml = '';
			selOtAplHtml += '<option value=' + otApValue + '>';
			selOtAplHtml += otApCheck;
			selOtAplHtml += '</option>';
			
			//selMyApprovalLine
			$('#seldpModify').append(selOtAplHtml);
		})
	});
	</script>
	
	<!-- Remove Department Modify Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#dpModifyDel').click(function() {
			var selOtApCheck = $("#seldpModify option:selected").val();

			$("#seldpModify option[value="+ selOtApCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Show & Hide Reference Modify -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfModifyOnOff').click(function() {
			var data = [{'apCheck': 'R', 'cmCode': ${sessionScope.cmCode}}];
			var json = JSON.stringify(data);
			var referenceHtml = '';
			
			if($("#rfModifyForm").css("display") == "none"){
				$.ajax({
					type: 'POST',
					url : '/writeDraft',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					var orgLength = Object.keys(data).length;

					$.each(data, function(index, value) {
						referenceHtml += '<option value=' + value.userId + '>';
						referenceHtml += value.userName;
						referenceHtml += '</option>';
					});
					$('#rfModifyLine').html(referenceHtml);
				})
				.fail(function(data) {
					console.log("Fail");
				})
				
		        $('#rfModifyForm').show();  
		    } else {  
		        $('#rfModifyForm').hide();  
		    }
		})
	});
	</script>
	
	<!-- Add Reference Modify -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfModifySave').click(function() {
			var referenceCheck = $("#rfModifyLine option:selected").text();
			var referenceValue = $("#rfModifyLine option:selected").val();
			var selOtAplHtml = '';
			selOtAplHtml += '<option value=' + referenceValue + '>';
			selOtAplHtml += referenceCheck;
			selOtAplHtml += '</option>';
			
			$('#selRfModifyLine').append(selOtAplHtml);
		})
	});
	</script>
	
	<!-- Remove Reference Modify -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfModifyDel').click(function() {
			var selRfCheck = $("#selRfModifyLine option:selected").val();

			$("#selRfModifyLine option[value="+ selRfCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Modify Draft -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#modifyApproval').click(function() {
			var modifyTitle = document.getElementsByName("modifyTitle")[0].value;
			
			var mAplSize = $("#selMyModifyLine option").length;
			var oAplSize = $("#seldpModify option").length;
			var rAplSize = $("#selRfModifyLine option").length;
			
			var pushApline = document.getElementById("selMyModifyLine");
			var pushOtApline = document.getElementById("seldpModify");
			var pushRfApline = document.getElementById("selRfModifyLine");
			
			var radioDmCode = $('input[name="dmCode"]:checked').val();
			
			var docBean = [];
			var aplBean = [];
			var rfBean = [];
			
			var rfInital = "";
			
			// Draft Writer Initalize & Push aplBean
			var aplInital = {'aplSeq':'1', 'aplId':'${sessionScope.userId}', 'aplName':'${sessionScope.userName}'};
			aplBean.push(aplInital);
			for(var i=0; i<mAplSize; i++) {
				aplInital = {'aplSeq':i+2, 'aplId':pushApline[i].value, 'aplName':pushApline[i].text};
				aplBean.push(aplInital);
			}
			
			// Department Approval Line Push aplBean
			for(var i=0; i<oAplSize; i++) {
				aplInital = {'aplSeq':mAplSize+2, 'aplId':pushOtApline[i].value, 'aplName':pushOtApline[i].text};
				aplBean.push(aplInital);
			}	
			
			// Reference Line Push
			for(var i=0; i<rAplSize; i++) {
				rfInital = {'rdId':pushRfApline[i].value, 'rdName':pushRfApline[i].text};
				rfBean.push(rfInital);
			}
			
			var docInital = {'dmCode':radioDmCode, 'dmTitle':modifyTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':mAplSize, 'dmNum':${sessionScope.tempList[0].dmNum}, aplBean, rfBean};
			docBean.push(docInital);
			
			var json = JSON.stringify(docBean);
			
			alert(json);
			
 			$.ajax({
				type: 'POST',
				url : '/modifyDraft',
				data : json,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				location.href = "/draftMove";
				
				console.log("Success");
			})
			.fail(function(data) {
				console.log("Fail");
			})
		});
	});
	</script>
</body>
</html>