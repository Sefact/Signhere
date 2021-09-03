/**
 * 
 */

function sampleFunction() {
	const dmNum = document.getElementsByName("dmNum")[0];
	const dmTitle = document.getElementsByName("dmTitle")[0];
	const apCode = document.getElementsByName("apCode")[0];
	const dmCode = document.getElementsByName("dmCode")[0];
	const dmDate = document.getElementsByName("dmDate")[0];
	const dmDate2 = document.getElementsByName("dmDate")[1];
	
	let form = makeForm("searchText", "post");
	
	form.appendChild(dmNum);
	form.appendChild(dmTitle);
	form.appendChild(apCode);
	form.appendChild(dmCode);
	form.appendChild(dmDate);
	form.appendChild(dmDate2);
	
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