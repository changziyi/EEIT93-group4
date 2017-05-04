<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.wishpool.model.*"%>

<%
	WishpoolService wishpoolSvc = new WishpoolService();
	List<WishpoolVO> list = wishpoolSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>多筆許願資料呈現</title>
</head>
<body bgcolor='pink'>

<c:forEach var="wishpoolVO" items="${list}">
    ${wishpoolVO.w_content}

</c:forEach>
	

</body>
</html>