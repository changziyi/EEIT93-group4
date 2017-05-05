<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%@ page import="toolman.order.model.*"%>

<%
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>員工資料 - ListOneEmp.jsp</h3>
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
	<tr align='center' valign='middle'>
		<td>${orderVO.o_id}</td>
		<td>${orderVO.b_name}</td>
		<td>${orderVO.o_edate}</td>
		<td>${orderVO.o_des}</td>
		<td>${orderVO.o_location}</td>
		<td>${orderVO.m_rating}</td>
        <td>${orderVO.ca_des}</td>
        
	 </tr>
</table>

</body>
</html>
