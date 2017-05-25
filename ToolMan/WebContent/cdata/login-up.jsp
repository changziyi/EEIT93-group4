<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/login/style.css">
<link rel="Shortcut Icon"
	href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/sweetalart/sweetalert.css">

<style>
body {font-family:Microsoft JhengHei;
	  margin-left:80px;
	  margin-top:120px;
	  }
h3{
	font-size: 35px;
	font-weight: bold;
	color:#357EBD;
}
.articles{
    width:90%; /*Takes 90% width from WebContainer*/
    height: auto;
    margin: auto;
} 
</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<article>
<div class="row"></div>
<div class="modal-dialog" >
<div class="modal-content"style="width:80%; border:5px double #3399ff; border-radius:20px;background-color:#ccffff;">
<div class="modal-header" style="text-align: center;">
<h3>註冊</h3>
</div>
<div class="modal-body" >
	<div class="form-group">
		<table class="table">
		<form action="<c:url value='/cdata/Cdata.do'/>" method="POST">
				<tr>
					<td style="width:25px;">帳號:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="id"
							autocomplete="off" placeholder="輸入帳號" autocomplete="off"
							autofocus>
							<div class="errormg">${errorMsgs.c_id}</div>
							</td>
							
					</tr>
				<tr>
					<td>密碼:</td>
					<td colspan="2"><input type="password" style="background-color: #ffffff;"
							name="pswd" axlength="12" placeholder="輸入密碼" autocomplete="off">
						<div class="errormg">${errorMsgs.c_pwd}</div>
						<div class="errormg">${errorMsgs.c_pwd01}</div></td>
				<tr>
					<td>姓名:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="name"
							placeholder="輸入姓名" autocomplete="off">
						<div class="errormg">${errorMsgs.c_name}</div>
						<div class="errormg">${errorMsgs.c_name01}</div></td>
				</tr>
				<tr>
					<td>生日:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;"
							id="datepicker" name="birth" placeholder="輸入生日"
							autocomplete="off">
						<div class="errormg">${errorMsgs.bday}</div></td>
				</tr>
				<tr>
					<td>手機號碼:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="phone"
							placeholder="輸入手機號碼" autocomplete="off">
						<div class="errormg">${errorMsgs.phone}</div>
						<div class="errormg">${errorMsgs.phone01}</div></td>
				</tr>
				<tr>
					<td>email:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="mail"
							placeholder="輸入E-mail" autocomplete="off">
						<div class="errormg">${errorMsgs.c_email}</div>
						<div class="errormg">${errorMsgs.c_email01}</div></td>
				</tr>
				<tr>
					<td>縣市:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="city"
								placeholder="縣市" autocomplete="off" /> <input type="hidden"
								style="background-color: #ffffff;" name="other">
							<div style="left: 138px;" class="errormg">${errorMsgs.c_city}</div></td>
				</tr>
				<tr>
					<td>地區:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;"
								name="district" placeholder="地區" autocomplete="off" />
							<div class="errormg">${errorMsgs.c_district}</div></td>
				</tr>
				<tr>
					<td>地址:</td>
					<td colspan="2"><input type="text" style="background-color: #ffffff;" name="addr"
							placeholder="輸入地址" autocomplete="off">
						<div class="errormg">${errorMsgs.c_addr}</div>
						<div class="errormg">${errorMsgs.c_addr01}</div></td>
				</tr>
				<tr>
					<td>驗證碼:</td>
					<td style="width:290px;"><div style="" width:280px;"><input type="text" id="code2" style="width:270px;background-color: #ffffff;"
							name="verification1" placeholder="驗證碼" axlength="4"
							autocomplete="off"></div></td><td style=""><span
							style=" float:left;  font-size: 20px; color: #a0b3b0"
							class="function-code" id="createCade"></span></td>
						<!--驗證碼驗證-->
						<input type="hidden"
							style="right: 20px; bottom: 6px; font-size: 20px; color: #a0b3b0"
							class="function-code" id="verification2" name="verification2" />

						<div id="v" style="left: 330px;" class="errormg">${errorMsgs.errorverify}</div>
						<div id="v" style="left: 160px; color: red; font-size: 16px; margin-top: 3px;">${errorMsgs.account}</div></td>
				</tr>
				<tr>
					<td>
					<div style="text-align:center;">
						<div style="position: absolute; right:100px;">
							<button type="submit" id="register" class="btn btn-default">註冊</button>
							<input type="hidden" name="action" value="">
						</div>
						<div style="position: absolute;right: 300px;">
							<button type="submit" id="onkey" class="btn btn-default" name="">一鍵輸入</button>
						</div>
					</div>
					</td>
				</tr>
				</form>																					
				</table>
			</div>
		</div>
	</div>
</div>	
</article>
		<script>
			//     $(function() {//日期選擇器
			//         $( "#datepicker" ).datepicker({
			//    		dateFormat: "yy-mm-dd"});//指定格式
			//     });
			var code;
			$(function() {
				createCode();
				$("#createCade").on("click", createCode);
				$("#register").on("click", register);
				//這行刪除驗證碼數字會消失		

				$("#onkey").click(function() {
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

			function register() {
				var Code = $("#code2").val();
				// 		$('#v').text("請重新輸入驗證碼");
			}

			function createCode() {//建立驗證碼
				var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A',
						'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
						'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
						'X', 'Y', 'Z');

				code = "";
				var codeLength = 4;
				for (var i = 0; i < codeLength; i++) {
					var index = Math.floor(Math.random() * selectChar.length);//隨機數
					code += selectChar[index];
					// 					$("#createCade").html(code);//顯示驗證碼
				}
				$("#createCade").html(code);
				$("#verification2").val(code);

			}

			$(function() {
				$("#register").click(function() {
					swal("恭喜您！", "註冊成功！", "success")
				});
			})
		</script>
		<script src="${pageContext.servletContext.contextPath}/js/login/index.js"></script>
</body>
</html>