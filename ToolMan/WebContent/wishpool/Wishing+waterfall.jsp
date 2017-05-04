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

<style>
.content_box {
	display: inline-block;
	border: 1px solid red;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 327px;
}
</style>

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

</head>
<body>
	<div class="container">
			style="height: 800px; width: 1100px; overflow: hidden; margin: 0 auto;">
			<div class="row">
				<div class="col-md-3" style="background-color: #e6ccff">
					<H2 style="color: #a94dff" align="center">測試用頁面</H2>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3" style="background-color: powderblue">

					<div align="center">
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#myModal01">我要許願</button>
					</div>
					<BR>
					<div align="center">
						<button class="btn btn-primary btn-sm" data-toggle="modal"
							data-target="#myModal02">什麼是許願池</button>
					</div>

				</div>
				<div id="_container"
		style="height: 800px; width: 1100px; overflow: hidden; margin: 0 auto;">
				<div class="col-md-1"></div>
				<div class="col-md-8" style="background-color: pink" align="center">
					<div>
						<div class="content_box">
							<img src="../images/001.jpg" alt="" class="img-responsive">內容一顯示在這個位置,後面都是廢話劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦劈哩啪啦
						</div>
						<div class="content_box">
							<img src="../images/005.jpg" alt="" class="img-responsive">內容二在這邊出現啦，多打幾個字比較好辨識
						</div>
						<div class="content_box">
							<img src="../images/002.jpg" alt="" class="img-responsive">內容三不想講話
						</div>
						<div class="content_box">
							<img src="../images/004.jpg" alt="" class="img-responsive">內容四，這裡也是廢話雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕雞哩咕嚕
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
						<div class="content_box">
							<img src="../images/012.jpg" alt="" class="img-responsive">內容八墊底了啦，所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串所以我要打好長一串
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>


	<!-- 我要許願表單 -->
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
								<td>位在地址： <select name="w_city">
										<option>台北市</option>
										<option>桃園市</option>
										<option>新竹市</option>
										<option>苗栗市</option>
										<option>台中市</option>
										<option>彰化市</option>
										<option>雲林市</option>
										<option>嘉義市</option>
										<option>台南市</option>
										<option>高雄市</option>
								</select> <select name="w_district">
										<option>大安區</option>
										<option>北投區</option>
										<option>士林區</option>
										<option>中山區</option>
										<option>龍井區</option>
										<option>沙鹿區</option>
										<option>柳營區</option>
										<option>六甲區</option>
										<option>鳳山區</option>
										<option>美濃區</option>
								</select>
								</td>
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