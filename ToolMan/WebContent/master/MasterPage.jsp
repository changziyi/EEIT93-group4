<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<img height="200px" src='${pageContext.servletContext.contextPath}/master/master.do?image=${mdataVO.m_id}'/>
		<H3>${mdataVO.b_name}</H3>
			專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro}
			</c:forEach>
				<br />
			師傅：${mdataVO.m_name} <br />
			地區：${mdataVO.m_city}　${mdataVO.m_district} <br />
	</div>
	<br /><hr /><br />
	<div>
		<c:forEach var="aDiscussions" items="${mdataVO.discussions}"><br />Q: ${aDiscussions.d_des}
			<c:if test="${not empty aDiscussions.d_reply}"><br />A: ${aDiscussions.d_reply}
			</c:if>
			<br />
		</c:forEach>
		<div>
			<p>提問</p>
			<form method="post" action="masterPage.do">
				<textarea name="d_des"></textarea><br />
				<input type="submit" value="送出"><input type="reset" value="取消">
<%-- 				<input type="hidden" name="m_id" value="${mdataVO.m_id}"> --%>
				<input type="hidden" name="action" value="MasterPage_Q">
			</form>
		</div>
	</div>

</body>
</html>