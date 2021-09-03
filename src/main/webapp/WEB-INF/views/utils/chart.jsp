<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h1 class="page-header">결재대기함</h1>

	<div class="row placeholders">
		<div class="searchBox">
					<div class="inputBox">
						<div>
							<div class="docNum">
								<label for="dmNum">문서번호</label>	
								<input type="text" name="dmNum"/>
							</div>
							<div class="docTitle">
								<label for="dmTitle">제목</label>
								<input type="text" name="dmTitle">
							</div>
						</div>
						<button id="searchBtn">검색</button>
					</div>
					<div class="searchOptionBox">
						<div class="dmCodeBox">
							<label for="dmCode">문서종류</label>
							<select name="dmCode">
								<option>페이지 로드시 db에서받아옴</option>
							</select>
						</div>
						<div class="dateOption">
							<div class="startDateBox">
								<label for="dmDateStart">START DATE</label>
								<input type="date" name="dmDateStart" />
							</div>
							<div class="endDateBox">
								<label for="dmDateEnd">END DATE</label>
								<input type="date" name="dmDateEnd" />
							</div>
						</div>
					</div>
				</div>
	</div>

	
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