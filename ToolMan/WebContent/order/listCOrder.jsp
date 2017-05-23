<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>
<%@ page import="toolman.cdata.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>


    	
    	


<jsp:useBean id="listOrder" scope="request" type="java.util.Set" />

<!DOCTYPE html>
<html>

<head>
<title>Tool Man</title>

</head>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
    
	
	
	
<body >
<jsp:include page="/nav/navigation.jsp" />
<jsp:include page="/order/title.jsp" />
<br/>
<br/>
<br/>
  <table class="table table-bordered table-hover" >
	<tr>
		<th>店家名稱</th>
		   <th>預約時間</th>
	    <th>訂單完成時間</th>
		<th>維修項目說明</th>
	<th>訂單狀況</th>
		
		<th>評分</th>
		<th>投訴</th>
		<th>詳細訂單</th>
		
	</tr>
 	
<%-- 	 <%@ include file="page1.file" %>   --%>
<%--  	<c:forEach var="orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> 	 --%>
	
	<c:forEach var="orderVO" items="${listOrder}" > 
	
		<tr align='center' valign='middle'>
			<td><a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${orderVO.m_id.m_id}'>${orderVO.b_name}</a></td>
			<td>${orderVO.o_tdate}</td>
			<td>${orderVO.o_edate}</td>
			<td>${orderVO.o_des}</td>
	        <td>${orderVO.s_name}</td>
		
			
			<td>
			
 <%------------------------------------------bootstrap評分-------------------------------------------------------%>


  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/OrderController.do" name="form1">
   <div>
 <button type="button" class="btn btn-info" data-toggle="modal" data-target="#${orderVO.o_id}" ><span class="glyphicon glyphicon-star"></span> 評分</button> 
   <div class="modal fade" id="${orderVO.o_id}" role="dialog" > 
    <div class="modal-dialog"> 
       <div class="modal-content">
             <div class="modal-body">
           <div class="modal-header">
<h3 class="modal-title">評分給鼓勵吧</h3>
        </div>  
       <label class="radio-inline">
      <input type="radio" name="m_rating" value="5" checked="checked">5分
    </label>
    <label class="radio-inline">
      <input type="radio" name="m_rating" value="4">4分
    </label>
    <label class="radio-inline">
      <input type="radio" name="m_rating" value="3" >3分
    </label>
     <label class="radio-inline">
      <input type="radio" name="m_rating" value="2">2分
    </label>
     <label class="radio-inline">
      <input type="radio" name="m_rating" value="1">1分
    </label>
           </div>
        <div class="container-fluid">
      <label for="comment">留言</label>
      <textarea class="form-control" rows="2" id="comment" name="ca_des"></textarea>
    </div>
         <div class="modal-footer">
    			<input type="submit" name="masterres1" value="送出" >
    			
	         	<input type="hidden" name="action" value="updateByC">
           <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
        </div>
         </div>
  </div>
 </div>
 </div> 

</form>
</td>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
			
			
 <%------------------------------------------------投訴----------------------------------------------------%>
	<td>

  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/Rdata.do" name="form2">
  
 <div>
   <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#${orderVO.o_id}k" ><span class="glyphicon glyphicon-thumbs-down"></span> 投訴</button> 
   <div class="modal fade" id="${orderVO.o_id}k" role="dialog" > 
    <div class="modal-dialog"> 
          <div class="modal-content">
       <div class="modal-header">
       <h3 class="modal-title">投訴</h3>
         </div>
         <div class="modal-body">
    <label for="comment">主旨</label>
      <label class="radio-inline">
    <input type="text" name="p_summary" />
        </label>
          </div>
        <div class="container-fluid">
    <label for="comment">內容</label>
      <textarea class="form-control" rows="5" id="comment" name="p_content"></textarea>
    </div>
     <div class="modal-footer">
        <input type="submit" value="送出" >  
             
		<input type="hidden" name="action" value="addRdata">
		
       	<input type="hidden" name="s_name" value="未解決">	
           <input type="hidden" name="c_id" value="${orderVO.c_id.c_id}"/>
           <input type="hidden" name="m_id" value="${orderVO.m_id.m_id}"/>
          <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          <input type="hidden" name="sa_rnote" value=null>	
        <input type="hidden" name="d_id" value="6000">		   
          
        </div>
       </div>
  </div>
  </div> 
 </div> 

</form>
</td>
 <%------------------------------------------------萬里長城----------------------------------------------------%>		
<%------------------------------------------詳細訂單-------------------------------------------------------%>
<td>
  <div>
 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#${orderVO.o_id}kk" ><span class="glyphicon glyphicon-zoom-in"></span> 詳細訂單</button> 
   <div class="modal fade" id="${orderVO.o_id}kk" role="dialog"  > 
    <div class="modal-dialog" > 
       <div class="modal-content" style="background-color:#CCE4FF">
        <div class="modal-header">
       <h2>詳細訂單</h2>
       </div>
             <div class="modal-body" >
     <form class="form-horizontal " >
  		<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">店家名稱：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.b_name}</p>
    </div>
    </div>	
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">預約時間：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.o_tdate}</p>
    </div>
    </div>	
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">訂單完成時間：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.o_edate}</p>
    </div>
    </div>	
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">維修項目說明：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.o_des}</p>
    </div>
    </div>	
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">施工地址：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.o_location}</p>
    </div>
    </div>	
			
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">訂單狀況：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.s_name}</p>
    </div>
    </div>	
			<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">你給的分數：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.m_rating}</p>
    </div>
    </div>	
		<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">你給的留言：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.ca_des}</p>
    </div>
    </div>	
		
<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">師傅給的分數：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.c_rating}</p>
    </div>
    </div>
    <div class="form-group" style="font-size:16px;">
    <label class="control-label col-sm-4">師傅給的留言：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.ma_des}</p>
    </div>
  </div>
</form>
	<br>
   </div> 
           </div>
        <div class="container-fluid">
    </div>
         <div class="modal-footer">
         </div>
         </div>
  </div>
 </div>

</td>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
			</tr>
		
		
		
		
		
	</c:forEach>
</table>
<%--    <%@ include file="page2.file" %>   --%>
 </div>
 
  	<script>

  $(function(){
			 
			 $('[name="masterres1"]').on('click',masterresponse1);
					 })//end ready
			 
			 function masterresponse1(){
				 var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
			 	 var attr = $(this).data('id');
				 $.post(hyperlinkstring,{"functionaction":"orderresponse1","o_id":attr},function(data){
				 });
				 }
		 
 	</script>
 
 <%----- --------%>



</body>
</html>
