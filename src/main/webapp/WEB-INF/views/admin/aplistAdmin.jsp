<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.search{
  position: absolute;
  right: 0px;
  width: 300px;
 
  padding: 10px
  }

.delDoc{
position: absolute;
  right: 0px;
  width: 300px;
 
  padding: 10px
  
  }
  
  .docList{
    
  rigtht: 20px;
    
    
    }


</style>
<title>aplistAdminPage</title>
</head>
<body>
<h1>aplistAdmin</h1>
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
  				<br><br><brr>
  				<div class="delDoc">
 					 <input type="button" name="delDoc" value="문서삭제" />
  				</div>
  				<div class="docList">
  				<br><br> 문서번호	제목	문서상태	문서종류	작성자	날짜
  				<br><br> 
  					<input type="checkbox" name="docCheck"	/> 
 				<br><br><br>
  				</div>
  					-1 2 3 4 5-
  				</div>
</body>
</html>