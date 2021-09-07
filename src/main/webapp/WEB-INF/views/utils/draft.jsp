<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

	<h1 class="page-header">MyDraft</h1>

	<form>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서번호</label>
			</div>
			<div class="form-group col-md-11">
				 <input type="text" class="form-control" name="dmNum" placeholder="문서번호">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">제목</label>
			</div>
			<div class="form-group col-md-11">
				 <input type="text" class="form-control" name="dmTitle" placeholder="제목">
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서상태</label>
			</div>
			<div class="form-group col-md-5">
				<select name="apCode"
					class="form-control">
					<option>선택</option>
					<option value="P">진행</option>
					<option value="C">완료</option>
					<option value="R">반려</option>
					<option value="D">보류</option>
					<option value="F">회수</option>
				</select>
			</div>
			<div class="form-group col-md-1">
				<label for="inputDocumentNum">문서종류</label>
			</div>
			<div class="form-group col-md-5">
				<select name="dmCode"
					class="form-control">
					<option>선택</option>
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
				<input type="date" class="form-control" name="dmDate"/>
			</div>
			<div class="form-group col-md-5">
				<input type="date" class="form-control" name="dmDate"/>
			</div>
			<div class="form-group col-md-1">
				<input type="button" class="btn btn-primary" value="Search" onClick="sampleFunction()"/>
			</div>
		</div>
		
	</form>

		<h2 class="sub-header">Section title</h2>
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