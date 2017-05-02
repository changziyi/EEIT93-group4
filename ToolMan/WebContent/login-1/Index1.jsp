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
<title>登入系統</title>
</head>
<body>
	<form action="Cdata.do" method="POST">
		<div>
			<div>
				<input type="text" name="account" value="${param.id}" placeholder="帳號" autofocus>
				<div>${errorMsgs.c_id}</div>
			</div>
			<div>
				<input type="password" name="pswd" value="${param.pswd}" placeholder="密碼" >
				<div>${errorMsgs.c_pwd}</div>
			</div>
			<div>
				<input type="text" name="name" value="${param.name}" placeholder="姓名" >
				<div>${errorMsgs.c_name}</div>
			</div>
			<div>
				<input type="text" name="Birthday" value="${param.Birthday}" id="datepicker" placeholder="生日">
				<div>${errorMsgs.c_birth}</div>
			</div>
			<div>
				<input type="text" name="Phone" value="${param.Phone}" placeholder="電話號碼" maxlength="10" >
				<div>${errorMsgs.c_cel}</div>
			</div>
			<div>
				<input type="text" name="E-mail" value="${param.E-mail}" placeholder="E-mail" >
				<div>${errorMsgs.c_email}</div>
			</div>
			<div><!--須建立動態表單-->
            	<select>
                	<option value="台北市">台北市</option>
                  	<option value="新北市">新北市</option>
                	<option value="桃園市">桃園市</option>
             	</select>
             	<select>
                	<option value="基隆市">大安區</option>
                	<option value="台北市">中正區</option>
                 	<option value="新北市">萬華區</option>
                   	<option value="桃園市">信義區</option>
                </select>				
			</div>
			<div>
				<input type="text" name="addr" value="${param.addr}" placeholder="地址" >
				<div>${errorMsgs.c_addr}</div>
			</div>
			<div>
				<input type="text" id="code" name="" maxlength="4" value="" placeholder="驗證碼" >
				<div id="createCade"></div><!--驗證碼驗證-->
			</div>
			<input type="button" id="register" value="註冊">
            <input type="hidden" name="action" value="sign-up">
		</div>
		<div>點擊「註冊」按鈕，代表你同意<a>《會員條款》</a></div>
	</form>
	<script>
    $(function() {//日期選擇器
        $( "#datepicker" ).datepicker({
   		dateFormat: "yy-mm-dd"});//指定格式
    });
    
	var code;//建立全新驗證碼
	$(function(){
		jcPublic.register();//註冊
		jcPublic.createCode();//建立驗證碼
		jcPublic.clickCode();//切換驗證碼
		
		$(".wrap>div>input").focus(function(){
			$(this).css({"outline": "none" });
			var $this = $(this);
			$this.next("label").removeClass("move")//隐藏錯誤提示訊息
		})
		
		$(".other>span").on("click",function(){
			$(this).parent().children("div").toggleClass("hidden");
		})
		
	})
//         $(function() {//日期選擇器
//         $( "#datepicker" ).datepicker({
//    		dateFormat: "yy-mm-dd"});//指定格式
//     });
    
	var jcPublic = {
		register:function(){//註冊
			var currentThis = this
			$("#register").on("click",function(){
				var $this = $(this);
				var Code = $("#code").val();//驗證碼
				
				if(code !== Code ){
					$this.prev(".wrap").find(".code").html("驗證碼錯誤").addClass("move");//錯誤加入頁面
					return currentThis.createCode();//輸入錯誤刷新驗證碼
					
				}
			})
		},
		createCode:function(){//建立驗證碼
				var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
				//建立英文與數字混和驗證碼
				code="";
				var codeLength=4;//驗證碼長度
				for(var i =0;i<codeLength;i++){
					var index = Math.floor(Math.random()*selectChar.length)//隨機數
					code +=selectChar[index];
					//$("#createCade").html(code)
				}
				return $("#createCade").html(code)
		},
		clickCode:function(){//點擊切換驗證碼
			var $this = this;
			$("#createCade").on("click",function(){
				return $this.createCode();
			})
		}
	}
	</script>
</body>
</html>