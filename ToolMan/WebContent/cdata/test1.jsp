<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

        <c:if test="${empty LoginOK}">
    	<c:set var="target" value="${pageContext.request.servletPath}" scope="session"/>
    	<c:redirect url="/cdata/login-in.jsp"/>
   		</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%-- 	<jsp:useBean id="cdataVO" class="toolman.cdata.model.CdataVO" scope="session"/> --%>
<div class="container">

  <ul class="nav nav-tabs"style="width:400px;" >
    <li class="active"><a data-toggle="tab" href="#home">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
  </ul>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <c:forEach var="cdata" items="${orders}">
    	<p>師傅：${cdata.b_name}</p>
		<p>時間：${cdata.o_edate}</p>
		<p>留言：${cdata.ma_des}</p>
	</c:forEach>
      </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>
</div>