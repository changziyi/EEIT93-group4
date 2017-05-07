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
.row {width:80%}
</style>
</head>
<body>

	<input type="text" name="search"><span id="twzipcode"></span>
	<br><button type="button" id="btn">找師傅</button>
	<input type="hidden" name="city">

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
	
	<div id="show" class="row"></div>




<script>
	
	var city = $('input[name="city"]');
	
	$(function() {
		
		var docFragment = $(document.createDocumentFragment());
		$.getJSON('MdataJsonServlet', {'city':'${search.m_city}','input':'${search.b_name}'}, function(datas) {
// 			search.val(null);
// 			show.empty();
			$.each(datas, function(i,master) {
				var bImg = $('<img />').attr({'src':'${pageContext.servletContext.contextPath}/master/master.do?type=master&image=' + master.id,
					'data-holder-rendered':'true'});
				var a = $('<a></a>').attr('href','${pageContext.servletContext.contextPath}/master/masterPage.do?m_id='+ master.id).append(bImg);
				var ratingImg = $('<img />').attr('src','${pageContext.servletContext.contextPath}/image/rating.jpg');
				var bname = $('<h3></h3>').text(master.bname).append(ratingImg);
				var city = $('<p></p>').text(master.city + ' ' + master.district);
				var finish = $('<p></p>').text(master.finish);
				var pro = $('<p></p>').text(master.pro);
				var caption = $('<div></div>').addClass('caption').append([bname,city,pro,finish]);
				var thumbnail = $('<div></div>').addClass('thumbnail').append([a,caption]);
				var col = $('<div></div>').addClass('col-sm-6 col-md-4').append([thumbnail]);
				docFragment.append(col);
			});
			show.append(docFragment);
		});
		

		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
			'countySel' : '臺北市',
			'onCountySelect': function () {
		    	city.attr("value", this.value);
		    }
		});
		
	})
	
	var search = $('input[name="search"]');
	var show = $('#show');
	
	$('#btn').click(function() {
		
		$.ajax({
			url : 'master.do',
			data: {'city':city.val(),'input':search.val(),'action':'SearchMasterNext'},
			type : 'POST',
			success : function(returnData) {
				$(location).attr('href','searchResult.jsp');
			}
		});
	});
	
// 	$('#btn').click (function() {
// 		console.log('search value: ' + search.val());
// 		var docFragment = $(document.createDocumentFragment());
// 		$.getJSON('MdataJsonServlet', {'city':city.val(),'input':search.val()}, function(datas) {
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