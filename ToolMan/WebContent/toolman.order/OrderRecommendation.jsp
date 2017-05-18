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
<h1>Other masters you may like to check out</h1>
<%-- 	<div>  <img src="${pageContext.servletContext.contextPath }/toolman.order/OrderRecommendation.do" /><div> --%>


		<c:forEach var="master" varStatus="stat" items="${recommendmaster}">	
					${master.b_name}
					${master.m_name}
					${master.m_id}	
		<img width="100" src="${pageContext.servletContext.contextPath}/toolman.order/OrderRecommendation.do?m_id=${master.m_id}"/>	
		</c:forEach>

<!-- </body> -->
</html>