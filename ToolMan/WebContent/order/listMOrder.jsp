<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>
<jsp:useBean id="listOrder" scope="request" type="java.util.Set" />
<html>
<head>
<title>Tool Man</title>
<script>        

// function star() {
//     var areas = document.getElementsByTagName("area");　
//         //alert(areas.length);
//         for (var i = 0; i < areas.length; i++) {
//             areas[i].onmouseover = function () { mouseOver(this.id); };
//             areas[i].onmouseout = mouseOut;
//            areas[i].onclick = function () { Click(this.id); }
        	 
//         }
        
//     }     


//         function mouseOver(areaid) {            
//             //document.images[0].src = "images/MapTaipei.gif";
<%--             document.images[0].src = "<%=request.getContextPath()%>/order/images/5star-"+areaid.substr(2)+".png"; --%>
//         }


//         function mouseOut() {            
<%--             document.images[0].src = "<%=request.getContextPath()%>/order/images/5star.png"; --%>
//              }


//          function Click(areaid) {            
//              document.getElementById("mapdiv1").innerHTML ="你給了"+areaid.substr(2)+"分";
//              document.getElementById("mapdiv").innerHTML = '<input type="hidden" name="c_rating" value="'+areaid.substr(2)+'">'
//          }
    </script>

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
<jsp:include page="/nav/navigation.jsp" />
 <table class="table table-bordered">
	<tr>
	    <th>消費者</th>
	    <th>預約時間</th>
	    <th>訂單完成時間</th>
		<th>維修項目說明</th>
		<th>訂單狀態</th>
		<th>回應訂單</th>
		<th>評分</th>
		<th>詳細訂單</th>
		
	</tr>
 		<c:forEach var="orderVO" items="${listOrder}" > 
	
		<tr align='center' valign='middle'>
			
			<td>
			
			${orderVO.c_id.c_id}
			
			</td>
		<td>${orderVO.o_tdate}</td>
			<td>${orderVO.o_edate}</td>
			<td>${orderVO.o_des}</td>
			<td>${orderVO.s_name}</td>
				
	               <td>
<a href="#" name="masterres" data-id="${orderVO.getO_id()}"class="btn btn-info ">
          <span class="glyphicon glyphicon-send"></span> 回應 
        </a>
			         </td>
			
				
			
			<td>
			
 <%------------------------------------------bootstrap評分-------------------------------------------------------%>

  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/OrderController.do" name="form1">
   <div>
  <!-- Trigger the modal with a button -->
  

 <button type="button" class="btn btn-info " data-toggle="modal" data-target="#${orderVO.o_id}" onclick="star()">評分</button> 
 
 
  <!-- Modal -->
  
  <div class="modal fade" id="${orderVO.o_id}" role="dialog" > 
    <div class="modal-dialog"> 
    
      <!-- Modal content-->
      
      <div class="modal-content">
             <div class="modal-body">
         
         
<h4 class="modal-title">評分給鼓勵吧</h4>
          
          
          
     <label class="radio-inline"> 
       <input type="radio" name="c_rating" value="5" checked="checked">5分 
     </label> 
     <label class="radio-inline"> 
       <input type="radio" name="c_rating" value="4">4分 
     </label> 
     <label class="radio-inline"> 
       <input type="radio" name="c_rating" value="3">3分
     </label> 
      <label class="radio-inline"> 
       <input type="radio" name="c_rating" value="2">2分 
     </label> 
      <label class="radio-inline"> 
       <input type="radio" name="c_rating" value="1">1分
     </label> 
   
<%--    <img src="<%=request.getContextPath()%>/order/images/5star.png" alt="" usemap="Map" /> --%>
<!--    <map name="Map" id="Map"> -->
<!--     <area id="id1" href="#" shape="poly" coords="3,2,4,93,97,93,98,4" /> -->
<!--     <area id="id2"  href="#" shape="poly" coords="101,4,103,88,199,92,195,10" /> -->
<!--     <area id="id3"  href="#" shape="poly" coords="202,6,205,89,296,93,295,7" /> -->
<!--     <area id="id4"  href="#" shape="poly" coords="303,8,306,90,400,91,391,8" /> -->
<!--     <area id="id5"  href="#" shape="poly" coords="400,6,406,91,484,91,485,6" /> -->
<!-- </map> -->
<!--  <div id="mapdiv1" ></div> -->
      </div>
        <div class="container-fluid">

  
      <label for="comment">留言</label>
      <textarea class="form-control" rows="2" id="comment" name="ma_des"></textarea>
    </div>
    <div class="modal-footer">
         	<input type="submit" name="masterres1" value="送出" >
			<input type="hidden" name="action" value="updateByM">
          	      <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          <input type="hidden" name="action" value="getOne_For_Update">
          	      
<!--            <div id="mapdiv" ></div> -->
           
        </div>
            </div>
  </div>
  </div>
 </div>

</form>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
			</td>
<%------------------------------------------詳細訂單-------------------------------------------------------%>
<td>
  <div>
 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#${orderVO.o_id}kk" >詳細訂單</button> 
   <div class="modal fade" id="${orderVO.o_id}kk" role="dialog"  > 
    <div class="modal-dialog" > 
       <div class="modal-content" style="background-color:#CCE4FF">
        <div class="modal-header">
       <h2>詳細訂單</h2>
       </div>
             <div class="modal-body" >
     <form class="form-horizontal " >
  		<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">消費者：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.c_id.c_id}</p>
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
      <p class="form-control-static">${orderVO.c_rating}</p>
    </div>
    </div>	
		<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">你給的留言：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.ma_des}</p>
    </div>
    </div>	
		
<div class="form-group" style="font-size:16px;">
<label class="control-label col-sm-4">消費者給的分數：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.m_rating}</p>
    </div>
    </div>
    <div class="form-group" style="font-size:16px;">
    <label class="control-label col-sm-4">消費者給的留言：</label>
    <div class="col-sm-7">
      <p class="form-control-static">${orderVO.ca_des}</p>
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

 	<script>
		 $(function(){
		 
		 $('[name="masterres"]').on('click',masterresponse);
				 })//end ready
		 
		 function masterresponse(){
			 var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
		 	 var attr = $(this).data('id');
			 $.post(hyperlinkstring,{"functionaction":"orderresponse","o_id":attr},function(data){
				 alert("以回應這則訂單");
				 history.go(0) ;
			 });
			 }
		 
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
</body>
</html>
