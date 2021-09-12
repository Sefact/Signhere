<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<h1 class="page-header">Employees</h1>
	
		<form id="entForm">
			<div class="form-row">
				<div class="form-group col-md-1">
					<label for="userName">이름</label>
				</div>
				<div class="form-group col-md-11">
					<input type="text" class="form-control" name="userName" placeholder="직원이름"/>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-1">
					<label for="grCode">직급</label>
				</div>
				<div class="form-group col-md-11">
					<select name =""grCode"">
						<option value="">직급선택</option>
						<c:forEach var = "name" items="${empList}">
							<option value="${name.grCode}">
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-1">
					<label for="dpCode">부서</label>
				</div>
				<div class="form-group col-md-5">
					<select name ="dpCode">
						<option value="">부서선택</option>
						<c:forEach var = "name" items="${empList}">
							<option value="${name.dpCode}">
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-6">
				<input type="button" class="btn btn-primary" value="Search"
					onClick="searchEmployee()" />
			</div>
			</div>
			
		</form>

	<h2 class="sub-header">Section title</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>직급</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var = "empLists" items="${empLists}">
				<tr>
					<td><c:out value="${empLists.userId}" /></td>
					<td><c:out value="${empLists.userName}" /></td>
					<td><c:out value="${empLists.grName}" /></td>
					<td><c:out value="${empLists.dpName}" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>