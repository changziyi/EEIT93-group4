<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<style>
.container {
	width: 800px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">Tab One</li>
			<li class="tab-link" data-tab="tab-2">Tab Two</li>
			<li class="tab-link" data-tab="tab-3">Tab Three</li>
			<li class="tab-link" data-tab="tab-4">Tab Four</li>
			<li class="tab-link" data-tab="tab-5">Tab Five</li>
		</ul>

		<div id="tab-1" class="tab-content current">Lorem ipsum dolor
			sit amet, consectetur adipisicing elit, sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
			commodo consequat.</div>
		<div id="tab-2" class="tab-content">Duis aute irure dolor in
			reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
			pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
			culpa qui officia deserunt mollit anim id est laborum.</div>
		<div id="tab-3" class="tab-content">Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
			commodo consequat. Duis aute irure dolor in reprehenderit in
			voluptate velit esse cillum dolore eu fugiat nulla pariatur.</div>
		<div id="tab-4" class="tab-content">Sed do eiusmod tempor
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
			commodo consequat.</div>
		<div id="tab-5" class="tab-content">Test.</div>

	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');
	
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');
	
				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			})
	
		})
	</script>
</body>
</html>