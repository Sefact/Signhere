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

function confirmDel(){
	let empToDel = document.querySelectorAll(".empListRow");
	let arr=[];
	
	for(let i =0; i<empToDel.length; i++){
		if(empToDel[i].checked == true){
			arr.push(empToDel[i].value);
		}
	}
	
	if(confirm(arr.length+"명의 직원을 정말 삭제합니까?")){
		requestDelEmp(arr);
	}
}


function requestDelEmp(empToDel){
	let objArray = {"userIdArr":empToDel};
	console.log(objArray);
	fetchAjax("/delEmployee",'post',objArray,afterDelEmp);
}

function afterDelEmp(data){
	alert(data+"명 삭제완료");
	location.reload();
}

function searchEmployee(){
	const userName = document.getElementsByName("userName")[0].value;
	const grCode = document.getElementsByName("grCode")[0].value;
	const dpCode = document.getElementsByName("dpCode")[0].value;
	
	const jsonData = {userName:userName, grCode:grCode, dpCode:dpCode};
	
	fetchAjax("/searchEmp",'post',jsonData,afterSearch);
}

function afterSearch(data){
	let empList = JSON.parse(data);
	console.log(empList[0].userId);
	empListBody = document.querySelector("#empListBody");
	empListBody.innerHTML="";
	let tr = ``;
	for(i=0; i<empList.length; i++){
		console.log(i);
		tr += `<tr>
					<td><input type="checkBox" class="empListRow" value="${empList[i].userId}"></td>
					<td>${empList[i].userId}</td>
					<td>${empList[i].userName}</td>
					<td>${empList[i].grName}</td>
					<td>${empList[i].dpName}</td>
				</tr>`
	}
	empListBody.innerHTML = tr;
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
		location.reload();
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