function fetchAjax(action,method,data,afterFunction){
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
	.then(jsonData =>{		
		//parameter에 JSON화 시켜줘야함! 안그럼 object로 인식한다.
		afterFunction(JSON.stringify(jsonData));
		console.log(jsonData);
	}).catch(err=>{
		console.log(err);
	});
}

function showDocDetail(dmNum){
	fetchAjax("/documentBox","post", dmNum, handleDocDetail);
}

function handleDocDetail(jsonData){
	let responseData = JSON.parse(jsonData);
	console.log(responseData);
}

function addToMyList(){
	let docList = document.querySelectorAll(".docListRow");
	let listSize = docList.length;
	let arr = [];
	
	for(i=0; i<listSize; i++){
		if(docList[i].checked == true){
			arr.push(docList[i].value);
		}
	}
	
	let objectArr = {"dmNumArr":arr};
	
	fetchAjax("/goMyList","post", objectArr, handleAddMyList);
}

function handleAddMyList(data){
	JSON.parse(data);
	console.log(data);
	location.reload();
	
}

function delMyList(){
	let docList = document.querySelectorAll(".docListRow");
	let listSize = docList.length;
	let arr = [];
	
	for(i=0; i<listSize; i++){
		if(docList[i].checked == true){
			arr.push(docList[i].value);
		}
	}
	
	let objectArr = {"dmNumArr":arr};
	
	fetchAjax("/delMyList","post", objectArr, handleDelMyList);
}

function handleDelMyList(data){
	JSON.parse(data);
	console.log(data);
	location.reload();
}

function searchText(apCode,searchCode) {
	
	const dmNum = document.getElementsByName("dmNum")[0].value;
	const dmTitle = document.getElementById("dmTitle").value;
	let dmWriter = "";
	let dmCode = document.getElementById("dmCode").value;
	const dmDate = document.getElementsByName("dmDate")[0].value;
	const dmDate2 = document.getElementsByName("dmDate")[1].value;
	
	if(dmCode == "선택"){
		dmCode ="";
	}
	if(searchCode == "RF"){
		const apCode = document.getElementById("apCode").value;
	}
	
	console.log(dmCode);
	
	let searchParams ={
			dmNum : dmNum,
			dmTitle : dmTitle,
			dmWriter : dmWriter,
			searchCode : searchCode,
			apCode : apCode,
			dmCode : dmCode,
			dmDate : dmDate,
			dmDate2 : dmDate2}
			
		fetchAjax('searchText','post',searchParams,handleSearch);
	
}

function handleSearch(data){
	let docList = JSON.parse(data);
	
	docListBody = document.querySelector("#docListBody");
	docListBody.innerHTML="";
	let tr = ``;
	if(docList[0].dmNumCheck != "0"){
		for(i=0; i<docList.length; i++){
		
		tr += `<tr>
					<td><a href="/documentBox?dmNumCheck=${docList[i].dmNum}" >${docList[i].dmNum}</td>
					<td>${docList[i].dmTitle}</td>
					<td>${docList[i].dmName}</td>
					<td>${docList[i].dmWriter}</td>
					<td>${docList[i].dmDate}</td>
				</tr>`
		}
	}else{
		tr += `<tr></tr>`
		alert(`해당문서는 존재하지 않습니다.`);
	}
	
	docListBody.innerHTML = tr;
}