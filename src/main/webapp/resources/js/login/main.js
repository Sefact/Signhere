/**
 * 
 */


function changePage(pageName,method){
	let form = makeForm(pageName, method);
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 내가보낸기안
function myDraft() {

	
	let form = makeForm("myDraft", "post");
	
	document.body.appendChild(form);
	form.submit();

	}
	
	
	
function clicktest(data){
	alert(data);
	
	
	
}	
	


// 내가보낸시행
function myEnforceMent() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("myEnforceMent", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 결제대기함
function waitApproval() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("apToDoList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 결제진행함
function approvalProcced() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("apIngList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 완료 문서함
function completeApproval() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("apCompleteList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 반려 문서함
function companionApproval() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("apReturnList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 보류 문서함
function deferList() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("deferList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 참조열람 문서함
function referenceApproval() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("apReferenceList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 공문 수신함
function receiveNotice() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("receiveList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 개인 보관함
function myList() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("myList", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 위임권 관리
function setEntrust() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("setEntrust", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 직원관리
function admin() {
	//const userId = document.getElementsByName("userId")[0];
	
	let form = makeForm("admin", "post");
	
	//form.appendChild(userId);
	
	document.body.appendChild(form);
	form.submit();
}

// 결재문서 관리
function apListAdmin() {
	
	let form = makeForm("apListAdmin", "post");
	
	//form.appendChild(userId);
	
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