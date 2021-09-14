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
            <li><a onClick="myInfoAccess()">My Info</a></li>
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
								<div class="form-group col-md-5">
									<select class="form-control" size="4">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
								<div class="form-group col-md-2">
									<button type="button" id="save" class="btn btn-primary btn-block">저장</button>
									<br>
									<button type="button" id="del" class="btn btn-primary btn-block">저장</button>
								</div>
								<div class="form-group col-md-5">
									<select class="form-control" size="4">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" id="selReceiver"
						class="btn btn primary">Send</button>
					<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- JQuery -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#approvalModal').click(function() {
				var data = [{'company':[{ 'cmCode' : '1234567890' }]}];
				var json = JSON.stringify(data);
				var outHtml = '';
				
				$.ajax({
					type: 'POST',
					url : '/orgChart',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					/* $.each(data, function(index, value) {
					}); */
					$('#dummyModal').modal('show');
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>