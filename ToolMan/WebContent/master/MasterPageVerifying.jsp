<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${mdataVO.b_name}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
</head>
	<style>
		body {font-family:Microsoft JhengHei;}
		.myDiv {position:relative; top:70px;}
		.cen {}
	</style>
<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="myDiv">
		<div class="text-center　cen">
		<h3>店家審核中，敬請等待</h3>
		<button class="btn btn-info">回首頁</button>
		</div>
	</div>
</body>
</html>