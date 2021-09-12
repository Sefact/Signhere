function searchText() {

	const dmNum = document.getElementsByName("dmNum")[0].value;
	const dmTitle = document.getElementsByName("dmTitle")[0].value;
	const dmWriter = document.getElementsByName("dmWriter")[0].value;
	const dmCode = document.getElementsByName("dmCode")[0].value;
	const dmDate = document.getElementsByName("dmDate")[0].value;
	const dmDate2 = document.getElementsByName("dmDate2")[0].value;
	
	
fetch('/searchText',{
		method:'post',
		headers:{
			'Accept': 'application/json, text/plain, */*',
			'Content-Type':'application/json'
		},
		body: JSON.stringify({
			dmNum : dmNum,
			dmTitle : dmTitle,
			dmWriter : dmWriter,
			dmCode : dmCode,
			dmDate : dmDate,
			dmDate2 : dmDate2
		})
	}).then(res =>{
		if(res.ok){
		return res.json()	
		}else{
			console.error(`HTTP error status: ${res.status}`)
		}
	}) 
	.then(jsonData =>{
		console.log(jsonData)
	}).catch(err=>{
		console.log(err)
	});

	
}

function showAddModal(){
	$('#addModal').modal('show');
}

function requestAddNewEmp(){
	const userId = document.querySelector("#userIdNewBox").value;
	const userName = document.querySelector("#userNameNewBox").value;
	const grCode = document.querySelector("#grGradeNewBox").value;
	const dpCode = document.querySelector("#dpCodeNewBox").value;
	
	const jsonData = {userId:userId,userName:userName,grCode:grCode,dpCode:dpCode};
	
	fetchAjax('/addEmployee','post',jsonData,afterAddEmp);
}

function afterAddEmp(data){
	let result = JSON.parse(data);
	if(result ===1){
		alert("직원추가 성공");
	}else{
		alert("네트워크오류 다시시도해주세요.");
	}
	location.reload();
}

function showDelModal(){
	$('#delModal').modal('show');
}

function searchEmployee(){
	
}


function deleteDoc(){
	const docListItems = document.querySelectorAll(".docListRow");
	let arr=[];
	let objArray;


	for(let i =0; i< docListItems.length; i++){
		if(docListItems[i].checked ==true){
			arr.push(docListItems[i].value);
		}
	}
	objArray={"dmNumArr":arr}

	fetch('/apListRemove',{
		method:'post',
		headers:{
			'Accept': 'application/json, text/plain, */*',
			'Content-Type':'application/json'
		},
		body: JSON.stringify(objArray)
	}).then(res =>{
		if(res.ok){
		return res.json()	
		}else{
			console.error(`HTTP error status: ${res.status}`)
		}
	}) 
	.then(jsonData =>{
		console.log(jsonData)
	}).catch(err=>{
		console.log(err)
	});
}

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