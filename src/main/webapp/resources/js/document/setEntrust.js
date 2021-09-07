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

function makeForm(action, method, name = null) {
	let form = document.createElement("form");
	
	if(name != null){
		form.setAttribute("name", name);
	}
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	
	return form;
}