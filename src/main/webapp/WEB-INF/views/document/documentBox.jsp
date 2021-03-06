<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>

	
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
		<h1 class="page-header">문서</h1>
		
			<div class="form-row">
				<div class="form-group col-md-6">

				</div>
			
				<div class="form-group col-md-2">
				<c:if test="${sessionScope.Button eq 'approval'}"><button type="button" class="btn btn-primary btn-block" id="onAplModal" >결재</button>
				</c:if>
				</div>
				<div class="form-group col-md-2">
				<c:if test="${sessionScope.Button eq 'approval'}"><button type="button" class="btn btn-primary btn-block" id="onAplModal2">반려</button>
				</c:if>
				</div>
				<div class="form-group col-md-2">
				<c:if test="${sessionScope.Button2 eq 'approval'}">	<button type="button" class="btn btn-primary btn-block" id="onAplModal3">보류</button>
				</c:if>
				</div>
				
			</div>
			<c:set var="docList" value="${docList}" />
			
			<div class="form-row">
				<div class="form-group col-md-12">
					<label>문서제목</label>
					<input type="text" class="form-control" id="" value="${docList.dmTitle}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>문서번호</label>
					<input type="text" class="form-control" id="" value="${docList.dmNum}" disabled/>
				</div>
				<div class="form-group col-md-6">
					<label>날짜</label>
					<input type="text" class="form-control" id="" value="${docList.dmDate}" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label>작성자</label>
					<input type="text" class="form-control" id="" value="${docList.dmWriter}" disabled/>
				</div>
				<div class="form-group col-md-4">
					<label>참조자</label>
					<!-- <input type="text" class="form-control" id="" value="${sessionScope.docBean.rfBean[0].rdId}" disabled/>  -->
					<select class="form-control">
					<c:forEach var="refList" items="${refList}">
						<option value="${refList.rdName}"><c:out value="${refList.rdName}"/></option>
						</c:forEach>	
					</select>
				</div>
				<div class="form-group col-md-4">
					<label>문서종류</label>
					<input type="text" class="form-control" id="" value="${docList.dmName }" disabled/>
				</div>
			</div>
			<div class="form-row">
				<!-- 그림, 문서파일 출력 -->
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<img id="imgPreview" src="${fileLoc}" width="50%" height="70%"/>
				
				</div>
			</div>
			<div class="writerSign col-md-12">
			<font size="5em">기안자 서명</font>
						<c:choose>
					    <c:when test="${signList[0].signLocation ne null}">
							<div><img style="border: 2px solid black" src="${signList[0].signLocation}" width="300px" height="300px" /></div>
					    </c:when>
					    <c:otherwise>
							<div><img style="border: 2px solid black" src="\img\signNull.jpeg" width="300px" height="300px" /></div>
					    </c:otherwise>
					    </c:choose>
			
			</div>
			<div class="form-row">
				<font size="5em">결재선</font>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="3">
							<option>부서: ${apConfirmList[0].apDp}</option>
							<option>직급: ${apConfirmList[0].apGr}</option>
							<option>이름: ${apConfirmList[0].apName}</option>
					</select>
					<br>
					<c:choose>
					    <c:when test="${signList[1].signLocation ne null}">
							<div><img style="border: 2px solid black" src="${signList[1].signLocation}" width="300px" height="300px" /></div>
					    </c:when>
					    <c:otherwise>
							<div><img style="border: 2px solid black" src="\img\signNull.jpeg" width="300px" height="300px" /></div>
					    </c:otherwise>
					</c:choose>
				</div>
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="3" >
							<option>부서: ${apConfirmList[1].apDp}</option>
							<option>직급: ${apConfirmList[1].apGr}</option>
							<option>이름: ${apConfirmList[1].apName}</option>
					</select>
					<br>
					<c:choose>
					    <c:when test="${signList[2].signLocation ne null}">
							<div><img style="border: 2px solid black" src="${signList[2].signLocation}" width="300px" height="300px" /></div>
					    </c:when>
					    <c:otherwise>
							<div><img style="border: 2px solid black" src="\img\signNull.jpeg" width="300px" height="300px" /></div>
					    </c:otherwise>
					</c:choose>					
				</div>
				<div class="form-group col-md-4">
					<select id="" class="form-control" size="3">
							<option>부서: ${apConfirmList[2].apDp}</option>
							<option>직급: ${apConfirmList[2].apGr}</option>
							<option>이름: ${apConfirmList[2].apName}</option>
					</select>
					<br>
					<c:choose>
					    <c:when test="${signList[3].signLocation ne null}">
							<div><img style="border: 2px solid black" src="${signList[3].signLocation}" width="300px" height="300px" /></div>
					    </c:when>
					    <c:otherwise>
							<div><img style="border: 2px solid black" src="\img\signNull.jpeg" width="300px" height="300px" /></div>
					    </c:otherwise>
					</c:choose>	
				</div>
			</div>
			
			<!-- Signature Form -->			
			<div class="form-row">
				<div class="form-group col-md-12">
					<font size="40em">Sign Here</font>
					<div id="signature-pad" class="m-signature-pad">
				        <div class="m-signature-pad--body">
				            <canvas id="signature-canvas" style="border: 2px solid black" width="500px" height="150px"></canvas>
				        </div>
				        <div class="m-signature-pad--footer" id="signUpClear">
				            <button type="button" id="signClear" class="btn btn-primary" data-action="clear">지우기</button>
				            <button type="button" id="signUpload" class="btn btn-primary" data-action="save">저장</button>
				        </div>
				    </div>
				</div> 
				<div class="form-group col-md-12"> <font size="5em" color="grey">* 결재/반려 의견</font>
				<table class="table table-striped">
				<thead>
					<tr>
						<th class ="col-md-1">구분</th>
						<th class ="col-md-1">결재자</th>
						<th class ="col-md-1">부서</th>
						<th class ="col-md-1">직급</th>
						<th class ="col-md-4">의견</th>
						<th class ="col-md-1">날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="apCommentList" items="${apCommentList}">
					<tr>
						<td><c:out value="결재"/></td>
						<td><c:out value="${apCommentList.acName }"/></td>
						<td><c:out value="${apCommentList.dpName }"/></td>
						<td><c:out value="${apCommentList.grName }"/></td>
						<td><c:out value="${apCommentList.acContents }"/></td>
						<td><c:out value="${apCommentList.acDate }"/></td>
						</tr>	
				</c:forEach>
							
				<c:forEach var="cpCommentList" items="${cpCommentList}">
					<tr>
						<td><c:out value="반려/보류"/></td>
						<td><c:out value="${cpCommentList.cpName }"/></td>
						<td><c:out value="${cpCommentList.dpName }"/></td>
						<td><c:out value="${cpCommentList.grName }"/></td>
						<td><c:out value="${cpCommentList.cpContents }"/></td>
						<td><c:out value="${cpCommentList.cpDate }"/></td>
						</tr>	
				</c:forEach>				
									
				</tbody>
				</table>
				
				</div>
				<div class="form-group col-md-4">
				</div>
			</div>
		
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
					<div class="container-fluid">
						<div class="form-row">

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
		
				<div class="form-group">
					<textarea class="form-control" name="acContents" rows="3"></textarea>
				</div>
	
			</div>
			<div class="modal-footer">
				<button type="button" id="requestApproval" class="btn btn primary">Send</button>
				<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
			</div>
		</div>
		</div>
	</div>
	
		<!-- Companion Request Modal -->
	<div id="cpnRequestModal" role="dialog" class="modal fade">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">&times;</button>
				<h4 class="modal-title">반려의견</h4>
			</div>
			<div class="modal-body">
		
				<div class="form-group">
					<textarea class="form-control" name="cpContents" rows="3"></textarea>
				</div>
	
			</div>
			<div class="modal-footer">
				<button type="button" id="requestCompanion" class="btn btn primary">Send</button>
				<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
			</div>
		</div>
		</div>
	</div>

	
	<div id="defRequestModal" role="dialog" class="modal fade">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">&times;</button>
				<h4 class="modal-title">보류의견</h4>
			</div>
			<div class="modal-body">
		
				<div class="form-group">
					<textarea class="form-control" name="cpContents" rows="3"></textarea>
				</div>
	
			</div>
			<div class="modal-footer">
				<button type="button" id="requestDefer" class="btn btn primary">Send</button>
				<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
			</div>
		</div>
		</div>
	</div>
	
	

	<script type="text/javascript">
      $('document').ready(function() {
         $('#onAplModal').click(function() {
        	var signCheck = $('#signDelete').attr("value");
        	      
            $('#aplRequestModal').modal('show');
            
         })
      });
      
      $('#requestApproval').click(function(){
    	  let acContents=document.getElementsByName("acContents")[0];    
    	  let form = makeForm("approvalDraft","get");
    	  
    	  form.appendChild(acContents);
    	  document.body.appendChild(form);
    	  
    	  form.submit();
      });
      
      
      $('document').ready(function() {
          $('#onAplModal2').click(function() {
     
             $('#cpnRequestModal').modal('show');
             
          })
       });
      
      
      
      $('document').ready(function() {
          $('#onAplModal3').click(function() {
       
             $('#defRequestModal').modal('show');
             
          })
       });
      
      
       
       $('#requestCompanion').click(function(){
     	  let cpContents=document.getElementsByName("cpContents")[0];

     
     	  let form = makeForm("companionDraft","get");
     	  
     	  form.appendChild(cpContents);
     	  
     	  document.body.appendChild(form);
     	  
     	  form.submit();
     	  
     	  
       });

       
       
       $('#requestDefer').click(function(){
      	  let cpContents=document.getElementsByName("cpContents")[1];

      
      	  let form = makeForm("deferDraft","get");
      	  
      	  form.appendChild(cpContents);
      	  
      	  document.body.appendChild(form);
      	  
      	  form.submit();
      	  
      	  
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