<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	
<h3>我要開店</h3>

<div>
<form>
	<div>
	<table>
		<tr>
			<td><div><img height="200px" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}"></div></td>
		</tr>
		<tr>
			<td>店家名稱:${mdataVO.b_name}</td>
		</tr>
		<tr>
			<td>店家介紹:${mdataVO.b_des}</td>
		</tr>
		<tr>
			<td>姓名:${mdataVO.m_name}</td>
		</tr>
		<tr>
			<td>電話:${mdataVO.m_cel}</td>
		</tr>
		<tr>
			<td>信箱:${mdataVO.m_email}</td>
		</tr>
		<tr>
			<td>地址:${mdataVO.m_city}${mdataVO.m_district}${mdataVO.m_addr}</td>
		</tr>
		<tr>
			<td>維修類別:<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro}
			</c:forEach></td>
		</tr>
		<tr>
			<td>專業證照<div><img height="200px" src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${mdataVO.m_id}"></div></td>
		</tr>
		<tr>
			<td>
				<input type="button" name="homePage" value="回首頁">
			</td>
		</tr>
	</table>
</div>
</form>
</div>

<script>

	$(function() {
		
		$('input[name="homePage"]').click(function() {
			$(location).attr('href', 'List.jsp');
		});
		
	});

</script>

</body>
</html>