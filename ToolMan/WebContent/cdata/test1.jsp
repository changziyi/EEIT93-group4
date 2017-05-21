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

<link href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css" rel="stylesheet">
<!-- <link type="text/css" href="../js/css/jquery-ui-1.8.11.custom.css" rel="Stylesheet"> -->
	<script src='${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js'></script>
<script src="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.js"></script>

</head>
<style>
.a {
	border: 2px solid #66b5ff;
	margin: 5px 10px ;
	overflow: hidden;
	background-color: #cce6ff;
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
	width:530px;
/* 	height:450px; */
	border: 1px solid red;
	background-color:gary;
	overflow: hidden;
	float: right;
	margin:15px 10px 0px 0px;
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
<div style="margin-top: 10px;">
	<div class="container">	
		<div class="page-header">
			<div class="row"></div>
		<div class="cdata_box"> <!--member big model -->
		<!----------------------- 會員資料 ---------------------->
		<div>
		<img height="30px" src='${pageContext.servletContext.contextPath}/image/btn_member.jpg'/>
		<label>  會員資料</label>
		<table class="manber-table">
			<thead>			
			<tr class="size"><th colspan="2" >會員基本資料</th></tr>
			</thead>
				<tbody>
					<tr>		
						<td class="size">姓名:</td><td>${cdataVO.c_name}</td>
					</tr>
					<tr>				
						<td class="size">生日:</td><td>${cdataVO.c_birth}</td>
					</tr>
					<tr>
						<td class="size">手機:</td><td>${cdataVO.c_cel}</td>				
					</tr>
					<tr>
						<td class="size">信箱:</td><td>${cdataVO.c_email}</td>				
					</tr>																
					<tr>			
						<td class="size">地區:</td><td>${cdataVO.c_city}&nbsp;${cdataVO.c_district}	</td>
					</tr>					
					<tr>				
						<td class="size">地址:</td><td>${cdataVO.c_addr}</td>
					</tr>			
			</tbody>
					<tr class="size">
						<th colspan="2" >
							<div style="margin-left:420px;"><button id="create-user">修改</button></div>
						</th>
					</tr>			
		</table>
		<!--------------------------------------------------------- dialog 修改 ------------------------------------------------------------>
			<div id="dialog" title="Dialog">
<!--     		<form id="message_form" method="POST" >   -->
    			<fieldset>  
    			<label for="name">姓名:</label>  
    			<input type="text" name="name" id="c_name" value="${cdataVO.c_name}" class="text ui-widget-content ui-corner-all" />
     			<label for="password">密碼:</label>  
    			<input type="password" name="addr" id="c_pswd" value="${cdataVO.c_pwd}" class="text ui-widget-content ui-corner-all" />
    			<label for="birth">生日:</label>  
    			<input type="text" name="birth" id="c_birth" value="${cdataVO.c_birth}" class="text ui-widget-content ui-corner-all" /> 
   				<label for="cel">手機:</label>  
    			<input type="text" name="cel" id="c_cel" value="${cdataVO.c_cel}" class="text ui-widget-content ui-corner-all" />       			       			
    			<label for="email">信箱:</label>  
    			<input type="text" name="email" id="c_email" value="${cdataVO.c_email}" class="text ui-widget-content ui-corner-all" /> 
    			<label for="addr">地址:</label>  
    			<input type="text" name="addr" id="c_addr" value="${cdataVO.c_addr}" class="text ui-widget-content ui-corner-all" /> 
				<button id="buttonsubmit" class="text ui-widget-content ui-corner-all" >送出</button>
  				</fieldset> 				 
<!--    		  	 </form>   -->
			</div>
		<!---------------------------------------------------------- dialog 修改 ----------------------------------------------------------->
		</div>
		<!----------------------- 會員資料 ---------------------->
<!-- 		<table class="manber-table" id="table1"> -->
<!-- 			<thead>			 -->
<!-- 			<tr class="size"><th colspan="2" >會員基本資料</th></tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 			<tr>		 -->
<!-- 				<td class="size">使用者密碼:</td>	 -->
<%-- 				<td>${cdataVO.c_name}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="size">手機:</td> -->
<%-- 				<td>${cdataVO.c_cel}</td>				 --%>
<!-- 			</tr>		 -->
<!-- 			</tbody> -->
<!-- 		</table>				 -->
		</div><!--member big model -->
		
		<div style="border: 2px solid gray;">
		
		<div style="margin:15px 0px 25px 10px;">
			<img height="300px" wight="250px" src='${pageContext.servletContext.contextPath}/images/Plankton.jpg'/>
			<a type="hidden" name="action" value="change_img"></a>
		</div>
		
<!------------------- 換頁標頭 ----------------------->
		<div>
		<ul class="nav nav-tabs" >
			<li><a class="active" data-toggle="tab"  href="#home">評價</a></li>
			<li><a data-toggle="tab" href="#menu2">媒合紀錄</a></li>
		</ul>
<!------------------- 換頁標頭 ----------------------->	
		<div class="tab-content"><!--切換評價媒合紀錄 -->
			<!-- 評價頁面 -->
			<div id="home" class="tab-pane fade in active">
				<div>
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

					</div>
				</div>
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
						</div>
			</div><!-- 評價頁面 -->
			
			<!-- 媒合紀錄頁面 -->
			<div id="menu2" class="tab-pane fade">
 				<div><!--Style="width:600px;"	 -->
				  <div>			
<%  
    int rowsPerPage1 = 5;  //每頁的筆數     
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
      whichPage1 = Integer.parseInt(request.getParameter("whichPage1"));
      pageIndex1=pageIndexArray1[whichPage1-1];
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
							<div class="a">		
								<div class="b">
									<label>${odata.b_name}</label><label class="font_right">${odata.o_edate}</label>				
								</div>
							</div>
						</c:forEach>
						<div style="text-align: center">
						<table border="0">    		
  						<%if (rowsPerPage1<rowNumber1) {%>
   						 <%if(pageIndex1>=rowsPerPage1){%>
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=1">至第一頁</a>&nbsp;
        				<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=whichPage1-1%>">上一頁 </a>&nbsp;<%}%>
   						 <%if(pageIndex1<pageIndexArray1[pageNumber1-1]){%>
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=whichPage1+1%>">下一頁</a>&nbsp;
         					<a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}&whichPage=<%=pageNumber1%>">至最後一頁</a>&nbsp; 
    						<%}%><%}%>  
 						</table>
 					   </div>
 					 </div>	 
					</div>
				</div><!-- 媒合紀錄頁面 -->
			</div><!--切換評價媒合紀錄 -->			
		</div>	
	</div>
  </div>
</div>	
<script>

// var name = $( "#name" ),   
// email = $( "#email" );   
// $( "#dialog" ).dialog({   
//     autoOpen: false,   
//     height: 300,   
//     width: 350,   
//     modal: true,   
//     buttons: {   
//         "Ok": function() {   
//             alert("name: "+name.val()+", email: "+email.val());   
//         },   
//         Cancel: function() {   
//             $( this ).dialog( "close" );   
//         }   
//     },   
//     close: function() {   
//         allFields.val( "" ).removeClass( "ui-state-error" );   
//     }   
// });  

// $( "#create-user" )   
// .button()   
// .click(function() {   
// $( "#dialog" ).dialog( "open" );   
// }); 

$(function(){
 
 	dialog();
	$( "#create-user" ) .click(function() {   
		 $( "#dialog" ).dialog( "open" );   
	}); 
 	$('#buttonsubmit').on('click',submitdialog);
});//end ready
 function submitdialog(){
	var c_name = $( "#c_name" ).val(); 
	var c_pswd = $( "#c_pswd" ).val();
	var c_birth = $( "#c_birth" ).val();
	var c_cel = $( "#c_cel" ).val();
	var c_email = $( "#email" ).val();
	var c_addr =$( "#c_addr" ).val();
	var hyperlink ="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do";
		
	$.get(hyperlink,{"action":"submitdialog","c_name":c_name, "c_pswd":c_pswd,  "c_birth":c_birth,"c_cel":c_cel,"c_email":c_email,"c_addr":c_addr},
			function(data){ 		
						}
// 	
					
       );//end get function
	$("#dialog" ).dialog( "close" );  
}
function dialog(){

	 $( "#dialog" ).dialog({   
	        autoOpen: false,     
	        width: 300,   
	        modal: true, 
	        resizable: false,//無法更改視窗大小
	        draggable: false,//無法拖曳
	        buttons: [{   
 
	        close: function() {   
	        	
	            $('#dialog').val("").removeClass("ui-state-error");
	            
	       	 }   
		}]
	 }); //end dialog
}	
	 	

 
 
	
</script>
</body>
</html>