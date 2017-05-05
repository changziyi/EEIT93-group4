<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
            
            form {
                padding: 15px;
                background: #f5f6fA;
            }
			
			label {
				font-weight: bold;
				display: block;
			}
			
			input[type="text"],
			input[type="email"] {
				padding: 6px;
				margin-bottom: 20px;
			}

		</style>

</head>
<body>
		<form action="php/form_upload.php" method="post" enctype="multipart/form-data">
			<label>Username:</label>
			<input type="text" name="username" required>
			
			<label>Email:</label>
			<input type="email" name="email" required>
			
			<label>Photo:</label>
			<input type="file" name="files[]" required mutiple>
			
			<input type="submit">
		</form>

</body>
</html>