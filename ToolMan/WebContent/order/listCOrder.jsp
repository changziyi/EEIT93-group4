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
<title>cena</title>

</head>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	
	
	
<body bgcolor='white'>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<%=request.getContextPath()%>/cdata/index.jsp">Home</a></li>
    <li><a href="<%=request.getContextPath()%>/order/listAllEmp.jsp">訂單</a></li>
      <li><a href="<%=request.getContextPath()%>/order/like.jsp">收藏店家</a></li>
      <li><a href="<%=request.getContextPath()%>/order/dislike.jsp">黑名單</a></li>
      <li><a href="<%=request.getContextPath()%>/master/List.jsp">搜尋店家</a></li>
      
    </ul>
  </div>
</nav>


<b><font color=red></font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1200'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td><h3>我的訂單 </h3>
		         </td></tr></table>

<table border='1' bordercolor='#CCCCFF' width='1200'>
	<tr>
		<th>訂單編號</th>
		<th>店家編號</th>
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
			<td>${orderVO.o_id}</td>
			<td>${orderVO.m_id.m_id}</td>
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
${orderVO.m_rating}
			</td>
				<td>
${orderVO.ca_des}
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
         <span>${orderVO.o_id}</span>
          
          
    <label class="radio-inline">
      <input type="radio" name="m_rating" value="5">5分
    </label>
    <label class="radio-inline">
      <input type="radio" name="m_rating" value="4">4分
    </label>
    <label class="radio-inline">
      <input type="radio" name="m_rating" value="3" checked="checked">3分
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
      <textarea class="form-control" rows="2" id="comment" name="ca_des">金肉炫風</textarea>
    </div>

  
     
         <div class="modal-footer">
         
         
     
			<input type="submit" value="送出" >
			
          	<input type="hidden" name="action" value="updateByC">
          	        	
          <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          
        </div>
        
        
        
        	
        
        
      </div>
  </div>
 </div>
 </div> 

</form>
 <%------------------------------------------------萬里長城----------------------------------------------------%>
			
			</td>
			
 <%------------------------------------------------投訴----------------------------------------------------%>
	<td>

  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/Rdata.do" name="form2">
  
 <div>
  <!-- Trigger the modal with a button -->
  

 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#${orderVO.o_id}k" >投訴</button> 
 
 
  <!-- Modal -->
  
  <div class="modal fade" id="${orderVO.o_id}k" role="dialog" > 
    <div class="modal-dialog"> 
    
      <!-- Modal content-->
      
      <div class="modal-content">
       <div class="modal-header">
       <h4 class="modal-title">投訴</h4>
       
       </div>
         <div class="modal-body">
         
         
         <span>${orderVO.o_id}</span>
      <label class="radio-inline">
    <input type="text" name="p_summary" />
    
    
    
    </label>
          </div>
        <div class="container-fluid">
    <label for="comment">內容</label>
      <textarea class="form-control" rows="5" id="comment" name="p_content">這個人猥褻下流，還亂摸我的小白</textarea>
    </div>
     <div class="modal-footer">
        <input type="submit" value="送出" >  
              
		<input type="hidden" name="action" value="insert">
		
          	<input type="hidden" name="s_name" value="m_pass">	
           <input type="hidden" name="c_id" value="${orderVO.c_id.c_id}"/>
           <input type="hidden" name="m_id" value="${orderVO.m_id.m_id}"/>
          <input type="hidden" name="o_id" value="${orderVO.o_id}">	   
          
        </div>
       </div>
  </div>
  </div> 
 </div> 

</form>
</td>
 <%------------------------------------------------萬里長城----------------------------------------------------%>		
			
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
