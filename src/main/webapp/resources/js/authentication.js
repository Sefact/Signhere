/**
 * 
 */
function sendUserInfo() {
	const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("login", "post");
	
	form.appendChild(userId);
	
	document.body.appendChild(form);
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
/*0901*/
function sendJoinInfo() {
	const cmCode = document.getElementsByName("cmCode")[0];
	const cmname = document.getElementsByName("cmname")[0];
	const userId = document.getElementsByName("userId")[0];
	const userName = document.getElementsByName("userName")[0];
	const userPwd = document.getElementsByName("userPwd")[0];
	const confrim = document.getElementsByName("confrim")[0];
	const userEmail = document.getElementsByName("userEmail")[0];
	const grCode = document.getElementsByName("grCode")[0];
	const grDetail = document.getElementsByName("grDetail")[0];
	
	let form = makeForm("join", "post");
	
	form.appendChild(cmCode);
	form.appendChild(cmname);
	form.appendChild(userId);
	form.appendChild(userName);
	form.appendChild(userPwd);
	form.appendChild(confrim);
	form.appendChild(userEmail);
	form.appendChild(grCode);
	form.appendChild(grDetail);
	
	document.body.appendChild(form);
	form.submit();
}