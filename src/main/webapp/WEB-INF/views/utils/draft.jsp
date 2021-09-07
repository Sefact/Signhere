<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<h1 class="page-header">MyDraft</h1>

	<form>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="dmNum">문서번호</label>
			</div>
			<div class="form-group col-md-11">
				<input type="text" class="form-control" name="dmNum"
					placeholder="문서번호">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="dmTitle">제목</label>
			</div>
			<div class="form-group col-md-11">
				<input type="text" class="form-control" name="dmTitle"
					placeholder="제목">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="dmWriter">작성자</label>
			</div>
			<div class="form-group col-md-11">
				<input type="text" class="form-control" name="dmWriter"
					placeholder="작성자">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="apCode">문서상태</label>
			</div>
			<div class="form-group col-md-5">
				<select name="apCode" class="form-control">
					<option value="">선택</option>
					<option value="P">진행</option>
					<option value="C">완료</option>
					<option value="R">반려</option>
					<option value="D">보류</option>
					<option value="F">회수</option>
				</select>
			</div>
			<div class="form-group col-md-1">
				<label for="dmCode">문서종류</label>
			</div>
			<div class="form-group col-md-5">
				<select name="dmCode" class="form-control">
					<option value="">선택</option>
					<option value="D">기안</option>
					<option value="E">시행</option>
				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">날짜</label>
			</div>
			<div class="form-group col-md-5">
				<input type="date" class="form-control" name="dmDate" />
			</div>
			<div class="form-group col-md-5">
				<input type="date" class="form-control" name="dmDate2" />
			</div>
			<div class="form-group col-md-1">
				<input type="button" class="btn btn-primary" value="Search"
					onClick="sampleFunction()" />
			</div>
		</div>

	</form>

	<div class="table-responsive">
	<input id="updatedList" style="display:none;" value="${docList}" />
	<input type="button" class="btn btn-primary" value="Delete"
			onClick="deleteDoc()" />
		<table class="table table-striped">
			<thead>
				<tr class="tableHeader">
					<th>문서번호</th>
					<th>제목</th>
					<th>문서상태</th>
					<th>문서종류</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var = "name" items="${docList}">
				<tr>
					<td><input type="checkBox" class="docListRow" value="${name.dmNum}"><c:out value="${name.dmNum}" /></td>
					<td><c:out value="${name.dmTitle}" /></td>
					<td><c:out value="${name.apName}" /></td>
					<td><c:out value="${name.dmName}" /></td>
					<td><c:out value="${name.dmWriter}" /></td>
					<td><c:out value="${name.dmDate}" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>