<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.order.model.*"%>



<%-- 此頁採用 JSTL 與 EL 取值 --%>



<%-- <%

// OrderService orderSvc = new OrderService();
// List<OrderVO> list = orderSvc.getAllOrder();
// pageContext.setAttribute("list",list);

 %> --%>



<jsp:useBean id="listOrder" scope="request" type="java.util.Set" />


<html>

<head>
<title>師傅專頁</title>

</head>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	
	
	
<body bgcolor='white'>


<jsp:include page="/order/title.jsp" />




  <table class="table table-bordered">
	<tr>
		<th>店家名稱</th>
		<th>訂單完成時間</th>
		<th>維修項目說明</th>
		<th>施工地址</th>
		<th>消費者</th>
		<th>分數</th>
		<th>留言</th>
		<th>評分</th>
		
	</tr>
 	
<%-- 	 <%@ include file="page1.file" %>   --%>
<%--  	<c:forEach var="orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> 	 --%>
	
	<c:forEach var="orderVO" items="${listOrder}" > 
	
		<tr align='center' valign='middle'>
			<td><a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${orderVO.m_id.m_id}'>${orderVO.b_name}</a></td>
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
                      
			
			<%-- 
			<td>
			
			
			
			
			  <FORM METHOD="post" action="OrderController.do">
	
			     <input type="submit" value="修改">
			     <input type="hidden" name="o_id" value="${orderVO.o_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     
			     
			     </FORM>
			 
			</td>
			--%>
			
			<td>
			
			${orderVO.c_id.c_id}
			
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
  

 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#${orderVO.o_id}" >評分</button> 
 
 
  <!-- Modal -->
  
  <div class="modal fade" id="${orderVO.o_id}" role="dialog" > 
    <div class="modal-dialog"> 
    
      <!-- Modal content-->
      
      <div class="modal-content">
      
     
          
          


         <div class="modal-body">
         
         
<h4 class="modal-title">評分給鼓勵吧</h4>
          
          
    <label class="radio-inline">
      <input type="radio" name="c_rating" value="5">5分
    </label>
    <label class="radio-inline">
      <input type="radio" name="c_rating" value="4">4分
    </label>
    <label class="radio-inline">
      <input type="radio" name="c_rating" value="3" checked="checked">3分
    </label>
     <label class="radio-inline">
      <input type="radio" name="c_rating" value="2">2分
    </label>
     <label class="radio-inline">
      <input type="radio" name="c_rating" value="1">1分
    </label>
          
  
         </div>
        <div class="container-fluid">

  
      <label for="comment">留言</label>
      <textarea class="form-control" rows="2" id="comment" name="ma_des">屋吼好男人</textarea>
    </div>

  
     
         <div class="modal-footer">
         
         
     
			<input type="submit" value="送出" >
			
          	<input type="hidden" name="action" value="updateByM">
          	
          	
          	
          <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          
        </div>
        
        
        
        	
        
        
      </div>
  </div>
  </div>
 </div>

</form>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
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
<%--    <%@ include file="page2.file" %>   --%>
 </div>
 
 

 
 
 <%----- --------%>



</body>
</html>
