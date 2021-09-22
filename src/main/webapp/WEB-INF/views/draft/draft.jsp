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
					<input type="file" class="form-control-file" name="docFile" id="docFile" value="Upload"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<img id="imgPreview" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12" id="docUploadForm">
					<input type="button" id="docUpload" value="Submit" />
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
			<!-- Signature Form -->
			<div class="form-row">
				<div class="form-group col-md-4">
					<div id="signature-pad" class="m-signature-pad">
				        <div class="m-signature-pad--body">
				            <canvas id="signature-canvas"></canvas>
				        </div>
				        <div class="m-signature-pad--footer">
				            <button type="button" class="button clear" data-action="clear">지우기</button>
				            <button type="button" class="button save" data-action="save">저장</button>
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
										<c:forEach var="ogDpList" items="${sessionScope.ogDocMap}">
												<option value="<c:out value="${ogDpList.aplId}"></c:out>"><c:out value="${ogDpList.aplName}"></c:out></option>
										</c:forEach>
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
										<c:forEach var="ogRfList" items="${sessionScope.ogRefMap}">
												<option value="<c:out value="${ogRfList.rdId}"></c:out>"><c:out value="${ogRfList.rdName}"></c:out></option>
										</c:forEach>
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
			if($("#modifyDepartment").css("display") == "none"){				
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
			if($("#rfModifyForm").css("display") == "none"){
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
				
				var docInital = {'dmCode':originRadioDmCode, 'dmTitle':modifyTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':originMAplSize, 'dmNum':'${sessionScope.tempList[0].dmNum}', aplBean, rfBean};
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
			$('#aplRequestModal').modal('show');
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
	
	/* var sel_file;
	
	$('document').ready(function() {
		$("input[name='docFile']").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#imgPreview").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    } */
	</script>
	
	<!-- File Send -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#docUpload').click(function() {
			var formData = new FormData();
			var inputFiles = $('input[name="docFile"]');
			var files = inputFiles[0].files;
			
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
					$('#docUploadForm').append(delHtml);
				}
				
				/* if($("#docDelete").css("visibility") == "hidden") {
					$("#docDelete").css('visibility', 'visible');
				} else {
					console.log("Delete Button Visible");
				} */
				
			})
			.fail(function(data) {
				alert("Upload Failed");
			})
			
			/* var acReason = document.getElementById("commentTextArea").value;
			
			
			alert(acReason.value);
			console.log(acReason); */
		})
	});
	</script>
	
	<script type="text/javascript">
	$('document').ready(function() {
		$('#docUploadForm').on('click', '#docDelete', function() {
			var that = $(this);
			alert(that.attr("data-src"));
			
			$.ajax({
				type : "POST",
				url : "/deleteFile",
				data : {fileName:that.attr("data-src")},
				dataType : "text"
			})
			.done(function(data) {
				$("input[name='docFile']").val("");
				console.log("Success");
			})
			.fail(function(data) {
				console.log("Failed");
			})
		});
	});
	</script>
	
	<script type="text/javascript">
	    var checkUnload = true;
	    
	    $(window).on("beforeunload", function(){
	        if(checkUnload) return false;
	    });
	   
	    $(document).on("click", "#modifyApproval", function(event){
	        // disable warning
	        $(window).off('beforeunload');
	    });
	</script>
	
	<script type="text/javascript">
	var canvas = $("#signature-pad canvas")[0];
    var sign = new SignaturePad(canvas, {
        minWidth: 2,
        maxWidth: 8,
        penColor: "rgb(0, 0, 0)"
    });
     
    $("[data-action]").on("click", function(){
        if ( $(this).data("action")=="clear" ){
            sign.clear();
        }
        else if ( $(this).data("action")=="save" ){
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
                        sign.clear();
                    },
                    error : function(res){
                        console.log("failed");
                    }
                });
            }
        }
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
    
    /* $('document').ready(function() {
		$('#saveSign').click(function() {
			var canvasData = atob(sign.toDataURL('image/png').split(",")[1]);
			
			var array = [];
			
			for (var i=0; i < canvasData.length; i++) {
		        array.push(canvasData.charCodeAt(i));
		    }
			
		    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
		    var formdata = new FormData();	// formData 생성
		    formdata.append("file", file);
		    
		    console.log(formdata);
		    
		    $.ajax({
		    	type : 'POST',
		        url : '/saveSign',
		        data : formdata,
		        processData : false,
		        contentType : false
		    })
		    .done(function(data) {
				console.log("Success");
			})
			.fail(function(data) {
				console.log("Failed");
			})
		})
	}); */
	</script>
</body>
</html>