<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.wishpool.model.*"%>

<%
	WishpoolService wishpoolSvc = new WishpoolService();
	List<WishpoolVO> list = wishpoolSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>瀑布流測試網頁</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://masonry.desandro.com/jquery.masonry.min.js"></script>
<script>
	$(function() {
		$('#_container').imagesLoaded(function() {
			$('#_container').masonry({
				itemSelector : '.content_box',
				columnWidth : 364,
				animate : true
			});
		});
	});
</script>

<style>
.content_box {
	display: inline-block;
	border: 1px solid #6600cc;
	padding: 10px;
	margin: 5px 5px 5px 0;
	overflow: hidden;
	width: 327px;
}
</style>


</head>
<body>
	<div id="_container"
		style="height: 800px; width: 1100px; overflow: hidden; margin: 0 auto;">
		<div class="content_box">
			<img src="../images/001.jpg" alt="" class="img-responsive">內容一顯示在這個位置
		</div>
		<div class="content_box">
			<img src="../images/005.jpg" alt="" class="img-responsive">內容二在這邊出現啦，多打幾個字比較好辨識
		</div>
		<div class="content_box">
			<img src="../images/002.jpg" alt="" class="img-responsive">內容三不想講話
		</div>
		<div class="content_box">
			<img src="../images/004.jpg" alt="" class="img-responsive">內容四
		</div>
		<div class="content_box">
			<img src="../images/006.jpg" alt="" class="img-responsive">內容五只會說哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈
		</div>
		<div class="content_box">
			<img src="../images/008.jpg" alt="" class="img-responsive">內容六瀑布流他媽的難做
		</div>
		<div class="content_box">
			<img src="../images/011.jpg" alt="" class="img-responsive">內容七相衝到了搞屁喔
		</div>
	</div>

</body>
</html>