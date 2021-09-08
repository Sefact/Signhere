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