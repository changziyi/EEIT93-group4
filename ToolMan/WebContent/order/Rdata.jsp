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


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<%=request.getContextPath()%>/cdata/index.jsp">Home</a></li>
 <li><a href="<%=request.getContextPath()%>/order/listAllEmp.jsp">訂單</a></li>
      <li><a href="<%=request.getContextPath()%>/order/like.jsp">收藏店家</a></li>
      <li><a href="<%=request.getContextPath()%>/order/dislike.jsp">黑名單</a></li>
      <li><a href="<%=request.getContextPath()%>/master/List.jsp">搜尋店家</a></li>
      
    </ul>
  </div>
</nav>

<h1>已收到投訴，管理員會盡快處理</h1>

</body>
</html>
