<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>



<%
	OrderService orderSvc = new OrderService();
    List<OrderVO> list = orderSvc.getAllOrder();
    pageContext.setAttribute("list",list);

%>
<%--
<jsp:useBean id="listOrder" scope="request" type="java.util.Set" />
--%>

<html>

<head>
<title>cena</title>

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

<div>11111</div>
<div>11111111</div>
<div>11111111</div>

<jsp:include page="/nav/navigation.jsp" />

<div class="alert alert-success">
  <h2><strong>已加入最愛</strong></h2>
  </div>

</body>
</html>
