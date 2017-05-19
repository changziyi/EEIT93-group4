<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="toolman.cdata.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.error{
color:red;
font-size:8px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重新設定密碼</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/updatePwdServlet"
		method="post">
		
 		使用者信箱：<input type="text" name="userName" style="color:gray;" value="${c_email}" readonly/><br /> 
		新密碼：<input type="password"  name="newPassword" /><span class="error">${errors.newPassword }</span><br />
		確認新密碼：<input type="password"  name="newPassword2" /><span class="error">${errors.newPassword2 }</span><br />
		<span>${error.passwordError}</span>
		<input type="submit" value="修改" />
	</form>
</body>
</html>