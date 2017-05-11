<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	$("ul.navigation > li:has(ul) > a").append('<div class="arrow-bottom"></div>');
	$("ul.navigation > li ul li:has(ul) > a").append('<div class="arrow-right"></div>');
});
</script>
<style type="text/css">
			body, ul, li, a{
				margin: 0;
				padding: 0;
				font-size: 13px;
				text-decoration: none;
			}
			ul, li {
				list-style: none;
			}
			ul.navigation li {
				position: relative;
				float: left;
			}
			ul.navigation li a{
				display: block;
				padding: 12px 90px;
				background: #888;
				color: #FFF;
			}
			ul.navigation > li > a{
				border-bottom: 1px solid #CCC;				
				border-left: 1px solid #CCC;
			}
			ul.navigation > li > a:hover{
				color: #666;
				background: #DDD
			}
			ul.navigation ul{
				text-align: center;
				display: none;
				float: left;
				position: absolute;			
				left: 0;	
				margin: 0;
			}
			ul.navigation li:hover > ul{
				display: block;
			}			
			ul.navigation ul li {
				border-bottom: 1px solid #DDD;
			}
			ul.navigation ul li:last-child {
				border-bottom: none;
			}
			/* 第二層或以後選單 li 之樣式 */
			ul.navigation ul a {
				width: 120px;
				padding: 10px 63px;	
				color: #666;		
				background: #EEE;	

				
			}
			ul.navigation ul a:hover {		
				background: #CCC;				
			}
			ul.navigation ul li:hover > ul{
				display: block;
				position: absolute;
				top: 0;				
				left: 100%;
			}
			.arrow-bottom {
				display: inline-block;
				margin-left: 5px;
				border-top: 4px solid #FFF;
				border-right: 4px solid transparent;				
				border-left: 4px solid transparent;		
				width: 1px;
				height: 1px;
			}
			#column2 {
				position:absolute;
				left:550px;
				top:80px;
				font-size:24px;
				}
</style>		


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>測試</title>
</head>
<body>
<h1>測試主畫面</h1>
<BR><hr>
<ul class="navigation">
	<li><a href="#">選單內容</a></li>
	<li><a href="#">選單內容</a></li>
	<li><a href="#">選單內容</a></li>
	<li>
		<a href="#">測試內容</a>	
		<ul>
			<li><a href="login-in.jsp">登入</a></li>
			<li>
				<a href="#">後台管理</a>
				<ul>
					<li><a href="test1.jsp">消費者檔案</a></li>
					<li><a href="#">我的服務</a></li>	
					
					<li><a href="<%=request.getContextPath()%>/order/listAllEmp.jsp">我的消費</a></li>
					
					<li><a href="#">黑名單</a></li>							
				</ul>			
			</li>
		</ul>		
	</li>
</ul>
<div id='column2'>
<br><br><br>
<h2>登入系統</h2><br>

<a href="login-in.jsp">登入畫面</a><p/>
<a href="login-up.jsp">註冊畫面</a><p/>
<a href="forgotpwd.jsp">忘記密碼</a><p/>
<a href="<c:url value='test1.jsp' />">測試登入1</a><p/>
<a href="<c:url value='test2.jsp' />">測試登入2</a><p/>
</div>
</body>
</html>