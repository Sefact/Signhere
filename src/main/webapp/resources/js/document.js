/**
 * 
 */
function setEntrust() {
	const userId = "userId";
	
	let form = makeForm("setEntrust", "post");
	
	form.append(userId);
	
	document.body.append(form);
	form.submit();
}

function writeApproval() {
	const userId = "userId";
	
	let form = makeForm("setEntrust", "post");
	
	form.append(userId);
	
	document.body.append(form);
	form.submit();
}

function waitApproval() {
	const userId = "userId";
	
	let form = makeForm("apToDoList", "post");
	
	form.append(userId);
	
	document.body.append(form);
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