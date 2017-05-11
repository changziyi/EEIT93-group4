<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <c:if test="${empty LoginOK}"> --%>
<%-- 	<c:set var="target" value="${pageContext.request.servletPath}" --%>
<%-- 		scope="session" /> --%>
<%-- 	<c:redirect url="/cdata/login-in.jsp" /> --%>
<%-- </c:if> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<style>
.a {
	border: 2px dashed #66b5ff;
	padding: 1px;
	margin: 10px;
	overflow: hidden;
	background-color: #cce6ff;
}
#big-box{
	width: 630px;
}
.page {
	text-align: center;
}
.b {
/* 	text-align: center; */
	border-bottom: 1px solid red;
}
hr {
	border: 0;
	height: 1px;
	background-color: #d4d4d4;
	color: #d4d4d4
}
.box{
	height:300px;
	width:300px;
	background-color: gray;
}
.font_right{
	float: right;
}
</style>
	<!-- background-color: gray; -->
	<%-- 	<jsp:useBean id="cdataVO" class="toolman.cdata.model.CdataVO" scope="session"/> --%>
	<div class="container" id="big-box">
		<ul class="nav nav-tabs" >
			<li class="active"><a data-toggle="tab" href="#home">評價</a></li>
			<li><a data-toggle="tab" href="#menu2">媒合紀錄</a></li>
		</ul>
		<div class="tab-content" style="background-color:gray;">
			<div id="home" class="tab-pane fade in active">
				<div Style="width: 600px;">
					<!--     background-color:red; -->
					<div>
						<h6>
							<input type="checkbox" name="star" value="">5顆星 <input
								type="checkbox" name="star" value="">4顆星 <input
								type="checkbox" name="star" value="">3顆星 <input
								type="checkbox" name="star" value="">2顆星 <input
								type="checkbox" name="star" value="">1顆星
							<hr>
						</h6>
					</div>
					<div>
						<c:forEach var="cdata" items="${orders}">
							<div class="a">
								<p>
									<label>${cdata.b_name}</label><span>${cdata.o_edate}</span>
								</p>
								<p>${cdata.ma_des}</p>
							</div>
						</c:forEach>
						<div class="page">
							<nav>
							<ul class="pagination">
								<li><a href="#"><span aria-hidden="true">&laquo;</span><span
										class="sr-only">Previous</span></a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#"><span aria-hidden="true">&raquo;</span><span
										class="sr-only">Next</span></a></li>
							</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div id="menu2" class="tab-pane fade">
				<div Style="width: 600px;">
					<h6>
						<input type="checkbox" name="star" value="">5顆星 <input
							type="checkbox" name="star" value="">4顆星 <input
							type="checkbox" name="star" value="">3顆星 <input
							type="checkbox" name="star" value="">2顆星 <input
							type="checkbox" name="star" value="">1顆星
						<hr>
					</h6>
				</div>
				<div Style="width:600px;">
					<div class="box">
						<c:forEach var="cdata" items="${orders}">
							<div class="b">
								<label>${cdata.b_name}</label><label class="font_right">${cdata.o_edate}</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>