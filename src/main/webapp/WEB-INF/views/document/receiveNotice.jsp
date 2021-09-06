<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <style>
   *  {
    padding: 0;
    margin: 0;
}
    #wrap {
    margin: 100px auto;
    width: 700px;
}
    #wrap form {
    border: 1px solid #000;
    padding: 20px;
}
    #search{
    display: flex;
    margin-bottom: 10px;
    
}
    #search .right {
    width: 80%;
}
    
    #search .right article {
    height: 20px;
    margin-bottom: 10px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}
    
    label{
    width: 130px;
    height: 20px;
    margin-right: 20px;
    font-size: 14px;
    text-align: center;
    display: inline-block;
    box-sizing: border-box;
    border: 1px solid black;
}

    
    #search .right input {
    width: 70%;
    height: 100%;
    border: 1px solid black;
}
    
    #search .left {
    width: 20%;
    text-align: center;
}
    
    #search .left input {
    width: 50%;
    height: 100%;

}
    
    .bot {
    display: flex;
    align-items: center;
}
    .bot .doc_kinds {
    /* display: flex; */
    margin-right: 20px;
  
}
    
.bot .doc_kinds select {
    width: 130px;
}
    .bot .date {
    display: flex;
}
    
    .bot .date label {
    height: 100%;
    line-height: 47px;
}
    
    
.bot .date .dat input {
    width: 85%;
}
  </style>
	<title>ReceiveNotice공문수신함</title>
	
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
  <div id="wrap">
        <form action="Document_search" method="POST">
            <div id="search">
                <div class="right">
                    <article class="number">
                        <label for="doc_number">문서번호</label>
                        <input type="text" class="form-control" name="dmNum" >
                    </article>
                    <article class="doc_id">
                        <label for="doc_id">제목</label>
                        <input type="text" class="form-control" name="dmTitle">
                    </article>
                    <article class="writer">
                        <label for="writer">작성자</label>
                        <input type="text" class="form-control" name="dmWriter">
                    </article>
                </div>
                <div class="left">
                    <input type="button" class="pushButton" value="검색" onclick="searchTextFunction()"/>
                </div>
            </div>
            <div class="bot">
                <article class="doc_kinds">
                    <label for="doc_kinds">문서상태</label>
                    <select name="apCode"
		class="form-control">
                      <option value="noneCombo" selected>=============</option>
                       <option value="P">진행</option>
					<option value="C">완료</option>
					<option value="R">반려</option>
					<option value="D">보류</option>
					<option value="F">회수</option>
                    </select>
                </article>
              
              
               <div class = "bot">
                <article class="doc_kinds">
                    <label for="doc_kinds">문서종류</label>
                    <select name="dmCode"
		class="form-control" >
		<!-- 기안 협조 신청 바꿔야함 -->
                      <option value="noneCombo" selected>=============</option>
                        <option value="draf" >기안</option>
                        <option value="cooperation" >협조</option>
                        <option value="application" >신청</option>
                    </select>
                </article>
                
                <article class="date">  
                  <label for="date">날짜</label>
                    <div class="dat">
                        <input type="date" class="form-control" name="dmDate" >
                        <input type="date" class="form-control" name="dmDate" >
                    </div>
                </article>
            </div>
        </form>
    </div>
    
	<jsp:include page="../utils/navigation.jsp" />
</body>
</html>