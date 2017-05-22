<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='https://www.google.com/recaptcha/api.js'></script>
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../js/login.css"> -->
<!-- <link rel="stylesheet" href="jqueryui/style.css"> -->
<style>
body {
	font-family: Microsoft JhengHei;
	margin: 0 auto;
	padding: 0 auto;
	background-color: #f9f9f9;
}

.content {
	width: 400px;
	margin: 30px auto;
	padding: 0 auto;
	/* 	background-color: gray; /*sign in box model 測試用 */
}

.loginbox {
	width: 390px;
	height: 380px;
	border: solid 1px rgba(0, 0, 0, 0.15);
	margin: 100px auto;
	position: relative;
	color: #a5a5a5;
	background-color: white;
	border-radius: 10px;
}

h1 {
	font-size: 24px;
	margin: 40px 0 15px 0;
	color: #ed9b4a;
	font-weight: 900;
	text-align: center;
}

.memberphoto {
	height: 44px;
	width: 44px;
	float: left;
	margin-top: 10px;
	margin-left: 47px;
	background-image: url(../image/member.png);
	background-size: contain;
	border: solid 1px #a5a5a5;
}

.passwordphoto {
	height: 44px;
	width: 44px;
	float: left;
	margin-top: 10px;
	margin-left: 47px;
	background-size: contain; /*指定圖片大小 */
	background-image: url(../image/password.jpg);
	border: solid 1px #a5a5a5;
}

.a {
	height: 40px;
	width: 250px;
	margin-top: 10px;
	margin-left: 11px;
	font-size: 20px;
	margin-bottom: 5px;
}

hr {
	width: 300px;
	color: #a5a5a5;
	margim-top: 10px;
	margim-bottom: 10px;
}

span {
	position: absolute;
	font-size: 10px;
	background-color: white;
	bottom: 91px;
	left: 195px;
	color: #444444;
	left: 195px;
}

.submit {
	height: 30px;
	width: 150px;
	font-size: 18px;
	color: white;
	background-color: #ed9b4a;
	border: 0 none;
	cursor: pointer;
	border-radius: 6px;
	margin-top: 10px;
}

.b {
	margin-left: 125px;
}

.fb {
	position: absolute;
	margin-top: 90px;
	margin-left: -128px;
}

.submit:hover {
	background-color: #cc711f;
}

.signup:hover {
	background-color: #cc711f;
}

h2 {
	font-size: 16px;
	position: absolute;
	bottom: 40px;
	left: 149px;
	color: #444444;
	font-weight: 900;
	left: 149px;
}

.forgotmember {
	font-size: 14px;
	margin-left: 266px;
	text-decoration: none; /*消除底線*/
	color: #cc792e;
}

.forgot {
	font-size: 14px;
	margin-left: 266px;
	text-decoration: none;
	color: #cc792e;
}

.error {
	color: red;
	text-align: center;
}

#recaptcha {
	margin-top: 10px;
	margin-left: 51px;
	margin-bottom: 3px;
}
</style>
<title>登入系統</title>
</head>
<body>
	<div class="content">
		<div class="loginbox">
			<form action="<c:url value='/LoginServlet' />" method="POST">
				<h1>會員登入</h1>
				<div>
					<div class="memberphoto"></div>
					<input type="text" class="a" placeholder="請輸入帳號" name="id">
					<div class="passwordphoto"></div>
					<input type="password" class="a" placeholder="請輸入密碼" name="pswd">
					<!-- 					<div> -->
					<!-- 					<div class="g-recaptcha" id="recaptcha" -->
					<!-- 			         data-sitekey="6LfxUyAUAAAAAE-AozM5vAPmEzh5fM33D0B4u69c"></div> -->
					<!-- 			         </div> -->
					<div class="error">${errorMsgs.c_id}</div>
					<div class="error">${errorMsgs.c_pwd}</div>
					<div class="error">${errorMsgs.LoginError}</div>
					<%-- 					<div class="error">${errorMsgs.gRecaptchaResponse}</div>			          --%>
				</div>
				<a class="forgotmember" href="login-up.jsp">還不是會員嗎?</a>
				<div>
					<a class="forgot" href="forgetpassword.jsp">忘記密碼?</a>
				</div>
				<div class="b">
					<input type="hidden" name="login_mumber" value="login_on_mumber">
					<input type="submit" class="submit" value="登入">
				</div>
			</form>
		</div>
	</div>

</body>
</html>