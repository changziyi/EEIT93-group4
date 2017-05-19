<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="toolman.cdata.model.*"%>
<%@ page import="toolman.order.model.*"%>
<%@ page import=" java.util.*"%>

<div class="navbar-wrapper">
	<div class="container-fluid">
		<nav class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.servletContext.contextPath}/index.jsp">ToolMan</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/index.jsp"
							class="">首頁</a></li>
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/master/master.do?city=all&action=SearchAll"
							class="">我要找師傅</a></li>
						<li><a class="alist" href="#">我要開店 </a></li>
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/wishpool/Wishing+waterfall.jsp">許願池
						</a></li>
					</ul>

					<!----------- 搜尋列----- -->
					<ul class="navbar-right">
						<form class="navbar-form">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</button>

						</form>
					</ul>
					<!----------- 搜尋列----- -->

					<ul class="nav navbar-nav pull-right">

						<%	if (session.getAttribute("LoginOK") == null) {%>
						<li><a class="alist" href="${pageContext.servletContext.contextPath}/cdata/login-in.jsp">登入 </a>
							</li>
						<%	} else {%>

						<%-----------------------------------------------訂單表------------------------------------------------------------------- --%>

						<li class=" dropdown"><a class="alist" href="#"
							class="dropdown-toggle " data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><span
								class="glyphicon">&#xe008;</span> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}">我的資料</a>
								</li>
								<li><a href="#">我的店家</a></li>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=listOrder">我的訂單</a>
								</li>
								<li><a
									href="${pageContext.servletContext.contextPath}/mdata/MdataOrderServlet.do?m_id=${LoginOK.m_id}&action=listOrder">我的工作</a></li>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myLike">我的最愛</a>
								</li>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myHate">黑名單</a>
								</li>
								<li><a href="#">刊登廣告</a></li>
								<li><a
									href="${pageContext.servletContext.contextPath}/loginoutServlet">登出</a></li>

							</ul></li>
						<%----------------------------------------------墨西哥長城------------------------------------------------------------------- --%>

						<%
							}
						%>
					</ul>
				</div>

			</div>
	</div>
	</nav>
</div>

<!------------------------------------- facebook 登入 ----------------------------------------->
<div style="visibility: hidden" id="status"></div>
		
<script>
    //fb click
    $(document).ready(function(){
    	  $("#p").click(function(){
    	  });
    	});
    
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
//     			window.location.reload();
<%--     			location.href="<%=request.getContextPath()%>/index.jsp"; --%>
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