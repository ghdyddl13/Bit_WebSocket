<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
	#header {
		background-color: #3399ff;
		box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.3);
	}
	
<<<<<<< HEAD
	#roombtn {
		background-color: #3399ff;
	}
</style>

</head>
<body>
<nav class="navbar navbar-default" id="header">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSocket</a>
    </div>
    <ul class="nav navbar-nav">
    </ul>
  </div>
</nav>

	<br>	
	<div align="center">
	<c:set var="list" value="${requestScope.list}"></c:set>
	<div>
		<form action="room.htm" method="post" id="frm2">
			<label>Chatting Room Name</label>
			<input type="text" name="roomname">
			<input type="submit" id="roombtn" value="생성" class="btn">
		</form>

	
	<form action="chat.htm">
		닉네임 : <input type="text" name="id" id="id">
		<!-- <select name="select" id="selectroom"> -->
		<div id="select">

		<!-- <select name="select"> -->

			<c:forEach var="room" items="${list}">
				<option value="${room.roomno}">${room.roomname}</option>
				<a href="chat.htm?id="+ $('#id').val()+"&select=${room.roomno}">
				<input type="submit" value="채팅방 입장" id="roombtn" class="btn">
				</a>
			</c:forEach>
		</div>
		<!-- </select> -->
		
	</form>
	</div>	


</body>
</html>