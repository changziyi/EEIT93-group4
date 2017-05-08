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
<title>Wishing Page</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://masonry.desandro.com/jquery.masonry.min.js"></script>

<script
	src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>

<style>
.content_box {
	display: inline-block;
	border: 2px dashed #66b5ff ;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 260px;
	background-color: #cce6ff;
	
}

.zipcode {
	display: none;
}
</style>

<script>
	$(function() {
		$('#wishblock').imagesLoaded(function() {
			$('#wishblock').masonry({
				itemSelector : '.content_box',
				columnWidth : 282,
				animate : true
			});
		});

		/*--------------------------方法分隔線--------------------------------*/

		var city = $('input[name="w_city"]');
		var district = $('input[name="w_district"]');
		$('#twzipcode').twzipcode({
			'css' : [ 'county', 'district', 'zipcode' ],
			'onCountySelect' : function() {
				city.attr("value", this.value);
			},
			'onDistrictSelect' : function() {
				district.attr("value", this.value);
			}
		});

	});
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="background-color: #99ceff">
				<H1 style="color: #a94dff" align="center"><b>測試用頁面</b></H1>
			</div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-3" style="background-color: #99ceff; padding: 30px;border:2px solid #66b5ff">

				<div align="center">
					<button class="btn btn-primary btn-lg" data-toggle="modal"
						data-target="#myModal01" style="color:#cce6ff"><b>我要許願</b></button>
				</div>
				<br>
				<div align="center">
					<button class="btn btn-primary btn-sm" data-toggle="modal"
						data-target="#myModal02" style="color:#cce6ff"><b>什麼是許願池</b></button>
				</div>

			</div>
			<div class="col-md-9" id="wishblock" 
				style="overflow: hidden; margin: 0 auto; background-color: #99ceff"">
					<div>
						<c:forEach var="wishpoolVO" items="${list}">
							<div class="content_box">
								<b style="color:#a94dff">使用者：${wishpoolVO.c_id}</b>
								<br>
								位在地區：${wishpoolVO.w_city}${wishpoolVO.w_district} 
								<br>
								維修項目：${wishpoolVO.w_pro} 
								<br> 
								維修內容：${wishpoolVO.w_content}
								<br>
								維修項目照片： 
								<img src="${pageContext.servletContext.contextPath}/wishpool/WishPool.do?type=wishpool&image=${wishpoolVO.w_id}" alt="示意圖" class="img-responsive" >
								<br>
								發送時間：${wishpoolVO.w_date}
								
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	<div class="row">
	<div class="col-md-3" style="background-color: pink; border:2px solid red">
	</div>


	<!-----------------------------我要許願表單 ----------------------------------------->
	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form method="POST" action="WishPool.do"
				enctype="multipart/form-data">

				<div class="modal-content">
					<div class="modal-header">
						<H4 style="color: red">
							我要許願
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>

							</button>
						</H4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>我想修 ： <input type="text" name="w_pro" required="true"
									value="${param.w_pro}" />${errorMsgs.pro1}${errorMsgs.pro2}
								</td>
							</tr>
							<tr>
								<td id="twzipcode">位在地址：</td>
							</tr>
							<tr>
								<td>維修項目的照片： <input type="file" name="w_image"></td>
							</tr>
							<tr>
								<td><label style="vertical-align: top">問題描述：</label> <textarea
										name="w_content" style="width: 400px; height: 120px"
										placeholder="請描述問題原因"></textarea></td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">送出</button>
						<input type="hidden" name="w_city"> <input type="hidden"
							name="w_district">
					</div>
				</div>
			</form>
		</div>
	</div>



	<!-- 這裡是許願是什麼  -->
	<div class="modal fade" id="myModal02" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<H4 style="color: red" class="modal-title" id="myModalLabel">
						許願池的作用是什麼?
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
					</H4>
					</button>
				</div>
				<div class="modal-body">
					<p>什麼情況會來許願呢?</p>
					<p>1.在我們的搜尋分類中找不到適合的維修選項。</p>
					<p>2.找不到合適的師父去處理您的問題。</p>
					<p>3.您想維修的東西屬於比較少見或是冷門的項目。</p>
					<br />
					<p>在您許下願望後，我們的師傅將可以在許願池中 發現您的需求，如果師傅具備解決該問題的能力
						，都能夠自行接下單並盡速協助處理您的狀況。</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>