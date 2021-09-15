<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">Entrust</h1>
		<form id="entForm">
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
			<input type="button" class="btn btn-primary" id="entrustDel" value="del"/>	
			<div id="entrustForm" class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>NUM</th>
							<th>SENDER</th>
							<th>RECEIVER</th>
							<th>SETTING</th>
							<th>REASON</th>
							</tr>
					</thead>
					<tbody>
					<c:forEach var="entrustList" items="${entrustList}">
						<tr>
							<td><input type="radio" name="etNum" value="${entrustList.ETNUM}"/></td>
							<td><c:out value="${entrustList.RNUM}"/></td>
							<td><c:out value="${entrustList.SENDER}"/></td>
							<td><c:out value="${entrustList.RECEIVER}"/></td>
							<td><c:out value="${entrustList.SETTING}"/></td>
							<td><c:out value="${entrustList.REASON}"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<ul class="btn-group pagination">
				    <c:if test="${pagination.prev }">
				    <li>
				        <a href='<c:url value="/setEntrust?page=${pagination.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
				    </li>
				    </c:if>
				    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/setEntrust?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pagination.next && pagination.endPage >0 }">
				    <li>
				        <a href='<c:url value="/setEntrust?page=${pagination.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
				    </li>
				    </c:if>
				</ul>
	</div>

	<!-- modal -->
	<div id="receiverModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">조직도</h4>
          </div>
          <div id="receiverInfo" class="modal-body"></div>
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
				var data = [{'company':[{ 'cmCode' : ${sessionScope.cmCode} }]}];
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
					console.log(data);
					
					$.each(data, function(index, value) {
						outHtml += '<div>';
						outHtml += "<input type='radio' name='userName' value=" + value.userId + ">";
						outHtml += value.userName;
						outHtml += '</div>';
					});
					$('#receiverInfo').html(outHtml);
					$('#receiverModal').modal('show');
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
					window.location.reload();
					
					etReason.value ="";
					etReason.focus();
					etReceiverId.value ="";
					etReceiverId.focus();
				})
				.fail(function(data) {
					console.log("Fail");
				})
			});
		});
	</script>
	
	<script>
	$(function(){
	    $("#entrustSave").click(function(){
	        var isRight = true;
	        $("#entForm").find("input[type=text]").each(function(index, item){
	            if ($(this).val().trim() == '') {
	                alert($(this).attr("name")+" 항목을 입력하세요.");
	                isRight = false;
	                return false;
	            }
	        });
	
	        if (!isRight) {
	            return;
	        }
	
	        $(this).prop("disabled", true);
	        $(this).prop("disabled", false);
	    });
	
	});
	</script>
	
	<script type="text/javascript">
	$('document').ready(function() {			
		$('#entrustDel').click(function() {
			var etNum = $(":input:radio[name=etNum]:checked").val();
			var etData = [{'etNum':etNum}];
			var json = JSON.stringify(etData);
			
			console.log(json);
			
			$.ajax({
				type: 'POST',
				url : '/disCheckEntrust',
				data : json,
				dataType: 'json',
				contentType: "application/json;charset=UTF-8",
			})
			.done(function(data) {
				console.log(data);
				window.location.reload();
				//location.href = "";
			})
			.fail(function(data) {
				console.log("Fail");
			})
		});
	});
	</script>