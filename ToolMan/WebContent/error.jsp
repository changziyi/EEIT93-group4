<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ToolMan</title>
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/index/magnific-popup.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<style>
		body {font-family:Microsoft JhengHei;}
	</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<div style="text-align:center;margin-top:150px;">
	<h1 style="font-family:Microsoft JhengHei;color:#778899;">網路連線不穩，請稍待片刻</h1><br>
	<a href="${pageContext.servletContext.contextPath}/index.jsp" class="btn btn-info">回首頁</a><br>
	<img style="margin-top:100px;" width="500" src="${pageContext.request.contextPath}/img/sitting.jpg"/>
</div>
</body>
</html>