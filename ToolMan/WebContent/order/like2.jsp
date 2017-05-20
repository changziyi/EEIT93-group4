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
	
	
	
	<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
    
	
	
	
<body >
<jsp:include page="/nav/navigation.jsp" />
<jsp:include page="/order/title.jsp" />
<br/>
<br/>
<br/>
<jsp:include page="/nav/navigation.jsp" />




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
			  <a href="${pageContext.servletContext.contextPath}/order/Favorite.do?f_id=${favoriteVO.f_id}&action=delete" class="btn btn-info ">
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
