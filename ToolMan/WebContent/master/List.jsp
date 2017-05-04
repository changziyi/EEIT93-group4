<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 	<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?image=${mdataVO.m_id}'/> --%>
	
	<br><div><a href='${pageContext.servletContext.contextPath}/master/OpenStoreInfo.jsp'>我要開店</a></div><br>
	
	<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=1000'/>
	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=1000'>master1000</a><br />
	
	<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=1001'/>
	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=1001'>master1001</a><br />
	
	<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=1002'/>
	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=1002'>master1002</a><br />

	<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=1003'/>
	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=1003'>master1003</a><br />


</body>
</html>