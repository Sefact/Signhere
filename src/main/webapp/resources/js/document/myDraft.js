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

function saveDocFiles(){
	let fileList = document.getElementsByName("fileList")[0];
	
	fileList.submit();	

}

function showSignatureModal(){
	$('#apSignatureModal').modal('show');
}

function requestDraft(){
	
}

let canvas = document.querySelector("#iputCanvas");
let signaturePad = new SignaturePad(canvas);
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
  	signaturePad.clear();
	var ctx = canvas.getContext('2d');
	ctx.globalCompositeOperation = 'source-over'; 
});

document.getElementById('confirm').addEventListener('click', function(){
	// Returns signature image as an array of point groups
	if (signaturePad.isEmpty()) {
    return alert("Please provide a signature first.");
  }
	const data = signaturePad.toDataURL('image/png');
	alert(data);
	
	let jsonSignature = {signature:data};
	
	fetchAjax('/saveSignature','post',jsonSignature, handleSignature);
});

function handleSignature(data){
	alert(data);
}

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