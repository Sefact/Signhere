
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