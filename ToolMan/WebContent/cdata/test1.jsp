<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="toolman.cdata.model.*"%>
<%@ page import="java.util.Set" %>
<%@ page import="toolman.order.model.*" %>
<%	
 	Set<OrderVO> orders = (Set<OrderVO>) request.getAttribute("orders");
	pageContext.setAttribute("orders2", orders);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<style>
.a {
	border: 2px dashed #66b5ff;
	margin: 5px 10px ;
	overflow: hidden;
	background-color: #cce6ff;
}
.page {
	text-align: center;
}
.b {
	text-align: center; 
	border-bottom: 1px solid red;
}
hr {
	border: 0;
	height: 1px;
	background-color: #d4d4d4;
	color: #d4d4d4
}
.font_right{
	float: right;
}
</style>
	<div class="container">
<!-- 		<div> -->
		<div style="border: 2px solid gray;">
		<div style="margin:10px;">
			<img height="350px" wight="350px" src='${pageContext.servletContext.contextPath}/images/Plankton.jpg'/>
		</div>
		<div style="margin-left:15px; margin-top:15px;">
			<p>姓名:&nbsp;${cdataVO.c_name}</p>
			<p>地區:&nbsp;${cdataVO.c_city}&nbsp;${cdataVO.c_district}</p>
		</div>
		</div>
		<ul class="nav nav-tabs" >
			<li><a id="change-one" class="active" data-toggle="tab"  href="#home">評價</a></li>
			<li><a id="change-two" data-toggle="tab" href="#menu2">媒合紀錄</a></li>
		</ul>
 
		<div class="tab-content" style="background-color:gray;">
			<div id="home" class="tab-pane fade in active">
				<div>
					<!--     background-color:red; -->
					<div>
						<h6>
							<input type="checkbox" name="star" value="">5顆星 <input
								type="checkbox" name="star" value="">4顆星 <input
								type="checkbox" name="star" value="">3顆星 <input
								type="checkbox" name="star" value="">2顆星 <input
								type="checkbox" name="star" value="">1顆星
							<hr>
						</h6>
					</div>
					<div>

<%  int rowsPerPage = 5;  //每頁的筆數     
    int rowNumber=0;      //總筆數
    int pageNumber=0;     //總頁數     
    int whichPage=1;      //第幾頁
    int pageIndexArray[]=null;
    int pageIndex=0; 
%>

<%  
    rowNumber=orders.size();
    if (rowNumber%rowsPerPage !=0)
     pageNumber=rowNumber/rowsPerPage +1;
    else pageNumber=rowNumber/rowsPerPage;    

    pageIndexArray=new int[pageNumber]; 
    for (int i=1 ; i<=pageIndexArray.length ; i++)
    pageIndexArray[i-1]=i*rowsPerPage-rowsPerPage;
%>

<%  try {
      whichPage = Integer.parseInt(request.getParameter("whichPage"));
      pageIndex=pageIndexArray[whichPage-1];
    } catch (NumberFormatException e) { //第一次執行的時候
       whichPage=1;
       pageIndex=0;
    } catch (ArrayIndexOutOfBoundsException e) { //總頁數之外的錯誤頁數
         if (pageNumber>0){
              whichPage=pageNumber;
              pageIndex=pageIndexArray[pageNumber-1];
         }
    } 
%>
						<c:forEach var="odata" items="${orders}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<div class="a">
								<p>
									<label>${odata.b_name}</label><span style="margin-left:40px;">${odata.o_tdate}</span>
								</p>
								<p>${odata.ma_des}</p>
							</div>
						</c:forEach>
<!-- <div > -->
<!-- <table border="0">     -->
<!--    <tr> -->
<%--   <%if (rowsPerPage<rowNumber) {%> --%>
<%--     <%if(pageIndex>=rowsPerPage){%> --%>
<%--         <td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=1">至第一頁</A>&nbsp;</td> --%>
<%--         <td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage-1%>">上一頁 </A>&nbsp;</td> --%>
<%--     <%}%> --%>
<%--     <%if(pageIndex<pageIndexArray[pageNumber-1]){%> --%>
<%--          <td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage+1%>">下一頁</A>&nbsp;</td> --%>
<%--          <td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=pageNumber %>">至最後一頁</A>&nbsp;</td> --%>
<%--     <%}%> --%>
<%--   <%}%>   --%>
<!--   </tr> -->
<!-- </table>     -->
<!-- </div> -->
<%if ( pageNumber > 1) {%>
<div style="margin-left:500px">
<table border="0">   
 <tr> 
   <FORM METHOD="post" ACTION="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do">   
        <td>
           <select  size="1" name="whichPage">
        <%for (int i=1; i<=pageNumber; i++){%><option value="<%=i%>">跳至第<%=i%>頁<%}%> 
           </select>
           <input type="submit" value="確定" >  
        </td>
   </FORM>
 </tr>
</table>
</div>
<%}%>

					</div>
				</div>
			</div>
			<div id="menu2" class="tab-pane fade">
				<div>
					<h6>
						<input type="checkbox" name="star" value="">5顆星 <input
							type="checkbox" name="star" value="">4顆星 <input
							type="checkbox" name="star" value="">3顆星 <input
							type="checkbox" nam="star" value="">2顆星 <input
							type="checkbox" name="star" value="">1顆星
						<hr>
					</h6>
				</div>
				<div Style="width:600px;">
					
<%  
    int rowsPerPage1 = 1;  //每頁的筆數     
    int rowNumber1=0;      //總筆數
    int pageNumber1=0;     //總頁數     
    int pageIndexArray1[]=null;
    int pageIndex1=0; 
    int whichPage1=1;      //第幾頁
%>

<%  
    rowNumber1=orders.size();
    if (rowNumber1%rowsPerPage1 !=0)
     pageNumber1=rowNumber1/rowsPerPage1 +1;
    else pageNumber1=rowNumber1/rowsPerPage1;    

    pageIndexArray1=new int[pageNumber1]; 
    for (int i=1 ; i<=pageIndexArray1.length ; i++)
    pageIndexArray1[i-1]=i*rowsPerPage1-rowsPerPage1;
%>

<%  try {
      whichPage1 = Integer.parseInt(request.getParameter("whichPage"));
      pageIndex1=pageIndexArray1[whichPage-1];
    } catch (NumberFormatException e) { //第一次執行的時候
       whichPage1=1;
       pageIndex1=0;
    } catch (ArrayIndexOutOfBoundsException e) { //總頁數之外的錯誤頁數
         if (pageNumber1>0){
              whichPage1=pageNumber1;
              pageIndex1=pageIndexArray1[pageNumber1-1];
         }
    } 
%>
						<c:forEach var="odata" items="${orders}" begin="<%=pageIndex1%>" end="<%=pageIndex1+rowsPerPage1-1%>">
							<div class="b">
								<label>${odata.b_name}</label><label class="font_right">${odata.o_edate}</label>				
							</div>
						</c:forEach>
						<table border="0">    
 						<tr>
  						<%if (rowsPerPage1<rowNumber1) {%>
   						 <%if(pageIndex1>=rowsPerPage1){%>
        				<td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=2">至第一頁</A>&nbsp;</td>
        				<td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage1-1%>">上一頁 </A>&nbsp;</td><%}%>
   						 <%if(pageIndex1<pageIndexArray1[pageNumber1-1]){%>
     					  <div style="text-align: center">
         					<td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage1+1%>">下一頁</A>&nbsp;</td>
         					<td><A href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=pageNumber1%>">至最後一頁</A>&nbsp;</td>
      					  </div>  
    						<%}%><%}%>  
 						</tr>
 						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>