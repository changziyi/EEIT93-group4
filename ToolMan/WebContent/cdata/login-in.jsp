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
	font-family: "微軟正黑體", sans-serif;
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
	width: 400px;
	height: 500px;
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
	text-align: center;
}
#recaptcha{
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
					<div class="error">${errorMsgs.c_id}</div>
					<div class="passwordphoto"></div>
					<input type="password" class="a" placeholder="請輸入密碼" name="pswd">
					<div class="error">${errorMsgs.c_pwd}${errorMsgs.LoginError}</div>
<!-- 					<div> -->
<!-- 					<div class="g-recaptcha" id="recaptcha" -->
<!-- 			         data-sitekey="6LfxUyAUAAAAAE-AozM5vAPmEzh5fM33D0B4u69c"></div> -->
<%-- 			         </div><div class="error">${errorMsgs.gRecaptchaResponse}</div> --%>
<!-- 				</div> -->
				<a class="forgotmember" href="login-up.jsp">還不是會員嗎?</a>
				<div>
					<a class="forgot" href="forgotpwd.jsp">忘記密碼?</a>
				</div>
				<div class="b">
					<input type="hidden" name="login_mumber" value="login_on_mumber">
					<input type="submit" class="submit" value="登入">
				</div>
				<hr>
				<!--FB -->
				<div class="fb">
					<div class="fb-login-button" onlogin="checkLoginState()" id="login"
						data-max-rows="1" data-size="large" data-button-type="login_with"
						scope="public_profile,email"></div>						
				   </div>
				   	<div style="visibility:hidden" id="status"></div>
				   	
	</form>
		</div>
	</div>
		<!-- test photo-->
		<div id="fb_photo"></div>
<script>

//fb
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
//	    		document.getElementById('status').innerHTML = 'We are connected.';
    		var v = document.getElementById('status');
    		v.innerHTML = 'We are connected.';
    		if(v.innerHTML === 'We are connected.'){
    			testAPI();
    			console.log(v.innerHTML);
//     			test
//     			window.location.reload();
<%--     			location.href="<%=request.getContextPath()%>/master/List.jsp"; --%>
    		}			
			
		} else if (response.status === 'not_authorized') {
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
		} 
	}


	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			console.log("Token : " + response.authResponse.accessToken);
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '1893060910719956',
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.9',
		});
		
		 FB.getLoginStatus(function(response) {
				console.log('statusChangeCallback');
				console.log(response);
		    	if (response.status === 'connected') {	    		
		    		document.getElementById('login').style.visibility = 'hidden';
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
		    });
		};
		
	// Load the Facebook JavaScript SDK
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/zh_TW/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	
	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		
		FB.api('/me','GET', 
				
				
				
				{fields: 'first_name,last_name,name,id,email,picture.width(200).height(200)'}, 
				function(response) {
				console.log('Successful login!! '+ ' id:' + response.id + ', name:' + response.name + 
							', email:' + response.email);
				document.getElementById('fb_photo').innerHTML = "<img src='" + response.picture.data.url +"'>";				
			},function(response) {
			    console.log(JSON.stringify(response));
			}
		);
	}
	
	//picture
// 	function getInfo() {
// 		FB.api('/me', 'GET', {fields: 'first_name,last_name,name,id,picture.width(50).height(50)'}, function(response) {
// 				document.getElementById('status').innerHTML = response.id;
// 			document.getElementById('status').innerHTML = "<img src='" + response.picture.data.url +"'>";
// 		});
// 	}	
	
	function loginNEMI(token) {
	    // 把 access_token 傳至後端再做資料拿取
	    console.log("Welcome!  Fetching your information.... ");
	    var xhr=new XMLHttpRequest();
	    xhr.open("POST", "/login", true);
	    xhr.setRequestHeader("Content-type", "");
	    xhr.onreadystatechange=function()
	    {
	      if(xhr.readyState === 4 && xhr.status === 200)
	      {
	          if(JSON.parse(xhr.responseText).status === "ok")
	            location.href="/index";
	          else
	            alert("something wrong!");
	      }  
	    };
	    xhr.send("token="+token);
	}
	
	function Logout() {
		FB.logout(function(response) {
			// user is now logged out
			alert('已成功登出!');
			window.location.reload();
		});
	}
</script>
</body>
</html>