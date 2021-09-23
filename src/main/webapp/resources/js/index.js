/*
let websocket = new WebSocket("ws://localhost:80/login");

websocket.onopen = function(event){
	websocket.send('hello ws');
}

websocket.onmessage = function(event){
	console.log('recieved message >'+ event.data);
}
*/
var ws  = null;
$(document).ready(function(){
    // 웹소켓 연결
	
	//var ws = new WebSocket("ws://localhost/echoHandler");
    ws = new SockJS("http:/localhost/echoHandler");

    //socket = sock;
	
	ws.onopen = function(){
		console.log("wsOpen");
	}
    
});
