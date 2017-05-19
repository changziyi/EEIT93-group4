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
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<style>
		body {font-family:Microsoft JhengHei;}
		input[type="file"] {display:inline;}
		pre {white-space:pre-wrap;word-wrap:break-word;}
		span {font-family:Microsoft JhengHei;}
		.zipcode {display: none;}
		.changeImg {width:200px; padding:10px;}
		#uploadTemp {line-height:normal;background-color:#fff;width:560px;}
		.workImgArea {vertical-align:top;padding:5px;}
		.myDiv {position:relative; top:85px;}
		.outtermd8 {width:87%; margin-left:4%;}
		.innermd8 {}
		.md4 {padding-top:3%}
		.commentbox {width:60%;height:20%;}
		.commentarea {margin-top:2%;margin-left:18%;}
		.onecomment {margin-bottom:2%}
		.desarea {}
		.disdes {width:70%;padding:1.3%;margin-bottom:0.5%;font-size:15px;font-family:Microsoft JhengHei;}
		.replyarea {}
		.disreply {width:64%;padding:1.3%;margin-left:6%;border-width:1.5px;border-color:#00BFFF;font-size:15px;font-family:Microsoft JhengHei;}
		.cid {width:25%;height:30px;padding-left:2%;padding-top:0.5%;background-color:#00BFFF;font-weight:bold;color:white;border-top-left-radius:10px;border-top-right-radius:10px}
		.commentdiv {margin-top:2.5%;margin-left:12%;}
		.masterreply {width:50%;height:10%}
		.qbtncen {margin-left:21%;padding:1.6%;}
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
				<c:if test="${LoginOK.m_id == mdataVO.m_id}">
  					<!-- 修改店家資料按鈕 -->
					<a class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span> 編輯店家</a>
				</c:if>
				<div class="container">
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
						      <!-- Modal content-->
							<form method="post" action="master.do" enctype="multipart/form-data" name="updateform">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">修改店家資訊</h4>
								</div>
								<div class="modal-body">
									<div>
										<table>
											<tr>
												<td>專業證照:
												<div><img id="m_cer" width="200px" src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${mdataVO.m_id}"></div>
												<input type="file" name="m_cer" ></td>
											</tr>
											<tr>
												<td>師傅姓名:
												<input type="text" name="m_name" value="${mdataVO.m_name}"/></td>
											</tr>
											<tr>
												<td>電話:
												<input type="text" name="m_cel" value="${mdataVO.m_cel}"/></td>
											<tr>
												<td>信箱:
												<input type="text" name="m_email" value="${mdataVO.m_email}"/></td>
											</tr>
											<tr>
												<td>地址:
												<span id="twzipcode"></span>
												<input type="text" name="m_addr" value="${mdataVO.m_addr}"/>
												</td>
											</tr>
											<tr>
												<td>維修類別:<br >
												<input type="checkbox" name="m_pro" value="地板地磚">地板地磚
												<input type="checkbox" name="m_pro" value="防水抓漏">防水抓漏
												<input type="checkbox" name="m_pro" value="室內裝潢">室內裝潢
												<input type="checkbox" name="m_pro" value="冷氣空調">冷氣空調
												<input type="checkbox" name="m_pro" value="水電工程">水電工程 <br>
												<input type="checkbox" name="m_pro" value="門窗工程">門窗工程
												<input type="checkbox" name="m_pro" value="油漆工程">油漆工程
												<input type="checkbox" name="m_pro" value="木作工程">木作工程
												<input type="checkbox" name="m_pro" value="泥作工程">泥作工程
												<input type="checkbox" name="m_pro" value="照明工程">照明工程
												</td>
											</tr>
											<tr>
											<td>首頁圖片:
												<div><img id="b_image" width="200px" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}"></div>
												<input type="file" name="b_image" /></td>
											</tr>
											<tr>
												<td>店家名稱:
												<input type="text" name="b_name" value="${mdataVO.b_name}" /></td>
											</tr>
											<tr>
												<td>店家介紹:
												<textarea name="b_des">${mdataVO.b_des}</textarea></td>
											</tr>
											<tr>
												<td><input type="hidden" name="action" value="updateMaster" ></td>
												<td><input type="hidden" name="m_city" value="${mdataVO.m_city}" ></td>
												<td><input type="hidden" name="m_district" value="${mdataVO.m_district}"></td>
												<c:forEach var="aMpro" varStatus="count1" items="${mdataVO.mpros}">
													<td class="prc"><input type="hidden" name="hidpro" value="${aMpro.m_pro}"></td>
												</c:forEach>
											</tr>
										</table>
									</div>
						        </div>
						        <div class="modal-footer">
						        	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
						        	<button type="button" class="btn btn-default" id="updatebtn">送出</button>
						        </div>
						      </div>
							</form>
		</div>
	</div>
	
</div>
				<H2>${mdataVO.b_name}</H2>
				<p>專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro} </c:forEach></p>
				<p>師傅：${mdataVO.m_name}</p>
				<p>地區：${mdataVO.m_city}　${mdataVO.m_district}</p>
	   	<a href="${pageContext.servletContext.contextPath}/toolman.order/NewOrder.jsp" class="btn btn-success ">
          <span class="glyphicon glyphicon-earphone"></span> 預約師傅
        </a>   
 <%--------------------------------------最愛與黑單--------------------------------------------------- --%>
				<a href="${pageContext.servletContext.contextPath}/order/Favorite.do?c_id=${LoginOK.c_id}&m_id=${mdataVO.m_id}&action=addFavorite" class="btn btn-info ">
					<span class="glyphicon glyphicon-heart-empty"></span> 加入最愛
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
						<img height="350px" src='${pageContext.servletContext.contextPath}/master/master.do?type=work&image=${a.im_id}'/>
						<p>${a.im_id}</p>
					</c:forEach>
				</c:forEach>
			</div>
    
		</div>
		<div id="menu2" class="tab-pane fade">
			<div>
				<div>
					<div id="show"></div>
					<div class="commentarea">
						<div class="form-group">
							<form method="post" action="masterPage.do">
								<label for="comment" style="font-size:16px">提問：</label>
								<textarea class="form-control commentbox" rows="5" cols="50" name="d_des" id="d_des"></textarea>
								<div class="qbtncen"><input type="button" name="question" class="btn btn-info" value="送出">　<input type="reset" class="btn btn-default" value="取消"></div>
							</form>
						</div>
					</div>
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
	<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
	<script>
	
// 		$(function() {
			
	
			//編輯店家
			var pro = $('input[name="m_pro"]');
			
			$('#updatebtn').click(function(){
				
				var updatedata = $('form[name="updateform"]').serializeArray();
				var cerpho = $('input[name="m_cer"]')[0].files[0];
				var bpho = $('input[name="b_image"]')[0].files[0];
				var formData = new FormData();
				
				$.each(updatedata, function(index, input) {
					formData.append(input.name, input.value);
					console.log('name: ' + input.name);
					console.log('value: ' + input.value);
				});
				
				formData.append('m_cer', cerpho);
				formData.append('b_image', bpho);
				
				$.ajax({
					url : 'master.do',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					type : 'POST',
	 				success : function(reutrnData) {
	 					$(location).attr('href','MasterPage.jsp');
	 				}
				});
			});
	
	
			//點選問與答區塊，load問與答內容
			var show = $('#show');
			$('a[href="#menu2"]').one('click', function() {
				var docFragment = $(document.createDocumentFragment());
				$.getJSON('MdataJsonServlet',{'master':'${mdataVO.m_id}','action':'discussion'},function(data){
					$.each(data,function(i,dis){
						var cid = $('<div></div>').addClass('cid').text(dis.cid + '　' + dis.date);
						var des = $('<pre></pre>').addClass('disdes').text(dis.des);
						var desarea = $('<div></div>').addClass('desarea').append(cid,des);
						var row = $('<div></div>');
						if (dis.reply != null) {
							var reply = $('<div></div>').addClass('replyarea').append($('<pre></pre>').addClass('disreply').text(dis.reply));
							row.addClass('onecomment').append([desarea,reply]);
						} else {
							var replyform = $('<form></form>').attr({'action':'masterPage.do','method':'post'})
							if ("${LoginOK.m_id}" == "${mdataVO.m_id}") {
								var replybtn = $('<input />').addClass('btn btn-info').attr({'type':'button','name':'replybtn','value':'回覆'});
								var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'2'});
								var hidid = $('<input />').attr({'type':'hidden','name':'did','value':dis.did});
								var hidaction = $('<input />').attr({'type':'hidden','name':'action','value':'MasterPage_A'});
								var replyarea = $('<div></div>').addClass('replyarea').append([reply,hidaction,hidid,replybtn]);
								row.addClass('onecomment').append([desarea,replyarea]);
							} else {
								var reply = $('<div></div>');
								row.addClass('onecomment').append([desarea,reply]);
							}
						}
						var onediv = $('<div></div>').addClass('commentdiv').append(row);
						docFragment.append(onediv);
					});
					show.append(docFragment);
				});
			});
			
			//使用者提問，動態更新問與答區塊
			$('input[name="question"]').on('click', function() {
				$.post("masterPage.do", {"m_id":"${mdataVO.m_id}",'action':'MasterPage_Q','d_des':$('#d_des').val()}, function(datas) {
					$('#d_des').val(null);
					var docFragment = $(document.createDocumentFragment());
					$.getJSON('MdataJsonServlet',{'master':'${mdataVO.m_id}','action':'discussion'},function(data){
						show.empty();
						$.each(data,function(i,dis){
							var cid = $('<div></div>').addClass('cid').text(dis.cid + '　' + dis.date);
							var des = $('<pre></pre>').addClass('disdes').text(dis.des);
							var desarea = $('<div></div>').addClass('desarea').append(cid,des);
							var row = $('<div></div>');
							if (dis.reply != null) {
								var reply = $('<div></div>').addClass('replyarea').append($('<pre></pre>').addClass('disreply').text(dis.reply));
								row.addClass('onecomment').append([desarea,reply]);
							} else {
								var replyform = $('<form></form>').attr({'action':'masterPage.do','method':'post'})
								if ("${LoginOK.m_id}" == "${mdataVO.m_id}") {
									var replybtn = $('<input />').addClass('btn btn-info').attr({'type':'button','name':'replybtn','value':'回覆'});
									var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'2'});
									var hidid = $('<input />').attr({'type':'hidden','name':'did','value':dis.did});
									var hidaction = $('<input />').attr({'type':'hidden','name':'action','value':'MasterPage_A'});
									var replyarea = $('<div></div>').addClass('replyarea').append([reply,hidaction,hidid,replybtn]);
									row.addClass('onecomment').append([desarea,replyarea]);
								} else {
									var reply = $('<div></div>');
									row.addClass('onecomment').append([desarea,reply]);
								}
							}
							var onediv = $('<div></div>').addClass('commentdiv').append(row);
							docFragment.append(onediv);
						});
						show.append(docFragment);
					});
				});
			});
			
			//師傅回覆
			show.on('click', 'input[name="replybtn"]', function() {
				var divparent = $(this).parents('.replyarea');
				var did = divparent.find('input[name="did"]').val();
				var reply = divparent.find('#reply').val();
				console.log(did);
				console.log(reply);
				
				$.post('masterPage.do', {'did':did,'reply':reply,'action':'MasterPage_A'}, function(datas){
					$('#reply').val(null);
					var docFragment = $(document.createDocumentFragment());
					$.getJSON('MdataJsonServlet',{'master':'${mdataVO.m_id}','action':'discussion'},function(data){
						show.empty();
						$.each(data,function(i,dis){
							var cid = $('<div></div>').addClass('cid').text(dis.cid + '　' + dis.date);
							var des = $('<pre></pre>').addClass('disdes').text(dis.des);
							var desarea = $('<div></div>').addClass('desarea').append(cid,des);
							var row = $('<div></div>');
							if (dis.reply != null) {
								var reply = $('<div></div>').addClass('replyarea').append($('<pre></pre>').addClass('disreply').text(dis.reply));
								row.addClass('onecomment').append([desarea,reply]);
							} else {
								var replyform = $('<form></form>').attr({'action':'masterPage.do','method':'post'})
								if ("${LoginOK.m_id}" == "${mdataVO.m_id}") {
									var replybtn = $('<input />').addClass('btn btn-info').attr({'type':'button','name':'replybtn','value':'回覆'});
									var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'2'});
									var hidid = $('<input />').attr({'type':'hidden','name':'did','value':dis.did});
									var hidaction = $('<input />').attr({'type':'hidden','name':'action','value':'MasterPage_A'});
									var replyarea = $('<div></div>').addClass('replyarea').append([reply,hidaction,hidid,replybtn]);
									row.addClass('onecomment').append([desarea,replyarea]);
								} else {
									var reply = $('<div></div>');
									row.addClass('onecomment').append([desarea,reply]);
								}
							}
							var onediv = $('<div></div>').addClass('commentdiv').append(row);
							docFragment.append(onediv);
						});
						show.append(docFragment);
					});
					
					
				});
				
			});
			
			
			var btn = $('#buttonUpload');
			var upload = $('input[name="file[]"]');
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
			
			
			var city = $('input[name="m_city"]');
			var district = $('input[name="m_district"]');

			$('#twzipcode').twzipcode({
				'css': ['county', 'district', 'zipcode'],
			    'countySel'   : '${mdataVO.m_city}',
			    'districtSel' : '${mdataVO.m_district}',
			    'onCountySelect': function () {
			    	city.attr("value", this.value);
			    },
				'onDistrictSelect': function () {
					district.attr("value", this.value);
			    }
			});
			
			//預設勾選專業 
			var hpros = $('input[name="hidpro"]');

			$.each(hpros, function() {
				var parentd = $(this).parent('.prc');
				var apro = parentd.find('input[name="hidpro"]').val();
				console.log(apro);
				$("input[name=m_pro][value=" + apro + "]").prop('checked', true);
			})
			
// 		}); //outter function
	</script>

<script>
$("#reservemaster").on("click",function(){window.location='${pageContext.servletContext.contextPath}/toolman.order/NewOrder.jsp'});
</script>
</body>
</html>