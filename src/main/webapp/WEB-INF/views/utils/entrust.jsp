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
					<button type="button" class="btn btn-primary" id="btnTest">Receiver</button>
				</div>
				<div class="form-group col-md-5">
					<input type="text" class="form-control" name="dmDate" placeholder="수임자" disabled/>
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
          <div class="modal-body">
            <p>Modal Body</p>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
          </div>
        </div>
      </div>
    </div>

	<!-- JQuery -->
	<script type="text/javascript">
		$('document').ready(function() {
			$('#btnTest').click(function() {
				var data = [{ 'userId' : "202103001" }];
				var json = JSON.stringify(data);
				alert(json);
				
				$.ajax({
					type: 'POST',
					url : '/mandatary',
					data : json,
					contentType: "application/json;charset=UTF-8",
					dataType: 'json'
				})
				.done(function() {
					
					$('#dummyModal').modal('show');
					console.log("Success");
				})
				.fail(function() {
					console.log("Fail");
				})
			});
		});
	</script>
	