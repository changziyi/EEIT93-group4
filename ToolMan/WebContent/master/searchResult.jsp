<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/star-rating.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.min.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/star-rating.min.js"></script>
<style>
body {font-family:Microsoft JhengHei;}
.county {width:80px;height:25px;vertical-align: top}
.zipcode {display: none;}
/* .district {display: none;} */
/* .row {width:82%} */
.mascontent {width:75%;}
.pro {
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
.pro:hover {color: #FFF5EE;}
.divpro {
	margin-left:0;
	margin-bottom:8px;
}
</style>
</head>
<body>
		<form action="master.do" method="post">
			<span id="twzipcode"></span><input type="text" name="input" value="${search.b_name}">
			<button type="button" id="btn">ajax</button>
			<input type="submit" value="找師傅">
			<input type="hidden" name="action" value="SearchResult">
			<input type="hidden" name="city" >
			<input type="hidden" name="district" >
		</form>
		
		<div>
			city= ${search.m_city}
			district = ${search.m_district}
			input= ${search.b_name}
		</div>
		
<!-- 	<input id="input-4" name="input-4" value="3" class="rating rating-loading" data-show-clear="false" data-show-caption="false" data-readonly="true"> -->
	<div id="show" class="row mascontent"></div>

<script>
	
// 	$(function() {
		
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','district':'${search.m_district}','input':'${search.b_name}','action':'advjson'}, function(datas) {
			show.empty();
			$.each(datas, function(i,master) {
				if (master.sta == '審核通過') {
					var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
						'data-holder-rendered':'true'});
					var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
// 					var rating = $('<input/>').addClass('rating rating-loading').attr({'id':'input-4','value':master.rating,'name':'input-4','data-show-clear':'false','data-show-caption':'false','data-readonly':'true'});
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
						var pa = $('<a href=""></a>').css({'text-decoration':'none'});
						switch(pro) {
							case '地板地磚':
								pa.addClass('pro').css({'background':'#FFA500'});
								break;
							case '水電工程':
								pa.addClass('pro').css({'background':'#00BBFA'});
								break;
							case '油漆工程':
								pa.addClass('pro').css({'background':'#5F9EA0'});
								break;
							case '木作工程':
								pa.addClass('pro').css({'background':'#CD853F'});
								break;
							case '防水抓漏':
								pa.addClass('pro').css({'background':'#4682B4'});
								break;
							case '室內裝潢':
								pa.addClass('pro').css({'background':'#F08080'});
								break;
							case '照明工程':
								pa.addClass('pro').css({'background':'#FFBB33'});
								break;
							case '冷氣空調':
								pa.addClass('pro').css({'background':'#48D1CC'});
								break;
							case '門窗工程':
								pa.addClass('pro').css({'background':'#FA8072'});
								break;
							case '泥作工程':
								pa.addClass('pro').css({'background':'#708090'});
								break;
						}
						divPro.append(pa.text(master.pro[i]));
						divSpan.append(divPro);
					}
					divSpan.append([finish]);
					var thumbnail = $('<div></div>').addClass('thumbnail').append([a,divSpan]);
					var col = $('<div></div>').addClass('col-sm-6 col-md-4').append([thumbnail]);
					docFragment.append(col);
				}
			});
			show.append(docFragment);
		});
		
		//專業LINK
		$('#show').on('click', '.pro', function() {
			link = $(this).text().trim();
			console.log(link);
			$.ajax({
				url : 'master.do',
				data: {'city':'${search.m_city}','input':link,'action':'SearchResult'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','searchResult.jsp');
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
		    'countySel':'${search.m_city}',
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
				$(location).attr('href','searchResult.jsp');
			}
		});
	});
</script>
</body>
</html>