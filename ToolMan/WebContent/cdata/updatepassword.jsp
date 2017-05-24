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
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login/style-updatepassword.css">
  <link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
  
  <script src="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.css">
   <%
   	String email = request.getParameter("email");
   	request.setAttribute("email",email);
   %>
   
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
	margin:160px auto ;
	
}

h3 {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 35px;
	color: #357EBD;
}

.heading-desc {
	font-size: 33px;
	font-weight: bold;
	padding: -50px;
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
  <div class="form form-signin">   
      <div class="tab-content">
        <div id="signup">   
          <h3 class="heading-desc" style="text-align: center">重新設置密碼</h3>          
			<form action="${pageContext.request.contextPath}/updatePwdServlet" method="post" >          
          <div class="field-wrap">
			<span style="font-size:22px;">信箱:</span>
            <input type="text"  placeholder="使用者信箱" name="userName" style="color:gray; background-color:#ffffff; " value="${email}" autocomplete="off" readonly />
          </div>
          <div class="field-wrap">
           <span style="font-size:22px;">新密碼:</span> <input style="background-color:#ffffff;"  type="password" class="input" name="newPassword" autocomplete="off" placeholder="請輸入密碼">
            <span style="font-size:16px;color:red;">${errors.newPassword }</span>
          </div> 
          <div class="field-wrap">
            <span style="font-size:22px;">確認新密碼:</span><input style="background-color:#ffffff;" type="password"  name="newPassword2" autocomplete="off" placeholder="請輸入密碼"/>
            <span style="font-size:16px;color:red;">${errors.newPassword2 }</span>
          </div>  
          <div class="cen">
						<button type="submit" id="sweetalart" class="button button-block cen">修改</button>
		</div>
                                                                          
          </form>
        </div>
        <div id="login"></div>        
      </div><!-- tab-content -->   
</div> <!-- /form -->

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	$(function(){
		$("#sweetalart").click(function(){
			swal("密碼修改成功！", "下次登入時請記得使用新的密碼喔！！","success")
		});				
	})
	</script>
<script src="${pageContext.servletContext.contextPath}/js/login/index.js"></script> 
</body>
</html>