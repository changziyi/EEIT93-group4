<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.email.model.*"%>

<%
	EmailService emailSvc = new EmailService();
	List<EmailVO> list = emailSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emailing Page</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://masonry.desandro.com/jquery.masonry.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>

<style>
.content_box {
	display: inline-block;
	border: 1px solid blue;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 240px;
	background-color: #cce6ff;
	
}

.zipcode {
	display: none;
}
</style>

<script>
	$(function() {
		$('#emailblock').imagesLoaded(function() {
			$('#emailblock').masonry({
				itemSelector : '.content_box',
				columnWidth : 275,
				animate : true
			});
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="background-color: #99ceff">
				<H1 style="color: green" align="center">測試用頁面</H1>
			</div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-3" style="background-color: #99ceff">

				<div align="center">
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#myModal01">email</button>
				</div>

			</div>
			<div class="col-md-9" id="emailblock" 
				style="overflow: hidden; margin: 0 auto; background-color: #99ceff"">
					<div>
						<c:forEach var="emailVO" items="${list}">
							<div class="content_box">								
								收件人：${emailVO.mss_id}
								<br>
								寄件人：${emailVO.msr_id}
								<br>
								主旨：${emailVO.ms_summary} 
								<br> 
								內容：${emailVO.ms_content}
								<br> 
								時間：${emailVO.ms_date}
								<br> 
								狀態：${emailVO.s_name}
								
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	

	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form method="POST" action="Email.do"
				enctype="multipart/form-data">

				<div class="modal-content">
					<div class="modal-header">
						<H4 style="color: blue">
							email
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>

							</button>
						</H4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>收件人 ： <input type="text" name="mss_id" required="true"
									value="${param.mss_id}" />${errorMsgs.email1}${errorMsgs.email2}
								</td>
							</tr>
						
							<tr>
								<td>主旨 ： <input type="text" name="ms_summary" required="true"
									value="${param.ms_summary}" />${errorMsgs.email1}${errorMsgs.email2}
								</td>
							</tr>
						
							<tr>
								<td><label style="vertical-align: top">內容：
								
								<textarea name="ms_content" style="width: 400px; height: 120px"
								placeholder="請輸入內容"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">送出</button>			
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>