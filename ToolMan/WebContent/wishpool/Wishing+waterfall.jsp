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
<title>許願池</title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/wishpool/wish.css" rel="stylesheet">
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
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

body {font-family:Microsoft JhengHei;}


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
		
		/*---------------------------------縣市篩選CODE(未完成)----------------------------------------------*/
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
		    <div class="col-md-2 pull-right">
				<div class="search-condition">
			
					<form name="searchForm" id="searchForm" action="Wishing+waterfall.jsp" method="get">
					<b>新舊排序：</b> 
					<span>
					<select name="order" onchange="searchForm.submit();">
						<option value="desc" <%="desc".equals(request.getParameter("order")) ? "selected" : "" %>>從新到舊</option>
						<option value="asc" <%="asc".equals(request.getParameter("order")) ? "selected" : "" %>>從舊到新</option>
					</select> 
					</span>
					</form>
				</div>
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
						 	 ${sname.mdataVO.m_city}${sname.mdataVO.b_name}
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
							<div class="content-box">
								<div><label class="user-name">會員帳號：</label><span>${wishpoolVO.c_id}</span></div>
								<div>位在地區：${wishpoolVO.w_city}${wishpoolVO.w_district}</div>
								<div>維修項目：${wishpoolVO.w_pro}</div>
								<div>維修內容：${wishpoolVO.w_content}</div>
								<div>維修項目照片： 
									<img src="${pageContext.servletContext.contextPath}/wishpool/wishpool.do?type=wishpool&image=${wishpoolVO.w_id}"
									alt="示意圖" class="img-responsive">
								</div>
								<br>
								<div align="center">
								<button class="btn btn-primary btn-sm" data-toggle="modal"
									data-target="#wishDetailModal${wishpoolVO.w_id}">
									我會修理</button>
								<br>
								<div class="pull-right">發送時間：${wishpoolVO.w_date}</div>
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

	<!--------------------------- 許願能做什麼?  ---------------------------------------------->
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
		<div class="modal fade" id="wishDetailModal${wishpoolVO.w_id}" name="wishpoolmodal"tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">
							確定要接下這個願望?
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span></button>
						</h3>
					</div>
					<div class="modal-body">
								<p >會員帳號：${wishpoolVO.c_id} </p>
								<p >位在地區：${wishpoolVO.w_city}${wishpoolVO.w_district} </p>
								<p>維修項目：${wishpoolVO.w_pro} </p>
								<p >維修內容：${wishpoolVO.w_content} </p>
								<p >發送時間：${wishpoolVO.w_date} </p>
								</div>
								
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
							<button name="btnsubmit" class="btn btn-primary" data-dismiss="modal" data-id="${wishpoolVO.c_id}" data-dis="${wishpoolVO.w_city}${wishpoolVO.w_district}" data-type="${wishpoolVO.w_pro}" data-content="${wishpoolVO.w_content}" data-time="${wishpoolVO.w_date}">確定接單</button>
							<input type="hidden" name="w_city"> <input type="hidden"
								name="w_district">
						</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script>
	
	  $(function() {
		$('#wishblock').imagesLoaded(function() {
			$('#wishblock').masonry({
				itemSelector : '.content-box',
				columnWidth : 282,
				animate : true
			});
		});
		 $('[name="btnsubmit"]').on('click',mail);
	  })
	  function mail(){
				 	   	 	var hyperlinkstring = "${pageContext.servletContext.contextPath}/email/Email.do";
		 	     			// must unbind the event, or it will accumulate forever
		 	     			
		 					var mssid=$(this).data('id').substring(5);
			 				var mssum="我要修"+$(this).data('type');
			 				var mscontent=$(this).data('content');
			 				var mstime=$(this).data('time');
			 				
							$.post(hyperlinkstring,{"mss_id":mssid,"ms_content":mscontent,"ms_summary":mssum},function(){

// 								    $('[name="wishpoolmodal"]').modal("hide");
								    $('[name="btnsubmit"]').unbind('click');
								}	
							);//end get function

	 	}// end mail
		</script>
</body>
</html>