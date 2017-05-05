<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="toolman.order.model.*"%>
    
  <%
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>  
    
    
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>
	<!-- login please -->
		<!-- <script src="js/jquery-1.12.3.min.js"></script> -->
	<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	
	
	   	
	<title>john</title>
	
	<!-- retrieve MdataVO object from session-->

</head>
<body>
	
<FORM METHOD="post" ACTION="OrderController.do" name="form1">
	<div>
	訂單編號:<font color=red><b>*</b></font>
	<span> <%=orderVO.getO_id()%></span>
	 <span><%=orderVO.getB_name()%></span>
	</div>
	<label>分數</label>
			<input type="radio" name="m_rating" value="5" checked="checked">5
			<input type="radio" name="m_rating" value="4" >4
			<input type="radio" name="m_rating" value="3" >3
			<input type="radio" name="m_rating" value="2">2
			<input type="radio" name="m_rating" value="1">1
			
	
		<div>
			<label>評價</label><!-- 	ok -->
			<input type="text" id="ca_des" name="ca_des" value="你好"/>
		  <input type="text" id="ma_des" name="ma_des" value="再見"/>
			
		</div>
		
	
		<div>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="o_id" value="<%=orderVO.getO_id()%>">	
		    <input type="hidden" name="c_rating" value="5">	
			
			<input type="submit" value="送出">
		</div>
		
	</form>

	

</body>
</html>