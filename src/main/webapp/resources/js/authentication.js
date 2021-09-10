/**
 * 
 */

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