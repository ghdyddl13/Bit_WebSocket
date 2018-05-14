<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- <form action="chat.htm">
		닉네임 : <input type="text" name="id">
		<select name="select">
			<option value="apple">apple</option>
			<option  value="banana">banana</option>
		</select>
		<input type="submit" value=" 채팅방 입장">
	</form> -->
	
	<c:set var="list" value="${requestScope.list}"></c:set>
	<div>
		<form action="room.htm" method="post" id="frm2">
			<label>Room Name </label><br>
			<input type="text" name="roomname">
			<input type="submit" value="생성">
		</form>
	</div>
	
	<form action="chat.htm">
		<!-- 닉네임 : <input type="text" name="id"> -->
		<select name="select">
			<!-- <option value="apple">apple</option>
			<option  value="banana">banana</option> -->
			<c:forEach var="room" items="${list}">
				<option value="${room.roomno}">${room.roomname}</option>
			</c:forEach>
		</select>
		<input type="submit" value=" 채팅방 입장">
	</form>
	


</body>
</html>