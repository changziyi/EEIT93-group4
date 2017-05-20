<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
.changeImg {
	width: 200px;
}

.zipcode {
	display: none;
}

.changeImg {
	width: 200px;
}

.search-condition {
	margin: 10px 0;
}

.btn-lg {
	font-size: 20px;
}

.modal-content {
	background-color: #b3d9ff;
	border-radius: 25px;
	border: 5px double #3399ff;
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


.modal-content {
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
	
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<h3 class="text-center">我要開店</h3>
			</div>
			
			<div class="modal-body">
				<div class="container">
					<form role="form" method="post" action="master.do" class="col-md-7"
						enctype="multipart/form-data">
						
						
							<div class="row">
							<p>首頁照片： </p>
							     <div class="indexphoto">
								<img height="180px"
									src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${cdata_mdataVO.m_id}">
							</div>
							</div>
						
							<div class="row">
								<p>店家名稱： ${cdata_mdataVO.b_name}</p>
							</div>
							
							<div class="row">
								<p>店家介紹： ${cdata_mdataVO.b_des}</p>
							</div>
							
							<div class="row">
								<p>姓名： ${cdata_mdataVO.m_name}</p>
							</div>
							
							<div class="row">
								<p>電話： ${cdata_mdataVO.m_cel}</p>
							</div>
							
							<div class="row">
								<p>信箱： ${cdata_mdataVO.m_email}</p>
							</div>
							
							<div class="row">
								<p>地址： ${cdata_mdataVO.m_city}${cdata_mdataVO.m_district}${cdata_mdataVO.m_addr}</p>	
							</div>
							
							<div class="row">
							   <div>
								<p>維修類別： 
								<c:forEach var="aMpro"
										items="${cdata_mdataVO.mpros}">${aMpro.m_pro}
			                    </c:forEach>
			                    </p>
							</div>
							</div>
							
							<div class="row">
								<p>專業證照：</p>
									<div>
										<img height="180px"
											src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${cdata_mdataVO.m_id}">
									</div>
							</div>
				            </form>
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
					$(location).attr('href', 'searchPage.jsp');
				});

			});
		</script>
</body>
</html>