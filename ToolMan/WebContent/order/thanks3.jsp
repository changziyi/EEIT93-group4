<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>黑名單</title>

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
<div class="alert alert-warning">
  <h2><strong>已加入黑名單</strong></h2>
  </div>


</body>
</html>
