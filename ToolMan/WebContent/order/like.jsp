<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.favorite.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
	FavoriteService favoriteSvc = new FavoriteService();
    List<FavoriteVO> list = favoriteSvc.getAllFavorite();
    pageContext.setAttribute("list",list);

%>
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
      <li class="active"><a href="#">Home</a></li>
      <li><a href="listAllEmp.jsp">訂單</a></li>
      <li><a href="like.jsp">收藏店家</a></li>
      <li><a href="dislike.jsp">黑名單</a></li>
      <li><a href="<%=request.getContextPath()%>/master/List.jsp">搜尋店家</a></li>
      
    </ul>
  </div>
</nav>


<b><font color=red></font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1200'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>我的最愛</h3>
		         </td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='1200'>
	<tr>
		<th>編號</th>
		<th>店家編號</th>
		<th>消費者帳號</th>
		<th>刪除</th>
		
		
	</tr>
	
	 <%@ include file="page1.file" %> 
	<c:forEach var="favoriteVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr align='center' valign='middle'>
			<td>${favoriteVO.f_id}</td>
			<td>${favoriteVO.m_id}</td>
			<td>${favoriteVO.c_id}</td>
			
			
			
			<td>
			
			  <FORM METHOD="post" ACTION="Favorite.do"> 
 			    <input type="submit" value="刪除">
 			    <input type="hidden" name="f_id" value="${favoriteVO.f_id}">
		    <input type="hidden" name="action"value="delete"></FORM> 
		  
			    
			</td>
			
		</tr>
		
	</c:forEach>
</table>
 <%@ include file="page2.file" %>
 </div>
 
 

 
 
 <%----- --------%>



</body>
</html>
