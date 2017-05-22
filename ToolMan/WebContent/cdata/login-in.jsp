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
<!-- 	recaptcha    -->

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
	margin:160px auto ;
	
}

.main {
	padding:0px 38px;
	margin-bottom:20px;
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
#onkey{
	width:100px;
}
#one{
	position: absolute; 
	left:130px;
	top:16px;
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
				<div class="social-box" style="bottom:30px;">
					<div class="row mg-btm">

						<input type="text" name="id" required="true" class="form-control" placeholder="請輸入帳號"
							autofocus > 
							
						<input type="password" name="pswd"  required="true" class="form-control" id="show"
							placeholder="請輸入密碼">
        
					<div style="position: absolute; right:110px;bottom:10px;font-size:16px;color:red;" class="error">${errorMsgs.LoginError}</div>
					<div style="position: absolute; right:125px;bottom:10px;font-size:16px;color:red;">${errorMsgs.gRecaptchaResponse}</div>
					</div>
					<!-- recaptcha -->
					<div style="display:none" id="show2">
						<div class="g-recaptcha" id="recaptcha"
						data-sitekey="6LfxUyAUAAAAAE-AozM5vAPmEzh5fM33D0B4u69c"></div>
					</div>
					<!--錯誤訊息 -->
                    <div class="error">${errorMsgs.c_id}</div>
					<div class="error">${errorMsgs.c_pwd}</div>
				</div>
				<div class="main" >
					<div class="row" >
						<div class="col-md-12">
							<button type="submit" class="btn btn-info btn-block"> ToolMan帳號 登入</button>
							<input type="hidden" name="login_mumber" value="login_on_mumber">
						</div>
					</div>
				</div>
				<div class="login-footer">
									<!----------------------------------------- FB登入 -------------------------------------------->
						<div class="row" id="one">
							<div class="col-md-12">
							<button type="submit" id="onkey" class="btn btn-info btn-block">一鍵輸入</button>
						</div>
					</div>				
					<div style="position: absolute; left:40px;  ">				
						<div class="fb">
							<div class="fb-login-button" onlogin="checkLoginState()" id="login"
							data-max-rows="1" data-size="large" scope="public_profile,email"></div>				
				   		</div>
				   </div>
				   	<div class="row">
						<div class="col-xs-6 col-md-6 pull-right"
							style="text-align: right; bottom:5px;">
							<a href="${pageContext.servletContext.contextPath}/cdata/forgetpassword.jsp">忘記密碼?</a><br />
							<a href="${pageContext.servletContext.contextPath}/cdata/login-up.jsp">還不是會員嗎?</a>
						</div>
					</div>				   
				<!----------------------------------------- FB登入 -------------------------------------------->
				</div>
			</form>
		</div>
	</div>
	<div style="visibility:hidden" id="status"></div>
</body>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(function(){
	$("#onkey").click(function(){
		event.preventDefault();
		$("input[name = 'id']").val("PolarBear");
		$("input[name = 'pswd']").val("c123456");
	});		
});


/******************************************************/
 	$(function(){
 		$("#show").click(function(){
 			$("#show2").slideDown("slow");
 			
 		});		
 	});
 
 

/********************** fb登入 ************************/

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
//   			test
//   			window.location.reload();
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
// 				document.getElementById('fb_photo').innerHTML = "<img src='" + response.picture.data.url +"'>";				
			
			}
		);
	}
	
	//picture
//	function getInfo() {
//		FB.api('/me', 'GET', {fields: 'first_name,last_name,name,id,picture.width(50).height(50)'}, function(response) {
//				document.getElementById('status').innerHTML = response.id;
//			document.getElementById('status').innerHTML = "<img src='" + response.picture.data.url +"'>";
//		});
//	}	
	
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

</html>