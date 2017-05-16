<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>網頁導覽列</title>

<link rel="stylesheet" href="style.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>

#button {
	height: 22px;
	font-weight: bolder;
	color: #FFF;
	font-size: 14px;
	margin: 0px;
	padding: 0px;
}

#button li {
	float: left; 
	width : 178px;
    list-style-type : none;
    text-align : center;
    background-color: #cce6ff;
    letter-spacing : 2px;
    border-left-width : 1px;
    border-left-style: solid;
    border-left-color: #FFF;
    argin-right: 1px;
	　　　
}

#button li a {
      display:block;
	　width: 180px;
	　height: 20px;
	　padding-top: 2px;
	  color : #99ceff;
	　text-decoration: none;
	　　　
}


#button li a:hover {
	background-color: blue;
}

#imaginary_container{
    margin-top:20%; /* Don't copy this */
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}

</style>
</head>
<body>

<h1 style="background-color:#00BFFF">Tool Man</h1>
<div id="wrapper"> 
  
 <div class="col-sm-6 col-sm-offset-3">
      <ul id="button">
      <li><a href="index.html">About</a></li>
      <li><a href="works.html">Works</a></li>
      <li><a href="video.html">Video</a></li>
      <li><a href="links.html">Links</a></li>
      <li><a href="story.html">Story</a></li>
      </ul>
	</div>


	<div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div id="imaginary_container"> 
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control"  placeholder="Search" >
                    <span class="input-group-addon">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
                    </span>
                </div>
        
        </div>
	</div>
</div>
</body>
</html>