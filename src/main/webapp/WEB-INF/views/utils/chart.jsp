<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h1 class="page-header"></h1>

	<div class="row placeholders col-sm-10">
	
	
		<canvas id="myChart" ></canvas>
	

	</div>

	
	<div class="table-responsive 1 col-xs-6 " >
	<h2 class="sub-header">결재대기함</h2>
		<table class="table table-striped">
			<thead>
					<tr>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>문서종류</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<!-- Authentication.java 130번째줄 참조. -->
			<c:forEach var="docList" items="${docList}">
				<tr>
					<td><c:out value="${docList.dmNum }"/></td>
					<td><c:out value="${docList.dmTitle }"/></td>
					<td><c:out value="${docList.dmCode }"/></td>				
					<td><c:out value="${docList.dmWriter }"/></td>
					<td><c:out value="${docList.dmDate }"/></td>
				</tr>
			</c:forEach>	
			
				</tbody>
		</table>
	</div>
		
		<div class="table-responsive 2 col-xs-6">
		<h2 class="sub-header">결재진행함</h2>
		<table class="table table-striped">
				<thead>
					<tr>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>문서종류</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach var="docList2" items="${docList2}">
				<tr>
					<td><c:out value="${docList2.dmNum }"/></td>
					<td><c:out value="${docList2.dmTitle }"/></td>
					<td><c:out value="${docList2.dmCode }"/></td>				
					<td><c:out value="${docList2.dmWriter }"/></td>
					<td><c:out value="${docList2.dmDate }"/></td>
				</tr>
			</c:forEach>	
			
				</tbody>
		</table>
	</div>
	
	
	
</div>

<script src="/resources/js/chart/chart.js"></script>
<script>
var ctx = document.getElementById('myChart').getContext('2d');




var chart = new Chart(ctx, {
	type : 'bar',
	data : {
		labels : [ '처리해야 할 결재', '내가 보낸 결재', '진행중인 결재' ],
		datasets : [ {
			label : 'chart1',
			data : [ ${sessionScope.waitChart}, ${sessionScope.myDraftChart}, ${sessionScope.ingChart} ],
			backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(54, 162, 235)',
					'rgb(255, 205, 86)' ],
			hoverOffset : 4
			
		} ]
	}
}); 








</script>


