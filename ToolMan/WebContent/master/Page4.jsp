
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Thumbnails example - Fileuploader</title>

		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
		
		<link href="${pageContext.servletContext.contextPath}/css/jquery.fileuploader.css" media="all" rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/css/jquery.fileuploader-theme-thumbnails.css" media="all" rel="stylesheet">

		<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/jquery.fileuploader.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/custom.js"></script>
		
		<style>
			body {
				font-family: 'Roboto', sans-serif;
				font-size: 14px;
                line-height: normal;
				color: #47525d;
				background-color: #fff;

				margin: 0;
				padding: 20px;
				
				width: 560px;
			}
		</style>
	</head>

	<body>
		<form action="php/form_upload.php" method="post" enctype="multipart/form-data">
			<input type="file" name="files" data-fileuploader-limit="3">
			<input type="submit">
		</form>
    </body>
</html>