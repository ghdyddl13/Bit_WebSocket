<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><script type="text/javascript">

	var wsocket;
	
	function connect() {
		wsocket = new WebSocket(
				"ws://192.168.0.26:8090/bit/chat?select="+$("#select").val());
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.send(nickname+":" + "님이 퇴장하였습니다.");
		wsocket.close();
	}
	function onOpen(evt) {
		appendMessage("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
	
			appendMessage(data);
		
	}
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send(nickname+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		connect();
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() { send(); });
	//	$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
		//wsocket.send(nickname+":" + "님이 입장하였습니다.");
	});
</script>

<style type="text/css">
	.chat{
		width: 40%;
		height: 500px;
		background-color: yellow;
		
	}
	
	.chat-text{
		width: 100%;
		height: 100%;
		background-color: transparent;	.
		overflow-y: auto;
	}
	
	.textinput{
		width: 35%;
	}
</style>

	
</head>
<body>



<div class="container-fluid" align="center" >
 	<div id="chatArea" class = "chat">
 		<div id ="chatMessageArea" class = "chat-text">
 		</div>
 	</div>
 	<input type = "hidden" value= "${select}" id ="select">
	<input type = "hidden" value= "${id}" id ="nickname">
	<input type ="text" id ="message" class ="textinput">	
	<input type ="button" id ="sendBtn" class ="btn btn-default" value ="전송">
	<a href = "index.htm"><input type ="button" id = "exitBtn" class ="btn btn-default" value ="나가기"></a>
	
</div>		
 
 	
 
 
</body>
</html>