<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.wishpool.model.*"%>
<%@ page import="toolman.ad.model.*"%>
<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css" rel="stylesheet">

<%
	WishpoolService wishpoolSvc = new WishpoolService();
	

	List<WishpoolVO> new_date = wishpoolSvc.getAll(request.getParameter("order"),
			request.getParameter("searchCity"));
	pageContext.setAttribute("new_date", new_date);
	
    AdService adSvc = new AdService();
	List<AdVO> gabs = adSvc.getAllBySname("廣告進行中");
	pageContext.setAttribute("get_sname", gabs);
	
	
%>
<html>
<head>


<style >
.kk {
 
   position: absolute;     
top: 30%;             
left: 40%;      
}
</style>
<meta http-equiv="refresh" content="3;url=${pageContext.servletContext.contextPath}/mdata/MdataOrderServlet.do?m_id=${LoginOK.m_id}&action=listOrder">



<title>Tool Man</title>
<script>
window.onload = masterresponse2;

function masterresponse2(){
var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
 var attr = $(this).data('id');
$.post(hyperlinkstring,{"functionaction":"orderresponse2","o_id":attr},function(data){
});

}

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

<div class="alert alert-success kk">
  <h1><strong>謝謝你的評價</strong></h1>
    <h1>幾秒回訂單頁</h1>
  
  </div>
  

</body>
</html>
