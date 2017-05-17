<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
    	<style>
		body {font-family:Microsoft JhengHei;}

</style>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/master/index1.jsp">ToolMan</a>
    </div>
    <ul class="nav navbar-nav">
 <li><a href="${pageContext.servletContext.contextPath}/mdata/MdataOrderServlet.do?m_id=${LoginOK.m_id}&action=listOrder">師傅訂單</a></li>
 <li><a href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=listOrder">消費者訂單</a> </li>
 <li><a href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myLike">我的最愛</a> </li>
 <li><a href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myHate">黑名單</a> </li>
      
    </ul>
  </div>
</nav>