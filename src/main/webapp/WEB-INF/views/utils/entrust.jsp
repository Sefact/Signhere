<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	
		<h1 class="page-header">Entrust</h1>
	
		<form>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="text" class="form-control" name="dmDate" placeholder="위임사유"/>
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-primary" id="modalReceiver">Receiver</button>
				</div>
				<div class="form-group col-md-5">
					<input type="text" class="form-control" name="etReceiver" placeholder="수임자" disabled/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12">
					<input type="button" class="btn btn-primary" value="save"/>
				</div>
			</div>
		</form>
	
			<h2 class="sub-header">Entrust List</h2>
			<div class="table-responsive">
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
						console.log(index + " " + value.userId + " " + value.userName);
						outHtml += '<div>' + '</div>';
						outHtml += "<input type='radio' name='userName' value=" + value.userName + ">";
						outHtml += value.userId;
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
				alert("Select Receiver");
			});
		});
	</script>
	