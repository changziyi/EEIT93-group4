<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OpenStore Page</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css"
	rel="stylesheet">
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />


<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>


<script
	src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>


<style type="text/css">
body {font-family:Microsoft JhengHei;}
.zip {margin:auto; width:110px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
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

.cbox {
	font-size: 16px;
}
</style>
</head>
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
					<form role="form" class="col-md-7 go-right" method="post"
						action="master.do" enctype="multipart/form-data">
						<p>師傅姓名:</p>
						<div class="form-group">
							<input class="form-control" type="text" name="m_name"
								value="${cdata_mdataVO.m_name}" /><label for="name">輸入性名</label>
						</div>
<%-- 						${errorMsgs.name1}${errorMsgs.name2} --%>
						<p>電話:</p>
						<div class="form-group">
							<input class="form-control" type="text" name="m_cel"
								value="${cdata_mdataVO.m_cel}" /><label for="phone">輸入電話</label>
						</div>

						<p>信箱:</p>
						<div class="form-group">
							<input class="form-control" type="text" name="m_email"
								value="${cdata_mdataVO.m_email}" /><label for="email">輸入信箱</label>
						</div>
						<p>地址:</p>
						<span id="twzipcode"></span>
						<div class="form-group">
							<input class="form-control" type="text" name="m_addr"
								value="${cdata_mdataVO.m_addr}" /><label for="addres">輸入地址</label>
						</div>
<%-- 						${errorMsgs.city}${errorMsgs.addr} --%>
						<p>維修類別:</p>
						<div class="row">
							<div class="col-md-2 cbox">
								地板地磚 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="地板地磚">
							</div>
							<div class="col-md-2 cbox">
								防水抓漏 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="防水抓漏">
							</div>
							<div class="col-md-2 cbox">
								室內裝潢 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="室內裝潢">
							</div>
							<div class="col-md-2 cbox">
								冷氣空調 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="冷氣空調">
							</div>
							<div class="col-md-2 cbox">
								水電工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="水電工程">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-2 cbox">
								門窗工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="門窗工程">
							</div>
							<div class="col-md-2 cbox">
								油漆工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="油漆工程">
							</div>
							<div class="col-md-2 cbox">
								木作工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="木作工程">
							</div>
							<div class="col-md-2 cbox">
								泥作工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="泥作工程">
							</div>
							<div class="col-md-2 cbox">
								照明工程 <input type="checkbox" name="m_pro"
									style="width: 20px; height: 20px" value="照明工程">
							</div>
						</div>
<%-- 						${errorMsgs.m_pro} --%>

						<p>專業證照:</p>
						<div>
							<img id="m_cer">
						</div>
						<input type="file" name="m_cer">
				</div>
			</div>
			<div class="modal-footer">
					<input type="button" id="oneinput" value="一鍵輸入"
						class="btn btn-success">
					<input type="submit" name="nextPage" value="下一步"
						class="btn btn-primary">
					<input type="hidden" name="action" value="OpenStoreStep">
					<input type="hidden" name="m_city"
						value="${cdata_mdataVO.m_city}">
					<input type="hidden" name="m_district"
						value="${cdata_mdataVO.m_district}">
			</div>
			</form>
		</div>
	</div>

	<script>
	
		$('#oneinput').click(function() {
			
			$('input[name="m_name"]').attr('value','張如意');
			$('input[name="m_cel"]').attr('value','0987654321');
			$('input[name="m_email"]').attr('value','changluyee@gmail.com');
			$('input[name="m_addr"]').attr('value','復興南路一段390號');
			$('select[name=district]').val('大安區');
			$('input[name="m_pro"][value="水電工程"]').prop('checked', true);
			$('input[name="m_pro"][value="室內裝潢"]').prop('checked', true);
			$('input[name="m_pro"][value="照明工程"]').prop('checked', true);
		});
	
		
		$(function() {

			//使用者選取圖片時觸發
			$('input[name="m_cer"]').on('change', function(event) {
				preview(this);
			});

			//預覽圖片
			function preview(input) {

				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#m_cer').attr({
							'src' : e.target.result,
							'class' : 'img-thumbnail',
							'width' : "300px"
						});
					}
					reader.readAsDataURL(input.files[0]);
				}
			}

			// 		$(':checkbox').click(function(){
			// 		    var data = [];
			//         	$(':checkbox[name = "m_pro"]:checked').each(function() {
			// //         		console.log($(this).val());
			//         		data.push($(this).val());
			//         	});
			// //         	console.log(data);
			//     		$.each(data, function(idx,value) {
			// // 				console.log(idx);
			// // 				console.log(value);

			// 			});
			//         });
			
			//縣市選單，透過hidden欄位取值ˋ
			var city = $('input[name="m_city"]');
			var district = $('input[name="m_district"]');

			$('#twzipcode').twzipcode({
				'css' : [ 'form-control zip', 'form-control zip', 'zipcode' ],
				'countySel' : '臺北市',
// 				'districtSel' : '大安區',
				'onCountySelect' : function() {
					city.attr("value", this.value);
				},
				'onDistrictSelect' : function() {
					district.attr("value", this.value);
				},
// 				'countySel': city.attr("value"),
// 				'districtSel': district.attr("value")
			});

		});
	</script>

</body>
</html>