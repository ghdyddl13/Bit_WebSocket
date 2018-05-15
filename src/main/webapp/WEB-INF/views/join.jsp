<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready( function(){
		$(document).on("click", "#join_btn", function(){
			if($("#pwd").val()!= $("#pwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}else{
				$('#frm').submit();
			}
		
	});
});
</script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well login-box">
                <form action="join.htm" method="post" id="frm">
                    <legend>회원가입</legend>
                    <div class="form-group">
                        <label for="username-email">Userid</label>
                        <input id="userid" name="userid"  placeholder="Please enter your ID" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="pwd" name="pwd"  placeholder="Please enter your Paasword" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password check</label>
                        <input type="password" id="pwd2" name="pwd2"  placeholder="Please enter your Paasword" type="text" class="form-control" />
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-danger btn-cancel-action">Cancel</button>
                        <!-- <input type="submit" class="btn btn-success btn-login-submit" value="join" /> -->
                        <button type="button" id="join_btn" class="btn btn-success btn-login-submit" >Join</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>