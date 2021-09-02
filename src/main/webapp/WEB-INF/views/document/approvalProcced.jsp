<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
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
<title>결재진행함</title>
</head>
<body>
<h1>approvalProceed</h1>
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

  				<button id="search">search
          </button>
 			</div>
  			</div>
  
  			<div id="bottom_input">
  				<br><br><br>
    			<button id="delete">DELETE
          </button>
  				<div class="docList">
  				<br><br> 문서번호	제목	문서상태	문서종류	작성자	날짜
  				<br><br> 
  					<input type="checkbox" name="docCheck"	/> 
 				<br><br><br>
         <input type="date" class="date1"/>
         <input type="date" class="date2"/>
  				</div>
  					-1 2 3 4 5-
  				</div>
=======
	<meta charset="UTF-8">
	<title>ApprovalProcced</title>
	
	<!-- Resources JS -->
	<script src="/resources/js/login/main.js"></script>
	<!-- Bootstrap core CSS -->
	<link href="/webjars/bootstrap/3.4.1/css/bootstrap.css" rel="stylesheet">
	<!-- JQuery -->
	<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
	<!-- popper.js -->
	<script src="/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
	<!-- Font-Awesome -->
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Resources CSS -->
	<link href="/resources/css/login/main.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../utils/navigation.jsp" />
>>>>>>> f0643571cbf2e66b36c42e3d0553388f988cc6e4
</body>
</html>