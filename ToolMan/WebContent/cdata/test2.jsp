<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <c:if test="${empty LoginOK}">
    	<c:set var="target" value="${pageContext.request.servletPath}" scope="session"/>
    	<c:redirect url="/cdata/login-in.jsp"/>
   		</c:if>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a>測試登入成功1</a>
</body>
</html>