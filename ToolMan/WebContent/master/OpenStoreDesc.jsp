<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<style>
	.changeImg{
		width: 200px;
	}
</style>
<body>

<h3>我要開店</h3>

<div>
<form method="post" action="master.do" enctype="multipart/form-data" >
	<div>
	<table>
		<tr>
		<td>首頁圖片:
			<div><img id="b_image"></div>
			<input type="file" name="b_image" /></td>
		</tr>
		<tr>
			<td>店家名稱:
			<input type="text" name="b_name" /></td>
		</tr>
		<tr>
			<td>店家介紹:
			<textarea name="b_des"></textarea></td>
		</tr>
		<tr>
			<td>
				<input type="button" name="frontPage" value="上一頁">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="送出審核">
				<input type="hidden" name="action" value="OpenStoreComplete">
			</td>
		</tr>
	</table>
</div>
</form>
</div>

<script>

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
						'class' : 'changeImg'
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