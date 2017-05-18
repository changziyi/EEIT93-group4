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
	
	
	
	
	
<body bgcolor='white'>

<jsp:include page="/order/title.jsp" />

<div class="alert alert-success">
  <h2><strong>已刪除資料</strong></h2>
  </div>


</body>
</html>
