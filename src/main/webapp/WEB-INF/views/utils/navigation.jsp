<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


	<script src="/resources/js/authentication.js"></script>
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Sign Here</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a onClick="logOut()">Logout</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a id="approvalModal" href="#">결재문 작성 <span class="sr-only">(current)</span></a></li>
          </ul>
          <ul class="nav nav-sidebar"> 
            <li><a onclick="changePage('myDraft','post')">내가보낸 결재</a></li>
            <li><a onclick="myEnforceMent();">내가보낸 시행문</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a onclick="waitApproval();">결재 대기함</a></li>
            <li><a onclick="approvalProcced();">결재 진행함</a></li>
            <li><a onclick="completeApproval();">완료 문서함</a></li>
            <li><a onclick="companionApproval();">반려 문서함</a></li>
            <li><a onclick="deferList();">보류 문서함</a></li>
            <li><a onclick="referenceApproval();">참조열람 문서함</a></li>
            <li><a onclick="receiveNotice();">공문 수신함</a></li>
            <li><a onclick="myList();">개인 보관함</a></li>
            <li><a onclick="setEntrust();">위임권 관리</a></li>
          </ul>
          
          <ul class="nav nav-sidebar">
            <li><a onclick="admin();">직원 관리</a></li>
            <li><a onclick="apListAdmin();">결재문서 관리</a></li>
          </ul>
        </div>
      </div>
    </div>
    
	<!-- modal -->
	<div id="dummyModal" role="dialog" class="modal fade">
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
									<input type="text"class="form-control" name="dmTitle"><br>
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
									<select id="myApprovalLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="mApLineSave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="mApLineDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="selMyApprovalLine" name="selMyApprovalLine" class="form-control" size="4">
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="otherDPOnOff">결재선(타부서)</a>
									</label>
								</div>
							</div>
							<div class="form-row" id="otherDepartment" style="display:none">
								<div class="form-group col-md-5">
									<select id="otherApprovalLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="otApLineSave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="otApLineDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="selOtApprovalLine" class="form-control" size="4">
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">	
									<label>
										<a id="referenceOnOff">참조자</a>
									</label>
								</div>
							</div>
							<div class="form-row" id="referenceForm" style="display:none">
								<div class="form-group col-md-5">
									<select id="referenceLine" class="form-control" size="4">
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="rfLineSave" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="rfLineDel" class="btn btn-primary btn-block">삭제</button>
								</div>
								<div class="form-group col-md-5">
									<select id="selReferencelLine" class="form-control" size="4">
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
					<input type="button" id="sendApproval" class="btn btn primary" value="Send"/>
					<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Load MyApprovalLine -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#approvalModal').click(function() {
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
					$('#myApprovalLine').html(modalHtml);
					$('#dummyModal').modal('show');
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>
	
	<!-- Add MyApprovalLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mApLineSave').click(function() {
			var myApCheck = $("#myApprovalLine option:selected").text();
			var myApValue = $("#myApprovalLine option:selected").val();
			var selMyAplHtml = '';
			selMyAplHtml += '<option value=' + myApValue + '>';
			selMyAplHtml += myApCheck;
			selMyAplHtml += '</option>';
			
			//selMyApprovalLine
			$('#selMyApprovalLine').append(selMyAplHtml);
		})
	});
	</script>
	
	<!-- Remove MyApprovalLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mApLineDel').click(function() {
			var selMyApCheck = $("#selMyApprovalLine option:selected").val();

			$("#selMyApprovalLine option[value="+ selMyApCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Show & Hide Other Department Approval Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#otherDPOnOff').click(function() {
			var data = [{'apCheck': 'D', 'cmCode': ${sessionScope.cmCode}}];
			var json = JSON.stringify(data);
			var otherDPHtml = '';
			
			if($("#otherDepartment").css("display") == "none"){
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
					$('#otherApprovalLine').html(otherDPHtml);
				})
				.fail(function(data) {
					console.log("Fail");
				})
				
		        $('#otherDepartment').show();  
		    } else {  
		        $('#otherDepartment').hide();  
		    }
		})
	});
	</script>
	
	<!-- Add Department Approval Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#otApLineSave').click(function() {
			var otApCheck = $("#otherApprovalLine option:selected").text();
			var otApValue = $("#otherApprovalLine option:selected").val();
			var selOtAplHtml = '';
			selOtAplHtml += '<option value=' + otApValue + '>';
			selOtAplHtml += otApCheck;
			selOtAplHtml += '</option>';
			
			//selMyApprovalLine
			$('#selOtApprovalLine').append(selOtAplHtml);
		})
	});
	</script>
	
	<!-- Remove Department Approval Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#otApLineDel').click(function() {
			var selOtApCheck = $("#selOtApprovalLine option:selected").val();

			$("#selOtApprovalLine option[value="+ selOtApCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Show & Hide Reference Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#referenceOnOff').click(function() {
			var data = [{'apCheck': 'R', 'cmCode': ${sessionScope.cmCode}}];
			var json = JSON.stringify(data);
			var referenceHtml = '';
			
			if($("#referenceForm").css("display") == "none"){
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
					$('#referenceLine').html(referenceHtml);
				})
				.fail(function(data) {
					console.log("Fail");
				})
				
		        $('#referenceForm').show();  
		    } else {  
		        $('#referenceForm').hide();  
		    }
		})
	});
	</script>
	
	<!-- Add Reference Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfLineSave').click(function() {
			var referenceCheck = $("#referenceLine option:selected").text();
			var referenceValue = $("#referenceLine option:selected").val();
			var selOtAplHtml = '';
			selOtAplHtml += '<option value=' + referenceValue + '>';
			selOtAplHtml += referenceCheck;
			selOtAplHtml += '</option>';
			
			$('#selReferencelLine').append(selOtAplHtml);
		})
	});
	</script>
	
	<!-- Remove Reference Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfLineDel').click(function() {
			var selRfCheck = $("#selReferencelLine option:selected").val();

			$("#selReferencelLine option[value="+ selRfCheck +"]").remove();
		})
	});
	</script>
	
	<!-- Send Draft -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#sendApproval').click(function() {
			var dmTitle = document.getElementsByName("dmTitle")[0].value;
			
			var mAplSize = $("#selMyApprovalLine option").length;
			var oAplSize = $("#selOtApprovalLine option").length;
			var rAplSize = $("#selReferencelLine option").length;
			
			var pushApline = document.getElementById("selMyApprovalLine");
			var pushOtApline = document.getElementById("selOtApprovalLine");
			var pushRfApline = document.getElementById("selReferencelLine");
			
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
			
			var docInital = {'dmCode':radioDmCode, 'dmTitle':dmTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':mAplSize, aplBean, rfBean};
			docBean.push(docInital);
			
			var json = JSON.stringify(docBean);
			
 			$.ajax({
				type: 'POST',
				url : '/confirmDraft',
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