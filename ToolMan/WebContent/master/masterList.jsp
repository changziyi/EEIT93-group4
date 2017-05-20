<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="toolman.mdata.model.MdataService"%>
<%@ page import="toolman.ad.model.AdService"%>
<%@ page import="toolman.ad.model.AdVO"%>
<%
    AdService adSvc = new AdService();
	List<AdVO> ads = adSvc.getAllBySname("廣告進行中");
	pageContext.setAttribute("allMid", ads);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ToolMan</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/index/expandsearch.css">
	<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/creative.css"> --%>
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<style>
		body {font-family:Microsoft JhengHei;}
		a {color:White;}
		.county {width:80px;height:25px;vertical-align: top}
		.zipcode {display: none;}
		.form-control {margin:auto; width:120px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
		.proc {padding:5px;margin-left: 0;margin-right: 5px;text-align: center;border-radius: 3px;color: #FFF5EE;font-weight: bold;}
		.divpro {margin-left: 0;margin-bottom: 10px;}
		.container {width: 80%;}
		.myDiv {position:relative; top:90px;}
		.pad {padding-left: 3%;}
		.result {font-size:20px;}
		.resultcount {padding:5%;}
		.count {color: #00BFFF;}
		.list-group {margin-top: 15%;}
		.probtn {font-size: 16px;}
		.searchinput {font-weight:bold;color:#00AFEA;}
		.btn-master {color: White; background-color: #00BFFF; font-size:14px}
		.btn-master:hover {background-color: #87CEFA;color: white}
		.thumbnailformaster {height:410px}
		.bar {width:30%;}
		.boxtext {font-size:15px; margin-bottom:10px; margin-bottom:10px}
		.bartext {font-size:20px; margin-bottom:8px}
		.bardiv {margin-left:5%}
		.addiv {margin-top:15%}
		.adrow {margin-top:3% ;margin-bottom:3%; margin-left:0.5%; margin-right:0.5%; padding:5% 4% 4% 2%}
		.md7 {padding-left:0.5%}
		.md5 {padding-left:0.2%;padding-top:10%;padding-right:0.2%}
	</style>
</head>

<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="container myDiv">
		<div class="row">
			<div class="bar col-xs-6 col-md-4">
<!-- 					<h1 class="my-4">Shop Name</h1> -->
					<div class="list-group">
						<div id="resultcount" class="list-group-item resultcount"></div>
						<div class="list-group-item">
							<div class="bardiv">
								<p class="bartext">地區</p>
								<span id="twzipcode"></span>
							</div>
						</div>
						<div class="list-group-item">
							<div class="bardiv">
								<p class="bartext">專業</p>
								<select class="form-control proselect" id="pro" name="pro">
									<option value="">類別</option>
									<option value="地板地磚">地板地磚</option>
									<option value="防水抓漏">防水抓漏</option>
									<option value="室內裝潢">室內裝潢</option>
									<option value="冷氣空調">冷氣空調</option>
									<option value="水電工程">水電工程</option>
									<option value="門窗工程">門窗工程</option>
									<option value="木作工程">木作工程</option>
									<option value="泥作工程">泥作工程</option>
									<option value="照明工程">照明工程</option>
								</select>
								<input type="hidden" name="action" value="SearchResult">
								<input type="hidden" name="city" >
								<input type="hidden" name="district" >
								<input type="search" name="input" placeholder="or店家名稱">
							</div>
						</div>
						<div class="list-group-item text-center">
							<button type="button" id="btn" class="btn btn-master btn-xl">搜尋</button>
						</div>
					</div>
				
					<div class="list-group addiv">
						<div class="list-group-item">
							<div class="result text-center">廣告</div>
						</div>
						<div class="list-group-item">
							<c:forEach var="aMaster" end="3" items="${allMid}">
								<div class="row thumbnail adrow">
									 <div class="col-md-7 md7">
										<a href='${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${aMaster.m_id}'><img width=200px class="img-responsive" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${aMaster.m_id}'/></a>
									</div>
									<div class="col-md-5 md5">
										<div>
											<span style="font-size:20px">${aMaster.mdataVO.b_name}</span><br /><span>地點：${aMaster.mdataVO.m_city}${aMaster.mdataVO.m_district}</span><br />完成案件數：${aMaster.mdataVO.o_finished}
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
				</div>
			<div class="col-xs-12 col-sm-6 col-md-8">
				<div id="show" class="row pad"></div>
<!-- 				   	<nav aria-label="Page navigation"> -->
<!--       					<ul class="pagination" id="pagination"></ul> -->
<!--    					 </nav> -->
			</div>
		</div> <!-- row -->
	</div>
	
<script src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>		
<script>
	
// 	$(function() {
		
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','district':'${search.m_district}','input':'${search.b_name}','pro':'${search.m_name}','action':'searchjson'}, function(datas) {
			show.empty();
			
			//json陣列數目，總共有幾個師傅
			var mcount = datas.length;
			var searchinput = $('<span></span>').addClass('searchinput').text(' ${search.m_city}${search.m_district} ${search.m_name} ${search.b_name}');
			var result = $('<span></span>').text('共找到 ' + mcount + ' 位師傅  ');
			var resultDiv = $('<div></div>').addClass('text-center').addClass('result').append(['搜尋',searchinput,$('<br />'),result]);
			$('#resultcount').append(resultDiv);
			
			//分頁 //已放棄QQ
// 		    $('#pagination').twbsPagination({
// 		        totalPages: ((mcount % 3 == 0)? (mcount/3) : (mcount/3) + 1),
// 		        visiblePages: 5,
// 		        onPageClick: function (event, page) {
// 		            $('#page-content').text('Page ' + page);
// 		        }
// 		    });
			var countpage = 0;
			$.each(datas, function(i,master) {
				console.log(countpage++);
				var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
					'data-holder-rendered':'true'}).addClass('img-responsive');
				var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
				var score = master.rating;
				if (score == '0') {
					score = '尚無評價';
				}
// 				var rating = $('<span></span>').attr('style','font-size:12px').text(score);
				var bname = $('<h3></h3>').text(master.bname);
				var city = $('<p></p>').addClass('boxtext').text('地點：' + master.city + ' ' + master.district);
				var finish = $('<p></p>').addClass('boxtext').text('完成案件數：' + master.finish);
				var divPro = $('<div></div>').addClass('divpro');
				var divSpan = $('<div></div>');
				var caption = divSpan.addClass('caption').append([bname,city,divPro]);
				var prodes = $('<span></span>').addClass('boxtext').text('專業：');
				divPro.append(prodes);
				if (master.pro.length != 'undefined' || master.pro.length != null) {
				for (var i = 0; i < master.pro.length; i++) {
					var pro = master.pro[i];
					var pa = $('<a href=""></a>');
					switch(pro) {
						case '地板地磚':
							pa.addClass('proc').css({'background':'#FFA500'});
							break;
						case '水電工程':
							pa.addClass('proc').css({'background':'#00BBFA'});
							break;
						case '油漆工程':
							pa.addClass('proc').css({'background':'#5F9EA0'});
							break;
						case '木作工程':
							pa.addClass('proc').css({'background':'#CD853F','border':'none','padding':'7px','color':'white'});
							break;
						case '防水抓漏':
							pa.addClass('proc').css({'background':'#4682B4'});
							break;
						case '室內裝潢':
							pa.addClass('proc').css({'background':'#F08080'});
							break;
						case '照明工程':
							pa.addClass('proc').css({'background':'#FFBB33'});
							break;
						case '冷氣空調':
							pa.addClass('proc').css({'background':'#48D1CC'});
							break;
						case '門窗工程':
							pa.addClass('proc').css({'background':'#FA8072'});
							break;
						case '泥作工程':
							pa.addClass('proc').css({'background':'#708090'});
							break;
					}
					divPro.append(pa.text(master.pro[i]));
					divSpan.append(divPro);
				}
				}
				divSpan.append([finish]);
				var thumbnail = $('<div></div>').addClass('thumbnail').addClass('thumbnailformaster').append([a,divSpan]);
				var col = $('<div></div>').addClass('col-xs-6 col-sm-4').append([thumbnail]);
				docFragment.append(col);
			});
			show.append(docFragment);
		});
		
		//專業LINK
		$('#show').on('click', '.proc', function() {
			var disval = district.val();
			if (disval == '鄉鎮市區') {
				disval = '';
			}
			link = $(this).text().trim();
			console.log(link);
			$.ajax({
				url : 'master.do',
				data: {'city':'${search.m_city}','district':disval,'pro':link,'action':'SearchResult'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','masterList.jsp');
				}
			});
		});
		
		var city = $('input[name="city"]');
		var district = $('input[name="district"]');
		
		$('#twzipcode').twzipcode({
			'css': ['form-control', 'form-control', 'zipcode'],
			'onCountySelect': function () {
		    	city.attr('value', this.value);
		    },
		    'onDistrictSelect': function() {
		    	district.attr('value', this.value);
		    },
		    'countySel':'${(empty search.m_city) ? "臺北市" : search.m_city}',
		    'districtSel':'${search.m_district}'
		});
	
// 	}); //outter function
	
	var input = $('input[name="input"]');
	var show = $('#show');
	var pro = $('#pro');
	
	pro.val('${search.m_name}');
	
	//ajax找師傅按鈕
	$('#btn').click(function() {
		var disval = district.val();
		if (disval == '鄉鎮市區') {
			disval = '';
		}
		$.ajax({
			url : 'master.do',
			data: {'city':city.val(),'district':disval,'pro':pro.val(),'input':input.val(),'action':'SearchResult'},
			type : 'POST',
			success : function(returnData) {
				$(location).attr('href','masterList.jsp');
			}
		});
	});
</script>
</body>
</html>