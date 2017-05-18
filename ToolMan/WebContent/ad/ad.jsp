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

<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css" rel="stylesheet">


<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
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
				<div class="pull-right search-condition">
			
					<form name="searchForm" id="searchForm" action="Wishing+waterfall.jsp" method="get">
					<b>新舊排序：</b> 
					<span>
					<select name="order" onchange="searchForm.submit();">
						<option value="desc" <%="desc".equals(request.getParameter("order")) ? "selected" : "" %>>從新到舊</option>
						<option value="asc" <%="asc".equals(request.getParameter("order")) ? "selected" : "" %>>從舊到新</option>
					</select> 
					</span>
				
					</form>
				</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="well text-center bgcolor">
					<div>
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#myModal01">
							刊登廣告
						</button>
					</div>
					<br>
					
				</div>				
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
			
			<div class="col-md-9" id="wishblock">
				
				
					<c:forEach var="wishpoolVO" items="${new_date}">
							<div class="content-box">
								<div><label class="user-name">師傅帳號：</label><span>${ADVO.m_id}</span></div>
							
								<div align="center">
								<button class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#wishDetailModal${wishpoolVO.w_id}">
									刊登廣告</button>
								<br>
								<div class="pull-right">起始時間：${wishpoolVO.w_date}</div>	<br>
								<div class="pull-right">結束時間：${wishpoolVO.w_date}</div>
								</div>
							</div>	
					</c:forEach>
				
			</div>
		</div>
		
	</div>

	<!-----------------------------我要許願表單 ----------------------------------------->
	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		
		
			<div class="modal-content">
				<div class="modal-header">
					<h3>
						刊登廣告
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>

						</button>
					</h3>
				</div>

				<div class="modal-body">
					<div class="container">
						
							<form role="form" class="col-md-5 go-right" method="POST" 
							action="AdServlet" enctype="multipart/form-data">
								<p>起始日期</p>
								<div class="form-group">
									<input type="text" name="start" class="form-control"
										required="true"> <label for="name">起始日期</label>
								</div>
								<p>結束日期</p>
								<div class="form-group">
									<input type="text" name="end" class="form-control"
										required="true"> <label for="name">結束日期</label>
								</div>
								
								<div id="twzipcode"></div>
					
							
							
						
				</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">送出</button>
					<input type="hidden" name="w_city"> <input type="hidden"
						name="w_district">
				</div>
				</form>
				</div>
			
			
			
		</div>
	</div>

	
</body>
</html>