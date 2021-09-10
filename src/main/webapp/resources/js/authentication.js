/**
 * 
 */
function fetchAjax(action,method,data,afterfunction){
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
	.then(jsonData => {
		afterfunction(JSON.stringify(jsonData));
	}).catch(err=>{
		console.log(err)
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

function requestSignUp(){
	const cmCode = document.getElementsByName("cmCode")[0];
	const cmName = document.getElementsByName("cmName")[0];
	const userId = document.getElementsByName("userId")[0];
	const userName = document.getElementsByName("userName")[0];	
	const userPwd = document.getElementsByName("userPwd")[0];
	const checkUserPwd = document.getElementsByName("checkUserPwd")[0];
	const userMail = document.getElementsByName("userMail")[0];

	let form = makeForm("joinRequest","post");
	
	form.appendChild(cmCode);
	form.appendChild(cmName);
	form.appendChild(userId);
	form.appendChild(userName);
	form.appendChild(userPwd);
	form.appendChild(checkUserPwd);
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
	const checkUserPwd = document.getElementsByName("checkUserPwd")[0];
	
	
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
	const codeComp = /^[a-z]{1}[a-z|0-9]{3,11}$/g;
		
	const pwdComp1 = /[a-z]/g;
	const pwdComp2 = /[A-Z]/g;
	const pwdComp3 = /[0-9]/g;
	const pwdComp4 = /[!@#$%^&*]/g;
	
	if(type ==1){
		result= codeComp.test(word);
		} else if(type ==2){
			let count=0;
			
			count += pwdComp1.test(word)? 1: 0;
			count += pwdComp2.test(word)? 1: 0;
			count += pwdComp3.test(word)? 1: 0;
			count += pwdComp4.test(word)? 1: 0;
			result = (count>=3)? true: false;				
			}			
		return result;			
}


//아이디중복체크. 유효성 = 영문으로 시작 12자 이상//
function dupCheck(obj){
	
	let userId = document.getElementsByName("userId")[0];
	
	let jsonData={userId:userId.value};
	
	if(obj.value != "재입력"){		
		//아이디 유효성 검사
		if(!isValidateCheck(1, userId.value)){			
			userId.value="";
			userId.focus();		
			return;					
		}
			fetchAjax('/employeeDup','post',jsonData,afterDupCheck);
							
		}else{
			userId.value="";
			userId.readOnly = false;
			userId.focus();
			obj.value = "중복검사";
		} 	
	}
	
function afterDupCheck(jsonData){
	jsonData = JSON.parse(jsonData);
	
	let btn = document.getElementById("dupBtn");
	let userId = document.getElementsByName("userId")[0];
	let msg = document.getElementById("message");
	
	if(jsonData.message=="사용가능"){
	userId.setAttribute("readOnly",true);
	btn.setAttribute("value", "재입력");
	msg.innerText = "사용 가능한 아이디";
	 
}else{
		userId.value="";
		msg.innerText = "사용 불가능한 아이디";
		userId.focus();
}
}

function pwdValidate(obj){
	let pwdMsg=document.getElementById("pwdMsg");
	
	if(charCount(obj.value,8,12)){
		if(!isValidateCheck(2,obj.value)){
			obj.value="";
			obj.focus();
			pwdMsg.innerText = "비밀번호는 영소문자,대문자,숫자,특수문자를 3가지 이상 혼합하여야 합니다.";			
		}else{
			pwdMsg.innerText="비밀번호가 .. 맞..습니다..";
		}	
	}else{
		pwdMsg.innerText = "비밀번호 글자수를 8~12이내로 입력하세요.";
	}	
}

function pwdConfirm(obj){
	let pwdMsg2=document.getElementById("pwdMsg2");
	
	let aCode=document.getElementsByName("aCode");
	if(!(aCode[0].value==aCode[1].value)){
		pwdMsg2.innerText="비번이 일치하지 않습니다.";
		aCode[1].value="";
		aCode[1].focus();
		
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


