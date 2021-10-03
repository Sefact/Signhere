<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<h1 class="page-header">결재문서관리</h1>

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
					onClick="searchText()" />
			</div>
		</div>

	</form>
	<input id="updatedList" style="display: none;" value="${docList}" />
	<h2 class="sub-header">문서 목록</h2>
	<input type="button" class="btn btn-primary" value="Delete"
		onClick="deleteDoc()" />
	<div class="table-responsive">
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
				<c:forEach var="docList" items="${docList}">
					<tr>
						<td><input type="checkBox" class="docListRow"
							value="${docList.DMNUM}">
						<c:out value="${docList.DMNUM}" /></td>
						<td><c:out value="${docList.DMTITLE}" /></td>
						<td><c:out value="${docList.APNAME}" /></td>
						<td><c:out value="${docList.DMNAME}" /></td>
						<td><c:out value="${docList.DMWRITER}" /></td>
						<td><c:out value="${docList.DMDATE}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<ul class="btn-group pagination">
		<c:if test="${pagination.prev }">
			<li><a
				href='<c:url value="/apListAdmin?page=${pagination.startPage-1 }"/>'><i
					class="fa fa-chevron-left"></i></a></li>
		</c:if>
		<c:forEach begin="${pagination.startPage }"
			end="${pagination.endPage }" var="pageNum">
			<li><a href='<c:url value="/apListAdmin?page=${pageNum }"/>'><i
					class="fa">${pageNum }</i></a></li>
		</c:forEach>
		<c:if test="${pagination.next && pagination.endPage >0 }">
			<li><a
				href='<c:url value="/apListAdmin?page=${pagination.endPage+1 }"/>'><i
					class="fa fa-chevron-right"></i></a></li>
		</c:if>
	</ul>
</div>