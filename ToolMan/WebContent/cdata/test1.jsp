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
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<!---- dialog ---->
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<style>
.a {
	border: 2px dashed #66b5ff;
	margin: 5px 10px ;
	overflow: hidden;
	background-color: #cce6ff;
}
.b { 
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
.cdata_box{
	width:450px;
	height:450px;
	border: 1px solid red;
	background-color:gary;
	overflow: hidden;
	float: right;
	margin:15px;
}
.manber-table {
	width:600px;
	border-collapse:collapse;
}
td,th {
	border:1px solid #DCDCDC;
}
label{
	font-size: 20px;
}
thead {
	background-color:#46a3ff;
	color:#ffffff;
	text-align:left;
	border:2px solid #46a3ff;
}
tbody {
	background-color:#ACD6FF;
	border:2px solid #DCDCDC;
}
tbody tr:nth-child(2n) {
	background-color:#acd6ff;
}
tbody tr:nth-child(2n+1) {
	background-color:#d2e9ff;
}
tbody tr:hover {
	background-color:#ffffff;
}
tbody td:hover {
	color:	#000000;
}
.size{
	width:120px;
	height:35px;
}
#table1{
	margin-top:20px;
}
.bottom{
	height: 30px;
	width: 110px;
	font-size: 18px;
	color: white;
	background-color: #ed9b4a;
	border: 0 none;
	cursor: pointer;
	border-radius: 10px;
}
.bottom:hover {
	background-color: #cc711f;
}
</style>
<body>
<jsp:include page="/nav/navigation.jsp" />
<div style="margin-top: 50px;">
	<div class="container">
	
	<div class="page-header">
			<div class="row">
		</div>
	
		<div class="cdata_box">
		<div>
		<img height="30px" src='${pageContext.servletContext.contextPath}/image/btn_member.jpg'/>
		<label>--會員資料--</label>
		<table class="manber-table">
			<thead>			
			<tr class="size"><th colspan="2" >會員基本資料</th></tr>
			</thead>
			<tbody>
			<tr>		
				<td class="size">姓名:</td>	
				<td>${cdataVO.c_name}</td>
			</tr>
			<tr>
				<td class="size">手機:</td>
				<td>${cdataVO.c_cel}</td>				
			</tr>
			<tr>
				<td class="size">信箱:</td>
				<td>${cdataVO.c_email}</td>				
			</tr>
			<tr>				
				<td class="size">生日:</td>
				<td>${cdataVO.c_birth}</td>
			</tr>
			<tr>				
				<td class="size">地址:</td>
				<td>${cdataVO.c_addr}</td>
			</tr>
			<thead>			
			<tr class="size"><th colspan="2" >
			<div style="margin-left:320px;">		
			<button id="create-user">修改</button>
			</div>
			</th></tr>
			</thead>			
			</tbody>
		</table>
		<!---- dialog ---->
<!------------------------------>
			<div id="dialog" title="Dialog">
    		<form>  
    			<fieldset>  
    			<label for="name">姓名:</label>  
    			<input type="text" name="name" id="c_name" value="${cdataVO.c_name}" class="text ui-widget-content ui-corner-all" />
     			<label for="password">密碼:</label>  
    			<input type="password" name="addr" id="c_pswd" value="${cdataVO.c_pwd}" class="text ui-widget-content ui-corner-all" />     			   
    			<label for="cel">手機:</label>  
    			<input type="text" name="cel" id="c_cel" value="${cdataVO.c_cel}" class="text ui-widget-content ui-corner-all" />   
    			<label for="email">信箱:</label>  
    			<input type="text" name="email" id="c_email" value="${cdataVO.c_email}" class="text ui-widget-content ui-corner-all" />   
    			<label for="birth">生日:</label>  
    			<input type="text" name="birth" id="c_birth" value="${cdataVO.c_birth}" class="text ui-widget-content ui-corner-all" />    
    			<label for="addr">地址:</label>  
    			<input type="text" name="addr" id="c_addr" value="${cdataVO.c_addr}" class="text ui-widget-content ui-corner-all" />  
  				</fieldset>  
   		  	 </form>  
			</div>
<!------------------------------>
		</div>
		<table class="manber-table" id="table1">
			<thead>			
			<tr class="size"><th colspan="2" >會員基本資料</th></tr>
			</thead>
			<tbody>
			<tr>		
				<td class="size">使用者密碼:</td>	
				<td>${cdataVO.c_name}</td>
			</tr>
			<tr>
				<td class="size">手機:</td>
				<td>${cdataVO.c_cel}</td>				
			</tr>		
			</tbody>
		</table>		
		</div>
		<div style="border: 2px solid gray;">
		<div style="margin:15px;">
			<img height="350px" wight="350px" src='${pageContext.servletContext.contextPath}/images/Plankton.jpg'/>
			<a type="hidden" name="action" value="change_img"></a>
		<div style="margin-left:15px; margin-top:15px;">
		</div>
			<p>姓名:&nbsp;${cdataVO.c_name}</p>
			<p>地區:&nbsp;${cdataVO.c_city}&nbsp;${cdataVO.c_district}</p>
		</div>
		<ul class="nav nav-tabs" >
			<li><a id="change-one" class="active" data-toggle="tab"  href="#home">評價</a></li>
			<li><a id="change-two" data-toggle="tab" href="#menu2">媒合紀錄</a></li>
		</ul>
<!--  style="background-color:gray;" -->
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<div>
					<!--     background-color:red; -->
					<div>
						<h6>
							<input type="checkbox" name="star" value="">5顆星 
							<input type="checkbox" name="star" value="">4顆星 
							<input type="checkbox" name="star" value="">3顆星 
							<input type="checkbox" name="star" value="">2顆星 
							<input type="checkbox" name="star" value="">1顆星
						</h6>
							<hr>
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
<!-- <div style="text-align: center" > -->
<!-- <table border="0">     -->
<%--   <%if (rowsPerPage<rowNumber) {%> --%>
<%--     <%if(pageIndex>=rowsPerPage){%> --%>
<%--         <a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=1">至第一頁</a>&nbsp; --%>
<%--         <a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage-1%>">上一頁 </a>&nbsp;<%}%> --%>
<%--     <%if(pageIndex<pageIndexArray[pageNumber-1]){%> --%>
<%--          <a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage+1%>">下一頁</a>&nbsp; --%>
<%--          <a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=pageNumber %>">至最後一頁</a>&nbsp; --%>
<%--          <%}%><%}%>   --%>
<!-- </table>     -->
<!-- </div> -->

						<div style="text-align: center">
						<table border="0">    		
  						<%if (rowsPerPage<rowNumber) {%>
   						 <%if(pageIndex>=rowsPerPage){%>
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=1">至第一頁</a>&nbsp;
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=whichPage-1%>">上一頁 </a>&nbsp;<%}%>
   						 <%if(pageIndex<pageIndexArray[pageNumber-1]){%>
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=whichPage+1%>">下一頁</a>&nbsp;
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=pageNumber%>">至最後一頁</a>&nbsp; 
    						<%}%><%}%>  
 						</table>
							<table border="0">    
							<%if ( pageNumber > 1) {%>
   							<form method="post" action="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do">   
           					<select  size="1" name="whichPage">
       						 <%for (int i=1; i<=pageNumber; i++){%><option value="<%=i%>">跳至第<%=i%>頁<%}%> 
          					 </select>
          					 <input type="submit" value="確定" >          
   							</form>
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
					</h6>
						<hr>
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
						<div style="text-align: center">
						<table border="0">    		
  						<%if (rowsPerPage1<rowNumber1) {%>
   						 <%if(pageIndex1>=rowsPerPage1){%>
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=2">至第一頁</a>&nbsp;
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage1-1%>">上一頁 </a>&nbsp;<%}%>
   						 <%if(pageIndex1<pageIndexArray1[pageNumber1-1]){%>
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=whichPage1+1%>">下一頁</a>&nbsp;
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?whichPage=<%=pageNumber1%>">至最後一頁</a>&nbsp; 
    						<%}%><%}%>  
 						</table>
 					   </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>	
	<script>
	var name = $( "#name" ),   
    email = $( "#email" );   
 $( "#dialog" ).dialog({   
        autoOpen: false,     
        width: 300,   
        modal: true, 
        resizable: false,//無法更改視窗大小
        draggable: false,//無法拖曳
        buttons: {   
            "Ok": function() {   
            	$( this ).dialog( "close" );  
            },     
            Cancel: function() {   
                $( this ).dialog( "close" );   
            }   
        },   
        close: function() {   
            allFields.val( "" ).removeClass( "ui-state-error" );   
        }   
}); 
 
 $( "#create-user" )   
 .button()   
 .click(function() {   
 $( "#dialog" ).dialog( "open" );   
});  
	
	</script>
</body>
</html>