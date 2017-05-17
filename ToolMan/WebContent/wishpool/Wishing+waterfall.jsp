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
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
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
	border: 3px dashed #66b5ff;
	padding: 10px;
	margin: 10px 10px 10px 0;
	overflow: hidden;
	width: 260px;
	background-color: #cce6ff;
}

.bgcolor {
   background-color: #4dd2ff;

}


 .search-condition {
	margin: 10px 0;
}

 .user-name {

}

 .btn-lg{
     font-size: 20px;

}

.modal-content {
    background-color: #ccffff;
	border-radius: 23px;
}

.form-control {

	background-color:white;
}

p {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 17px;
}

h3 {
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 35px;
	color:#357EBD;
}


form>div {
	position: relative;
	overflow: hidden;
}

form input, form textarea {
	width: 100%;
	border: 2px solid gray;
	background: none;
	position: relative;
	top: 0;
	left: 0;
	z-index: 1;
	padding: 8px 12px;
	outline: 0;
}

form input:valid, form textarea:valid {
	background: white;
}

form input:focus, form textarea:focus {
	border-color: #357EBD;
}

form input:focus+label, form textarea:focus+label {
	background: #357EBD;
	color: white;
	font-size:15px;
	padding: 1px 6px;
	z-index: 2;
	text-align:center;
}

form label {
	-webkit-transition: background 0.2s, color 0.2s, top 0.2s, bottom 0.2s,
		right 0.2s, left 0.2s;
	transition: background 0.2s, color 0.2s, top 0.2s, bottom 0.2s, right
		0.2s, left 0.2s;
	position: absolute;
	color: #999;
	padding: 7px 6px;
	font-weight: normal;
}

form textarea {
	display: block;
	resize: vertical;
}

form.go-bottom input, form.go-bottom textarea {
	padding: 12px 12px 12px 12px;
}

form.go-bottom label {
	top: 0;
	bottom: 0;
	left: 0;
	width: 100%;
}

form.go-bottom input:focus, form.go-bottom textarea:focus {
	padding: 4px 6px 20px 6px;
}

form.go-bottom input:focus+label, form.go-bottom textarea:focus+label {
	top: 100%;
	margin-top: -16px;
}

form.go-right label {
	border-radius: 0 5px 5px 0;
	height: 100%;
	top: 0;
	right: 100%;
	width: 100%;
	margin-right: -100%;
}

form.go-right input:focus+label, form.go-right textarea:focus+label {
	right: 0;
	margin-right: 0;
	width: 35%;
	padding-top: 5px;
}

</style>

<script>
      /*---------------瀑布流的關鍵CODE--------------------*/

	$(function() {
		$('#wishblock').imagesLoaded(function() {
			$('#wishblock').masonry({
				itemSelector : '.content-box',
				columnWidth : 282,
				animate : true
			});
		});

		/*--------------------------表單送出自動判別縣市行政區--------------------------------*/

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
		
		/*---------------------------------限是篩選CODE----------------------------------------------*/
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
<jsp:include page="/nav/navigation.jsp" />
	<div class="container">
		<div class="page-header">
			<div class="row"></div>
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
			
			<div class="col-md-9" id="wishblock">
				
				
					<c:forEach var="wishpoolVO" items="${new_date}">
						<div class="bgcolor">
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

	<!-----------------------------我要許願表單 ----------------------------------------->
	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		
		
			<div class="modal-content">
				<div class="modal-header">
					<h3>
						我要許願
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>

						</button>
					</h3>
				</div>

				<div class="modal-body">
					<div class="container">
						
							<form role="form" class="col-md-5 go-right" method="POST" 
							action="wishpool.do" enctype="multipart/form-data">
								<p>我想修：</p>
								<div class="form-group">
									<input type="text" name="w_pro" class="form-control"
										required="true"> <label for="name">想修什麼呢?</label>
								</div>
								<p>位在地址：</p>
								<div id="twzipcode"></div>
								
								<p>維修項目的照片：</p>
								<input type="file" name="w_image" class="form-control">
								
								<p>問題描述：</p>
								<div class="form-group">
									<textarea name="w_content" class="form-control" required="true"></textarea>
									<label for="message">描述您的問題</label>
								</div>
							
						
				</div>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">送出</button>
					<input type="hidden" name="w_city"> <input type="hidden"
						name="w_district">
				</div>
				</form>
				</div>
			
			
			
		</div>
	</div>


	<!--------------------------- 這裡是許願是什麼  ---------------------------------------------->
	<div class="modal fade" id="myModal02" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">
						許願池的作用是什麼?
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
					</h3>
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
					<button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
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