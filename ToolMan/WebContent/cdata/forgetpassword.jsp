<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢密碼</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/login/style-forgetpassword.css">
<link rel="Shortcut Icon"
	href="${pageContext.servletContext.contextPath}/favicon.ico" />
<script
	src="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.css">
	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
<style>
.form-signin {
	max-width: 400px;
	display: block;
	background-color: #ccffff;
	-moz-box-shadow: 0 0 3px 3px #888;
	-webkit-box-shadow: 0 0 3px 3px #888;
	box-shadow: 0 0 3px 3px #888;
	border-radius: 20px;
	border: 5px double #3399ff;
	margin: 160px auto;
}

.heading-desc {
	font-size: 33px;
	font-weight: bold;
	padding: -20px;
}

h3 {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 35px;
	color: #357EBD;
}

.button-block {
	width: 50%;
}

.button {
	font-size: 20px;
	width: 100px;
	height: 50px;
}

.cen {
	margin: 10px auto;
	text-align: center;
}
</style>


</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<div class="row"></div>
	<div class="form form-signin" style="align: center">
		<div class="tab-content">
			<div id="signup">
				<h3 class="heading-desc" style="text-align: center">查詢密碼</h3>
				<span style="font-size:22px;">Email:</span><form action="${pageContext.request.contextPath}/ForgotPwdServlet" method="POST">
					<div class="field-wrap">
					 <input  style="background-color: #ffffff;" type="text" class="input"
							name="Email" id="Email" autocomplete="off" value="${email}"> 
<%-- 							<div style="font-size: 16px; color: red">${errorMsgs.erroremail}</div> --%>
					</div>
					<div class="cen">
						<button type="submit" onclick="check();" class="button button-block">送出</button>
						<button type="button" class="button button-block" 
						onclick="window.location.href ='${pageContext.servletContext.contextPath}/index.jsp'">
						上一頁</button>
					</div>
<!-- id="sweetalart" -->
				</form>
			</div>
			<div id="login"></div>
		</div>
		<!-- tab-content -->
	</div>
	<!-- /form -->

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	
	function check(){
		var email = $('#Email').val();
		if(email == ""){
		    swal("錯誤!", "請輸入正確信箱", "error");
		}else{
			swal("成功!", "已將重新設定密碼的連結寄出請至E-mail信箱收取信件。",  "success")
						
		}
	}
	
	
// 		$.post(hyperlinkstring,{
// 			"name":c_email},function(){
// 		}
			
// 		}
	
	</script>
	<script
		src="${pageContext.servletContext.contextPath}/js/login/index.js"></script>
</body>
</html>

