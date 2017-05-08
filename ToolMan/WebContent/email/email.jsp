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
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email</title>
</head>
<body>

<div class='container'>
<h1>email</h1>

<form action='Email.do' method='post' action="Email.do">
    <table border='1' class='center'>
    <tr><td width='80'>To</td><td width='580' style='text-align:left;'>&nbsp;${param.id}</td></tr>
    <tr><td width='80'>主旨</td><td width='580'><input type='text'  name='title' size='81' value='${param.title}'></td></tr>
    <tr><td width='80'>內容</td><td width='580'><textarea rows='10' cols='70'  name='content'  value='${param.content}'></textarea></td></tr>
    <tr><td colspan='2'><button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
    <tr><td colspan='2'><button type="submit" class="btn btn-primary">傳送</button>
  </table>
<%--   <input type="hidden"  name='fromid' value='${LoginOK.custId}'> --%>
<%--   <input type="hidden"  name='id' value='${param.id}'> --%>
  
</form>
</div>
<%-- <font color='red'>${ErrorMsgKey.TitleError}</font><br> --%>
<%-- <font color='red'>${ErrorMsgKey.ContentError}</font><br> --%>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>