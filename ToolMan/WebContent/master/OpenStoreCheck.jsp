<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<%-- 	${mdataVO.m_id} --%>
<%-- 	<img height="200px" src="master.do?image=${mdataVO.m_id}"> --%>
	
<h3>我要開店</h3>

<div>
<form>
	<div>
	<table>
		<tr>
			<td><div><img height="200px" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}"></div></td>
		</tr>
		<tr>
			<td>店家名稱:
			<input type="text" name="b_name" /></td>
		</tr>
		<tr>
			<td>姓名:${mdataVO.m_name}</td>
		</tr>
		<tr>
			<td>
				<input type="button" name="frontPage" value="回首頁">
			</td>
		</tr>
	</table>
</div>
</form>
</div>

<script>

	$(function() {
		
		$('input[name="frontPage"]').click(function() {
			$(location).attr('href', 'OpenStoreDesc.jsp');
		});
		
	});

</script>

</body>
</html>