<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>
<jsp:useBean id="listOrder" scope="request" type="java.util.Set" />
<html>
<head>
<title>師傅專頁</title>
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
		<th>訂單完成時間</th>
		<th>維修項目說明</th>
		<th>施工地址</th>
		<th>店家名稱</th>
		<th>訂單狀態</th>
		<th>回應訂單</th>
		<th>分數</th>
		<th>留言</th>
		<th>評分</th>
		
	</tr>
 	
<%-- 	 <%@ include file="page1.file" %>   --%>
<%--  	<c:forEach var="orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> 	 --%>
	
	<c:forEach var="orderVO" items="${listOrder}" > 
	
		<tr align='center' valign='middle'>
			
			<td>
			
			${orderVO.c_id.c_id}
			
			</td>
			<td>${orderVO.o_edate}</td>
			<td>${orderVO.o_des}</td>
			<td>${orderVO.o_location}</td>
				<td>${orderVO.b_name}</td>
			<td>${orderVO.s_name}</td>
				
	               <td>
<a href="#" name="masterres" data-id="${orderVO.getO_id()}"class="btn btn-info ">
          <span class="glyphicon glyphicon-send"></span> 回應 
        </a>
			         </td>
			<td>
${orderVO.c_rating}
			</td>
				<td>
${orderVO.ma_des}
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
         	<input type="submit" value="送出" >
			<input type="hidden" name="action" value="updateByM">
          	      <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          	      
<!--            <div id="mapdiv" ></div> -->
           
        </div>
            </div>
  </div>
  </div>
 </div>

</form>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
			</td>
			</tr>
		
	</c:forEach>
</table>
 </div>
 	<script>
		 $(function(){
		 
		 $('[name="masterres"]').on('click',masterresponse);
		 
		 
		 
		 
		 
		 
		 })//end ready
		 
		 function masterresponse(){
			 var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
		 	 var attr = $(this).data('id');
			 $.post(hyperlinkstring,{"functionaction":"orderresponse","o_id":attr},function(data){
				 alert("data");
			 });
			 
			 
		 }
 	</script>
</body>
</html>
