<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>發送重設密碼</title>
</head>
<body>
	 
<form action="${pageContext.request.contextPath}/ForgotPwdServlet" method="post">  
        信箱：<input type="text" name="Email" />
    <span style="color: red">${errorMsgs.erroremail}</span><br/>  
    <input type="submit" id="inputout" value="送出" /><a href=""></a> 
</form>  
</body>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
// 	$(function(){
// 		$("#inputout").click(function(){
// 			swal("Good job!", "You clicked the button!", "success")
// 		});	
// 	});
</script>
</html>





