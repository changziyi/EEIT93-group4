<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="CdataVO" class="toolman.cdata.model.CdataVO" />
<c:set var="subTitle" value="查詢會員資料" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
    <c:if test="${empty LoginOK}">
    	<c:set var="target" value="${pageContext.request.servletPath}" scope="session"/>
    	<c:redirect url="/ch06_01/login.jsp"/>
    </c:if>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${subTitle}</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty memberBean.allMembers}">
					         目前尚未有任何會員資料
		</c:when>
	<c:otherwise>
						會員資料如下:<br>
		<table border="1">				
			<tr>
				<th width="120">姓名</th>
				<th width="120">日期</th>
			</tr>
			<c:forEach var="aBean" items="${ memberBean.allMembers}">
				<tr>
					<td>${aBean.memberId}</td>
					<td>${aBean.password}</td>
					<td>${aBean.name}</td>
					<td>${aBean.address}</td>
					<td>${aBean.phone}</td>
					<td>${aBean.birthday}</td>
				</tr>
			</c:forEach>
		</table>			
	</c:otherwise>
</c:choose>
</body>
</html>