<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="jqueryui/style.css">
      <title>login-up</title>
      <style>
        body {
          font-family: "微軟正黑體", sans-serif;
          margin: 0 auto;
          padding: 0 auto;
          background-color: #f9f9f9;
        }
        .content {
          width: 450px;
          margin: 30px auto;
          padding: 0 auto;
          text-align: center;
          /*background-color:gray;*//*sign in box model 測試用 */
        }
        .loginbox {
          width: 400px;
          border: solid 1px rgba(0, 0, 0, 0.15);
          margin: 100px auto;
          
          color: #a5a5a5;
          background-color: white;
          border-radius: 10px;
        }

        h2 {
          font-size: 24px;
          margin: -15px 0 15px 0;
          color: #ed9b4a;
          font-weight: 900;
        }
        h4{

        }
        .input {
          height: 40px;
          width: 250px;
          font-size: 20px;
          margin-bottom: 10px;
        }
        .input-city{
          height: 46px;
          width: 149px;
          color:gray;
          font-size: 20px;  
          margin-bottom: 10px;
        }
        .submit {
          height: 30px;
          width: 150px;
          font-size: 18px;
          color: white;
          background-color: #ed9b4a;
          border: 0 none;
          curso: pointer;
          border-radius: 6px;
          margin: 10px 0px 15px;
        }
        .submit:hover {
          background-color: #cc711f;
        }
        .function-code{
            position: absolute;
            right:705px;top:738px;
/*             right:535px;top:738px; */
            font-family: "微軟雅黑";
            font-size: 20px;
        }
        .color{
        color:red;
        font-size:14px;
        }
      </style>
      <title>註冊系統</title>
    </head>
    <body>
      <div class="content">
        <div class="loginbox">
          <form  action="" method="POST">
          <h4>ＸＸＸ，你好</h4>
            <h2>請重新設置新密碼</h2>
            <div>
              <input type="password" class="input" placeholder="新密碼" name="pswd">
              <div class="color" >${errorMsgs.c_pwd}</div>
            </div>
            <div>
              <input type="text" class="input" placeholder="確認新密碼" name="name">
              <div class="color" >${errorMsgs.c_name}</div>         
            </div>         
            <input type="submit" id="register" class="submit" value="確認更改">            
            <input type="hidden" name="action" value="">
          </form>
        </div>
      </div>
    </body>
  </html>