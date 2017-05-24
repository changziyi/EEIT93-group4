<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>註冊</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/login/style.css">
  <link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
 <script src="../js/jquery.min.js"></script>
 <script src="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.css">

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

.button-block {
	width: 50%;
}

.button {
	font-size: 20px;
	width: 100px;
	height: 50px;
}

.cen {
	margin: 30px auto;

}
</style>



</head>
<body>
  <div class="form form-signin">  
      <div class="tab-content">
        <div id="signup">   
          <h3 class="heading-desc" style="text-align: center">註冊</h3>          
    <form action="<c:url value='/cdata/Cdata.do'/>" method="POST">            
          <div class="field-wrap" >
            <input type="text" style="background-color:#ffffff;"  name="id" autocomplete="off" placeholder="帳號*"  autocomplete="off" autofocus>
            <div style="left:410px;" class="errormg">${errorMsgs.c_id}</div>
          </div>
          
          <div class="field-wrap">         
            <input type="password" style="background-color:#ffffff;" name="pswd" axlength="12" placeholder="密碼*"  autocomplete="off">
            <div style="left:410px;" class="errormg">${errorMsgs.c_pwd}</div>
            <div style="left:246px;" class="errormg">${errorMsgs.c_pwd01}</div>
          </div> 
          <div class="field-wrap">
            <input type="text" style="background-color:#ffffff;" name="name" placeholder="姓名*" autocomplete="off">
            <div style="left:410px;" class="errormg">${errorMsgs.c_name}</div>
            <div style="left:257px;" class="errormg">${errorMsgs.c_name01}</div>
          </div>
          <div class="field-wrap">
            <input type="text" style="background-color:#ffffff;" id="datepicker" name="birth" placeholder="生日*" autocomplete="off">
            <div style="left:259px;" class="errormg">${errorMsgs.bday}</div>
          </div> 
          <div class="field-wrap">
            <input type="text" style="background-color:#ffffff;" name="phone" placeholder="手機號碼*" autocomplete="off">
            <div style="left:378px;" class="errormg">${errorMsgs.phone}</div>
            <div style="left:346px;" class="errormg">${errorMsgs.phone01}</div>
          </div>
          <div class="field-wrap">
            <input type="text" style="background-color:#ffffff;" name="mail" placeholder="E-mail*" autocomplete="off">
            <div style="left:396px;" class="errormg">${errorMsgs.c_email}</div>
            <div style="left:333px;" class="errormg">${errorMsgs.c_email01}</div>
          </div>                                                    
<!--地址-->                
          <div class="top-row">
            <div class="field-wrap">
              <input type="text" style="background-color:#ffffff;" name="city" placeholder="縣市*" autocomplete="off" />
              <input type="hidden" style="background-color:#ffffff;" name="other">
              <div style="left:138px;" class="errormg">${errorMsgs.c_city}</div>
            </div>      
            <div class="field-wrap">
              <input type="text" style="background-color:#ffffff;" name="district" placeholder="地區*" autocomplete="off"/>
              <div style="left:138px;" class="errormg">${errorMsgs.c_district}</div>
            </div>
          </div>
<!--地址-->  
          <div class="field-wrap">
	            <input type="text" style="background-color:#ffffff;" name="addr" placeholder="地址*" autocomplete="off">
	            <div style="left:410px;" class="errormg">${errorMsgs.c_addr}</div>
	            <div style="left:347px;" class="errormg">${errorMsgs.c_addr01}</div>
          </div>
          <div class="field-wrap"> 
	          	     
	            <input type="text" id="code2" style="background-color:#ffffff;" name="verification1" placeholder="驗證碼*" axlength="4" autocomplete="off">
	            
	            <span  style="border:1px solid blue;right:20px;bottom:6px;font-size: 20px;color:#a0b3b0"class="function-code" id="createCade" ></span><!--驗證碼驗證-->
				<input  type = "hidden" style="border:1px solid blue;right:20px;bottom:6px;font-size: 20px;color:#a0b3b0"class="function-code" id="verification2" name="verification2" />

	            <div id="v" style="left:330px;" class="errormg">${errorMsgs.errorverify}</div>
	             <div id="v" style="left:160px; color:red; font-size: 16px; margin-top:3px;" >${errorMsgs.account}</div>           
          </div>
          <div>
          <div style="margin-top:40px">
            <div>
          	<button type="submit" id="register" class="button button-block cen" >註冊</button>
          	<input type="hidden" name="action" value=""> 
          	</div> 
         
     
          <div style="margin-top:10px">       
          <button type="submit" id="onkey" class="button button-block cen" name="" >一鍵輸入</button>
          </div> 
          </div>
          </div>
          </form>
        </div>
      
<!--    -->
        <div id="login"></div>        
      </div><!-- tab-content -->   
 <!-- /form -->
	<script>
//     $(function() {//日期選擇器
//         $( "#datepicker" ).datepicker({
//    		dateFormat: "yy-mm-dd"});//指定格式
//     });
var code;   
$(function(){
	createCode();
	$("#createCade").on("click",createCode);
	$("#register").on("click",register);
//這行刪除驗證碼數字會消失		

		
		$("#onkey").click(function(){
			event.preventDefault();
			$("input[name = 'id']").val("oneprice");
			$("input[name = 'pswd']").val("sa123456");
			$("input[name = 'name']").val("航海王");
			$("input[name = 'birth']").val("1990-04-19");
			$("input[name = 'phone']").val("0985220221");
			$("input[name = 'mail']").val("Eeit93401@gmail.com");
			$("input[name = 'city']").val("台北市");
			$("input[name = 'district']").val("大安區");
			$("input[name = 'addr']").val("建國南路一段126號");
		});		

	
	})//end ready
	
	function register(){
		var Code = $("#code2").val();		
// 		$('#v').text("請重新輸入驗證碼");
	}
		

		
		function createCode(){//建立驗證碼
				var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
				
				code="";
				var codeLength=4;
				for(var i =0;i<codeLength;i++){
					var index = Math.floor(Math.random()*selectChar.length);//隨機數
					code +=selectChar[index];
// 					$("#createCade").html(code);//顯示驗證碼
				}
				$("#createCade").html(code);
				$("#verification2").val(code);
				
		}

		$(function(){
			$("#register").click(function(){
				swal("恭喜您！", "註冊成功！","success")
			});				
		})

		
	
	

//		function myFunction(){
//			var id = ${errorMsgs.c_id};
//			var pswd = 
//			var name =
//			var birth =
//			var phone = 
//			var mail =
//			var city =
//			var district =
//			var addr =
			
			
			
//		}

	
	</script>
<script src="${pageContext.servletContext.contextPath}/js/login/index.js"></script> 
 
</body>
</html>