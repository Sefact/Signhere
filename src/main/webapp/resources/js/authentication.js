/**
 * 
 */
var dupCmCheck;
var userIdCheck;
var userMailCheck;

var newIdCheck;


function fetchAjax(action,method,data,afterFunction){
fetch(action,{
		method:method,
		headers:{
			'Accept': 'application/json, text/plain, */*',
			'Content-Type':'application/json'
		},
		body: JSON.stringify(data)
	}).then(res =>{
		if(res.ok){
		return res.json()	
		}else{
			console.error(`HTTP error status: ${res.status}`)
		}
	}) 
	.then(jsonData =>{		
		//parameter에 JSON화 시켜줘야함! 안그럼 object로 인식한다.
		afterFunction(JSON.stringify(jsonData));
		console.log(jsonData);
	}).catch(err=>{
		console.log(err);
	});
}


function sendUserInfo() {
	const userId = document.getElementsByName("userId")[0];
	const userPwd = document.getElementsByName("userPwd")[0];
	
	let form = makeForm("login", "post");
	
	form.appendChild(userId);
	form.appendChild(userPwd);
	
	document.body.appendChild(form);

	form.submit();
}

function signUpPage(){
	let form = makeForm("join","Post");
	document.body.appendChild(form);
	form.submit();
}

function findPwdPage(){
	let form = makeForm("findPwd","Post");
	document.body.appendChild(form);
	form.submit();
}

function requestSignUp(){
	const cmCode = document.getElementsByName("cmCode")[0];
	const cmName = document.getElementsByName("cmName")[0];
	const userId = document.getElementsByName("userId")[0];
	const userName = document.getElementsByName("userName")[0];	
	const userPwd = document.getElementsByName("userPwd")[0];
	const userMail = document.getElementsByName("userMail")[0];
	
	if(dupCmCheck=="true"){
		if(userIdCheck=="true"){
			if(userMailCheck=="true"){
				let form = makeForm("joinRequest","post");
				form.appendChild(cmCode);
				form.appendChild(cmName);
				form.appendChild(userId);
				form.appendChild(userName);
				form.appendChild(userPwd);
				form.appendChild(userMail);
				document.body.appendChild(form);
				form.submit();				
			}			 else{ 
				alert("이메일 중복체크 부탁드립니다.");					
			}
		}		
			else{ 
		alert("아이디 중복체크 부탁드립니다.");			
		}
	}	else {   
	 alert("회사코드 중복체크 부탁드립니다.");			
	}

}


function makeForm(action, method, name = null) {
	let form = document.createElement("form");
	
	if(name != null){
		form.setAttribute("name", name);
	}
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	
	return form;
}



function requestNewInfo(){
	
	const cmName=document.getElementsByName("cmName")[0];
	const userName=document.getElementsByName("userName")[0];
	const dpName=document.getElementsByName("dpName")[0];
	const grName=document.getElementsByName("grName")[0];	
	const userMail=document.getElementsByName("userMail")[0];
	const userPwd=document.getElementsByName("userPwd")[0];

	
	
	let form = makeForm("newInfoAccess","post");
	
	form.appendChild(cmName);
	form.appendChild(userName);
	form.appendChild(dpName);
	form.appendChild(grName);
	form.appendChild(userMail);
	form.appendChild(userPwd);
	
	document.body.appendChild(form);
	
	form.submit();
	
}


function logOut(){
	
	let form = makeForm("logOut","get");
	
	document.body.appendChild(form);
	
	form.submit();
}


function myInfoAccess(){
	
	let form = makeForm("myInfoAccess","post");
	
	document.body.appendChild(form);
	
	form.submit();
}



function myInfo(){
	
	let userId = document.getElementsByName("userId")[0];
	let userPwd = document.getElementsByName("userPwd")[0];
	
	let form = makeForm("myInfoConfirm","post");
	
	form.appendChild(userId);
	form.appendChild(userPwd);
		
	document.body.appendChild(form);
	
	form.submit();
}


//회사코드,아이디,비밀번호 유효성체크
function isValidateCheck(type, word){
	let result;
	//회사코드(cmCode) 유효성체크 type을 0으로
	const cmCodeComp=/^[0-9]{10}$/;
	
	//아이디(userId) 유효성체크
	const userIdComp = /^[a-z]{1}[a-z|0-9]{3,11}$/g;
	
	//비밀번호(userPwd) 유효성체크	
	const pwdComp1 = /[a-z]/g;
	const pwdComp2 = /[A-Z]/g;
	const pwdComp3 = /[0-9]/g;
	const pwdComp4 = /[!@#$%^&*]/g;
	
	if(type==0){
		result= cmCodeComp.test(word);
	}
	if(type==1){
		result= userIdComp.test(word);
		} else if(type==2){
			let count=0;
			count += pwdComp1.test(word)? 1: 0;
			count += pwdComp2.test(word)? 1: 0;
			count += pwdComp3.test(word)? 1: 0;
			count += pwdComp4.test(word)? 1: 0;
			result = (count>=3)? true: false;
			console.log(count);
			console.log(result);				
			}			
		return result;			
}

//회사코드가 양식에 맞지않고 다른 곳을 클릭했을 때 나오는 function
function dupCmCodeCheckblur(){
	
	let cmCode=document.getElementsByName("cmCode")[0];
	
	
	if(!isValidateCheck(0,cmCode.value)){
		cmCode.value="";
		alert("회사코드가 사업자번호양식에 맞지 않습니다");
		
		setTimeout(function(){
			cmCode.focus();
		},2000);
				
	}
	
}


//회사코드 중복체크. 유효성 = 숫자 10자리
function dupCmCodeCheck(){
	
	let cmCode=document.getElementsByName("cmCode")[0];
	
	let jsonData={cmCode:cmCode.value};
	
	if(!isValidateCheck(0,cmCode.value)){
		cmCode.value="";
		cmCode.focus();
		alert("회사코드가 사업자번호양식에 맞지 않습니다");				
	}
		fetchAjax('/employerDup','post',jsonData,dupCheckCmCode2)
	
}

//innerHTML. 아이디 중복체크하여 이상없을시 input type을 readOnly로 바꿔줌. 사용가능 alert창 띄워줌.

function dupCheckCmCode2(jsonData){
	jsonData=JSON.parse(jsonData);
	
	let cmCode = document.getElementsByName("cmCode")[0];
	
	BtnCmCode2 = document.getElementById("dupBtnCmCode2");
	
	if(isValidateCheck(0,cmCode.value)){
	if(jsonData.message=="사용가능"){
		alert("사용가능한 회사코드 입니다.");
		  setTimeout(function(){
			   cmCode.readOnly=true;
		        },300);
		BtnCmCode2.innerHTML="<input type='button' value='재입력' onClick='reDupBtnCmCode()'>";
		
		dupCmCheck="true";
	  } else {
		       alert("이미존재하는 회사코드 입니다.");
			   cmCode="";
		       setTimeout(function(){
			   cmCode.focus();
		        },300);
		dupCmCheck="false";
	}
	
	}
}

//회사코드 재입력 button.
function reDupBtnCmCode(){
	let cmCode = document.getElementsByName("cmCode")[0];
	alert("사업자코드를 재입력 해주세요.");
	cmCode.readOnly=false;
	cmCode.value="";
	setTimeout(function(){
			cmCode.focus();
		},300);
	
}



//아이디가 양식에 맞지않고 다른 곳을 클릭했을 때 나오는 function
function dupUserIdCheckBlur(){
	
	let userId = document.getElementsByName("userId")[0];
	

		//아이디 유효성 검사
		if(!isValidateCheck(1,userId.value)){			
			userId.value="";			
			alert("ID가 조건에 맞지 않습니다.");
			setTimeout(function(){
			userId.focus();
			},2000);	
		}
	}

//이메일 중복체크
function dupUserMailCheck(){
	
	let userMail = document.getElementsByName("userMail")[0];
	
	let jsonData={userMail:userMail.value};
			fetchAjax('/mailDup','post',jsonData,dupUserMailCheck2);
	}
	
//innerHTML. 아이디 중복체크하여 이상없을시 input type을 readOnly로 바꿔줌. 사용가능 alert창 띄워 줌.
function dupUserMailCheck2(jsonData){
	jsonData = JSON.parse(jsonData);
	
	let dupBtnUserMail2 = document.getElementById("dupBtnUserMail2");
	let userMail = document.getElementsByName("userMail")[0];

	if(jsonData.message=="사용가능"){
	userMail.setAttribute("readOnly",true);

	dupBtnUserMail2.innerHTML="<input type='button' value='재입력' onClick='reDupUserMailCheck()'>";
	userMailCheck="true"
	alert("사용가능한 메일입니다.");
	 }
	   else
		{userMailCheck="false";
			alert("이미 존재하는 메일입니다");
			userMail.value="";
			userMail.focus();
}
}
//메일 재입력 button
function reDupUserMailCheck(){
	let userMail = document.getElementsByName("userMail")[0];
	userMail.readOnly=false;
	userMail.value="";
	userMail.focus();
}


function mailValidate(){
	
	let userMail = document.getElementsByName("userMail")[0].value;

	
	//구체적인  유효성 조건은 나중에 다시 정리하겠습니다..
	var valEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

	if(valEmail.test(userMail))	{	
		
		}else{
			alert("이메일형식에 맞게 입력해주세요.");	
			
		}	
	}


//아이디중복체크. 유효성 = 영문으로 시작 12자 이상//
function dupUserIdCheck(){
	
	let userId = document.getElementsByName("userId")[0];
	
	let jsonData={userId:userId.value};

		//아이디 유효성 검사
		if(!isValidateCheck(1,userId.value)){			
			userId.value="";
			userId.focus();
			alert("ID는 영문으로 시작 12자 이상이여야 합니다.");				
		}
			fetchAjax('/employeeDup','post',jsonData,dupUserIdCheck2);
	}
	
function afterDupCheck(jsonData){
	jsonData = JSON.parse(jsonData);
	
	let btn = document.getElementById("dupBtn");
	let userId = document.getElementsByName("userId")[0];
	let msg = document.getElementById("message");
}
//innerHTML. 아이디 중복체크하여 이상없을시 input type을 readOnly로 바꿔줌. 사용가능 alert창 띄워 줌.
function dupUserIdCheck2(jsonData){
	jsonData = JSON.parse(jsonData);
	
	let dupBtnUserId2 = document.getElementById("dupBtnUserId2");
	let userId = document.getElementsByName("userId")[0];


	if(isValidateCheck(1,userId.value)){
	if(jsonData.message=="사용가능"){
	alert("사용가능한 ID입니다.");
	
	userId.readOnly=true;
	userIdCheck="true";
		      
	dupBtnUserId2.innerHTML="<input type='button' value='재입력' onClick='reDupUserIdCheck()'>";

	 }
	   else
		{
			userIdCheck="false";
			userId.value="";
			alert("이미 존재하는 ID입니다");
				       setTimeout(function(){
			   userId.focus();
		        },300);
			}
		}
	}
//아이디 재입력 button
function reDupUserIdCheck(){
	let userId = document.getElementsByName("userId")[0];
	alert("사용자 ID를 재입력해주세요.");
	userId.readOnly=false;
	userId.value="";
		setTimeout(function(){
			userId.focus();
		},2000);
}

//비밀번호  첫번째칸  name=userPwd[0]
function pwdValidate(obj){
	let pwdMsg=document.getElementById("pwdMsg");	
	if(charCount(obj.value,8,12)){
		if(!isValidateCheck(2,obj.value)){
			alert("비밀번호는 영소문자,대문자,숫자,특수문자를 3가지 이상 혼합하여야 합니다.");	
			obj.value="";
			
			selTimeout(function(){
				
					obj.focus();
			},2000);	
		}else{
			obj.readOnly=false;
			pwdMsg.innerHTML="<span style='font-size:1.2em; color: green;'>사용가능한 비밀번호 입니다. </span>";
		}	
		}if (!charCount(obj.value,8,12)){
			pwdMsg.innerHTML="<span style='font-size:1.2em; color: red;'>비밀번호는 8~12자 이내로 입력해주세요.</span>";
			obj.value="";
			obj.focus();
	}	
}
//비밀번호 두번째칸  name=userPwd[1]
function pwdConfirm(){
	let pwdMsg2=document.getElementById("pwdMsg2");
	let userPwd=document.getElementsByName("userPwd");
	let userPwd2=document.getElementsByName("userPwd2");
	
	if(!(userPwd[0].value==userPwd2[0].value)){
		pwdMsg2.innerHTML="<span style='font-size:1.2em; color: red;'>비밀번호가 일치하지 않습니다. </span>";
		userPwd2[0].value="";
		userPwd2[0].focus();	
		
	}else{
		
		pwdMsg2.innerHTML="<span style='font-size:1.2em; color: green;'>비밀번호가 일치합니다. </span>";
	}	
}



//직원추가 아이디 유효성체크
function userIdNewCheck(obj){
	
	if(!isValidateCheck(1,obj.value)){
		alert("ID는 영소 문자로 시작하여 영소 문자+숫자 포함 12자 이하 여야 합니다. ");
		
	}
}

//fetchAjax(action,method,data,afterfunction)
//직원추가 아이디 중복체크
function userIdNewDupCheck(){
	
	const userId=document.getElementsByName("userIdNew")[0];
	
	
	data={userId:userId.value};
	
	fetchAjax('/employeeDup','post',data,userIdNewDupCheck2);


}

function userIdNewDupCheck2(data){

	data = JSON.parse(data);

	
	const userId=document.getElementsByName("userIdNew")[0];
	
	
	
	if(data.message=="사용불가"){
		alert("이미 존재하는 아이디입니다.")
		userId.value="";		
	 	setTimeout(function(){
		serId.focus();
		 },1000);
		newIdCheck="1";
		
	}else if(data.message=="사용가능"){
		alert("사용가능한 아이디입니다");
	}
	
}



//이름 글자수 유효성체크
function nameCheck(obj){
	
	if(charCount(obj.value,2,5)){
		if(!krCheck(obj.value))	{			
			alert("한글로 입력해주세요.");		
		}
	}else{
		alert("이름은 2-5글자로 입력해주세요");
	}	
}
//한글 유효성체크
function krCheck(obj){	
	const pattern =/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/;

	return pattern.test(obj);
}


function charCount(word, min, max){
	
return word.length>=min && word.length<max;
	
	
}
//비밀번호 찾기 페이지(findPwd.jsp) 아래 function을 누르면 비밀번호 변경 페이지(confirmPwd.jsp)를 메일로 전송.
function confirmPassword(message){

	let all = document.getElementsByName("all");	
	all.submit();
	
	alert(message);
	
}

//confirmPwd.jsp에서 비밀번호 변경을 하는 function. (button)
function reConfirmPassword(message){
	let userId=document.getElementsByName("userId")[0];
	let userPwd=document.getElementsByName("userPwd")[0];
	
	let form = makeForm("callConfirmPwd","post");
	
	form.appendChild(userId);
	form.appendChild(userPwd);
	
	document.body.appendChild(form);
	
	form.submit();
	alert(message);
}


function cancelPassword(){
	
	let form = makeForm("login","get");
	form.appendChild
	form.submit();
	

}

function cancelNewInfo(){
	
	location.href="localhost/login/main.jsp";
	
	
}

