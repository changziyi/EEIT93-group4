<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>
<style>
body {font-family:Microsoft JhengHei;}
.county {width:80px;height:25px;vertical-align: top}
.zipcode {display: none;}
/* .district {display: none;} */
/* .row {width:82%} */
.proc {
	width: 15px;
	height: 3px;
	padding: 5px;
	margin-left:0;
 	margin-right:5px;
 	text-align: center;
	border-radius: 3px;
	color: #FFF5EE;
	font-weight: bold;
/* 	word-wrap:break-word; */
}
.btn:hover {color: #FFF5EE;}
.divpro {
	margin-left:0;
	margin-bottom:8px;
}
.container {width:90%;}
.myDiv {position:relative; top:100px}
</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<!-- 		<form action="master.do" method="post"> -->
<%-- 			<span id="twzipcode"></span><input type="text" name="input" value="${search.b_name}"> --%>
<!-- 			<button type="button" id="btn">ajax</button> -->
<!-- 			<input type="submit" value="找師傅"> -->
<!-- 			<input type="hidden" name="action" value="SearchResult"> -->
<!-- 			<input type="hidden" name="city" > -->
<!-- 			<input type="hidden" name="district" > -->
<!-- 		</form> -->
<!-- 		<div> -->
<%-- 			city= ${search.m_city} --%>
<%-- 			district = ${search.m_district} --%>
<%-- 			pro= ${search.m_name} --%>
<%-- 			input= ${search.b_name} --%>
<!-- 		</div> -->
	<div class="container myDiv">
		<div class="row">
			<div class="col-xs-6 col-md-4">
<!-- 					<h1 class="my-4">Shop Name</h1> -->
					<div>
						<form action="master.do" method="post">
							<span id="twzipcode"></span><input type="text" name="input" value="${search.b_name}">
							<button type="button" id="btn">ajax</button>
							<input type="submit" value="找師傅">
							<input type="hidden" name="action" value="SearchResult">
							<input type="hidden" name="city" >
							<input type="hidden" name="district" >
						</form>
					</div>
	                <div class="list-group">
	                    <a href="#" class="list-group-item">Category 1</a>
	                    <a href="#" class="list-group-item">Category 2</a>
	                    <a href="#" class="list-group-item">Category 3</a>
	                </div>
                </div>
			<div class="col-xs-12 col-sm-6 col-md-8"><div id="show" class="row"></div></div>
		</div>
	</div>
	
<script>
	
// 	$(function() {
		
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','district':'${search.m_district}','input':'${search.b_name}','pro':'${search.m_name}','action':'searchjson'}, function(datas) {
			show.empty();
			$.each(datas, function(i,master) {
				var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
					'data-holder-rendered':'true'});
				var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
				var score = master.rating;
				if (score == '0') {
					score = '尚無評價';
				}
				var rating = $('<span></span>').attr('style','font-size:12px').text(score);
				var bname = $('<h3></h3>').text(master.bname).append(rating);
				var city = $('<p></p>').text('地點：' + master.city + ' ' + master.district);
				var finish = $('<p></p>').text('完成案件數：' + master.finish);
				var divPro = $('<div></div>').addClass('divpro');
				var divSpan = $('<div></div>');
				var caption = divSpan.addClass('caption').append([bname,city,divPro]);
				var prodes = $('<span></span>').text('專業：');
				divPro.append(prodes);
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
				divSpan.append([finish]);
				var thumbnail = $('<div></div>').addClass('thumbnail').append([a,divSpan]);
				var col = $('<div></div>').addClass('col-xs-6 col-sm-4').append([thumbnail]);
				docFragment.append(col);
			});
			show.append(docFragment);
		});
		
		//專業LINK
		$('#show').on('click', '.proc', function() {
			link = $(this).text().trim();
			console.log(link);
			$.ajax({
				url : 'master.do',
				data: {'city':'${search.m_city}','pro':link,'action':'SearchResult'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','masterList.jsp');
				}
			});
		});
		
		var city = $('input[name="city"]');
		var district = $('input[name="district"]');
		
		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
			'onCountySelect': function () {
		    	city.attr('value', this.value);
		    },
		    'onDistrictSelect': function() {
		    	district.attr('value', this.value);
		    },
		    'countySel':'${(search.m_city eq "all") ? "臺北市" : search.m_city}',
		    'districtSel':'${search.m_district}'
		});
	
// 	}); //outter function
	
	var input = $('input[name="input"]');
	var show = $('#show');
	//ajax找師傅按鈕
	$('#btn').click(function() {
		var disval = district.val();
		if (disval == '鄉鎮市區') {
			disval = '';
		}
		$.ajax({
			url : 'master.do',
			data: {'city':city.val(),'district':disval,'input':input.val(),'action':'SearchResult'},
			type : 'POST',
			success : function(returnData) {
				$(location).attr('href','masterList.jsp');
			}
		});
	});
</script>
</body>
</html>