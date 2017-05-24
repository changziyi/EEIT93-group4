<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.wishpool.model.*"%>
<%@ page import="toolman.ad.model.*"%>

<%
	AdService adSvc = new AdService();
	

	List<AdVO> gabs = adSvc.getAllBySname("廣告進行中");
	pageContext.setAttribute("get_sname", gabs);
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AD Page</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css" rel="stylesheet">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" -->
<!-- 	type="text/javascript"></script> -->
<script type="text/javascript"
	src="http://masonry.desandro.com/jquery.masonry.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>

</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="container">
		<div class="page-header">
			<div class="row"></div>
		</div>
		
		<div class="row">
			<div class="col-md-3">
				<div class="well bgcolor">
					<h2 class="text-center">隨機廣告</h2>
					<br>
					 <c:forEach var="sname" end="3" items="${get_sname}">
						 	<div>
						 	 ${sname.mdataVO.m_city} ${sname.mdataVO.b_name}
						 	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${sname.m_id}'>
						 		<img height="200px" class="img-responsive" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${sname.m_id}'/>
						 	</a>
						 	</div>
						 	<br>
					 </c:forEach>
				</div>
			</div>
					
			
		
<div class="col-md-8">
	<div  id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
					<h3>
						刊登廣告
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>

						</button>
					</h3>
				</div>
					<div class="container">			
							<form role="form" class="col-md-5 go-right" method="POST" 
							action="AdServlet" enctype="multipart/form-data">
								<p>起始日期</p>
								<div class="form-group">
									<input type="text" name="start" class="form-control"
										id="datepicker">
								</div>
								<p>結束日期</p>
								<div class="form-group">
									<input type="text" name="end" class="form-control"
									 id="datepicker2">
								</div>
							
								<div id="twzipcode"></div>

							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">取消</button>
								<button type="button" id="btnsubmit" class="btn btn-primary">送出</button>
							</div>
						</form>	
	</div>
	</div>
	</div>
</div>
</body>
	<script>
  $( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker2" ).datepicker();
  } );
  $('#btnsubmit').click(function(){
	  $.post('AdServlet',{
		  'start':$('#datepicker').val(),
		  'end':$('#datepicker2').val()
	  },function(){
		  location.href='<%=request.getContextPath()%>/index.jsp';
	  })
  })
  </script>
</html>