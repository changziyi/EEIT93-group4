<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>${mdataVO.b_name}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<style>
		body {font-family:Microsoft JhengHei;}
		input[type="file"] {display:inline;}
		.changeImg {width:200px; padding:10px;}
		#uploadTemp {line-height:normal;background-color:#fff;width:560px;}
		.workImgArea {vertical-align:top;padding:5px;}
		.myDiv {position:relative; top:85px;}
		.outtermd8 {width:87%; margin-left:5%;}
		.innermd8 {}
		.md4 {padding-top:5%}
	</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<div class="myDiv">
<div class="container">

	<div class="row">
		<div class="col-md-8 outtermd8">
			<div class="col-md-8 innermd8">
				<img height="450px" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}'/>
			</div>
			<div class="col-md-4 md4">
				<H3>${mdataVO.b_name}</H3>
				<p>專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro}</c:forEach></p>
				<p>師傅：${mdataVO.m_name}</p>
				<p>地區：${mdataVO.m_city}　${mdataVO.m_district}</p>
	   			<input type="button" id="reservemaster" value="預約師傅" >
 <%--------------------------------------最愛與黑單--------------------------------------------------- --%>
				<a href="${pageContext.servletContext.contextPath}/order/Favorite.do?c_id=${LoginOK.c_id}&m_id=${mdataVO.m_id}&action=addFavorite" class="btn btn-info ">
					<span class="glyphicon glyphicon-heart-empty"></span>加入最愛
				</a>
        		<a href="${pageContext.servletContext.contextPath}/order/Dislike.do?c_id=${LoginOK.c_id}&m_id=${mdataVO.m_id}&action=addDislike" class="btn btn-danger">
          			<span class="glyphicon glyphicon-remove-sign"></span> 加入黑名單
        		</a>
  <%--------------------------------------萬里長城--------------------------------------------------- --%>
			</div>
		</div>
	</div>
</div> <!--container-->
<div class="container">
	<br />
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">介紹</a></li>
		<li><a data-toggle="tab" href="#menu1">作品</a></li>
		<li><a data-toggle="tab" href="#menu2">問與答</a></li>
		<li><a data-toggle="tab" href="#menu3">評價</a></li>
		<li><a data-toggle="tab" href="#menu4">媒合人次</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<p>${mdataVO.b_des}</p>
		</div>
		<div id="menu1" class="tab-pane fade">
			<div></div>
<!-- 			<div id="uploadTemp">
				<form action="php/form_upload.php" method="post" enctype="multipart/form-data">
					<div class="workImgArea">作品名稱　<input type="text" name="workname" required></div>
					<div class="workImgArea">完工日期　<input type="text" name="worktime" required></div>
					<div class="workImgArea">作品描述　<textarea name="workdes" required></textarea></div>
					<input type="file" name="files" data-fileuploader-limit="3"><button type="button" id="buttonUpload">上傳</button>
				</form>
			</div> -->
			
			<c:if test="${LoginOK.m_id == mdataVO.m_id}">
				<div id='div1'></div>
				<form name="myData" action="TestFormData" enctype="multipart/form-data">
					<div><input type="file" id="file" name="file[]" multiple="multiple"></div>
					<div class="workImgArea">作品名稱　<input type="text" name="workname" required></div>
					<div class="workImgArea">完工日期　<input type="text" name="worktime" required></div>
					<div class="workImgArea">作品描述　<textarea name="workdes"></textarea></div>
					<button type="button" id="buttonUpload">上傳</button>
				</form>
			</c:if>
			<div>
				<c:forEach var="aWork" items="${mdataVO.works}">
					<c:forEach var="a" items="${aWork.workims}">
						<img height="450px" src='${pageContext.servletContext.contextPath}/master/master.do?type=work&image=${a.im_id}'/>
						<p>${a.im_id}</p>
					</c:forEach>
				</c:forEach>
			</div>
    
		</div>
		<div id="menu2" class="tab-pane fade">
			<div>
				<div>
					<div id="show"></div>
					<p>提問</p>
					<form method="post" action="masterPage.do">
						<textarea name="d_des" id="d_des"></textarea><br />
						<input type="button" name="question" value="送出"><input type="reset" value="取消">
<!-- 						<input type="submit" value="送出"><input type="reset" value="取消"> -->
<!-- 						<input type="hidden" name="action" value="MasterPage_Q"> -->
					</form>
				</div>
			</div>

		</div>
		<div id="menu3" class="tab-pane fade">
			<h3>評價: ${mdataVO.m_arating}</h3>
			<c:forEach var="orderCid" items="${mdataVO.orders}">
				${orderCid.c_id.c_id} ：
				${orderCid.c_rating} - 
				${orderCid.o_edate}<br>
			</c:forEach>
		</div>
		<div id="menu4" class="tab-pane fade">
			<h3>成功媒合人次:</h3>
			<c:forEach var="orderCid" items="${mdataVO.orders}">
				${orderCid.c_id.c_id} - 
				${orderCid.o_edate}<br>
			</c:forEach>
		</div>
	</div>
</div>	
</div>
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<script>
	
// 		$(function() {
			
			//點選問與答區塊，load問與答內容
			var show = $('#show');
			$('a[href="#menu2"]').one('click', function() {
				var docFragment = $(document.createDocumentFragment());
				$.getJSON('MdataJsonServlet',{'master':'${mdataVO.m_id}','action':'discussion'},function(data){
					$.each(data,function(i,dis){
						var cid = $('<p></p>').text(dis.cid + '　' + dis.date);
// 						var date = $('<span></span>').text(dis.date);
						var des = $('<p></p>').text(dis.des);
						var reply = $('<p></p>').text(dis.reply);
						var row = $('<div></div>').append([cid,des,reply]);
						var onediv = $('<div></div>').append(row);
						docFragment.append(onediv);
					});
					show.append(docFragment);
				})
			});
			
			//使用者提問，動態更新問與答區塊
			$('input[name="question"]').on('click', function() {
				$.post("masterPage.do", {"m_id":"${mdataVO.m_id}",'action':'MasterPage_Q','d_des':$('#d_des').val()}, function(datas) {
					$('#d_des').val(null);
					var docFragment = $(document.createDocumentFragment());
					$.getJSON('MdataJsonServlet',{'master':'${mdataVO.m_id}','action':'discussion'},function(data){
						$('#show').empty();
						$.each(data,function(i,dis){
							var cid = $('<p></p>').text(dis.cid + '　' + dis.date);
// 							var date = $('<span></span>').text(dis.date);
							var des = $('<p></p>').text(dis.des);
							var reply = $('<p></p>').text(dis.reply);
							var row = $('<div></div>').append([cid,des,reply]);
							var onediv = $('<div></div>').append(row);
							docFragment.append(onediv);
						});
						show.append(docFragment);
					});
				});
			});
			
			
			var btn = $('#buttonUpload');
			var upload = $('input[type="file"]');
			var myDiv = $('#div1');
			
			//上傳圖片限制三張
			upload.on('change', function(event) {
				
				myDiv.empty();
				
				if (event.target.files.length > 3) {
					alert("限制為3張圖片，請重新選擇");
					upload.val(null);
				}
	
				for (var i = 0; i < event.target.files.length; i++) {
					$('<img />').attr('id', 'img' + i).appendTo(myDiv);
				}
	
				preview(this);
	
			});
	
			function preview(input) {
	
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img0').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[0]);
				} else {
					$('#img0').remove();
				}
	
				if (input.files && input.files[1]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img1').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[1]);
				} else {
					$('#img1').remove();
				}
	
				if (input.files && input.files[2]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img2').attr({
							'src' : e.target.result,
							'class' : 'changeImg'
						});
					}
					reader.readAsDataURL(input.files[2]);
				} else {
					$('#img2').remove();
				}
			}
			
			//上傳作品圖片
			btn.on('click',function() {
	
				var others = $('form').serializeArray();
				var photos = $('input[type="file"]')[0].files;
	
				var formData = new FormData();
	
				$.each(others, function(index, input) {
					formData.append(input.name, input.value);
// 					console.log('name: ' + input.name);
// 					console.log('value: ' + input.value);
				});
	
				for (var i = 0; i < photos.length; i++) {
					formData.append('file' + i, photos[i]);
// 					console.log(photos[i]);
				}
	
				$.ajax({
					url : 'TestFormData',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					type : 'POST',
		 			success : function(reutrnData) {
// 		 				alert(reutrnData);
						$('#img0').removeAttr('src').removeAttr('class');
						$('#img1').removeAttr('src').removeAttr('class');
						$('#img2').removeAttr('src').removeAttr('class');
						var successImg = $('<img />').attr('src','${pageContext.servletContext.contextPath}/image/jake.gif');
						myDiv.append(successImg);
						upload.val(null);
// 						$('input[name="fileuploader-list-files"]').val('[]');
// 						$('ul').find('.fileuploader-item').remove();
		 			},
		 			beforeSend : function() {
		 				
		 			},
		 			complete : function() {
		 				
		 			}
		 			
		 			
				});
			});
			
// 		}); //outter function
	</script>

<script>
$("#reservemaster").on("click",function(){window.location='${pageContext.servletContext.contextPath}/toolman.order/NewOrder.jsp'});
</script>
</body>
</html>