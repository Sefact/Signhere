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
	<!-- Signature Library -->
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.2/dist/signature_pad.min.js"></script>
</head>


<body>
	<jsp:include page="../utils/navigation.jsp" />
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Approval</h1>
		<form method="POST" enctype="multipart/form-data" id="approvalForm">
			<div class="form-row">
				<div class="form-group col-md-8">
					<button type="button" id="approvalModify" class="btn btn-primary btn-block" >문서 종류 및 결재선 수정</button>
				</div>
				<div class="form-group col-md-4">
					<button type="button" class="btn btn-primary btn-block" id="onAplModal">결재하기</button>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label>문서제목</label>
					<input type="text" class="form-control" id="dmTitle" value="${sessionScope.docBean.dmTitle}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>문서번호</label>
					<input type="text" class="form-control" id="dmNum" value="${sessionScope.tempList[0].dmNum}" disabled/>
				</div>
				<div class="form-group col-md-6">
					<label>날짜</label>
					<input type="text" class="form-control" id="dmDate" value="${sessionScope.tempList[0].dmDate}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>작성자</label>
					<input type="text" class="form-control" id="dmWriter" value="${sessionScope.docBean.dmWriter}" disabled/>
				</div>
				<div class="form-group col-md-4">
					<label>참조자</label>
					<!-- <input type="text" class="form-control" id="" value="${sessionScope.docBean.rfBean[0].rdId}" disabled/>  -->
					<select class="form-control">
						<c:forEach var="rfBean" items="${sessionScope.docBean.rfBean}">
							<option value="<c:out value="${rfBean.rdName}"></c:out>"><c:out value="${rfBean.rdName}"></c:out></option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-4">
					<label>문서종류</label>
					<input type="text" class="form-control" id="dmCode" value="${sessionScope.docBean.dmName}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<input type="file" class="form-control-file" name="docFile" id="docFile" value="Upload"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<img id="imgPreview" src="" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12" id="docUploadForm">
					<input type="button" id="docUpload" value="Submit" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label>결재자</label>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<select class="form-control" size="3">
						<option>부서: ${sessionScope.apDpMap[0].aplDpName}</option>
						<option>직급: ${sessionScope.apDpMap[0].aplGrade}</option>
						<option>이름: ${sessionScope.apDpMap[0].aplName}</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<select class="form-control" size="3">
						<option>부서: ${sessionScope.apDpMap[1].aplDpName}</option>
						<option>직급: ${sessionScope.apDpMap[1].aplGrade}</option>
						<option>이름: ${sessionScope.apDpMap[1].aplName}</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<select class="form-control" size="3">
						<option>부서: ${sessionScope.apDpMap[2].aplDpName}</option>
						<option>직급: ${sessionScope.apDpMap[2].aplGrade}</option>
						<option>이름: ${sessionScope.apDpMap[2].aplName}</option>
					</select>
				</div>
			</div>
			<!-- Signature Form -->
			<div class="form-row">
				<div class="form-group col-md-4">
					<div id="signature-pad" class="m-signature-pad">
				        <div class="m-signature-pad--body">
				            <canvas id="signature-canvas"></canvas>
				        </div>
				        <div class="m-signature-pad--footer" id="signUpClear">
				            <button type="button" id="signClear" class="btn btn-primary" data-action="clear">지우기</button>
				            <button type="button" id="signUpload" class="btn btn-primary" data-action="save">저장</button>
				        </div>
				    </div>
				</div>
				<div class="form-group col-md-4">
				</div>
				<div class="form-group col-md-4">
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
										<c:forEach var="ogAplList" items="${sessionScope.ogAplMap}">
												<option value="<c:out value="${ogAplList.aplId}"></c:out>"><c:out value="${ogAplList.aplName}"></c:out></option>
										</c:forEach>
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
							<!-- 결재선(타부서) 타이틀 -->
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="modifyDPOnOff">결재선(타부서)</a>
									</label>
								</div>
							</div>
							<!-- 결재선(타부서) -->
							<div class="form-row" id="modifyDepartment" style="display:none">
								<div class="form-group col-md-5">
									<select id="otherModifyLine" class="form-control" size="4">
										<c:forEach var="ogDpList" items="${sessionScope.ogDocMap}">
												<option value="<c:out value="${ogDpList.aplId}"></c:out>"><c:out value="${ogDpList.aplName}"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<!-- 결재선(타부서) 저장, 삭제 -->
								<div class="form-group col-md-2">
									<button type="button" id="dpModifySave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="dpModifyDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<!-- 결재선(타부서) 선택된 -->
								<div class="form-group col-md-5">
									<select id="seldpModify" class="form-control" size="4">
										<c:forEach var="docList" items="${sessionScope.docMap}">
												<option value="<c:out value="${docList.aplId}"></c:out>"><c:out value="${docList.aplName}"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<!-- 결재선(참조자) 타이틀 -->
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="rfModifyOnOff">참조자</a>
									</label>
								</div>
							</div>
							<!-- 결재선(참조자) -->
							<div class="form-row" id="rfModifyForm" style="display:none">
								<div class="form-group col-md-5">
									<select id="rfModifyLine" class="form-control" size="4">
										<c:forEach var="ogRfList" items="${sessionScope.ogRefMap}">
												<option value="<c:out value="${ogRfList.rdId}"></c:out>"><c:out value="${ogRfList.rdName}"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<!-- 참조자(저장, 삭제) -->
								<div class="form-group col-md-2">
									<button type="button" id="rfModifySave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="rfModifyDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<!-- 결재선 선택된(참조자) -->
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
									<label for="D">기안</label>
									<input type="radio" name="dmCode" value="D"/>
								</div>
								<div class="form-group col-md-2">
									<label for="E">시행</label>
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
	
	<!-- Approval Request Modal -->
	<div id="aplRequestModal" role="dialog" class="modal fade">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">&times;</button>
				<h4 class="modal-title">결재의견</h4>
			</div>
			<div class="modal-body">
			<form>
				<div class="form-group">
					<textarea class="form-control" id="commentTextArea" rows="3"></textarea>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="requestApproval" class="btn btn primary">Send</button>
				<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
			</div>
		</div>
		</div>
	</div>
	
	<!-- Load MyModifyModal -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#approvalModify').click(function() {
				$('#modifyModal').modal('show');
			})
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
			
			// #1 Modify Approval Append
			$('#selMyModifyLine').append(selMyAplHtml);
			
			// #2 Remove Modify Approval
			$("#myModifyLine option[value="+ myApValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove MyModifyLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mModifyLineDel').click(function() {
			var selMyApCheck = $("#selMyModifyLine option:selected").text();
			var selMyApValue = $("#selMyModifyLine option:selected").val();
			var selectedAp = '';
			selectedAp += '<option value=' + selMyApValue + '>';
			selectedAp += selMyApCheck;
			selectedAp += '</option>';
			
			// #1 Remove Selected Modify Approval 
			$("#selMyModifyLine option[value="+ selMyApValue +"]").remove();
			
			// #2 Append Selected Modify Approval
			$('#myModifyLine').append(selectedAp);
		})
	});
	</script>
	
	<!-- Show & Hide Other Department Modify Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#modifyDPOnOff').click(function() {
			var otMdData = [{'apCheck': 'D', 'cmCode': ${sessionScope.cmCode}}];
			var otMdLineLength = $('#otherModifyLine option').length;
			var otMdDataJson = JSON.stringify(otMdData);
			var otMdHtml = "";			
			
			if($("#modifyDepartment").css("display") == "none"){
				if(otMdLineLength > 0) {
					$('#modifyDepartment').show();
				} else {
					$.ajax({
						type: 'POST',
						url : '/writeDraft',
						data : otMdDataJson,
						contentType: "application/json;charset=UTF-8",
						dataType: 'json'
					})
					.done(function(data) {
						var orgLength = Object.keys(data).length;

						$.each(data, function(index, value) {
							otMdHtml += '<option value=' + value.userId + '>';
							otMdHtml += value.userName;
							otMdHtml += '</option>';
						});
						$('#otherModifyLine').html(otMdHtml);
					})
					.fail(function(data) {
						console.log("Fail");
					})
					
			        $('#modifyDepartment').show();
			    }
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
			
			// #1 Append Modify Department
			$('#seldpModify').append(selOtAplHtml);
			
			// #2 Remove Modify Department
			$("#otherModifyLine option[value="+ otApValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove Department Modify Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#dpModifyDel').click(function() {
			var selOtApValue = $("#seldpModify option:selected").val();
			var selOtApCheck = $("#seldpModify option:selected").text();
			var selectedDp = '';
			selectedDp += '<option value=' + selOtApValue + '>';
			selectedDp += selOtApCheck;
			selectedDp += '</option>';
			
			// #1 Remove Modify Dpeartment
			$("#seldpModify option[value="+ selOtApValue +"]").remove();
			
			// #1 Append Modify Department
			$('#otherModifyLine').append(selectedDp);
		})
	});
	</script>
	
	<!-- Show & Hide Reference Modify -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfModifyOnOff').click(function() {
			var rfMdData = [{'apCheck': 'R', 'cmCode': ${sessionScope.cmCode}}];
			var rfMdLineLength = $('#rfModifyLine option').length;
			var rfMdDataJson = JSON.stringify(rfMdData);
			var rfMdHtml = "";		
			
			if($("#rfModifyForm").css("display") == "none"){
				if(rfMdLineLength > 0) {
					$('#rfModifyForm').show();
				} else {
					$.ajax({
						type: 'POST',
						url : '/writeDraft',
						data : rfMdDataJson,
						contentType: "application/json;charset=UTF-8",
						dataType: 'json'
					})
					.done(function(data) {
						var orgLength = Object.keys(data).length;

						$.each(data, function(index, value) {
							rfMdHtml += '<option value=' + value.userId + '>';
							rfMdHtml += value.userName;
							rfMdHtml += '</option>';
						});
						$('#rfModifyLine').html(rfMdHtml);
					})
					.fail(function(data) {
						console.log("Fail");
					})
					
			        $('#rfModifyForm').show();
			    }
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
			var appendRfMd = '';
			appendRfMd += '<option value=' + referenceValue + '>';
			appendRfMd += referenceCheck;
			appendRfMd += '</option>';
			
			// #1 Append Modify Reference
			$('#selRfModifyLine').append(appendRfMd);
			
			// #2 Remove Modify Reference
			$("#rfModifyLine option[value="+ referenceValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove Reference Modify -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfModifyDel').click(function() {
			var selRfValue = $("#selRfModifyLine option:selected").val();
			var selRfCheck = $("#selRfModifyLine option:selected").text();
			
			var selectedRfMd = '';
			selectedRfMd += '<option value=' + selRfValue + '>';
			selectedRfMd += selRfCheck;
			selectedRfMd += '</option>';
			
			// #1 Remove Selected Modify Reference
			$("#selRfModifyLine option[value="+ selRfValue +"]").remove();
			
			// #2 Append Selected Modify Reference
			$('#rfModifyLine').append(selectedRfMd);
		})
	});
	</script>
	
	<!-- Modify Draft -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#modifyApproval').click(function() {
			var modifyTitle = document.getElementsByName("modifyTitle")[0].value;
			
			/* Origin Approval Info */
			var originApSize = $("#myModifyLine option").length;
			var originDpSize = $("#otherModifyLine option").length;
			var originRfSize = $("#rfModifyLine option").length;
			
			var pushOriginAp = document.getElementById("myModifyLine");
			var pushOriginDp = document.getElementById("otherModifyLine");
			var pushOriginRf = document.getElementById("rfModifyLine");
			
			var docBean = [];
			var aplBean = [];
			var rfBean = [];
			
			// Origin Approval Inital & Push
			for(var i=0; i<originApSize; i++) {
				originApInital = {'aplSeq':i+1, 'aplId':pushOriginAp[i].value, 'aplName':pushOriginAp[i].text};
				aplBean.push(originApInital);
			}
			
			// Original Department Inital & Push
			for(var i=0; i<originDpSize; i++) {
				originDpInital = {'aplSeq':originApSize+1+i, 'aplId':pushOriginDp[i].value, 'aplName':pushOriginDp[i].text};
				aplBean.push(originDpInital);
			}
			
			// Original Reference Inital & Push
			for(var i=0; i<originRfSize; i++) {
				originRfInital = {'rdId':pushOriginRf[i].value, 'rdName':pushOriginRf[i].text};
				rfBean.push(originRfInital);
			}
			
			var originDocInital = {'dmTitle':modifyTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':originApSize, aplBean, rfBean};
			docBean.push(originDocInital);
			
			var temp = JSON.stringify(docBean);
			
 			$.ajax({
				type: 'POST',
				url : '/tempDraft',
				data : temp,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				// Original Member & Other(=Department) & Reference
				var originMAplSize = $("#selMyModifyLine option").length;
				var originOAplSize = $("#seldpModify option").length;
				var originRAplSize = $("#selRfModifyLine option").length;
				
				// Origin push Approval & Other(=Department) & Reference
				var oPushApline = document.getElementById("selMyModifyLine");
				var oPushOtApline = document.getElementById("seldpModify");
				var oPushRfApline = document.getElementById("selRfModifyLine");
				
				var originRadioDmCode = $('input[name="dmCode"]:checked').val();
				var originRadioDmName = $("label[for='"+originRadioDmCode+"']").text().substring(0,2);
				
				alert(originRadioDmName);
				
				var docBean = [];
				var aplBean = [];
				var rfBean = [];
				
				var rfInital = "";
				
				// Draft Writer Initalize & Push aplBean
				var aplInital = {'aplSeq':'1', 'aplId':'${sessionScope.userId}', 'aplName':'${sessionScope.userName}'};
				aplBean.push(aplInital);
				for(var i=0; i<originMAplSize; i++) {
					aplInital = {'aplSeq':i+2, 'aplId':oPushApline[i].value, 'aplName':oPushApline[i].text};
					aplBean.push(aplInital);
				}
				
				// Department Approval Line Push aplBean
				for(var i=0; i<originOAplSize; i++) {
					aplInital = {'aplSeq':originMAplSize+2, 'aplId':oPushOtApline[i].value, 'aplName':oPushOtApline[i].text};
					aplBean.push(aplInital);
				}	
				
				// Reference Line Push
				for(var i=0; i<originRAplSize; i++) {
					rfInital = {'rdId':oPushRfApline[i].value, 'rdName':oPushRfApline[i].text};
					rfBean.push(rfInital);
				}
				
				var docInital = {'dmName':originRadioDmName, 'dmCode':originRadioDmCode, 'dmTitle':modifyTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':originMAplSize, 'dmNum':'${sessionScope.tempList[0].dmNum}', aplBean, rfBean};
				docBean.push(docInital);
				
				var json = JSON.stringify(docBean);
				
				$.ajax({
					type: 'POST',
					url : '/modifyDraft',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				setTimeout("location.reload()", 2000);
			})
			.fail(function(data) {
				console.log("Fail");
			})
		});
	});
	</script>
	
	<!-- Open Approval Comment(=Request) Modal -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#onAplModal').click(function() {
			// undefined
			var docCheck = $('#docDelete').attr("value");
			var signCheck = $('#signDelete').attr("value");
			
			if(typeof docCheck == "undefined" || docCheck == "" || docCheck == null && typeof signCheck == "undefined" || signCheck == "" || signCheck == null) {
					alert("파일 혹은 사인을 업로드 부탁드립니다.");
			} else {
				$('#aplRequestModal').modal('show');	
			}
		})
	});
	</script>
	
	<!-- IMG Preview -->
	<script type="text/javascript">	
	var imgInput = document.getElementById("docFile");
	imgInput.addEventListener('change', function (e) {
		if (e.target.files) {
			var imageFile = e.target.files[0];
			var reader = new FileReader();
			reader.onload = function (e) {
				var img = document.createElement("img");
				
				img.onload = function (event) {
					var MAX_WIDTH = 1150;
					var MAX_HEIGHT = 300;
					
					var width = img.width;
					var height = img.height;

					if (width > height) {
					    if (width > MAX_WIDTH) {
					        height = height * (MAX_WIDTH / width);
					        width = MAX_WIDTH;
					    }
					} else {
					    if (height > MAX_HEIGHT) {
					        width = width * (MAX_HEIGHT / height);
					        height = MAX_HEIGHT;
					    }
					}

					var canvas = document.createElement("canvas");
					canvas.width = width;
					canvas.height = height;
					var ctx = canvas.getContext("2d");
					ctx.drawImage(img, 0, 0, width, height);

					// Show resized image in preview element
					var dataurl = canvas.toDataURL(imageFile.type);
					document.getElementById("imgPreview").src = dataurl;
				}
				img.src = e.target.result;
			}
			reader.readAsDataURL(imageFile);
		}
	});	
	</script>
	
	<!-- File Send -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#docUploadForm').on('click', '#docUpload', function() {
			var formData = new FormData();
			var inputFiles = $('input[name="docFile"]');
			var imgNullCheck = $("#imgPreview").attr("src");
			var files = inputFiles[0].files;
			
			if(typeof imgNullCheck == "undefined" || imgNullCheck == "" || imgNullCheck == null) {
				alert("문서 업로드 부탁드립니다.");
			} else {
				formData.append('key1', 'value1');
				formData.append('key2', 'value2');
				
				for(var i=0; i<files.length; i++) {
					formData.append('uploadFiles', files[i]);
				}
				
				$.ajax({
					type : 'POST',
					url : '/uploadFile',
					data : formData,
					processData : false,
					contentType : false
				})
				.done(function(data) {
					alert("Upload Success");
					
					console.log(data.result);
					
					var delHtml = "";
					delHtml += "<input type='button' data-src="+ data.result +" id='docDelete' value='Delete'/>";
					
					if($("#docDelete").length > 0) {
						console.log("Delete Button already");
					} else {
						$('#docUploadForm').html(delHtml);
					}
				})
				.fail(function(data) {
					alert("Upload Failed");
				})
			}
		})
	});
	</script>
	
	<script type="text/javascript">
	$('document').ready(function() {
		$('#docUploadForm').on('click', '#docDelete', function() {
			var that = $(this);
			
			$.ajax({
				type : "POST",
				url : "/deleteFile",
				data : {fileName:that.attr("data-src")},
				dataType : "text"
			})
			.done(function(data) {
				$("input[name='docFile']").val("");
				$("#imgPreview").attr("src", "");
				
				var uploadHtml = "";
				uploadHtml += "<input type='button' id='docUpload' value='Submit' />";
				
				$('#docUploadForm').html(uploadHtml);
				
				console.log("Success");
			})
			.fail(function(data) {
				console.log("Failed");
			})
		});
	});
	</script>
	
	<script type="text/javascript">
	var canvas = $("#signature-pad canvas")[0];
    var sign = new SignaturePad(canvas, {
        minWidth: 2,
        maxWidth: 8,
        penColor: "rgb(0, 0, 0)"
    });

    $('#signUpClear').on('click', '#signClear', function() {
    	sign.clear();
    });
    
    $('#signUpClear').on('click', '#signUpload', function() {
    	if (sign.isEmpty()) {
            alert("사인해 주세요!!");
        } else {
        	var canvasData = atob(sign.toDataURL('image/png').split(",")[1]);
        	
        	var array = [];
        	for(var i=0 ; i<canvasData.length ; i++){
        		//문자열을 아스키코드로 변환하여 array배열에 저장
        		array.push(canvasData.charCodeAt(i));
        	}
        	
        	var file = new Blob([new Uint8Array(array)], {type: 'image/png'});

            var formdata = new FormData();	// formData 생성
            formdata.append("file", file);	// file data 추가
            
            $.ajax({
            	type : 'POST',
		        url : '/saveSign',
		        data : formdata,
		        processData : false,
		        contentType : false,
                success : function(r){
                    alert("저장완료");
                    
                    var signHtml = "";
                    signHtml += '<button type="button" id="signDelete" value="signDelete" class="btn btn-primary" data-action="delete">삭제</button>'
                    
                    $('#signUpClear').html(signHtml);
                    
                   //sign.clear();
                },
                
                error : function(res){
                    console.log("failed");
                }
            });
        }
    });
    
    $('#signUpClear').on('click', '#signDelete', function() {
    	$.ajax({
			type : "POST",
			url : "/deleteSign"
		})
		.done(function(data) {
			var signInitHtml = "";
			signInitHtml += '<button type="button" id="signClear" class="btn btn-primary" data-action="clear">지우기</button> ';
			signInitHtml += '<button type="button" id="signUpload" class="btn btn-primary" data-action="save">저장</button>';
			
			$('#signUpClear').html(signInitHtml);
			
			sign.clear();
			
			alert("Sign Delete Success");
		})
		.fail(function(data) {
			console.log("Failed");
		})
    });
     
    function resizeCanvas(){
        var canvas = $("#signature-pad canvas")[0];
 
        var ratio =  Math.max(window.devicePixelRatio || 1, 1);
        canvas.width = canvas.offsetWidth * ratio;
        canvas.height = canvas.offsetHeight * ratio;
        canvas.getContext("2d").scale(ratio, ratio);
    }
     
    $(window).on("resize", function(){
        resizeCanvas();
    });

    resizeCanvas();
	</script>
	
	<script type="text/javascript">
	$('document').ready(function() {
		$('#requestApproval').click(function() {
			var dmTitle = document.getElementById("dmTitle").value;
			var dmNum =document.getElementById("dmNum").value;
			var dmDate = document.getElementById("dmDate").value;
			var dmCode = document.getElementById("dmCode").value;
			var acReason = document.getElementById("commentTextArea").value;
			
			var approvalSize = '${sessionScope.aplMap.size()}';
			var departmentSize = '${sessionScope.docMap.size()}';
			var referenceSize = '${sessionScope.refMap.size()}';
			
			var aplBean = new Array();
			var refBean = new Array();
			
			<c:forEach items='${sessionScope.aplMap}' var ='aplMap'>
				aplBean.push({aplId:'${aplMap.aplId}', aplSeq:'${aplMap.aplSeq}'});
			</c:forEach>
			
			<c:forEach items='${sessionScope.docMap}' var ='docMap'>
				aplBean.push({aplId:'${docMap.aplId}', aplSeq:'${docMap.aplSeq}'});
			</c:forEach>
			
			<c:forEach items='${sessionScope.refMap}' var ='refMap'>
				refBean.push({rdId:'${refMap.rdId}', rfSeq:'${refMap.rfSeq}'});
			</c:forEach>
			
			var draftData = [{'dmTitle':dmTitle, 'dmNum':dmNum, 'dmDate':dmDate, 'dmWriter':'${sessionScope.userId}', 'dmCode':dmCode, 'aplComment':acReason, aplBean, refBean}];
			var draftJson = JSON.stringify(draftData);
			
			$.ajax({
				type: 'POST',
				url : '/requestDraft',
				data : draftJson,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				dmCodeCheck = data[0].dmCode;
				
				if(dmCodeCheck == "D") {
					location.href = "/myDraft";	
				} else {
					location.href = "/myEnforceMent";
				}
				console.log("Success");
			})
			.fail(function(data) {
				console.log("Fail");
			})
		})
	});
	</script>
	
	<!-- BeforeUnload Page Move Locked -->
	<script type="text/javascript">
	    var checkUnload = true;
	    
	    $(window).on("beforeunload", function(){
	        if(checkUnload) return false;
	    });
	   
	    $(document).on("click", "#modifyApproval", function(event){
	        $(window).off('beforeunload');
	    });

	    $(document).on("click", "#sendApproval", function(event){
	        $(window).off('beforeunload');
	    });
	    
	    $(document).on("click", "#requestApproval", function(event){
	        $(window).off('beforeunload');
	    });
	</script>
</body>

</html>