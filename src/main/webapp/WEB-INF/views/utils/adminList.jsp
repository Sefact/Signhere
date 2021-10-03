<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
	<script src="/resources/js/authentication.js"></script>
	<script src="/resources/js/admin/aplistAdmin.js"></script>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h1 class="page-header">Employees</h1>
		<form>
			<div class="form-row">
				<div class="form-group col-md-12">
					<label for="userName">이름</label>
					<input type="text" class="form-control" name="userName" placeholder="직원이름"/>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="grCode">직급</label>
					<select class="form-control" name ="grCode">
						<option value="">직급선택</option>
						<c:forEach var = "grList" items="${grList}">
							<option value="${grList.GDCODE}">
								${grList.GDNAME }
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="dpCode">부서</label>
					<select class="form-control" name="dpCode">
						<option value="">부서선택</option>
						<c:forEach var = "dpList" items="${dpList}">
							<option value="${dpList.DPCODE}">
								${dpList.DPNAME }
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-12">
				<input type="button" class="btn btn-primary" value="Search"
					onClick="searchEmployee()" />
				</div>
			</div>			
		</form>

	<div class="form-row">
		<div class="form-group col-md-12">
			<h2 class="sub-header">직원리스트</h2>
		</div>
	</div>
	
	<div class="form-row">
		<div class="form-group col-md-12">
			<button class="btn btn-primary" id="addEmployeeBtn" onclick="showAddModal()">직원추가</button>
			<button class="btn btn-primary" id="deleteEmployeeBtn" onclick="confirmDel()">직원삭제</button>
			<button class="btn btn-primary" id="modifyEmployeeBtn" onclick="requestUserInfoDetail()">직원정보수정</button>
			<button class="btn btn-primary" id="addDepartmentBtn" onclick="showAddDpModal()">부서 추가</button>
		</div>
	</div>
	
	<div class="form-row">
		<div class="form-group col-md-12">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>아이디</th>
							<th>이름</th>
							<th>직급</th>
							<th>부서</th>
						</tr>
					</thead>
					<tbody id="empListBody">
					<c:forEach var = "empList" items="${empList}">
						<tr>
							<td>
								<input type="checkBox" class="empListRow" value="${empList.USERID}">
								<input type="hidden" class="empListRowName" value="${empList.USERNAME}">
								<input type="hidden" class="empListRowgrName" value="${empList.GRNAME}">
								<input type="hidden" class="empListRowdpName" value="${empList.DPNAME}">
							</td>
							<td><c:out value="${empList.USERID}" /></td>
							<td><c:out value="${empList.USERNAME}" /></td>
							<td><c:out value="${empList.GRNAME}" /></td>
							<td><c:out value="${empList.DPNAME}" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
				<ul class="btn-group pagination">
					<c:if test="${pagination.prev }">
						<li><a
							href='<c:url value="/admin?page=${pagination.startPage-1 }"/>'><i
								class="fa fa-chevron-left"></i></a></li>
					</c:if>
					<c:forEach begin="${pagination.startPage }"
						end="${pagination.endPage }" var="pageNum">
						<li><a href='<c:url value="/admin?page=${pageNum }"/>'><i
								class="fa">${pageNum }</i></a></li>
					</c:forEach>
					<c:if test="${pagination.next && pagination.endPage >0 }">
						<li><a
							href='<c:url value="/admin?page=${pagination.endPage+1 }"/>'><i
								class="fa fa-chevron-right"></i></a></li>
					</c:if>
				</ul>
		</div>
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
            <form>
	            <div class="form-group">
	            	<label for="userIdNew">아이디</label>
	            	<input id="userIdNewBox" class="form-control" name="userIdNew" placeholder="아이디입력" onBlur="userIdNewCheck(this)"/>
		        </div>
		        <div class="form-group">
		        	<input type="button" class="btn btn-primary" value="중복체크" onClick="userIdNewDupCheck()">
		        </div>
	            <div class="form-group">
	            	<label for ="userNameNew">이름</label>
	            	<input id="userNameNewBox" class="form-control" name="userNameNew" placeholder="이름입력" onBlur="nameCheck(this)" />
	            </div>
	            <div class="form-group">
	            	<label for ="grGradeNew">직급</label>
	            	<select class="form-control" id="grGradeNewBox" name ="grCodeNew">
						<option value="">직급선택</option>
							<c:forEach var = "grList" items="${grList}">
								<option value="${grList.GDCODE}">
									${grList.GDNAME }
								</option>
						</c:forEach>
					</select>
	            </div>
	            <div class="form-group">
	            	<label for ="dpCodeNew">부서</label>
	            	<select class="form-control" id="dpCodeNewBox" name ="dpCodeNew">
						<option value="">부서선택</option>
						<c:forEach var = "dpList" items="${dpList}">
							<option value="${dpList.DPCODE}">
								${dpList.DPNAME }
							</option>
							</c:forEach>
					</select>
				</div>
			</form>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" onClick="requestAddNewEmp()" id="requestAddNewBtn" class="btn btn primary">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- modify Employee modal -->
	<div id="modifyModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">직원 정보 수정</h4>
          </div>
          <div id="modalBodyContents" class="modal-body">
            <div>
            	<label for ="userIdSelected">아이디</label>
            	<span id="userIdSelected"></span>
            	
            </div>
            <div>
            	<label for ="userMailSelected">이메일</label>
            	<span id="userMailSelected"></span>
            	
            </div>
            <div>
            	<label for ="userNameSelected">이름</label>
            	<span id="userNameSelected"></span>
            	
            </div>
            <div>
            	<label for ="grCodeSelected">직급</label>
            	<span id="grCodeSelected"></span>
            	<select id="grCodeSelectedBox" name ="grCodeSelected">
					<option value="">직급선택</option>
						<c:forEach var = "grList" items="${grList}">
							<option value="${grList.GDCODE}">
								${grList.GDNAME }
							</option>
					</c:forEach>
				</select>
            </div>
            <div>
            	<label for ="dpCodeSelected">부서</label>
            	<span id="dpCodeSelected"></span>
            	<select id="dpCodeSelectedBox" name ="dpCodeSelected">
					<option value="">부서선택</option>
					<c:forEach var = "dpList" items="${dpList}">
						<option value="${dpList.DPCODE }">
							${dpList.DPNAME }
						</option>
						</c:forEach>
				</select>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" data-dismiss="modal" onClick="requestModifyEmp()" id="requestModifyEmpBtn" class="btn btn primary">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- add Department modal -->
	<div id="addDeptModal" role="dialog" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" data-dismiss="modal" class="close">&times;</button>
            <h4 class="modal-title">부서추가</h4>
          </div>
          <div id="addDeptBody" class="modal-body">
            <div>
            	<table class="table table-striped">
            		<tr>
            			<th></th>
            			<th>부서이름</th>
            		</tr>
            		
            		<c:forEach var = "dpList" items="${dpList}">
            		<tr value="${dpList.DPCODE}">
            			<td></td>
            			<td><c:out value="${dpList.DPNAME}" /></td>
						</c:forEach>
					</tr>
				</table>
            </div>
            <div>
            	<input name="deptInputBox" id="deptInputBox" type="text" style=display:none placeholder="부서명" />
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" onClick="showAddDeptBox()" id="showAddDepBtn" class="btn btn primary">부서추가</button>
            <button type="button" style=display:none data-dismiss="modal" onClick="requestAddDept()" id="requestAddDepBtn" class="btn btn primary">확인</button>
            <button type="button" data-dismiss="modal" class="btn btn-default">닫기</button>
          </div>
        </div>
      </div>
    </div>
</div>