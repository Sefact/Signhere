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
          <ul class="nav navbar-nav navbar-left">
            <li><a id="modalOrgChart" href="#">조직도</a></li>
          </ul>
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
    
	<!-- Approval modal -->
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
	
	<!-- Organization Chart -->
	<div id="organizationModal" role="dialog" class="modal fade">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" data-dismiss="modal" class="close">&times;</button>
				<h4 class="modal-title">조직도</h4>
			</div>
			<div class="modal-body">
				<div class="input-group">
					<input type="text" name="orgMValue" class="form-control" placeholder="Search">
					<span class="input-group-btn">
						<button type="button" id="orgMsearch" class="btn btn-primary"><i class="fa fa-search"></i></button>
					</span>
				</div>
				<br>
				<div id="organizationInfo">
				
				</div>
			</div>
			<div class="modal-footer">
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
				var apSize = $("#selMyApprovalLine option").length;
				var json = JSON.stringify(data);
				var modalHtml = '';
				
				if(apSize > 0) {
					$('#dummyModal').modal('show');
				} else {
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
				}
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
			
			// #1 selMyApprovalLine append
			$('#selMyApprovalLine').append(selMyAplHtml);
			
			// #2 append after Remove selMyApprovalLine
			$("#myApprovalLine option[value="+ myApValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove MyApprovalLine -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#mApLineDel').click(function() {
			var selMyApValue = $("#selMyApprovalLine option:selected").val();
			var selMyApCheck = $("#selMyApprovalLine option:selected").text();
			
			var selectedAp = '';
			selectedAp += '<option value=' + selMyApValue + '>';
			selectedAp += selMyApCheck;
			selectedAp += '</option>';
			
			// #1 Remove Selected Approval Line
			$("#selMyApprovalLine option[value="+ selMyApValue +"]").remove();
			
			// #2 Append Origin Approval Line
			$('#myApprovalLine').append(selectedAp);
		})
	});
	</script>
	
	<!-- Show & Hide Other Department Approval Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#otherDPOnOff').click(function() {
			var data = [{'apCheck': 'D', 'cmCode': ${sessionScope.cmCode}}];
			var dpSize = $("#selOtApprovalLine option").length;
			var json = JSON.stringify(data);
			var otherDPHtml = '';
			
			if($("#otherDepartment").css("display") == "none"){
				if(dpSize > 0) {
					$('#otherDepartment').show();
				} else {
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
			    }
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
			
			// #1 append Other Department Approval Line
			$('#selOtApprovalLine').append(selOtAplHtml);
			
			// #2 append after Remove selMyApprovalLine
			$("#otherApprovalLine option[value="+ otApValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove Department Approval Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#otApLineDel').click(function() {
			var selOtApValue = $("#selOtApprovalLine option:selected").val();
			var selOtApCheck = $("#selOtApprovalLine option:selected").text();
			
			var selectedDp = '';
			selectedDp += '<option value=' + selOtApValue + '>';
			selectedDp += selOtApCheck;
			selectedDp += '</option>';
			
			// #1 Remove Selected Department Line
			$("#selOtApprovalLine option[value="+ selOtApValue +"]").remove();
			
			// #2 Append Origin Department Line
			$('#otherApprovalLine').append(selectedDp);
		})
	});
	</script>
	
	<!-- Show & Hide Reference Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#referenceOnOff').click(function() {
			var data = [{'apCheck': 'R', 'cmCode': ${sessionScope.cmCode}}];
			var rfSize = $("#selReferencelLine option").length;
			var json = JSON.stringify(data);
			var referenceHtml = '';
			
			if($("#referenceForm").css("display") == "none"){
				if(rfSize > 0) {
					$('#referenceForm').show();	
				} else {
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
				}				  
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
			
			// #1 append Reference Line
			$('#selReferencelLine').append(selOtAplHtml);
			
			// #2 append after Remove Select Reference Line
			$("#referenceLine option[value="+ referenceValue +"]").remove();
		})
	});
	</script>
	
	<!-- Remove Reference Line -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#rfLineDel').click(function() {
			var selRfValue = $("#selReferencelLine option:selected").val();
			var selRfCheck = $("#selReferencelLine option:selected").text();
			
			var selectedRf = '';
			selectedRf += '<option value=' + selRfValue + '>';
			selectedRf += selRfCheck;
			selectedRf += '</option>';
			
			// #1 Remvoe Selected Reference
			$("#selReferencelLine option[value="+ selRfValue +"]").remove();
			
			// #2 Append Origin Reference Line
			$('#referenceLine').append(selectedRf);
		})
	});
	</script>
	
	<!-- Navigation Send Draft -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#sendApproval').click(function() {
			var navDmTitle = document.getElementsByName("dmTitle")[0].value;
			
			/* Origin Approval Info */
			var navApSize = $("#myApprovalLine option").length;
			var navDpSize = $("#otherApprovalLine option").length;
			var navRfSize = $("#referenceLine option").length;
			
			var pushNavAp = document.getElementById("myApprovalLine");
			var pushNavDp = document.getElementById("otherApprovalLine");
			var pushNavRf = document.getElementById("referenceLine");
			
			var navApInital = "";
			var navDpInital = "";
			var navRfInital = "";
			
			var docBean = [];
			var aplBean = [];
			var rfBean = [];
			
			// Origin Approval Inital & Push
			for(var i=0; i<navApSize; i++) {
				navApInital = {'aplSeq':i+1, 'aplId':pushNavAp[i].value, 'aplName':pushNavAp[i].text};
				aplBean.push(navApInital);
			}
			
			// Original Department Inital & Push
			for(var i=0; i<navDpSize; i++) {
				navDpInital = {'aplSeq':navApSize+1+i, 'aplId':pushNavDp[i].value, 'aplName':pushNavDp[i].text};
				aplBean.push(navDpInital);
			}
			
			// Original Reference Inital & Push
			for(var i=0; i<navRfSize; i++) {
				navRfInital = {'rdId':pushNavRf[i].value, 'rdName':pushNavRf[i].text};
				rfBean.push(navRfInital);
			}
			
			var originDocInital = {'dmTitle':navDmTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':navApSize, aplBean, rfBean};
			docBean.push(originDocInital);
			
			var temp = JSON.stringify(docBean);
			
			//alert(navApSize + ":" + navDpSize + ":" + navRfSize);
			
 			$.ajax({
				type: 'POST',
				url : '/tempDraft',
				data : temp,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				console.log("loc this");
				/* Selected Approval Info */
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
				
				var docInital = {'dmCode':radioDmCode, 'dmTitle':navDmTitle, 'dmWriter':'${sessionScope.userName}', 'aplSeq':mAplSize, aplBean, rfBean};
				docBean.push(docInital);
				
				var json = JSON.stringify(docBean);
				
				$.ajax({
					type: 'POST',
					url : '/confirmDraft',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				console.log("Success");
				setTimeout("location.href = '/draftMove'", 2000);
			})
			.fail(function(data) {
				console.log("Fail");
			})
		});
	});
	</script>
	
	<script type="text/javascript">
	$('document').ready(function() {
		$('#modalOrgChart').click(function() {
			var orgData = [{'cmCode':${sessionScope.cmCode}}]
			var orgJson = JSON.stringify(orgData);
			
			$.ajax({
				type: 'POST',
				url : '/orgChart',
				data : orgJson,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				var orgDpHtml = "";
				orgDpHtml += '<div>';
				orgDpHtml += '<ul>';
				$.each(data, function(index, value) {
					/* orgDpHtml += '<div class="selDpMember" id=' + index + ' name="dpName" value=' + value.dpCode +'>';
					orgDpHtml += '<a>' + value.dpName + '</a>';
					orgDpHtml += '<div class=' + index + ' style="display:none">';
					orgDpHtml += '</div>';
					orgDpHtml += '</div>'; */
					orgDpHtml += '<li>';
					orgDpHtml += '<a class="selDpMember" id='+ index +' value='+ value.dpCode + ' name="dpName">' + value.dpName + '</a>';
					orgDpHtml += '<div class=' + index + ' style="display:none">';
					orgDpHtml += '</div>';
					orgDpHtml += '</li>';
				});
				orgDpHtml += '</ul>';
				orgDpHtml += '</div>';
				
				$('#organizationInfo').html(orgDpHtml);
				$('#organizationModal').modal('show');
				
				$('.selDpMember').click(function(){
					var dpCode = $(this).attr('value');
					var orgLoc = $(this).attr('id');
					
					alert(dpCode + ":" + orgLoc);
					
					var orgMData = [{'cmCode':${sessionScope.cmCode}, 'dpCode':dpCode}];
					
					var orgMJson = JSON.stringify(orgMData);
					
					$.ajax({
						type: 'POST',
						url : '/orgMemberChart',
						data : orgMJson,
						contentType: "application/json;charset=UTF-8",
						dataType: 'json'
					})
					.done(function(data) {
						var orgDpMHtml = "";
						
						$.each(data, function(index, value) {
							orgDpMHtml += '<div>';
							orgDpMHtml += value.userName;
							orgDpMHtml += '</div>';
						});
						$('.' + orgLoc).html(orgDpMHtml);						
						
						if($('.' + orgLoc).css("display") == "none"){
							$('.' + orgLoc).show();
						} else {
							$('.' + orgLoc).hide();
						}
					})
					.fail(function(data) {
						console.log("Fail");
					})
				});
			})
			.fail(function(data) {
				console.log("Fail");
			})
		})
	});
	</script>
	
	<!-- OrgChart Search -->
	<script type="text/javascript">
	$('document').ready(function() {
		$('#orgMsearch').click(function() {
			var inOrgMem = document.getElementsByName("orgMValue")[0].value;
			var searchData = [{'message':inOrgMem, 'cmCode':${sessionScope.cmCode}}];
			var searchJson = JSON.stringify(searchData);
			
			$.ajax({
				type: 'POST',
				url : '/orgSearch',
				data : searchJson,
				contentType: "application/json;charset=UTF-8",
				dataType: 'json'
			})
			.done(function(data) {
				var searchHtml = "";
				
				console.log(data.length);
				
				if(data.length > 0) {
					$.each(data, function(index, value) {
						searchHtml += '<div>';
						searchHtml += value.userName;
						searchHtml += '</div>';
					});
				} else {
					searchHtml += '<div>';
					searchHtml += "검색결과가 존재하지 않습니다.";
					searchHtml += '</div>';
				}
				
				$('#organizationInfo').html(searchHtml);
			})
			.fail(function(data) {
				console.log("Fail");
			})
		})
	});
	</script>