<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.changeImg{
		width:200px;
		padding:10px;
	}
</style>
</head>
<body>
	<form name="myData" action="TestFormData" enctype="multipart/form-data">
		<div>
			<label>Email address</label> <input type="email"
				id="exampleInputEmail3" name="email" placeholder="Email">
		</div>
		<div>
			<label>Password</label> <input type="password"
				id="exampleInputPassword3" name="password" placeholder="Password">
		</div>
		<div>
			<label>Photos</label> <input type="file" id="file" name="file[]"
				multiple="multiple">
		</div>
		<div>
			<label> <input type="checkbox" name="remember">
				Remember me
			</label>
		</div>
		<button type="button" id="buttonUpload">上傳</button>
	</form>
	<div id='div1'></div>


	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script>
		var btn = $('#buttonUpload');
		var upload = $('input[type="file"]');
		var myDiv = $('#div1');

		upload.on('change', function(event) {

			if (event.target.files.length > 3) {
				alert("超過限制");
				upload.val(null);
			}

			for (var i = 0; i < event.target.files.length; i++) {
				$('<img />').attr('id', 'img' + i).appendTo(myDiv);
			}

		});

		$(function() {
			function preview(input) {

				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img0').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[0]);
				}
				
				if (input.files && input.files[1]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img1').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[1]);
				}
				
				if (input.files && input.files[2]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img2').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[2]);
				}
				
			}

			upload.on('change', function(event) {
				preview(this);
			});

		});

		btn.click(function() {

			var others = $('form').serializeArray();
			var photos = $('input[type="file"]')[0].files;

			var formData = new FormData();

			$.each(others, function(index, input) {
				formData.append(input.name, input.value);
				console.log('name: ' + input.name);
				console.log('value: ' + input.value);
			});

			for (var i = 0; i < photos.length; i++) {
				formData.append('file' + i, photos[i]);
				console.log(photos[i]);
			}

			$.ajax({
				url : 'TestFormData',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				type : 'POST',
				success : function(reutrnData) {
					alert(reutrnData);
				}
			});

		});
	</script>
</body>
</html>