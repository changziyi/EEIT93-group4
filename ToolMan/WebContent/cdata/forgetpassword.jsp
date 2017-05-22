<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>忘記密碼</title>
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login/style-forgetpassword.css">
   
</head>
<body>
  <div class="form" >  
      <div class="tab-content">
        <div id="signup">   
          <h1>忘記密碼</h1>          
          <form action="${pageContext.request.contextPath}/ForgotPwdServlet" method="POST">           
          <div class="field-wrap">
            <label>E-mail<span></span></label>
            <input type="text" class="input" name="Email" autocomplete="off">
          </div> 
          <button type="submit" id="register" class="button button-block" >送出</button>                                                   
          </form>
        </div>
        <div id="login"></div>        
      </div><!-- tab-content -->   
</div> <!-- /form -->

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	</script>
<script src="${pageContext.servletContext.contextPath}/js/login/index.js"></script> 
</body>
</html>

