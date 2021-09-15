<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h1 class="page-header">Dashboard</h1>

	<div class="row placeholders">
		<div class="col-xs-6 col-sm-3 placeholder">
			<img
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				width="200" height="200" class="img-responsive"
				alt="Generic placeholder thumbnail">
			<h4>Label</h4>
			<span class="text-muted">Something else</span>
		</div>
		<div class="col-xs-6 col-sm-3 placeholder">
			<img
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				width="200" height="200" class="img-responsive"
				alt="Generic placeholder thumbnail">
			<h4>Label</h4>
			<span class="text-muted">Something else</span>
		</div>
		<div class="col-xs-6 col-sm-3 placeholder">
			<img
				src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
				width="200" height="200" class="img-responsive"
				alt="Generic placeholder thumbnail">
			<h4>Label</h4><canvas id="myChart"></canvas>

		</div>

	</div>

	<h2 class="sub-header">결제함에 글들을 보여주는 섹션 두개로 나눌예정..?</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
			
				<tr>
					<th>#</th>
					<th></th>
					<td></td>
					<th>Header</th>
					<th>Header</th>
					<th>Header</th>
				
				</tr>
				
			</thead>
			<tbody>
				<tr>
				<c:forEach var="docList" items="${docList}">
					<td></td>
					<td><c:out value="${docList}"/></td>
					<td>ipsum</td>
					<td>dolor</td>
					<td>sit</td>
					</c:forEach>
				</tr>
				<tr>
					<td>1,002</td>
					<td>amet</td>
					<td>consectetur</td>
					<td>adipiscing</td>
					<td>elit</td>
				</tr>
				<tr>
					<td>1,003</td>
					<td>Integer</td>
					<td>nec</td>
					<td>odio</td>
					<td>Praesent</td>
				</tr>
				<tr>
					<td>1,003</td>
					<td>libero</td>
					<td>Sed</td>
					<td>cursus</td>
					<td>ante</td>
				</tr>
				<tr>
					<td>1,004</td>
					<td>dapibus</td>
					<td>diam</td>
					<td>Sed</td>
					<td>nisi</td>
				</tr>
				<tr>
					<td>1,005</td>
					<td>Nulla</td>
					<td>quis</td>
					<td>sem</td>
					<td>at</td>
				</tr>
				<tr>
					<td>1,006</td>
					<td>nibh</td>
					<td>elementum</td>
					<td>imperdiet</td>
					<td>Duis</td>
				</tr>
				<tr>
					<td>1,007</td>
					<td>sagittis</td>
					<td>ipsum</td>
					<td>Praesent</td>
					<td>mauris</td>
				</tr>
				<tr>
					<td>1,008</td>
					<td>Fusce</td>
					<td>nec</td>
					<td>tellus</td>
					<td>sed</td>
				</tr>
				<tr>
					<td>1,009</td>
					<td>augue</td>
					<td>semper</td>
					<td>porta</td>
					<td>Mauris</td>
				</tr>
				<tr>
					<td>1,010</td>
					<td>massa</td>
					<td>Vestibulum</td>
					<td>lacinia</td>
					<td>arcu</td>
				</tr>
				<tr>
					<td>1,011</td>
					<td>eget</td>
					<td>nulla</td>
					<td>Class</td>
					<td>aptent</td>
				</tr>
				<tr>
					<td>1,012</td>
					<td>taciti</td>
					<td>sociosqu</td>
					<td>ad</td>
					<td>litora</td>
				</tr>
				<tr>
					<td>1,013</td>
					<td>torquent</td>
					<td>per</td>
					<td>conubia</td>
					<td>nostra</td>
				</tr>
				<tr>
					<td>1,014</td>
					<td>per</td>
					<td>inceptos</td>
					<td>himenaeos</td>
					<td>Curabitur</td>
				</tr>
				<tr>
					<td>1,015</td>
					<td>sodales</td>
					<td>ligula</td>
					<td>in</td>
					<td>libero</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script src="/resources/js/chart/chart.js"></script>
<script>
var ctx = document.getElementById('myChart').getContext('2d');

var chart = new Chart(ctx, {
	type : 'doughnut',
	data : {
		labels : [ 'Red', 'Blue', 'Yellow' ],
		datasets : [ {
			label : 'My First Dataset',
			data : [ 300, 50, 100 ],
			backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(54, 162, 235)',
					'rgb(255, 205, 86)' ],
			hoverOffset : 4
		} ]
	}
});

</script>
