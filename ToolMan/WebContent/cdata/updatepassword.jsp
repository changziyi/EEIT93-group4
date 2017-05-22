<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>重新設置密碼</title>
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login/style-forgetpassword.css">
  <link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
   
</head>
<body>
  <div class="form" >  
      <div class="tab-content">
        <div id="signup">   
          <h1 style="color:#357EBD; font-size: 33px; ">重新設置密碼</h1>          
			<form action="${pageContext.request.contextPath}/updatePwdServlet" method="post">          
          <div class="field-wrap">

            <input type="text"  placeholder="使用者信箱*" name="userName" style="color:gray; background-color:#ffffff; " value="${c_email}" autocomplete="off" readonly />
          </div>
          <div class="field-wrap">
            <label>新密碼<span class="req">*</span></label>
            <input style="background-color:#ffffff;"  type="password" class="input" name="newPassword" autocomplete="off">
            <span class="error">${errors.newPassword }</span>
          </div> 
          <div class="field-wrap">
            <label>確認新密碼<span class="req">*</span></label>
            <input style="background-color:#ffffff;" type="password"  name="newPassword2" autocomplete="off"/>
            <span class="error">${errors.newPassword2 }</span>
          </div>                      
          <button type="submit" class="button button-block" >修改</button>                                                  
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