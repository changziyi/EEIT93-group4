<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="toolman.rdata.model.*"%>
<%@ page import="toolman.order.model.*"%>
<%
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<title>���u��ƭק� - update_emp_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>���u��ƭק� - update_emp_input.jsp</h3>

<h3>��ƭק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="emp.do" name="form1">
<table border="0">
	<tr>
		<td>���u�s��:<font color=red><b>*</b></font></td>
		<td><%=orderVO.getO_id()%></td>
	</tr>
	<tr>
		<td>���u�m�W:</td>
		<td><input type="TEXT" name="ename" size="45" value="<%=orderVO.getC_rating()%>" /></td>
	</tr>
	<tr>
		<td>¾��:</td>
		<td><input type="TEXT" name="job" size="45"	value="<%=orderVO.getCa_des()%>" /></td>
	</tr>
	
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="empno" value="<%=orderVO.getO_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
