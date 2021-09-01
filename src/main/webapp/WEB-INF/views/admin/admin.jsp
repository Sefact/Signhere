<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#search{
  position: absolute;
  top:50px;
  right: 30%;
  width: 100px;
  height: 140px;
  font-size: 30px;
  }
  
  #delete{
  position: absolute;
  top:30%;
  right: 30%;
  width: 80px;
  height: 40px;
  font-size: 15px;
  }


.delDoc{
position: absolute;
  right: 20%;
  width: 300px;
 
  padding: 10px
  
  }
  
  .docList{
    
  rigtht: 20px; 
    }
    
    
</style>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
</head>


<body>
	<h1>admin</h1>
	<div id="top_input">
    	<div id="top_class">
			<input type="text" name="userName" placeholder="이름"/>
			<br>
			<input type="text" name="grade" placeholder="직급"/>
			<br>
			<input type="text" name="department" placeholder="부서"/>
			<br>
 			<input type="button" name="search" value="검색" />
	 	</div>

	</div>
  
  		<div id="bottom_input">
  			<input type="button" name="addMember" value="직원추가" />
  			<input type="button" name="delMember" value="직원삭제" />
  
  			<br><br> ID NAME GRADE DEPARTMENT
  			<br><br> CONTEXT- CONTEXT -CONTEXT
  			<br><br><br>
  
  			-1 2 3 4 5-
  </div>
</body>
</html>