/**
 * 
 */
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
	
	alert(userId);
	alert(userPwd);
	
	
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
	
	//if(!isValidateCheck(0,cmCode.value)){
	//	alert("회사코드가 사업자번호양식에 맞지 않습니다");	
	//}
	//if(!isValidateCheck(1,userId.value)){
	//	alert("아이디가 조건에 맞지않습니다.");}

	let form = makeForm("joinRequest","post");
	
	form.appendChild(cmCode);
	form.appendChild(cmName);
	form.appendChild(userId);
	form.appendChild(userName);
	form.appendChild(userPwd);
	form.appendChild(userMail);
	
	document.body.appendChild(form);
	
	console.log(form);
	
	form.submit();
		
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


function dupCmCodeCheck(){
	
	let cmCode=document.getElementsByName("cmCode")[0];
	
	let jsonData={cmCode:cmCode.value};
	
	if(!isValidateCheck(0,cmCode.value)){
		cmCode.value="";
		cmCode.focus();
		alert("회사코드가 사업자번호양식에 맞지 않습니다");
		return;					
	}
		fetchAjax('/employerDup','post',jsonData,dupCheckCmCode2)
	
}


function dupCheckCmCode2(jsonData){
	jsonData=JSON.parse(jsonData);
	
	let cmCode = document.getElementsByName("cmCode")[0];
	
	BtnCmCode2 = document.getElementById("dupBtnCmCode2");
	
	if(jsonData.message=="사용가능"){
		alert("사용가능한 회사코드 입니다.");
		cmCode.readOnly=true;
		BtnCmCode2.innerHTML="<input type='button' value='재입력' onClick='reDupBtnCmCode()'>";
	} else{
		
	}
}

function reDupBtnCmCode(){
	let cmCode = document.getElementsByName("cmCode")[0];
	alert("사업자코드를 다시 입력해주세요.");
	cmCode.readOnly=false;
	cmCode.value="";
	cmCode.focus();
	
}



//아이디중복체크. 유효성 = 영문으로 시작 12자 이상//
function dupUserIdCheck(){
	
	let userId = document.getElementsByName("userId")[0];
	
	let jsonData={userId:userId.value};

		//아이디 유효성 검사
		if(!isValidateCheck(1,userId.value)){			
			userId.value="";
			userId.focus();
			alert("ID가 조건에 맞지 않습니다.");
			return;					
		}
			fetchAjax('/employeeDup','post',jsonData,dupUserIdCheck2);
							
			
	}
	
function dupUserIdCheck2(jsonData){
	jsonData = JSON.parse(jsonData);
	
	let dupBtnUserId2 = document.getElementById("dupBtnUserId2");
	let userId = document.getElementsByName("userId")[0];

	if(jsonData.message=="사용가능"){
	userId.setAttribute("readOnly",true);

	dupBtnUserId2.innerHTML="<input type='button' value='재입력' onClick='reDupUserIdCheck()'>";

	alert("사용가능한 ID입니다.");
	 }
	   else
		{
			userId.value="";
			alert("이미 존재하는 ID입니다");
			userId.focus();
}
}

function reDupUserIdCheck(){
	let userId = document.getElementsByName("userId")[0];
	userId.readOnly=false;
	userId.value="";
	userId.focus();
}

function pwdValidate(obj){

	let pwdMsg=document.getElementById("pwdMsg");	
	if(charCount(obj.value,8,12)){
		if(!isValidateCheck(2,obj.value)){
			obj.value="";
			obj.focus();
			//pwdMsg.innerText = "비밀번호는 영소문자,대문자,숫자,특수문자를 3가지 이상 혼합하여야 합니다.";	
			alert("비밀번호는 영소문자,대문자,숫자,특수문자를 3가지 이상 혼합해주세요.");		
		}else{
			pwdMsg.innerHTML="<span style='font-size:1.2em; color: green;'>사용가능한 비밀번호 입니다. </span>";
		}	
		}if (!charCount(obj.value,8,12)){
			pwdMsg.innerHTML="<span style='font-size:1.2em; color: red;'>비밀번호는 8~12자 이내로 입력해주세요.</span>";
			obj.value="";
			obj.focus();
	}	
}
function pwdConfirm(){
	let pwdMsg2=document.getElementById("pwdMsg2");
	let userPwd=document.getElementsByName("userPwd");
	if(!(userPwd[0].value==userPwd[1].value)){
		pwdMsg2.innerHTML="<span style='font-size:1.3em; color: red;'>비밀번호가 일치하지 않습니다. </span>";
		userPwd[1].value="";
		userPwd[1].focus();	
	}else{
		pwdMsg2.innerText="비밀번호가 맞... 습ㄴ..니다";	
	}	
}

function nameCheck(obj){
	
	if(charCount(obj.value,2,5)){
		if(!krCheck(obj.value))	{			
			alert("한글쓰셈");		
		}
	}else{
		alert("이름은 2-5글자로 입력해주세요");
	}	
}

function krCheck(obj){	
	const pattern =/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/;

	return pattern.test(obj);
}


function charCount(word, min, max){
	
return word.length>=min && word.length<max;
	
	
}

function confirmPassword(message){

	let all = document.getElementsByName("all");	
	all.submit();
	
	alert(message);
	
	
	
}

function reConfirmPassword(message){

	let all = document.getElementsByName("all");	
	all.submit();
	
	alert(message);
	
}



