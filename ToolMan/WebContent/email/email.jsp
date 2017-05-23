<%@page import="org.hibernate.SessionFactory"%>
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
	//by Benny
	List<EmailVO> list = emailSvc.getMail(cdataVO.getC_id());

		pageContext.setAttribute("list", list);
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email Page</title>
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
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

colcenter {
margin : 0px auto ;

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
<jsp:include page="/nav/navigation.jsp" />
	<div class="container">
		<div class="row page-header">		
				<div class="row"></div>
		</div>
		<br>

		<div class="row colcenter">
			<div class="col-md-5" style="background-color: #99ceff">

				<div align="center">
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#myModal01">發送 Email</button>
				</div>

			</div>
			<div class="col-md-9" id="emailblock" 
				style="overflow: hidden; margin: 0 auto; background-color: #99ceff"">
				
			
					<div>
						<c:forEach var="emailVO" items="${list}">
							<div class="content_box">
														
								<span>收件人：${emailVO.mss_id}</span>
								<br>
								<span>寄件人：${emailVO.msr_id}</span>
								<br>
								主旨： 
							<button class="btn btn-primary" data-toggle="modal" id="selectbtn"
						data-target="#clickSummary" data-id="${emailVO.ms_id}">${emailVO.ms_summary}</button>
								<br> 
								時間：${emailVO.ms_date}
								<br> 
								<span>狀態：<span>${emailVO.s_name == 'true' ? '已讀':'未讀'}</span></span>

								
							<form action="Email.do" method="post">
							<input type="submit" class="btn btn-default"  value="刪除" ><span aria-hidden="true"></span>
							<input type="hidden" name="ms_id" value="${emailVO.ms_id}"></input>
							<input type="hidden" name="action" value="del1"></input>
							</form>
							
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	

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
								<td>收件人：${Onelist.mss_id}</td>
							</tr>
							<tr>
								<td>寄件人：${Onelist.msr_id}</td>
							</tr>
							<tr>
								<td>主旨：${Onelist.ms_summary}</td>
							</tr>
							<tr>								
								<td>內容：${Onelist.ms_content}</td>
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
								<td><label style="vertical-align: top">內容：</label>
								
								<textarea name="ms_content" style="width: 400px; height: 120px"
								placeholder="請輸入內容"></textarea></td>
							</tr>
						</table>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">送出</button>			
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
	<script type="text/javascript">
	$('button.btn-primary').click(function(){
		var dataid = $(this).attr('data-id');
		$.get('Email.do',{
			'action':'updateisRead',
			'msid':dataid
		});
		var divparent =  $(this).parent('div');
		var receiveid = divparent.children('span:first').text();
		var receiveid2 = divparent.children('span:eq(1)').text();
		var receiveid3 = $(this).text();
		var receiveid4 = divparent.children('span:eq(2)').text();
		$('td:first').text(receiveid);
		$('td:eq(1)').text(receiveid2);
		$('td:eq(2)').text("主旨: "+receiveid3);
		$('td:eq(3)').text(receiveid4);
		divparent.children('span:eq(3)').children().text('已讀');
	})
	
	
	</script>
</body>
</html>