<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>

<%
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>

<%
    OrderService orderSvc = new OrderService();
    List<OrderVO> list = orderSvc.getAllOrder();
    pageContext.setAttribute("list",list);

%>


<html>
<head>
<title>cena</title>
</head>
<body bgcolor='white'>
<b><font color=red></font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>123654</h3>
		         </td></tr></table>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>店家名稱</th>
		<th>訂單完成時間</th>
		<th>維修項目說明</th>
		<th>施工地址</th>
		<th>師傅分數</th>
		<th>消費者評價說明</th>
	</tr>
	
	 <%@ include file="page1.file" %> 
	<c:forEach var="orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">>
	
		<tr align='center' valign='middle'>
			<td>${orderVO.o_id}</td>
			<td>${orderVO.b_name}</td>
			<td>${orderVO.o_edate}</td>
			<td>${orderVO.o_des}</td>
			<td>${orderVO.o_location}</td>
	<%--	
			<td>${rdataVO.p_content}</td>
			
		 
			          <c:forEach var="deptVO" items="${deptSvc.all}">
                             <c:if test="${empVO.deptno==deptVO.deptno}">
	                                                                       【${deptVO.dname} - ${deptVO.loc}】
                             </c:if>
                      </c:forEach>
                   --%>  
                      
			
			 
			<td>
			
			
			
			
			  <FORM METHOD="post" action="OrderController.do">
	
			     <input type="submit" value="修改">
			     <input type="hidden" name="o_id" value="${orderVO.o_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			 
			</td>
			
			<td>
			
			
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
