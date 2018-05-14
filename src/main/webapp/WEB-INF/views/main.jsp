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
</style>

</head>
<body>
<nav id="header" class="navbar navbar-expand-sm bg-light navbar-light">
</nav>
		<c:set var="list" value="${requestScope.list}"></c:set>
		
		
	<div>
		<form action="room.htm" method="post" id="frm2">
			<label>Room Name </label><br>
			<input type="text" name="roomname">
			<input type="submit" value="생성">
		</form>
	</div>
	
	<form action="chat.htm">
		닉네임 : <input type="text" name="id">
		<select name="select">
			<!-- <option value="apple">apple</option>
			<option  value="banana">banana</option> -->
			<c:forEach var="room" items="${list}">
				<option value="${room.roomno}">${room.roomname}</option>
			</c:forEach>
		</select>
		<input type="submit" value="채팅방 입장">
	</form>
	


</body>
</html>