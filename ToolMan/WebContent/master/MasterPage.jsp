<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${mdataVO.b_name}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<img height="450px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}'/>
	</div>
	<div>
		<H3>${mdataVO.b_name}</H3>
		<p>專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro}</c:forEach></p>
		<p>師傅：${mdataVO.m_name}</p>
		<p>地區：${mdataVO.m_city}　${mdataVO.m_district}</p>
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
</div> <!--container-->
</body>
</html>