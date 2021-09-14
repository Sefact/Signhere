<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<!-- admin.js -->
<script src="/resources/js/admin/admin.js"></script>
<!-- Resources JS -->
<script src="/resources/js/login/main.js"></script>
<!-- Bootstrap core CSS -->
<link href="/webjars/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
<!-- JQuery -->
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- popper.js -->
<script src="/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
<!-- Font-Awesome -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<!-- Resources CSS -->
<link href="/resources/css/login/main.css" rel="stylesheet">
<!-- Bootstrap Modal -->
<script src="/webjars/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../utils/navigation.jsp" />
	<form>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="employeeName">이름</label>
			</div>
			<div class="form-group col-md-5">
				<input type="text" class="form-control" name="empId" placeholder="이름을 입력하세요.">
				<div class="form-group col-md-5"></div>	
			</div>				
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="employeeGrade">직급</label>
			</div>
			<div class="form-group col-md-5">
				<input type="text" class="form-control" name="empGrade" placeholder="직급을 입력하세요.">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="employeeDepartment">소속부서</label>
			</div>
			<div class="form-group col-md-5">
				<input type="text" class="form-control" name="empDepartment" placeholder="소속부서명을 입력해주세요." />
			</div>
		</div>
		<div class="form-group col-md-3">		
		</div>
		<div class="form-group col-md-1">
			<a href="#theModal" class="nav-link" data-remote="false"
				data-toggle="modal" data-target="#theModal">+직원추가</a>
			<div class="modal fade" id="theModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="addEmp-ModalLabel">직원추가</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<label for="addEmpId">ID</label>
							<input type="text" class="newEmpId" name="newEmpId" placeholder="YYYY+MM+001~"/>
							<br>
							<label for="addEmpName">이름</label>	
							<input type="text" class="newEmpName" name="newEmpName" placeholder=""/>
							<br>
							<label for="empGrade">직급</label>
							<select name="empGrade" class="orgChart">
								<option>직급명</option>
								<option value="V">미배정</option>
								<option value="A">사원</option>
								<option value="B">주임</option>
								<option value="C">책임</option>
								<option value="D">계장</option>
								<option value="E">대리</option>
								<option value="F">과장대리</option>
								<option value="G">과장</option>
								<option value="H">차장</option>
								<option value="I">부장</option>
								<option value="J">공장장</option>
								<option value="K">상임고문</option>
								<option value="L">고문</option>
								<option value="M">감사</option>
								<option value="N">이사</option>
								<option value="O">상무이사</option>
								<option value="P">전무이사</option>
								<option value="Q">부사장</option>
								<option value="R">사장</option>
								<option value="S">대표이사</option>
								<option value="T">부회장</option>
								<option value="U">회장</option>
							</select>
							<br>
							<label for="empDepartment">부서</label>	
								<select name="dp" class="modal-body">
									<option selected>부서선택</option>
									<forEach items="${getdpList}" var="dp">
									<option>value="${dp.dp_name}"</option>
									</forEach>
								</select>
						</div>
						<div class="modal-footer">
							<button type="button" class="cancelBtn" data-dismiss="modal">취소</button>
							<input type="button" class="btn btn-primary" value="추가" onClick="addEmployee()"></input>
						</div>					
					</div>
				</div>
			</div>
		</div>
		<div class="form-group col-md-1">
			<input type="button" class="btn btn-primary" value="search" onClick="empSearch()"/>
		</div>
		<div class="form-group col-md-1">
			<input type="button" class="form-control" value="직원삭제" />
		</div>
	</form>
	<h2 class="sub-header">직원 관리</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>아이디</th>
					<th>성명</th>
					<th>직급</th>
					<th>소속부서</th>
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
</body>


</html>