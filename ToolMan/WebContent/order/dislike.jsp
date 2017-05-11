<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.blacklist.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
	BlacklistService blacklistSvc = new BlacklistService();
    List<BlacklistVO> list = blacklistSvc.getAllBlacklist();
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
	<tr bgcolor='gray' align='center' valign='middle' height='20'>
		<td><h3>黑名單</h3>
		         </td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='1200'>
	<tr>
		<th>編號</th>
		<th>店家編號</th>
		<th>消費者帳號</th>
		<th>刪除</th>
		
		
	</tr>
	
	 <%@ include file="page1.file" %> 
	<c:forEach var="blacklistVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr align='center' valign='middle'>
			<td>${blacklistVO.bk_id}</td>
			<td>${blacklistVO.mdataVO.b_name}</td>
			<td>${blacklistVO.cdataVO.c_id}</td>
			
			
			
			<td>
			
			  <FORM METHOD="post" ACTION="Dislike.do"> 
 			    <input type="submit" value="刪除">
 			    <input type="hidden" name="bk_id" value="${blacklistVO.bk_id}">
		    <input type="hidden" name="action"value="delete"></FORM> 
		  
			    
			</td>
			
		</tr>
		
	</c:forEach>
</table>
 <%@ include file="page2.file" %>
 </div>
 
   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cdata/CdataOrderServlet.do" >
       <input type="submit" value="消費者最愛">
        <input type="hidden" name="c_id" value="Snoopy">
        <input type="hidden" name="action" value="myHate">
     </FORM>

 
 
 <%----- --------%>



</body>
</html>
