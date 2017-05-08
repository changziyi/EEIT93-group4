<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<style>
		body{padding: 0;margin: 0;background: #F7FAFC;}
		a{text-decoration: none;}
		.index-box{width:300px;height: auto;margin:0 auto;margin-top:80px;}		
		.title{font-size: 18px;text-align: center;color: #707171;font-weight: bold;margin: 30px auto;}		
		.index-body{text-align: center;}
		.nav-sliders{position: relative;display: inline-block;margin-bottom: 20px;}
		.nav-sliders>a{font-size: 20px;display: inline-block;width:60px ;font-family: "微軟雅黑";color: #999;cursor: pointer;float: left;$width}
		.nav-sliders>a.active{color: #ed9b4a;}
		.nav-sliders>span{position: absolute;height: 2px;background:#ed9b4a;display:block;left: 5px;width: 50px;bottom:-8px;}
		fieldset{margin: 0;padding: 0;border-style:none;}/*消除預設邊框*/
		.select{width: 150px;height: 40px;border-style:none; color:gray;}
		.select1{width: 144px;height: 40px;border-style:none; color:gray;}		
		.login-box{width: 300px;display: none;}
		.wrap{border:1px solid #d5d5d5;border-radius: 5px;background: #fff;}
		.wrap>div{position: relative;overflow: hidden;}
		.wrap>div>input{width: 95%;border:none;padding:17px 17px 17px 0px;border-radius: 5px; margin-left:5px;}
		.wrap>div>label.error{position: absolute;color: #c33;top: 0;line-height: 50px;transform: translate(25px,0);transition: all 0.5s ease-out;-webkit-transform: translate(25px,0);-moz-transform: translate(25px,0);opacity: 0;visibility:hidden;cursor: text;}
		.wrap>div>label.move{transform: translate(0,0);transition: all 0.5s ease-out;-webkit-transform: translate(0,0);-moz-transform: translate(0,0);opacity: 1;visibility: visible;}
		.password{border-top: solid 1px #d5d5d5 ;}
		.password1{border-top: solid 1px #d5d5d5 ;text-align: left;font-color:red;}/*下拉式選單往左*/
		.code{right:115px ;}
		.button-color{height: 40px;width: 300px;background:#ed9b4a;text-align: center;line-height: 40px;border-radius: 5px;margin-top: 25px;color: #fff;font-family: "微软雅黑";cursor: pointer;}
		.remember{text-align: left;margin-top: 20px;font-family: "微軟雅黑";color: #666666;}
		.remember>a{float:right;cursor: pointer;color: #666666;}/*無法登入*/
		.registered-box{width: 300px;}
		.text{font-size: 15px;margin-top: 20px;font-family: "微軟雅黑";color: #666666;}
		.text>a{color: #0f88eb;}
		.verification-code{position: absolute;right:22px;top: 14px;font-family: "微軟雅黑";font-size: 18px;cursor: pointer;}
		.button-color:hover{background-color: #cc711f;}
	</style>
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
</head>
	<body>
		<div class="index-box">
			<div class="index-body">
				<div class="nav-sliders"><!--觸發事件-->
					<a class="registered active">登入</a>
					<a class="login">註冊</a>
					<span class="on"></span>
				</div>
		   	<div class="change"><!--切換登入,註冊-->
        <!--登入開始-->
        <div class="registered-box">
        	<form action="<c:url value='Cdata.do' />" method="post">  
           		<div class="wrap">
             		<div>
               			<input type="text" name=""  value="" placeholder="帳號">
             		</div>
             		<div class="password">
               			<input type="password" name="" placeholder="密碼" >          			
             		</div>
           		</div>
           			<div class="button-color" id="login">登入</div>
           			<div class="remember">
             			<label><input type="checkbox">記住密碼</label>
             		<a>無法登入?</a>
           			</div>
           	</form>		
        </div>       	
        <!--登入結束-->		   	
        <!--註冊開始-->
        <div class="login-box">
            <form action="<c:url value='Cdata.do'/>" method="POST">
            	<div class="wrap">
             		<div calss="password">
                		<input type="text" name="id" value="" placeholder="帳號" autofocus>
                		<div>${errorMsgs.c_id}</div>
               		 </div>
               		 <div class="password">
                		<input type="password" name="pswd" value="" placeholder="密碼" >
                		<div>${errorMsgs.c_pwd}</div>
               		 </div>
               		 <div class="password">
                		<input type="text" name="name" value="" placeholder="姓名" >
                		<div>${errorMsgs.c_name}</div>
               		 </div>
               		 <div class="password">
                		<input type="text" name="birth" value="" id="datepicker" placeholder="生日">
                		<div>${errorMsgs.bday}</div>
               		 </div>
               		 <div class="password">
                		<input type="text" name="phone" value="" placeholder="電話號碼" maxlength="10" >
                		<div>${errorMsgs.phone}</div>
               		 </div>
               		 <div class="password">
                 		<input type="text" name="mail" value="" placeholder="E-mail" >
                 		<div>${errorMsgs.c_email}</div>
               		 </div>
					<div class="password1" ><!--須建立動態表單-->
                		<select name="city" class="select">
                    		<option value="台北市">台北市</option>
                    		<option value="新北市">新北市</option>
                    		<option value="桃園市">桃園市</option>
                		</select>
                 		<select name="district" class="select1">
                   			<option value="大安區">大安區</option>
                    		<option value="中正區">中正區</option>
                    		<option value="萬華區">萬華區</option>
                    		<option value="信義區">信義區</option>
                 		</select>
               		</div>
                		<div class="password">
                  			<input type="text" name="addr" value="" placeholder="地址" >
                  			<div>${errorMsgs.c_addr}</div>
                		</div>
               		<div class="password">
                  		<input type="text" id="code" name="" maxlength="4" value="" placeholder="驗證碼" autocomplete="off">
                  		<label class="error passwor code">請輸入驗證碼</label>
               			<div class="verification-code" id="createCade"></div><!--驗證碼驗證-->
            		</div>
             	</div>
             		<input type="buttom" class="button-color" id="register" value="註冊">
             		<input type="hidden" name="action" value="sign-up">
             		<div class="text">點擊「註冊」按鈕，代表你同意<a>《會員條款》</a></div>             		
        </form>
        	</div>
        <!--註冊結束-->
				</div>
			</div>
		</div>			
		<script>	
			var code;//建立全新驗證碼
			$(function(){
				jcPublic.register();//註冊
				jcPublic.Tab();//切换註冊與註冊與登入
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
                $(function() {//日期選擇器
                $( "#datepicker" ).datepicker({
           		dateFormat: "yy-mm-dd"});//指定格式
            });
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
				
				Tab:function(){//切換註冊與登入
					$(".nav-sliders>a").on("click",function(){
						$(this).addClass("active").siblings().removeClass("active");
						var $width = $(this).width();//寬度
						var $index = $(this).index();//索引
						$(".on").stop(true,true).animate({"left":$width*$index+5+"px"},300);
						//點擊橘色底線移動
						$(this).parents(".index-body").children(".change").children().eq($index).stop(true,false).show().siblings().hide();
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