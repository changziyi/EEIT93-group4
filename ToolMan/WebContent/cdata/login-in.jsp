<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>log in test</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css"
	rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css"
	rel="stylesheet">
<link rel="Shortcut Icon"
	href="${pageContext.servletContext.contextPath}/favicon.ico" />
	
<script src='https://www.google.com/recaptcha/api.js'></script>	

<style>

body {
	font-family: Microsoft JhengHei;
	margin: 0 auto;
	padding: 0 auto;
}

.form-signin {
	max-width: 400px;
	display: block;
	background-color: #ccffff;
	-moz-box-shadow: 0 0 3px 3px #888;
	-webkit-box-shadow: 0 0 3px 3px #888;
	box-shadow: 0 0 3px 3px #888;
	border-radius: 20px;
	border: 5px double #3399ff;
	margin:120px auto ;
	
}

.main {
	padding: 38px;
}

.social-box {
	margin: 0 auto;
	padding: 38px;
	border-bottom: 1px #ccc solid;
}

.social-box a {
	font-weight: bold;
	font-size: 18px;
	padding: 8px;
}

.social-box a i {
	font-weight: bold;
	font-size: 20px;
}

.heading-desc {
	font-size: 33px;
	font-weight: bold;
	padding: 38px 38px 0px 38px;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	height: 20px;
	padding: 20px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: 10px;
	border-radius: 5px;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-radius: 5px;
}

.login-footer {
	background: background-color: #ccffff;
	margin: 0 auto;
	border-top: 1px solid #dadada;
	padding: 20px;
}

.login-footer a {
	font-weight: bold;
	color: #8a8a8a;
	line-height: 19px;
	font-size: 15px;
	
}

</style>

</head>
<body>

<jsp:include page="/nav/navigation.jsp" />

	<div class="container">
		<div class="row ">
			<form class="form-signin mg-btm"action="<c:url value='/LoginServlet' />" method="POST">
				<h3 class="heading-desc" style="text-align:center">
					會員登入
				</h3>
				<div class="social-box">
					<div class="row mg-btm">

						<input type="text" name="id" required="true" class="form-control" placeholder="請輸入帳號"
							autofocus > 
							
						<input type="password" name="pswd"  required="true" class="form-control"
							placeholder="請輸入密碼">
        
					</div>

                    <div class="error">${errorMsgs.c_id}</div>
					<div class="error">${errorMsgs.c_pwd}</div>
					<div class="error">${errorMsgs.LoginError}</div>

				</div>
				<div class="main">
					<div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-info btn-block"> ToolMan帳號 登入</button>
							<input type="hidden" name="login_mumber" value="login_on_mumber">
						</div>
						<div class="row"></div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<a href="#" class="btn btn-primary btn-block"> <i
								class="icon-facebook"></i> Facebook帳號 登入
							</a>
						</div>
					</div>

				</div>
				<div class="login-footer">
					<div class="row">
						<div class="col-xs-6 col-md-6 pull-right"
							style="text-align: right">
							<a href="forgetpassword.jsp">忘記密碼?</a><br /> <a href="login-up.jsp">還不是會員嗎?</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>