<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${mdataVO.b_name}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<style>
</style>
</head>
<body>
<div class="container">

	<div class="row">
		<div class="col-md-8">
			<img height="450px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}'/>
		</div>
		<div class="col-md-4">
			<H3>${mdataVO.b_name}</H3>
			<p>專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro}</c:forEach></p>
			<p>師傅：${mdataVO.m_name}</p>
			<p>地區：${mdataVO.m_city}　${mdataVO.m_district}</p>
		</div>
	</div>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
	
	<div>
		<c:forEach var="aDiscussions" items="${mdataVO.discussions}"><br />Q: ${aDiscussions.d_des}
			<c:if test="${not empty aDiscussions.d_reply}"><br />A: ${aDiscussions.d_reply}
			</c:if>
			<br />
		</c:forEach>
		<div>
			<p>提問</p>
			<form method="post" action="masterPage.do">
				<textarea name="d_des"></textarea><br />
				<input type="submit" value="送出"><input type="reset" value="取消">
<%-- 				<input type="hidden" name="m_id" value="${mdataVO.m_id}"> --%>
				<input type="hidden" name="action" value="MasterPage_Q">
			</form>
		</div>
	</div>
</div> <!--container-->
</body>
</html>