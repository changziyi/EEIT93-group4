<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

form input:valid, form textarea:valid {
	background: white;
}

form input:focus, form textarea:focus {
	border-color: #357EBD;
}

form input:focus+label, form textarea:focus+label {
	background: #357EBD;
	color: white;
	font-size: 15px;
	padding: 1px 6px;
	z-index: 2;
	text-align: center;
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

form.go-bottom input, form.go-bottom textarea {
	padding: 12px 12px 12px 12px;
}

form.go-bottom label {
	top: 0;
	bottom: 0;
	left: 0;
	width: 100%;
}

form.go-bottom input:focus, form.go-bottom textarea:focus {
	padding: 4px 6px 20px 6px;
}

form.go-bottom input:focus+label, form.go-bottom textarea:focus+label {
	top: 100%;
	margin-top: -16px;
}

form.go-right label {
	border-radius: 0 5px 5px 0;
	height: 100%;
	top: 0;
	right: 100%;
	width: 100%;
	margin-right: -100%;
}

form.go-right input:focus+label, form.go-right textarea:focus+label {
	right: 0;
	margin-right: 0;
	width: 45%;
	padding-top: 5px;
}

.modal-content {
	width: 120%;
}

cbox {
	text-align: center;
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
					<form role="form" method="post" action="master.do"
						class="col-md-7 go-right" enctype="multipart/form-data">

						<p>首頁圖片:</p>
						<div>
							<img id="b_image">
						</div>
						<input type="file" name="b_image" />

						<p>店家名稱:</p>
						<div class="form-group">
							<input class="form-control" type="text" name="b_name"
								value="${cdata_mdataVO.b_name}" /><label for="name">輸入店家名稱</label>
						</div>

						<p>店家介紹：</p>
						<div class="form-group">
							<textarea name="b_des" id="b_des" class="form-control" rows="8"></textarea>
							<label for="message">介紹您的店家</label>
						</div>
				</div>
				
				<div class="modal-footer">
					<input type="button" id="oneinput" value="一鍵輸入"
						class="btn btn-success">
					<input type="button" name="frontPage" value="上一頁"
						class="btn btn-danger"> <input type="submit" value="送出審核"
						class="btn btn-primary"> <input type="hidden"
						name="action" value="OpenStoreComplete">
				</div>
			</div>
		</div>
		</form>
	</div>
	
	<script>
	
	
	$('#oneinput').click(function() {
		$('input[name="b_name"]').attr('value','如意棒裝潢');
		$('#b_des').val('test');
	});
	
		$(function() {

			$('input[name="b_image"]').on('change', function(event) {
				preview(this);
			});

			function preview(input) {

				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#b_image').attr({
							'src' : e.target.result,
							'class' : 'img-thumbnail',
							'width' : "300px"
						});
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			$('input[name="frontPage"]').click(function() {
				$(location).attr('href', 'OpenStoreInfo.jsp');
			});

		});
	</script>

</body>
</html>