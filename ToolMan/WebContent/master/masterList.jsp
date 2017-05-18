<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="${pageContext.servletContext.contextPath}/css/index/expandsearch.css" rel="stylesheet">
<style>
body {font-family:Microsoft JhengHei;}
.county {width:80px;height:25px;vertical-align: top}
.zipcode {display: none;}
.form-control {margin:auto; width:120px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
.proc {
	width: 15px;
	height: 3px;
	padding: 5px;
	margin-left: 0;
 	margin-right: 5px;
 	text-align: center;
	border-radius: 3px;
	color: #FFF5EE;
	font-weight: bold;
/* 	word-wrap:break-word; */
}
.btn:hover {color: #FFF5EE;}
.divpro {
	margin-left: 0;
	margin-bottom: 8px;
}
/* .container {width: 90%;} */
.myDiv {position: relative; top: 100px}
.pad {
	padding-top: 15px; 
	padding-left: 10px; 
	padding-right: 30px; 
	padding-bottom: 40px;
}
.result {
	font-size: 25px;
}
.count {
	color: #00BFFF;
}
.list-group {
	margin-top: 50px;
}
.probtn {
	font-size: 16px;
}
a {
	color:White;
}

</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="container myDiv">
		<div>
			city= ${search.m_city}
			district = ${search.m_district}
			pro= ${search.m_name}
			input= ${search.b_name}
		</div>
		<div class="row">
			<div class="col-xs-6 col-md-4">
<!-- 					<h1 class="my-4">Shop Name</h1> -->
					<div class="list-group">
						<div id="resultcount" class="list-group-item"></div>
						<div class="list-group-item">
							<h3>專業</h3>
							<div id="protag">
								<a class="btn probtn" style="background:#FFA500">地板地磚</a>
								<a class="btn probtn" style="background:#00BBFA">水電工程</a>
								<a class="btn probtn" style="background:#5F9EA0">油漆工程</a>
								<a class="btn probtn" style="background:#CD853F">木作工程</a><br>
								<a class="btn probtn" style="background:#4682B4">防水抓漏</a>
								<a class="btn probtn" style="background:#F08080">室內裝潢</a>
								<a class="btn probtn" style="background:#FFBB33">照明工程</a>
								<a class="btn probtn" style="background:#48D1CC">冷氣空調</a><br>
								<a class="btn probtn" style="background:#FA8072">門窗工程</a>
								<a class="btn probtn" style="background:#708090">泥作工程</a>
							</div>
						</div>
						<div class="list-group-item">
							<h3>地區</h3>
							<span id="twzipcode"></span>
<%-- 							<input type="text" name="input" value="${search.b_name}"> --%>
							<input type="hidden" name="action" value="SearchResult">
							<input type="hidden" name="city" >
							<input type="hidden" name="district" >
							<button type="button" id="btn" class="btn btn-xl">搜尋</button>
						</div>
					</div>
                </div>
			<div class="col-xs-12 col-sm-6 col-md-8"><div id="show" class="row"></div></div>
		</div>
	</div>
	
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>	
<script>
	
// 	$(function() {
			
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','district':'${search.m_district}','input':'${search.b_name}','pro':'${search.m_name}','action':'searchjson'}, function(datas) {
			show.empty();
			
			//json陣列數目，代表總共有幾個師傅
			var mcount = datas.length;
			var result = $('<div></div>').addClass('result').addClass('text-center').text('搜尋結果：總共找到 ' + mcount + ' 位師傅');
			$('#resultcount').append(result);
			
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