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