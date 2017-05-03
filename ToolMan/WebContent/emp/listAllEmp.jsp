<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.rdata.model.*"%>
<%@ page import="toolman.order.model.*"%>

<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
    RdataService rdataSvc = new RdataService();
    List<RdataVO> list = rdataSvc.getAll();
    pageContext.setAttribute("list",list);

%>


<html>
<head>
<title>檢舉 - Rdata.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>所有員工資料 - ListAllEmp.jsp</h3>
		         </td></tr></table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>檢舉編號</th>
		<th>檢舉日期</th>
		<th>消費者帳號</th>
		<th>師傅編號</th>
		<th>主旨</th>
		<th>問題</th>
		<th>評價</th>
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
	                                                                       【${deptVO.dname} - ${deptVO.loc}】
                             </c:if>
                      </c:forEach>
                   --%>  
                      
			
			 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="empno" value="${orderVO.o_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			</tr>
		
			
			<%--
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="empno" value="${empVO.empno}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
			
		</tr>--%>
	</c:forEach>
</table>
 <%@ include file="page2.file" %>
 
</body>
</html>
