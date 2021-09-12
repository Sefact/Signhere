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
				<div class="form-group col-md-5">
					<select name ="grCode">
						<option value="">직급선택</option>
						<c:forEach var = "grade" items="${grList}">
							<option value="${grade.gdCode}">
								${grade.gdName }
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
						<c:forEach var = "department" items="${dpList}">
							<option value="${department.dpCode}">
								${department.dpName }
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

	<h2 class="sub-header">직원리스트</h2>
	<button class="btn btn-primary" id="addEmployeeBtn" onclick="showAddModal()">직원추가</button>
	<button class="btn btn-primary" id="deleteEmployeeBtn" onclick="showDelModal()">직원삭제</button>
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
			<c:forEach var = "empLists" items="${empList}">
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
	<!-- add Employee modal -->
	<div id="addModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">직원추가</h4>
          </div>
          <div id="" class="modal-body">
            <div>
            	<label for ="userIdNew">아이디</label>
            	<input id="userIdNewBox" name="userIdNew" placeholder="사번입력" />
            </div>
            <div>
            	<label for ="userNameNew">이름</label>
            	<input id="userNameNewBox" name="userNameNew" placeholder="사번입력" />
            </div>
            <div>
            	<label for ="grGradeNew">직급</label>
            	<select id="grGradeNewBox" name ="grCodeNew">
					<option value="">직급선택</option>
						<c:forEach var = "grade" items="${grList}">
							<option value="${grade.gdCode}">
								${grade.gdName }
							</option>
					</c:forEach>
				</select>
            </div>
            <div>
            	<label for ="dpCodeNew">부서</label>
            	<select id="dpCodeNewBox" name ="dpCodeNew">
					<option value="">부서선택</option>
					<c:forEach var = "department" items="${dpList}">
						<option value="${department.dpCode}">
							${department.dpName }
						</option>
						</c:forEach>
				</select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" onClick="requestAddNewEmp()" id="requestAddNewBtn" class="btn btn primary">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- delete Employee modal -->
	<div id="delModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">직원삭제</h4>
          </div>
          <div id="newEmpInfo" class="modal-body">
            <div>
            	<label for ="userIdDel">아이디</label>
            	<input placeholder="사번입력" />
            </div>
            <div>
            	<label for ="empIdDel">이름</label>
            	<input placeholder="사번입력" />
            </div>
            <div>
            	<label for ="grGradeDel">직급</label>
            	<select name ="grCodeDel">
					<option value="">직급선택</option>
						<c:forEach var = "grade" items="${grList}">
							<option value="${grade.gdCode}">
								${grade.gdName }
							</option>
					</c:forEach>
				</select>
            </div>
            <div>
            	<label for ="dpCodeDel">부서</label>
            	<select name ="dpCodeDel">
					<option value="">부서선택</option>
					<c:forEach var = "department" items="${dpList}">
						<option value="${department.dpCode}">
							${department.dpName }
						</option>
						</c:forEach>
				</select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" onClick="requestDelEmp()" id="selReceiver" class="btn btn primary">삭제</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
    
</div>