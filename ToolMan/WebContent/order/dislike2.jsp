<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.blacklist.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>
<jsp:useBean id="myHate" scope="request" type="java.util.Set" />

	<style>
	
</style>
<html>

<head>
<title>Tool Man</title>
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />

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

<jsp:include page="/nav/navigation.jsp" />




  <table class="table table-bordered" style="background-color:#EEEEEE;">
	<tr>
	
		<th>店家編號</th>
		<th>消費者帳號</th>
		<th>刪除</th>
		
		
	</tr>
	
<%-- 	 <%@ include file="page1.file" %>  --%>
<%-- 	<c:forEach var="blacklistVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
	
	
		<c:forEach var="blacklistVO" items="${myHate}" > 
	
	
		<tr align='center' valign='middle'>
		
			<td>${blacklistVO.mdataVO.b_name}</td>
			<td>${blacklistVO.cdataVO.c_id}</td>
			
			
			
			<td>
			  <a href="${pageContext.servletContext.contextPath}/order/Dislike.do?bk_id=${blacklistVO.bk_id}&action=delete" class="btn btn-info ">
          <span class="glyphicon glyphicon-trash"></span> 刪除 
        </a>
			    
			</td>
			
		</tr>
		
	</c:forEach>
</table>
 </div>
 
 

 
 
 <%----- --------%>



</body>
</html>
