/**
 * 
 */

/*
function entrustSave() {
	var etReason = document.getElementsByName("etReason")[0];
	var etReceiverId = document.getElementsByName("etReceiverId")[0];
	
	alert(etReason.value + " : " + etReceiverId.value);
	
	let form = makeForm("saveEntrust", "post");

	form.appendChild(etReason);
	form.appendChild(etReceiverId);
	
	document.body.appendChild(form);
	
	//console.log(form);
	
	form.submit();
}
*/

/*function entrustDel() {
	var etNum = document.querySelector('input[name="etNum"]:checked').value;
	
	console.log(etNum);
	
	let form = makeForm("disCheckEntrust", "post");

	form.append(etNum);
	
	document.body.append(form);
	
	form.submit();
}*/

function makeForm(action, method, name = null) {
	let form = document.createElement("form");
	
	if(name != null){
		form.setAttribute("name", name);
	}
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	
	return form;
}