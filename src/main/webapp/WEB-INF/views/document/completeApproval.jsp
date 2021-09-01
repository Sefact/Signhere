<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#search {
	position: absolute;
	top: 50px;
	right: 30%;
	width: 100px;
	height: 140px;
	font-size: 30px;
}

#delete {
	position: absolute;
	top: 30%;
	right: 30%;
	width: 80px;
	height: 40px;
	font-size: 15px;
}

.delDoc {
	position: absolute;
	right: 20%;
	width: 300px;
	padding: 10px
}

.docList {
	rigtht: 20px;
}

.date1 {
	position: absolute;
	right: 45%;
	top: 20%;
	width: 150px;
	height: 20px;
	padding: 10px
}

.date2 {
	position: absolute;
	right: 45%;
	top: 24%;
	width: 150px;
	height: 20px;
	padding: 10px
}
</style>


<meta charset="UTF-8">
<title>결재완료함</title>
</head>
<body>
<h1>completeApproval</h1>
  	<div id="top_input">
    		<div id="top_class">
				<input type="text" name="docNum" placeholder="문서번호"/>
  					<br>
				<input type="text" name="grade" placeholder="제목"/>
  					<br>
				<input type="text" name="writer" placeholder="작성자"/>
  					<br>
		docCode<select name="docCode"> 
					<option value="draft">기안</option>
					<option value="help">시행</option>
				</select>
  			<div class="search">
  				<input type="button" name="search" value="검색" />
 			</div>
  			</div>
	</div>
  
  			<div id="bottom_input">
  				<br><br><br>
  				<div class="delDoc">
 					 <input type="button" name="delDoc" value="문서삭제" />
  				</div>
  				<div class="docList">
  				<br><br> 문서번호	제목	문서종류	작성자	날짜
  				<br><br> 
  					<input type="checkbox" name="docCheck"	/> 
 				<br><br><br>
  				</div>
  					-1 2 3 4 5-
  				</div>
</body>
</html>