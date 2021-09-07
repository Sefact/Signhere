<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Entrust</h1>
		<form>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="text" class="form-control" name="etReason" placeholder="위임사유"/>
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-primary" id="modalReceiver">Receiver</button>
				</div>
				<div id="receiverForm" class="form-group col-md-5">
					<input type="text" class="form-control" name="etReceiverId" placeholder="수임자" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<input type="button" class="btn btn-primary" id="entrustSave" value="save"/>
				</div>
			</div>
		</form>
	
			<h2 class="sub-header">Entrust List</h2>
			<div id="entrustForm" class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Header</th>
							<th>Header</th>
							<th>Header</th>
							<th>Header</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1,001</td>
							<td>Lorem</td>
							<td>ipsum</td>
							<td>dolor</td>
							<td>sit</td>
						</tr>
				</table>
			</div>
	</div>

	<!-- modal -->
	<div id="dummyModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">조직도</h4>
          </div>
          <div id="selMember" class="modal-body">
            <p>Modal Body</p>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" id="selReceiver" class="btn btn primary">Send</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
          </div>
        </div>
      </div>
    </div>

	<!-- JQuery -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#modalReceiver').click(function() {
				var data = [{'company':[{ 'cmCode' : '1234567890' }]}];
				var json = JSON.stringify(data);
				var outHtml = '';
				
				$.ajax({
					type: 'POST',
					url : '/mandatary',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					$.each(data, function(index, value) {
						console.log(index + " " + value);
						outHtml += '<div>';
						outHtml += "<input type='radio' name='userName' value=" + value.userId + ">";
						outHtml += value.userId;
						outHtml += '</div>';
					});
					$('#selMember').html(outHtml);
					
					$('#dummyModal').modal('show');
					
					
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>
	
	<script type="text/javascript">
		$('document').ready(function() {
			$('#selReceiver').click(function() {
				var radioValue = document.getElementsByName("userName").length;
				
				for (var i=0; i<radioValue; i++) {
		            if (document.getElementsByName("userName")[i].checked == true) {
		                var userValue = document.getElementsByName("userName")[i].value;
		            }
		        }

				var receiveHtml = '';
				receiveHtml += "<input type='text' class='form-control' name='etReceiverId' value=" + userValue + " disabled/>";
				
				$('#receiverForm').html(receiveHtml);
				//$('#receiverForm').append(receiveHtml);
			});
		});
	</script>
	
	<script type="text/javascript">
		$('document').ready(function() {			
			$('#entrustSave').click(function() {
				var etReason = document.getElementsByName("etReason")[0];
				var etReceiverId = document.getElementsByName("etReceiverId")[0];
				
				var data = [{'etReceiverId':etReceiverId.value, 'etReason':etReason.value}];
				var json = JSON.stringify(data);
				var entrustForm = '';
				
				$.ajax({
					type: 'POST',
					url : '/saveEntrust',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function(data) {
					var elength = Object.keys(data.entrustList).length
					
					entrustForm += '<table class="table table-striped">';
					entrustForm += '<thead>';
					entrustForm += '<tr>';
					entrustForm += '<th>NUM</th>';
					entrustForm += '<th>SENDER</th>';
					entrustForm += '<th>RECEIVER</th>';
					entrustForm += '<th>SETTING</th>';
					entrustForm += '<th>REASON</th>';
					entrustForm += '</tr>';
					entrustForm += '</thead>';
					entrustForm += '<tbody>';
					for(var i=0;i<elength;i++){
						entrustForm += '<tr>';
						entrustForm += '<td>' + data.entrustList[i].etNum + '</td>';
						entrustForm += '<td>' + data.entrustList[i].etSender + '</td>';
						entrustForm += '<td>' + data.entrustList[i].etReceiver + '</td>';
						entrustForm += '<td>' + data.entrustList[i].etSet + '</td>';
						entrustForm += '<td>' + data.entrustList[i].etReason + '</td>';
						entrustForm += '</tr>';
					}		
					entrustForm += '</table>';
					$('#entrustForm').html(entrustForm);
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>