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
		$('#frm').submit();
	});
		
 		$('#loginbtn').click(function() {
			console.log("클릭 화면 뜨니?");
			if($('#userid').val().trim()== "") {
				alert('아이디를 입력해주세요');
				$('#userid').val(""); 
                $('#userid').focus();
			}else if($('#pwd').val().trim()=="") {
				alert('비밀번호를 입력해주세요');
				$('#pwd').val(""); 
				$('#pwd').focus();   
			}else{
				$("#login").submit();
			}
		});
		

});
	
</script>
<style type="text/css">
	#loginbtn {
		background-color: #3399ff;
		box-shadow: 1px 1px 5px #000;
		color: white;
	}
	#cancel {
		background-color: #ff1a1a;
		box-shadow: 1px 1px 5px #000;
		color: white;
	}
	#join_btn {
		background-color: #3399ff;
		box-shadow: 1px 1px 5px #000;
		color: white;
	}

	
</style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well login-box">
                <form action="login.htm" method="post" id="login">
                    <legend>Login</legend>
                    <div class="form-group">
                        <label for="username-email">Userid</label>
                        <input id="userid" name="userid"  placeholder="Please enter your ID" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="pwd" name="pwd"  placeholder="Please enter your Paasword" type="password" class="form-control" />
                    </div>
                    <div class="form-group text-center">
                    	<input type="button" id="loginbtn" class="btn btn-success btn-login-submit" value="login" />
                        <button id="cancel" class="btn btn-danger btn-cancel-action">Cancel</button>
                        <button type="button" id="join_btn" class="btn btn-success btn-login-submit">Join</button>
                         
                    </div>
                </form>
                <form action="join.htm" id="frm" method="get">
            	</form>
            </div>
        </div>
    </div>
</div>
</body>
</html>