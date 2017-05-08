<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
<style>
.county {width:80px;height:25px;vertical-align: top}
.zipcode {display: none;}
.district {display: none;}
.row {width:80%}
</style>
</head>
<body>

	<form action="master.do" method="post">
		<span id="twzipcode"></span><input type="text" name="search"><button type="button" id="btn">找師傅</button>
		<input type="submit" value="servlet">
		<input type="hidden" name="action" value="SearchMaster">
		<input type="hidden" name="city" >
	</form>

<script>
	
	var city = $('input[name="city"]');

	$('#twzipcode').twzipcode({
		'css': ['county', 'district', 'zipcode'],
		'onCountySelect': function () {
	    	city.attr("value", this.value);
	    },
		'countySel':'臺北市'
	});
	
	var search = $('input[name="search"]');
	
	$('#btn').click(function() {
		
		$.ajax({
			url : 'master.do',
			data: {'city':city.val(),'input':search.val(),'action':'SearchMaster'},
			type : 'POST',
			success : function(returnData) {
				$(location).attr('href','searchResult.jsp');
			}
		});
	});

</script>

</body>
</html>