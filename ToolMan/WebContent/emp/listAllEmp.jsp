<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.rdata.model.*"%>
<%@ page import="toolman.order.model.*"%>

<%-- �����ĥ� JSTL �P EL ���� --%>

<%
    RdataService rdataSvc = new RdataService();
    List<RdataVO> list = rdataSvc.getAll();
    pageContext.setAttribute("list",list);

%>


<html>
<head>
<title>���| - Rdata.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>�Ҧ����u��� - ListAllEmp.jsp</h3>
		         </td></tr></table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>���|�s��</th>
		<th>���|���</th>
		<th>���O�̱b��</th>
		<th>�v�Žs��</th>
		<th>�D��</th>
		<th>���D</th>
		<th>����</th>
	</tr>
	
	 <%@ include file="page1.file" %> 
	<c:forEach var="rdataVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">>
	
		<tr align='center' valign='middle'>
			<td>${rdataVO.r_id}</td>
			<td>${rdataVO.r_date}</td>
			<td>${rdataVO.c_id}</td>
			<td>${rdataVO.m_id}</td>
			<td>${rdataVO.p_summary}</td>
			<td>${rdataVO.p_content}</td>
			
			<%-- 
			          <c:forEach var="deptVO" items="${deptSvc.all}">
                             <c:if test="${empVO.deptno==deptVO.deptno}">
	                                                                       �i${deptVO.dname} - ${deptVO.loc}�j
                             </c:if>
                      </c:forEach>
                   --%>  
                      
			
			 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="empno" value="${orderVO.o_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			</tr>
		
			
			<%--
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="empno" value="${empVO.empno}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
			
		</tr>--%>
	</c:forEach>
</table>
 <%@ include file="page2.file" %>
 
</body>
</html>
