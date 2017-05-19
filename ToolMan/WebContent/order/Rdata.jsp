<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>已收到投訴</title>

</head>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<body >
<jsp:include page="/nav/navigation.jsp" />
<jsp:include page="/order/title.jsp" />
<br/>
<br/>
<br/>
<div class="alert alert-success">
  <h2><strong>已收到投訴，管理員會盡快處理</strong></h2>
  </div>
</body>
</html>
