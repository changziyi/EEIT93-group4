<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login-in/style.css">
  <link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<!--------------------------------------------------------------------------------------------------------------->
<!-- 我不是機器人  -->
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
  <div class="form">
      
<!--       <ul class="tab-group"> -->
<!--         <li class="tab"><a href="#login">Log In</a></li> -->
<!--       </ul> -->
      
      <div class="tab-content">   
        <div id="login">   
          <h1>Welcome Back!</h1>      
          <form action="<c:url value='/LoginServlet' />" method="POST">          
            <div class="field-wrap">
            <label>請輸入帳號<span class="req">*</span></label>
            <input type="text" name="id" autocomplete="off" />
            <label style="left:410px;" class="errormg">${errorMsgs.c_id}</label>
          </div>     
          <div class="field-wrap">
            <label>請輸入密碼<span class="req">*</span></label>
            <input type="password" name="pswd" autocomplete="off">
            <label style="left:410px;" class="errormg">${errorMsgs.c_pwd}</label>
<%-- 			<label style="left:340px; bottom:-70px;" class="errormg1">${errorMsgs.LoginError}</label> --%>
			<label style="left:375px; bottom:-100px;" class="errormg1">${errorMsgs.gRecaptchaResponse}</label>
          </div>
          <p class="forgot1"><a href="login-up.jsp">還不是會員嗎?</a></p>
          <p class="forgot"><a href="forgetpassword.jsp">忘記密碼?</a></p>
		<!------ recaptcha ------->
          <div style="margin-top:-35px;">
			<div class="g-recaptcha" id="recaptcha" 
				data-sitekey="6LfxUyAUAAAAAE-AozM5vAPmEzh5fM33D0B4u69c"></div>
			</div>
			
		<!------ recaptcha ------->
          <div style="margin-top:8px;">        
          	<input type="hidden" name="login_mumber" value="login_on_mumber">
   		  	<input type="submit" class="button button-block" value="Log In"> 
   		  </div>      
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="${pageContext.servletContext.contextPath}/js/login-in/index.js"></script> 
</body>
</html>