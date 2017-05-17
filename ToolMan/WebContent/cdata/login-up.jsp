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
          font-family:Microsoft JhengHei;
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

        h1 {
          font-size: 24px;
          margin: 30px 0 15px 0;
          color: #ed9b4a;
          font-weight: 900;
        }
        .input {
          height: 40px;
          width: 298px;
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
            margin-top:14px;
            margin-right:20px;
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
          <form  action="<c:url value='/cdata/Cdata.do'/>" method="POST">
            <h1>註冊</h1>
            <div>
              <input type="text" class="input" placeholder="帳號" name="id" autofocus>
              <div class="color" >${errorMsgs.c_id}</div>
              <input type="password" class="input" placeholder="密碼" name="pswd">
              <div class="color" >${errorMsgs.c_pwd}</div>
              <input type="text" class="input" placeholder="姓名" name="name">
              <div class="color" >${errorMsgs.c_name}</div>
              <input type="text" class="input" id="datepicker" placeholder="生日" name="birth">
              <div class="color" >${errorMsgs.bday}</div>
              <input type="text" class="input" placeholder="手機號碼" name="phone">
              <div class="color" >${errorMsgs.phone}</div>
              <input type="text" class="input" placeholder="E-mail" name="mail">
              <div class="color" >${errorMsgs.c_email}</div>
              <select class="input-city"  name="city">
                <option value="台北市">台北市</option>
                <option value="新北市">新北市</option>
                <option value="桃園市">桃園市</option>
              </select>
              <select class="input-city" name="district">
                <option value="大安區">大安區</option>
                <option value="中正區">中正區</option>
                <option value="萬華區">萬華區</option>
                <option value="信義區">信義區</option>
              </select>
              <input type="text" class="input" placeholder="地址" name="addr">
              <input type="hidden" name="other">
              <div class="color" >${errorMsgs.c_addr}</div>
            </div>
<!--             style="background-color:gray;" -->
            <div>
              <input type="password" class="input" placeholder="驗證碼" name="">        
              <span class="function-code" id="createCade"></span><!--驗證碼驗證--> 
            </div>                 
            <input type="submit" id="register" class="submit" value="註冊">            
            <input type="hidden" name="action" value="">
          </form>
        </div>
      </div>
	<script>
    $(function() {//日期選擇器
        $( "#datepicker" ).datepicker({
   		dateFormat: "yy-mm-dd"});//指定格式
    });
    
	var code;
	$(function(){
		jcPublic.register();
		jcPublic.createCode();
		jcPublic.clickCode();
		
		$(".wrap>div>input").focus(function(){
			$(this).css({"outline": "none" });
			var $this = $(this);
			$this.next("label").removeClass("move")//隐藏錯誤提示訊息
		})
		
		$(".other>span").on("click",function(){
			$(this).parent().children("div").toggleClass("hidden");
		})
		
	})
	
	var jcPublic = {
		register:function(){//註冊
			var currentThis = this
			$("#register").on("click",function(){
				var $this = $(this);
				var Code = $("#code").val();//驗證碼
				
				if(code !== Code ){
					$this.prev(".wrap").find(".code").html("驗證碼錯誤").addClass("move");//錯誤加入頁面
					return currentThis.createCode();
					
				}
			})
		},
		createCode:function(){//建立驗證碼
				var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
				
				code="";
				var codeLength=4;
				for(var i =0;i<codeLength;i++){
					var index = Math.floor(Math.random()*selectChar.length)//隨機數
					code +=selectChar[index];
					//$("#createCade").html(code)
				}
				return $("#createCade").html(code)
		},
		clickCode:function(){
			var $this = this;
			$("#createCade").on("click",function(){
				return $this.createCode();
			})
		}
	}
	</script>
    </body>
  </html>