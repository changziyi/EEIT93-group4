<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ToolMan</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css"
	rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css"
	rel="stylesheet">
<link rel="Shortcut Icon"
	href="${pageContext.servletContext.contextPath}/favicon.ico" />


<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>


<script
	src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>

<style>
body {font-family:Microsoft JhengHei;}
.changeImg {
	width: 200px;
}

.zipcode {
	display: none;
}

.wid {
	width:35%;
	font-size:15px;
}

.search-condition {
	margin: 10px 0;
}

.btn-lg {
	font-size: 20px;
}

.modal-content-1 {
	border-radius: 10px;
	border: 1px solid #D3D3D3;
}

.form-control {
	background-color: white;
}

p {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 17px;
}

h3 {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 35px;
	color: #357EBD;
}

form>div {
	position: relative;
	overflow: hidden;
}

form input, form textarea {
	width: 100%;
	border: 2px solid gray;
	background: none;
	position: relative;
	top: 0;
	left: 0;
	z-index: 1;
	padding: 8px 12px;
	outline: 0;
}


form label {
	-webkit-transition: background 0.2s, color 0.2s, top 0.2s, bottom 0.2s,
		right 0.2s, left 0.2s;
	transition: background 0.2s, color 0.2s, top 0.2s, bottom 0.2s, right
		0.2s, left 0.2s;
	position: absolute;
	color: #999;
	padding: 7px 6px;
	font-weight: normal;
}

form textarea {
	display: block;
	resize: vertical;
}


.modal-content-1 {
	width: 120%;
}

indexphoto {
border: 5px double red;

}

</style>

<body>

	<jsp:include page="/nav/navigation.jsp" />
	<div class="page-header">
		<div class="row"></div>
	</div>
	
	<div class="modal-dialog wid">
		<div class="modal-content-1">
		
			<div class="modal-header">
				<h3 class="text-center">店家資訊</h3>
			</div>
			
			<div class="modal-body">
				<div>
						<div class="form-group">
							<table class="table table-hover">
								<tr>
									<td>首頁圖片</td>
									<td><div><img id="m_cer" class="img-thumbnail" width="350px" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${cdata_mdataVO.m_id}"></div>
								</tr>
								<tr>
									<td>店家名稱</td>
									<td>${cdata_mdataVO.b_name}</td>
								</tr>
								<tr>
									<td>店家介紹</td>
									<td><div style="width:500px">${cdata_mdataVO.b_des}</div></td>
								</tr>
								<tr>
									<td>師傅姓名</td>
									<td>${cdata_mdataVO.m_name}</td>
								</tr>
								<tr>
									<td>電話</td>
									<td>${cdata_mdataVO.m_cel}</td>
								</tr>
								<tr>
									<td>信箱</td>
									<td>${cdata_mdataVO.m_email}</td>
								</tr>
								<tr>
									<td>地址</td>
									<td>${cdata_mdataVO.m_city}${cdata_mdataVO.m_district}${cdata_mdataVO.m_addr}</td>
								</tr>
								<tr>
									<td>維修類別</td>
									<td><c:forEach var="aMpro" items="${cdata_mdataVO.mpros}">${aMpro.m_pro}</c:forEach></td>
								</tr>
								<tr>
									<td>專業證照</td>
									<td><div><img id="m_cer" class="img-thumbnail" height="300px" src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${cdata_mdataVO.m_id}"></div>
								</tr>
							</table>
						</div>
						
						</div>
					</div>
					<div class="modal-footer">
							<input type="button" name="homePage" class="btn btn-primary" value="回首頁">
                      </div>	
				  </div>
				
			</div>

   <!------------------------- script-------------------------------------------->	

		<script>
			$(function() {

				$('input[name="homePage"]').click(function() {
					$(location).attr('href', '${pageContext.servletContext.contextPath}/index.jsp');
				});

			});
		</script>
</body>
</html>