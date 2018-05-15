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
	
	#roombtn {
		background-color: #3399ff;
		box-shadow: 1px 1px 5px #000;
		color: white;
	}
	
table {
	text-align: center;
    border-collapse: collapse;
    width: 30%;
    margin: auto;
}

th, td {
    text-align: center;
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(even){
	background-color: #f2f2f2;
}

th {
    background-color: #3399ff;
    color: white;
}
#loginimg {
	height: 20px;
	width: 20px;
}
</style>

</head>
<body>
<nav class="navbar navbar-default" id="header">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.htm" style="color:white">WebSocket</a>
    </div>
    
    <ul class="nav navbar-nav">
        <li class="nav-item">
     		<a class="nav-link" href="#" style="color:white"> 
     		<img id="loginimg" alt="" src="https://dopl-egov.commerce.utah.gov/eGov/person%20image.png">${nickname}님</a>
    	</li>
    </ul>
    
  </div>
</nav>

	<br>	
	<div align="center">
	<c:set var="list" value="${requestScope.list}"></c:set>
	<div>
		<form action="room.htm" method="post" id="frm2">
			<label><h5>Chatting Room Name</h5></label>
			<input type="text" name="roomname">
			<input type="submit" id="roombtn" value="생성" class="btn">
		</form>

		<div id="select">
			<table>
				<tr><th>채팅방이름</th><th>비고</th></tr>
			<c:forEach var="room" items="${list}">

				<tr><td><input type="hidden" value="${room.roomno}">${room.roomname}</td>
				
				<td><a href="chat.htm?select=${room.roomno}">
				<input type="submit" value="채팅방 입장" id="roombtn" class="btn">
				</a></td></tr>
	
			</c:forEach>
			</table>
		</div>
	</div>	
</div>


</body>
</html>