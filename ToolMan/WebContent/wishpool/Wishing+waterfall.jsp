<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.wishpool.model.*"%>
<%@ page import="toolman.ad.model.*"%>

<%
	WishpoolService wishpoolSvc = new WishpoolService();
	

	List<WishpoolVO> new_date = wishpoolSvc.getAll(request.getParameter("order"),
			request.getParameter("searchCity"));
	pageContext.setAttribute("new_date", new_date);
	
    AdService adSvc = new AdService();
	List<AdVO> gabs = adSvc.getAllBySname("廣告進行中");
	pageContext.setAttribute("get_sname", gabs);
	
	
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
.content-box {
	display: inline-block;
	border: 2px dashed #66b5ff;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 260px;
	background-color: #cce6ff;
}

.bgcolor {
   background-color: #00BFFF;

}


 .search-condition {
	margin: 10px 0;
}

 .user-name {

}

 .btn-lg{
     font-size: 20px;

}


</style>

<script>
	$(function() {
		$('#wishblock').imagesLoaded(function() {
			$('#wishblock').masonry({
				itemSelector : '.content-box',
				columnWidth : 282,
				animate : true
			});
		});

		/*--------------------------方法分隔線--------------------------------*/

		var city = $('input[name="w_city"]');
		var district = $('input[name="w_district"]');
		$('#twzipcode').twzipcode({
			'css' : [ 'county', 'district', 'hidden' ],
			'onCountySelect' : function() {
				city.attr("value", this.value);
			},
			'onDistrictSelect' : function() {
				district.attr("value", this.value);
			}
		});
		$('#bycity').twzipcode({
			countyName:'searchCountry',
			districtName:'searchDistrict',
			zipcodeName:'searchZipcode',
			'css' : [ 'county','hidden','hidden' ],
			'onCountySelect' : function() {
				location = "Wishing+waterfall.jsp?searchCity=" + this.value + "&order=" + $("#orderBy").val();
			}
		});
		
		//get parameter from parameter
		var countryDefault = '<%=""%>';
		
		if (countryDefault != '') {
			$("select[name=searchCountry]").val(countryDefault);	
		}
	});
</script>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>
				許願池
			</h1>
		</div>
		<div class="row">
				<div class="pull-right search-condition">
			
					<form name="searchForm" id="searchForm" action="Wishing+waterfall.jsp" method="get">
					<b>新舊排序：</b> 
					<span>
					<select name="order" onchange="searchForm.submit();">
						<option value="desc" <%="desc".equals(request.getParameter("order")) ? "selected" : "" %>>從新到舊</option>
						<option value="asc" <%="asc".equals(request.getParameter("order")) ? "selected" : "" %>>從舊到新</option>
					</select> 
					</span>
					<b>選擇縣市：</b> 
					<span id="bycity"></span>
					</form>
				</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="well text-center bgcolor">
					<div>
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#myModal01">
							我要許願
						</button>
					</div>
					<br>
					<div>
						<button class="btn btn-primary btn-sm wish-btn" data-toggle="modal"
							data-target="#myModal02">
							什麼是許願池
						</button>
					</div>
				</div>				
				<div class="well bgcolor">
					<h2 class="text-center">隨機廣告</h2>
					<br>
					 <c:forEach var="sname" end="3" items="${get_sname}">
						 	<div>
						 	 ${sname.mdataVO.m_city} ${sname.mdataVO.b_name}
						 	<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${sname.m_id}'>
						 		<img height="200px" class="img-responsive" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${sname.m_id}'/>
						 	</a>
						 	</div>
						 	<br>
					 </c:forEach>
				</div>
			</div>
			
			<div class="col-md-9">
				
				<div class="row well bgcolor">
					<c:forEach var="wishpoolVO" items="${new_date}">
						<div class="col-md-4">
							<div class="content-box">
								<div><label class="user-name">使用者：</label><span>${wishpoolVO.c_id}</span></div>
								<div>位在地區：${wishpoolVO.w_city}${wishpoolVO.w_district}</div>
								<div>維修項目：${wishpoolVO.w_pro}</div>
								<div>維修內容：${wishpoolVO.w_content}</div>
								<div>維修項目照片： 
									<img src="${pageContext.servletContext.contextPath}/wishpool/wishpool.do?type=wishpool&image=${wishpoolVO.w_id}"
									alt="示意圖" class="img-responsive">
								</div>
								<div align="center">
								<button class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#wishDetailModal${wishpoolVO.w_id}">
									我會修理</button>
								<br>
								<div class="pull-right">發送時間：${wishpoolVO.w_date}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
	</div>

	<!-----------------------------我要許願表單 ----------------------------------------->
	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form method="POST" action="wishpool.do"
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
								<td><b>我想修 ：</b><br> <input type="text" name="w_pro"
									required="true" value="${param.w_pro}" />${errorMsgs.pro1}${errorMsgs.pro2}
								</td>
							</tr>
							<tr>
								<td><b>位在地址：</b><div id="twzipcode"></div></td>
							</tr>
							<tr>
								<td><b>維修項目的照片：</b> <input type="file" name="w_image"></td>
							</tr>
							<tr>
								<td><label style="vertical-align: top"><b>問題描述：</b></label>
									<textarea name="w_content" style="width: 400px; height: 120px"
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



	<!--------------------------- 這裡是許願是什麼  ---------------------------------------------->
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
	
	<c:forEach var="wishpoolVO" items="${new_date}">
		<!-------------------------- 接下許願 ------------------------------>
		<div class="modal fade" id="wishDetailModal${wishpoolVO.w_id}" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<H4 style="color: red" class="modal-title" id="myModalLabel">
							許願單
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span></button>
						</H4>
					</div>
					<div class="modal-body">
								使用者：${wishpoolVO.c_id}<br>
								位在地區：${wishpoolVO.w_city}${wishpoolVO.w_district} <br>
								維修項目：${wishpoolVO.w_pro} <br> 
								維修內容：${wishpoolVO.w_content} <br>
								發送時間：${wishpoolVO.w_date} <br>
								</div>
								
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">確認接單</button>
							<input type="hidden" name="w_city"> <input type="hidden"
								name="w_district">
						</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	

</body>
</html>