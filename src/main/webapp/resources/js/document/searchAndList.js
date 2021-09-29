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
	fetchAjax("documentBox","post", dmNum, handleDocDetail);
}

function handleDocDetail(jsonData){
	let responseData = JSON.parse(jsonData);
	console.log(responseData);
}