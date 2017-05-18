<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.favorite.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>
<jsp:useBean id="myLike" scope="request" type="java.util.Set" />

<html>

<head>
<title>我的最愛</title>

</head>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	
	
	
<body bgcolor='white'>


<jsp:include page="/order/title.jsp" />




  <table class="table table-bordered">
	<tr>
		<th>店家編號</th>
		<th>消費者帳號</th>
		<th>刪除</th>
		
		
	</tr>
	
<%-- 	 <%@ include file="page1.file" %>  --%>
<%-- 	<c:forEach var="favoriteVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
	
		<c:forEach var="favoriteVO" items="${myLike}" > 
	
	
		<tr align='center' valign='middle'>
			<td><a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${favoriteVO.mdataVO.m_id}'>${favoriteVO.mdataVO.b_name}</a></td>
			<td>${favoriteVO.cdataVO.c_id}</td>
			
			
			
			<td>
			
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/Favorite.do"> 
 			    <input type="submit" value="刪除">
 			    <input type="hidden" name="f_id" value="${favoriteVO.f_id}">
		    <input type="hidden" name="action"value="delete"></FORM> 
		  
			    
			</td>
			
		</tr>
		
	</c:forEach>
</table>
 </div>
 
  
     

   
 
 <%----- --------%>



</body>
</html>
