/**
 *
 */
function postAjax(jobCode, clientData, fn, header){
   /* Step 1*/
   let ajax = new XMLHttpRequest();
      
   /* Step2 */
   ajax.onreadystatechange = function(){
      if(ajax.readyState == 4 && ajax.status == 200){
         /* Step 5 */
         window[fn](JSON.parse(ajax.responseText));
      }
   };
   /* Step 3 */
   ajax.open("POST", jobCode);
   /* Step 4 */
   //ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   ajax.setRequestHeader("Content-type", header);
   ajax.send(clientData);
}

function getAjax(jobCode, clientData, fn){
   /* Step 1*/
   let ajax = new XMLHttpRequest();
   
   /* Step2 */
   ajax.onreadystatechange = function(){
      if(ajax.readyState == 4 && ajax.status == 200){
         /* Step 5 */
         window[fn](JSON.parse(ajax.responseText));
      }
   };
   
   /* Step 3 */
   if(clientData != ""){ jobCode += "?" + clientData; }
   ajax.open("GET", jobCode);
   /* Step 4 */
   ajax.send();

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

function makeForm(action, method, name = null) {
	let form = document.createElement("form");	
	if(name != null){
		form.setAttribute("name", name);
	}
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	
	return form;
	}
}

function requestAddNewEmp(){
	const userId = document.querySelector("#newEmpId").value;
	const userName = document.querySelector("#newEmpName").value;
	const grCode = document.querySelector("#newEmpGrade").value;
	const dpCode = document.querySelector("#empCode").value;
	
	const jsonData = {userId:userId,userName:userName,grCode:grCode,dpCode:dpCode};
	
	fetchAjax('/addEmployee','post',jsonData,afterAddEmp);
}

function afterAddEmp(data){
	let result = JSON.parse(data);
	if(result==1){
		alert("직원추가 완료");
	}else{
		alert("직원추가 실패. 정보를 다시 입력해주세요");
	}
	location.reload();
}

