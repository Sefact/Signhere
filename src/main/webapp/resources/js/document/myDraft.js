/**
 * 
 */


function sampleFunction() {
	
	
	const dmNum = document.getElementsByName("dmNum")[0];
	const dmTitle = document.getElementsByName("dmTitle")[0];
	const dmWriter = document.getElementsByName("dmWriter")[0];
	const apCode = document.getElementsByName("apCode")[0];
	const dmCode = document.getElementsByName("dmCode")[0];
	const dmDate = document.getElementsByName("dmDate")[0];
	const dmDate2 = document.getElementsByName("dmDate2")[0];
	
	let form = makeForm("searchText", "post");
	
	form.appendChild(dmNum);
	form.appendChild(dmTitle);
	form.appendChild(dmWriter);
	form.appendChild(apCode);
	form.appendChild(dmCode);
	form.appendChild(dmDate);
	form.appendChild(dmDate2);

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



function addFile(){
	let fileNum = document.querySelectorAll(".fileInputBox").length;
	
	if(fileNum<3){
		console.log("왜또안와");
	
	let fileBox = document.querySelector(".fileBox");
	
	let fileInputBox = document.createElement("input");
	
	fileInputBox.type="file";
	fileInputBox.style.display="none";
	fileInputBox.name="file";
	
	fileInputBox.classList.add("fileInputBox");

	console.log(fileNum);
	
	fileInputBox.classList.add("fileBox"+ fileNum);
	
	console.log(fileBox);
	console.dir(fileBox);
	
	fileBox.appendChild(fileInputBox);
	
	fileInputBox.click();
	
	fileInputBox.addEventListener('change',setThumbnail = (e) =>{
		
	for(var image of event.target.files){
	
	var reader = new FileReader();
	
	
	reader.onload = function (event){
		var img = document.createElement("img");
		img.setAttribute("src",event.target.result);
		img.width="200px";
		img.height="200px"
		document.querySelector("div#image_container").appendChild(img);
	
		
	};
	
	console.log(image);
	reader.readAsDataURL(image);
	
	}
	})
	
	}else{
		alert("최대 3개까지만 추가 가능합니다");
	}
}



/*
function setThumbnail(event){
	//파일삭제기능 고려해야 함..
	for(var image of event.target.files){
	
	var reader = new FileReader();
	
	
	reader.onload = function (event){
		var img = document.createElement("img");
		img.setAttribute("src",event.target.result);
		img.width="200px";
		img.height="200px"
		document.querySelector("div#image_container").appendChild(img);
	
		
	};
	
	console.log(image);
	reader.readAsDataURL(image);
	
	}
}
*/

function saveDocFiles(){
	$('#apCommentModal').modal('show');

}

function showSignatureModal(){
	$('#apSignatureModal').modal('show');
}

function handleSignature(){
	alert("문서 기안완료!");
}

let canvas = document.querySelector("#inputCanvas");
let signaturePad = new SignaturePad(canvas);
signaturePad.clear();
//let readCanvas = document.queryselector("#readCanvas");
//let readPad = new SignaturePad(readCanvas);


signaturePad.minWidth = 0.5;
signaturePad.maxWidth = 3;
signaturePad.penColor = "rgb(0, 0, 0)";
/*
signaturePad.toDataURL(); // save image as PNG
signaturePad.toDataURL("image/jpeg"); // save image as JPEG
signaturePad.toDataURL("image/svg+xml"); // save image as SVG
*/
// Draws signature image from data URL.
// NOTE: This method does not populate internal data structure that represents drawn signature. Thus, after using #fromDataURL, #toData won't work properly.
//signaturePad.fromDataURL("data:image/png;base64,iVBORw0K...");



// Draws signature image from an array of point groups
//signaturePad.fromData(data);

// Returns true if canvas is empty, otherwise returns false
//signaturePad.isEmpty();

// Unbinds all event handlers
//signaturePad.off();

// Rebinds all event handlers
//signaturePad.on();


// Clears the canvas
document.getElementById('clear').addEventListener('click', function () {
  	console.log(signaturePad);
	signaturePad.clear();
	var ctx = canvas.getContext('2d');
	ctx.globalCompositeOperation = 'source-over'; 
});

document.getElementById('confirm').addEventListener('click', function(){
	// Returns signature image as an array of point groups
	if (signaturePad.isEmpty()) {
    return alert("Please provide a signature first.");
  }
	//empty formData object. JS FormData API
	let formData = new FormData();

	let file = document.getElementsByName("file")[0];
	let apComment = document.getElementsByName("acReason")[0].value;

	//signature file binaryData 
	const data = signaturePad.toDataURL('image/png');
	
	console.log("폼 API"+formData);
	console.log("업로드 문서파일"+file);
	console.log(file.value);
	console.log("결재의견"+apComment);
	console.log("사인파일"+data);
	
	formData.append('fileList', file);
	formData.append('apComment',apComment);
	formData.append('signature',data);
	
	
	fetch('upLoadDocFiles',{
		method:'POST',
		body: formData,
	})
	.then(res => res.json())
	.then(data => {
		alert("성공!");
		console.log(data);
	})
	.catch(err => {
		alert("실패");
		console.log("Error:" + err);
	})
	
});


function resizeCanvas() {
    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
    canvas.width = canvas.offsetWidth * ratio;
    canvas.height = canvas.offsetHeight * ratio;
    canvas.getContext("2d").scale(ratio, ratio);
    signaturePad.clear(); // otherwise isEmpty() might return incorrect value
}

window.addEventListener("resize", resizeCanvas);
resizeCanvas();

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
		console.log(JSON.stringify(jsonData));
		console.dir(JSON.stringify(jsonData));
		afterfunction(JSON.stringify(jsonData));
	}).catch(err=>{
		console.log(err)
	});
}