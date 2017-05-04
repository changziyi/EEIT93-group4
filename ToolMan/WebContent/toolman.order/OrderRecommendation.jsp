<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Order Recommendation</title>


</head>
<body>
<h1>get to this page </h1>


<%-- 	<div>  <img src="${pageContext.servletContext.contextPath }/toolman.order/OrderRecommendation" /><div> --%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<% List mdataVOlist = (List) session.getAttribute("recommendmaster"); %>

		<c:forEach var="master" varStatus="stat" items="${recommendmaster}">	
					${master.b_name}
					${master.m_name}		
		</c:forEach>

<!-- </body> -->
</html>