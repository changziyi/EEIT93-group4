<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${empty LoginOK}">
	<c:set var="target" value="${pageContext.request.servletPath}"
		scope="session" />
	<c:redirect url="/cdata/login-in.jsp" />
</c:if>

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
	margin-top: 10px;
	overflow: hidden;
	/* 	height: 100px; */
	background-color: #cce6ff;
}

.page {
	text-align: center
}
</style>
	<%-- 	<jsp:useBean id="cdataVO" class="toolman.cdata.model.CdataVO" scope="session"/> --%>
	<div class="container">
		<ul class="nav nav-tabs" style="width: 600px; background-color: gray;">
			<li class="active"><a data-toggle="tab" href="#home">評價</a></li>
			<li><a data-toggle="tab" href="#menu2">媒合紀錄</a></li>
		</ul>
		<div class="tab-content">
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
				<h3>Menu 2</h3>
				<div Style="width: 600px; background-color: red;">
					<p></p>
				</div>
			</div>
		</div>
	</div>