
<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ page import="java.util.*"%> 
<%@ page import="toolman.email.model.*"%> 
<%@ page import="toolman.cdata.model.*"%> 
<%	
	EmailService emailSvc = new EmailService();
	HttpSession sessions = request.getSession();
	CdataVO cdataVO = (CdataVO)sessions.getAttribute("LoginOK");
	System.out.println(cdataVO.getC_id());
	List<EmailVO> list = emailSvc.getMail(cdataVO.getC_id());
	pageContext.setAttribute("list", list);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email Page</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://masonry.desandro.com/jquery.masonry.min.js"></script>


<%-- 	src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script> --%>

<style>
body {font-family:Microsoft JhengHei;}
.content_box {
	display: inline-block;
	border: 5px dashed #ccb3ff;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 630px;
	background-color: #cce6ff;
	height:300px ;
	
}

.bgcolor {
	background-color: #4dd2ff;
	border: 5px double #3399ff;
	border-radius: 25px;
}

.modal-content {
	background-color: #ccffff;
	border-radius: 23px;
}

p {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 17px;
}

</style>

</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="container">
	
		<div class="row page-header">		
				<div class="row"></div>
		</div>
		
		
		<div class="row">
			<div class="col-md-3">
				<div class="well text-center bgcolor">
					<div>
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#myModal01">
							 發送 e-mail
						</button>
					</div>			
				</div>
			</div>
			
			<div class="col-md-8" id="emailblock" 
				style="overflow: hidden; margin: 0 auto">
				
			
						<c:forEach var="emailVO" items="${list}">
							<div class="content_box" name="mainblock " >
					            <div class="modal-header" >			
								<span name="receiver1${emailVO.ms_id}">收件人：${emailVO.mss_id}</span>
								<br>
								<span name="sender1${emailVO.ms_id}">寄件人：${emailVO.msr_id}</span>
								<br>
								</div>
								<div class="modal-body">
								主旨： 
								<button class="btn btn-default" data-toggle="modal" id="selectbtn" name="btndetail" data-name="btndetail${emailVO.ms_id}"
						   		 data-target="#clickSummary" data-id="${emailVO.ms_id}">${emailVO.ms_summary}</button>
								<br class="content1"> 
								<span name="content1${emailVO.ms_id}">內容：<span >${emailVO.ms_content}</span></span>
								<br> 
								<span name="time1${emailVO.ms_id}">時間：<span >${emailVO.ms_date}</span></span>
								<br> 
								<span >狀態：<span name="readornot${emailVO.ms_id}" >${emailVO.s_name == 'true' ? '已讀':'未讀'}</span></span>
	                 			</div>
	                 			<div class="modal-footer">
							<form action="Email.do" method="post">
							<input type="submit" class="btn btn-danger pull-right"  value="刪除" ><span aria-hidden="true"></span>
							<input type="hidden" name="ms_id" value="${emailVO.ms_id}"></input>
							<input type="hidden" name="action" value="del1"></input>
							</form>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
	
	
<!-------------------- 詳細內容的彈出視窗 --------------------------------------------->
	<div class="modal fade" id="clickSummary" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
<form method="POST" action="Email.do">
				<div class="modal-content">
					<div class="modal-header" >
						<H4 style="color: blue">
						Content
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>

							</button>
						</H4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td name="receiver2">收件人：${Onelist.mss_id}</td>
							</tr>
							<tr>
								<td name="sender2">寄件人：${Onelist.msr_id}</td>
							</tr>
							<tr>
								<td name="btndetail2">主旨：${Onelist.ms_summary}</td>
							</tr>
							<tr>								
								<td name="content2">內容：${Onelist.ms_content}</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>

					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	<!------------------------ 發送信件的彈出視窗 -------------------------------------------------->
	
		<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<form method="POST" action="Email.do">
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
														
								<p>收件人 ： </p>								
								 <input type="text" name="mss_id" required="true"
									value="${param.mss_id}" />${errorMsgs.email1}${errorMsgs.email2}
																											
								<p>主旨 ： </p> 
								<input type="text" name="ms_summary" required="true"
									value="${param.ms_summary}" />${errorMsgs.email1}${errorMsgs.email2}
												
								<p>內容：</p>								
								<textarea name="ms_content" style="width: 400px; height: 120px"
								placeholder="請輸入內容"></textarea>
																
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal04">送出</button>			
					</div>
					
<!-- 					<form action="Email.do" method="post"> -->
<!-- 					<input type="submit" class="btn btn-default"  value="送出" ><span aria-hidden="true"></span> -->
<%-- 					<input type="hidden" name="ms_id" value="${emailVO.ms_id}"></input> --%>
<!-- 					<input type="hidden" name="action" value="submit1"></input> -->
<!-- 					</form> -->
		
					
				</div>
			</form>
		</div>
	</div>
	<!------------------ 發信確認 ------------>
	

	<div class="modal fade" id="myModal04" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">
						寄信成功!
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
					</h3>
					</button>
				</div>
				<div class="modal-body">
					<p>123456</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">離開</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<!------------------------------------ js ---------------------------------------------------->
	<script>
	$(function() {
// 		$('#emailblock').imagesLoaded(function() {
// 			$('#emailblock').masonry({
// 				itemSelector : '.content_box',
// 				columnWidth : 275,
// 				animate : true
// 			});
// 		});
		$('[name="btndetail"]').click(function(){
			var dataid = $(this).attr('data-id');
			$.get('Email.do',{
				'action':'updateisRead',
				'msid':dataid
			});

			$('[name="receiver2"]').text($('[name="receiver1'+dataid+'"]').text());
			$('[name="sender2"]').text($('[name="sender1'+dataid+'"]').text());
			$('[name="btndetail2"]').text("主旨: "+$('[data-name="btndetail'+dataid+'"]').text());
			$('[name="content2"]').text($('[name="content1'+dataid+'"]').text());
			$('[name="readornot'+dataid+'"]').text('已讀');
//	 		divparent.children('span:eq(4)').children().text('已讀');
		})
	});
	
	
	
	</script>
</body>
</html>