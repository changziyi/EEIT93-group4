<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <!-- <link rel="stylesheet" type="text/css" href="../js/login.css"> -->
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
            /*background-color:gray;*//*sign in box model 測試用 */
          }

          .loginbox {
            width: 400px;
            height: 400px;
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
            float:left;
            margin-top:10px;
            margin-left:47px;
            background-image: url(../image/member.png);
            background-size: contain;
            border: solid 1px #a5a5a5;
          }

          .passwordphoto {
            height: 44px;
            width: 44px;
            float:left;
            margin-top:10px;
            margin-left:47px;
            background-size: contain;/*指定圖片大小 */
            background-image: url(../image/password.jpg);
            border: solid 1px #a5a5a5;
          }

          .a {
            height: 40px;
            width: 250px;
            margin-top:10px;
            margin-left:11px;
            font-size: 20px;
            margin-bottom:5px;
          }

          hr {
            width: 300px;
            position: absolute;
            bottom: 90px;
            left: 50px;
            color: #a5a5a5;
          }
          span {
            position: absolute;
            font-size: 10px;
            background-color: white;
            bottom: 91px;
            left: 195px;
            color: #444444;
          }

          .submit {
            height: 30px;
            width: 150px;
            font-size: 18px;
            color: white;
            background-color: #ed9b4a;
            border: 0 none;
            cursor: pointer;
            position: absolute;
            bottom: 110px;
            left: 125px;
            border-radius: 6px;
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
          }
          .forgotmember {
            font-size: 14px;
            margin-left:266px;
            text-decoration: none;/*消除底線*/
            color: #cc792e;
          }
          .forgot {
            font-size: 14px;
            position: absolute;
            right: 43px;
            bottom: 150px;
            text-decoration: none;
            color: #cc792e;
          }
          .error{
          text-align: center;
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
              </div>
              <a class="forgotmember" href="../cdata/login-up.jsp">還不是會員嗎?</a>
              <a class="forgot" href="forgotpwd.jsp">忘記密碼?</a>
               <input type="hidden" name="login_mumber" value="login_on_mumber">
              <input type="submit" class="submit" value="登入">
              
              <hr>
              <span>或</span>
            </form>
          </div>
        </div>
      </body>
    </html>