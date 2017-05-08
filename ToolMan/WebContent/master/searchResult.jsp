<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
<style>
.county {width:80px;height:25px;vertical-align: top}
.zipcode {display: none;}
.district {display: none;}
/* .row {width:80%} */
</style>
</head>
<body>
	
	<form action="master.do" method="post">
		<span id="twzipcode"></span><input type="text" name="input" value="${search.b_name}">
		<button type="button" id="btn">ajax</button>
		<input type="submit" value="找師傅">
		<input type="hidden" name="action" value="SearchResult">
		<input type="hidden" name="city" >
	</form>

<!--  
	<div class="row">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<a href="${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=1000"><img src="${pageContext.servletContext.contextPath}/image/fasion.jpg" data-holder-rendered="true"></a>
				<div class="caption">
					<h3>忍者龜 <img src="${pageContext.servletContext.contextPath}/image/rating.jpg"></h3>
					<p>地點：台北市大安區</p>
					<p>專業：油漆工程、地板地磚</p>
					<p>完成案件數量：7</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="${pageContext.servletContext.contextPath}/image/harden.jpg" data-holder-rendered="true">
				<div class="caption">
					<h3>買飯幫主 <img src="${pageContext.servletContext.contextPath}/image/rating.jpg"></h3>
					<p>地點：台中市大里區</p>
					<p>專業：水電工程</p>
					<p>完成案件數量：3</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="${pageContext.servletContext.contextPath}/image/thunder.jpg" data-holder-rendered="true">
				<div class="caption">
					<h3>卡哇邦嘎 <img src="${pageContext.servletContext.contextPath}/image/rating.jpg"></h3>
					<p>地點：高雄市三民區</p>
					<p>專業：木工工程、室內裝潢</p>
					<p>完成案件數量：10</p>
				</div>
			</div>
		</div>
	</div>
-->
	<div>
		city= ${search.m_city}
		input= ${search.b_name}
	</div>
	<div id="show" class="row"></div>




<script>
	
// 	var master = [{"sta":"m_pass","bname":"金興伐地板","city":"臺北市","district":"中正區","rating":5,"finish":6,"id":1000,"mname":"許珺瑋","pro":["地板地磚"]},{"sta":"m_pass","bname":"如意棒裝潢","city":"臺北市","district":"中正區","rating":4,"finish":8,"id":1001,"mname":"張如意","pro":["水電工程","木工工程","油漆工程"]},{"sta":"m_sus","bname":"守株植樹專家","city":"臺北市","district":"中正區","rating":3,"finish":12,"id":1002,"mname":"朱昭宇","pro":["地板地磚"]},{"sta":"m_pass","bname":"店家名稱","city":"臺北市","district":"中正區","rating":0,"finish":0,"id":1005,"mname":"阿部師","pro":["防水抓漏","水電工程","地板地磚"]},{"sta":"m_nchecked","bname":"店家名稱","city":"臺北市","district":"文山區","rating":0,"finish":0,"id":1006,"mname":"阿部師","pro":["水電工程","地板地磚","防水抓漏"]}]

// 	$.each(master, function(i, val) {
// 		console.log(i);
// 		for (var i = 0; i < val.pro.length ; i++) {
// 			console.log(val.pro[i]);
// 		}
// 	});
	
	var city = $('input[name="city"]');
	
	$(function() {
		
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','input':'${search.b_name}'}, function(datas) {
// 			search.val(null);
			show.empty();
			$.each(datas, function(i,master) {
				if (master.sta == 'm_pass') {
					var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
						'data-holder-rendered':'true'});
					var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
					var ratingImg = $('<img />').attr('src','${pageContext.servletContext.contextPath}/image/rating.jpg');
					var bname = $('<h3></h3>').text(master.bname).append(ratingImg);
					var city = $('<p></p>').text(master.city + ' ' + master.district);
					var finish = $('<p></p>').text(master.finish);
					var divSpan = $('<div></div>');
// 					var pro = $('<p></p>').text(master.pro);
					var caption = divSpan.addClass('caption').append([bname]);
					for (var i = 0; i < master.pro.length; i++) {
						var pro = master.pro[i];
						var pa = $('<a href="#"></a>').addClass('pro');
						divSpan.append(pa.text(master.pro[i] + ' '));
					}
					divSpan.append([city,finish]);
					var thumbnail = $('<div></div>').addClass('thumbnail').append([a,divSpan]);
					var col = $('<div></div>').addClass('col-sm-6 col-md-4').append([thumbnail]);
					docFragment.append(col);
				}
			});
			show.append(docFragment);
		});
		
		
// 		$('#show').on('click', 'a', function() {
// 			var link = $(this).text();
// 			console.log(link);
// 			location.href="master.do?type=json&action=SearchResult&city=${search.m_city}&input="+link;
// 		});
		
		//專業LINK
		$('#show').on('click', '.pro', function() {
			var link = $(this).text().trim();
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
		
		
		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
			'onCountySelect': function () {
		    	city.attr("value", this.value);
		    },
		    'countySel':'${search.m_city}'
		});
		
	})
	
	var input = $('input[name="input"]');
	var show = $('#show');
	//ajax找師傅按鈕
	$('#btn').click(function() {
		$.ajax({
			url : 'master.do',
			data: {'city':city.val(),'input':input.val(),'action':'SearchResult'},
			type : 'POST',
			success : function(returnData) {
				$(location).attr('href','searchResult.jsp');
			}
		});
	});
	
	
// 	$('#btn').click (function() {
		
// 		console.log('search value: ' + search.val());
		
// 		$.ajax({
// 			url : 'master.do',
// 			data: {'city':city.val(),'input':search.val(),'action':'SearchMasterNext'},
// 			type : 'POST',
// 			success : function(returnData) {
// // 				$(location).attr('href','searchResult.jsp');
// 			}
// 		});
		
// 		var docFragment = $(document.createDocumentFragment());
// 		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','input':'${search.b_name}', 'action':'SearchMasterNext'}, function(datas) {
// // 			search.val(null);
// 			show.empty();
// 			$.each(datas, function(i,master) {
// 				var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
// 												'data-holder-rendered':'true'});
// 				var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
// 				var ratingImg = $('<img />').attr('src','${pageContext.servletContext.contextPath}/image/rating.jpg');
// 				var bname = $('<h3></h3>').text(master.bname).append(ratingImg);
// 				var city = $('<p></p>').text(master.city + ' ' + master.district);
// 				var finish = $('<p></p>').text(master.finish);
// 				var pro = $('<p></p>').text(master.pro);
// 				var caption = $('<div></div>').addClass('caption').append([bname,city,pro,finish]);
// 				var thumbnail = $('<div></div>').addClass('thumbnail').append([a,caption]);
// 				var col = $('<div></div>').addClass('col-sm-6 col-md-4').append([thumbnail]);
// 				docFragment.append(col);
// 			});
// 			show.append(docFragment);
// 		});
		
		
// 	});

</script>

</body>
</html>