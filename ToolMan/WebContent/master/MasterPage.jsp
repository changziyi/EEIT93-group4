<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="toolman.blacklist.model.*"%>
<%
	BlacklistService empSvc = new BlacklistService();
    List<BlacklistVO> list = empSvc.getAllBlacklist();
    pageContext.setAttribute("myHate",list);
%>

<!DOCTYPE html>
<html>
<head>
	<title>${mdataVO.b_name}</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/star-rating.css">
	<link rel='stylesheet' href='${pageContext.servletContext.contextPath}/js/fullcalendar.min.css' />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/calendarformasterpage/cal.css">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/star-rating.min.js"></script>
	<script src='${pageContext.servletContext.contextPath}/js/moment.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/fullcalendar.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.js'></script>
	<script src="${pageContext.servletContext.contextPath}/lang/zh-tw.js"></script>
	<style>
		body {font-family:Microsoft JhengHei;}
		input[type="file"] {display:inline;}
		pre {white-space:pre-wrap;word-wrap:break-word;}
		span {font-family:Microsoft JhengHei;}
		td {font-size:15px;}
		p {font-size:15px}
		.zipcode {display: none;}
		.zip {margin:auto; width:100px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
		.changeImg {width:200px; padding:10px;}
		#uploadTemp {line-height:normal;background-color:#fff;width:560px;}
		.workImgArea {vertical-align:top;padding:5px;}
		.myDiv {position:relative; top:70px;} 
		.outtermd8 {width:100%; margin-left:3%; margin-right:0}
		.innermd8 {padding-top:8%;padding-right:0; margin-right:0;width:60%}
		.md4 {padding-left:1%;margin-top:2%}
		.commentbox {width:60%;height:20%;}
		.commentarea {margin-top:2%;margin-left:18%;}
		.onecomment {margin-bottom:2%}
		.desarea {}
		.disdes {width:70%;padding:1.3%;margin-bottom:0.5%;font-size:15px;font-family:Microsoft JhengHei;}
		.replyarea {}
		.disreply {width:62%;padding:1.3%;margin-left:8%;border-width:1.5px;border-color:#00BFFF;font-size:15px;font-family:Microsoft JhengHei;background-color:#E0FFFF}
		.cid {width:25%;height:30px;padding-left:2%;padding-top:0.5%;background-color:#00BFFF;font-weight:bold;color:white;border-top-left-radius:10px;border-top-right-radius:10px}
		.commentdiv {margin-top:2.5%;margin-left:12%;}
		.masterreply {width:50%;height:10%}
		.qbtncen {margin-left:21%;padding:1.6%;}
		.bimgwidth {width:87%}
		.popup {width:50%}
		.ratediv {margin-left:10%}
		.ratstardiv {margin-top:1%;margin-left:28%}
		.tagtext {font-size:16px}
		.bdes {font-family:Microsoft JhengHei;width:70%;padding:3%;font-size:17px;margin-top:3%;margin-left:9%}
	</style>
	<jsp:useBean id="mdataVO" class="toolman.mdata.model.MdataVO" scope="session"/>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<div class="myDiv">
<div class="container">
	<div class="row">
		<div class="col-md-8 outtermd8">
			<div class="col-md-8 innermd8">
				<img height="350px" class="img-thumbnail bimgwidth" src='${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}'/>
			</div>
			<div class="col-md-4 md4">
<%-- 				<c:if test="${LoginOK.m_id == mdataVO.m_id}"> --%>
<!--   					修改店家資料按鈕 -->
<!-- 					<a class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span> 編輯店家</a> -->
<%-- 				</c:if> --%>
				<div class="container">
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog" style="width:43%">
						      <!-- Modal content-->
						      
							<form method="post" action="master.do" enctype="multipart/form-data" name="updateform">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">編輯店家資訊</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<table class="table">
											<tr>
												<td>專業證照</td>
												<td><div><img id="m_cer" class="img-thumbnail" width="350px" src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${mdataVO.m_id}"></div>
												<input type="file" name="m_cer" ></td>
											</tr>
											<tr>
												<td>師傅姓名</td>
												<td><input type="text" name="m_name" class="form-control" value="${mdataVO.m_name}"/></td>
											</tr>
											<tr>
												<td>電話</td>
												<td><input type="text" name="m_cel" class="form-control" value="${mdataVO.m_cel}"/></td>
											<tr>
												<td>信箱</td>
												<td><input type="text" name="m_email" class="form-control" value="${mdataVO.m_email}"/></td>
											</tr>
											<tr>
												<td>地址</td>
												<td><span id="twzipcode"></span>
												<input type="text" name="m_addr" class="form-control" value="${mdataVO.m_addr}"/>
												</td>
											</tr>
											<tr>
												<td>維修類別</td>
												<td>
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
												<td>首頁圖片</td>
												<td><div><img id="b_image" width="350px" class="img-thumbnail" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${mdataVO.m_id}"></div>
												<input type="file" name="b_image" ></td>
											</tr>
											<tr>
												<td>店家名稱</td>
												<td><input type="text" name="b_name" class="form-control" value="${mdataVO.b_name}" /></td>
											</tr>
											<tr>
												<td>店家介紹</td>
												<td><textarea name="b_des" class="form-control" rows="8">${mdataVO.b_des}</textarea></td>
											</tr>
										</table>
									</div>
						        </div>
						        <div class="modal-footer">
						        	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
						        	<button type="button" class="btn btn-default" id="updatebtn">送出</button>
						        </div>
									<input type="hidden" name="action" value="updateMaster" >
									<input type="hidden" name="m_city" value="${mdataVO.m_city}" >
									<input type="hidden" name="m_district" value="${mdataVO.m_district}">
									<c:forEach var="aMpro" varStatus="count1" items="${mdataVO.mpros}">
									<div class="prc"><input type="hidden" name="hidpro" value="${aMpro.m_pro}"></div>
								</c:forEach>
						      </div>
							</form>
		</div>
	</div>
	
</div>
				<H3 style="display:inline;vertical-align:top">${mdataVO.b_name}</H3>
				<c:if test="${LoginOK.m_id == mdataVO.m_id}">
					<a href="${pageContext.servletContext.contextPath}/calendarformasterpage/mastercalendar.jsp" class="btn btn-default"><span class="glyphicon glyphicon-calendar"></span> 編輯日曆</a><a class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span> 編輯店家</a>
				</c:if>
				<p></p>
				<p>專業：<c:forEach var="aMpro" items="${mdataVO.mpros}">${aMpro.m_pro} </c:forEach></p>
				<p>師傅：${mdataVO.m_name}</p>
				<p>地區：${mdataVO.m_city} ${mdataVO.m_district}</p>
 <%--------------------------------------最愛與黑單--------------------------------------------------- --%>
     	     	
     	<c:if test="${empty LoginOK}">
     	        		<a href="#" data-toggle="tooltip" data-placement="bottom" title="要登入才能預約師傅">
	          			<button type="button" class="btn btn-primary disabled btn-success" >
	          				<span class="glyphicon glyphicon-earphone"></span>預約師傅
	          			</button>
	          		</a>
          		</c:if>
          		<c:if test="${not empty LoginOK}">
          			<c:if test="${LoginOK.m_id != mdataVO.m_id}">
          			<a href="${pageContext.servletContext.contextPath}/toolman.order/NewOrder.jsp" class="btn btn-success ">
	          			<span class="glyphicon glyphicon-earphone"></span> 預約師傅</a>
	          			
					<a href="${pageContext.servletContext.contextPath}/order/Favorite.do?c_id=${LoginOK.c_id}&m_id=${mdataVO.m_id}&action=addFavorite" class="btn btn-info ">
						<span class="glyphicon glyphicon-heart-empty"></span> 加入最愛
					</a>
	        		<a href="${pageContext.servletContext.contextPath}/order/Dislike.do?c_id=${LoginOK.c_id}&m_id=${mdataVO.m_id}&action=addDislike" class="btn btn-danger">
	          			<span class="glyphicon glyphicon-remove-sign"></span> 加入黑名單
	        		</a>
	        		</c:if>		
	        	</c:if>	
        		
        		     	
        		     	<c:forEach var="empVO" items="${myHate}">
        		
        		
        			<c:if test="${empVO.mdataVO.m_id == mdataVO.m_id && empVO.cdataVO.c_id == LoginOK.c_id}">
        			
        			
        			<div class="alert alert-danger" style="font-size:20px">
    <strong>注意!</strong> 此人是黑名單人物
  </div>
        			</c:if>
        			</c:forEach>
        			<p class="text-center">師傅不可被預約時間</p>
        		<div id='calendar' style="float:left;width:400px; height:100px;"></div>
 <%--------------------------------------萬里長城--------------------------------------------------- --%>
			</div>
		</div>
	</div>
</div> <!--container-->
<div class="container" style="margin-top:7%">
	<br />
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home" class="tagtext">介紹</a></li>
		<li><a data-toggle="tab" href="#menu1" class="tagtext">作品</a></li>
		<li><a data-toggle="tab" href="#menu2" class="tagtext">問與答</a></li>
		<li><a data-toggle="tab" href="#menu3" class="tagtext">評價</a></li>
		<li><a data-toggle="tab" href="#menu4" class="tagtext">媒合紀錄</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<pre class="bdes">${mdataVO.b_des}</pre>
		</div>
		
		<div id="menu1" class="tab-pane fade">
			<c:if test="${LoginOK.m_id == mdataVO.m_id}">
<!-- 				<div id='div1'></div> -->
<!-- 				<form name="myData" action="TestFormData" enctype="multipart/form-data"> -->
<!-- 					<div><input type="file" id="file" name="file[]" multiple="multiple"></div> -->
<!-- 					<div class="workImgArea">作品名稱　<input type="text" name="workname" required></div> -->
<!-- 					<div class="workImgArea">完工日期　<input type="text" name="worktime" required></div> -->
<!-- 					<div class="workImgArea">作品描述　<textarea name="workdes"></textarea></div> -->
<!-- 					<button type="button" id="buttonUpload">上傳</button> -->
<!-- 				</form> -->
				
<!-- 				<button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#workpopup">新增作品</button> -->
				<a class="btn btn-info btn" data-toggle="modal" data-target="#workpopup" style="margin-top:2%">
          			<span class="glyphicon glyphicon-plus"></span> 新增作品
          		</a>
          		
				<div id="workpopup" class="modal fade" role="dialog" style="margin-top:10%">
				  <div class="modal-dialog" style="width:37%">
					<form name="myData" action="TestFormData" enctype="multipart/form-data">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">新增作品集</h4>
					      </div>
					      <div class="modal-body">
					        <div id='div1'></div>
					        
					        <div class="form-group">
								<table class="table">
									<tr>
										<td><input type="file" id="file" name="file[]" class="custom-file-input" multiple="multiple"><span class="custom-file-control"></span></td>
										<td></td>
									</tr>
									<tr>
										<td>作品名稱</td>
										<td><input type="text" class="form-control" name="workname" required></td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td>作品描述</td> -->
<!-- 										<td><textarea name="workdes" class="form-control" id="workdes"></textarea></td> -->
<!-- 									</tr> -->
<!-- 									<div><input type="file" id="file" name="file[]" multiple="multiple"></div> -->
<!-- 									<div class="workImgArea">作品名稱　<input type="text" name="workname" required></div> -->
<!-- 									<div class="workImgArea">作品描述　<textarea name="workdes" id="workdes"></textarea></div> -->
								</table>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
					        <button type="button" class="btn btn-default" id="buttonUpload">上傳</button>
					      </div>
					    </div>
					</form>
				  </div>
				</div>
			</c:if>
			
			<c:if test="${empty mdataVO.works}">
	          	<div class="ratediv">
	          		<h3 style="margin-top:8%; margin-bottom:8%; margin-left:25%">尚無上傳作品</h3>
	          	</div>
          	</c:if>
			
			<div class="modal-dialog">
				<c:forEach var="aWork" items="${mdataVO.works}">
					<div class="modal-content aWork" style="box-shadow:0px 0px 0px; width:160%; margin-left:-30%; margin-top:2%">
						<div class="modal-header">
							<c:if test="${LoginOK.m_id == mdataVO.m_id}">
								<a class="btn btn-danger deleteworkim" id="deleteworkim"><span class="glyphicon glyphicon-trash"></span> 刪除</a>
							</c:if>
							<h4 style="display:inline">${aWork.work_name}</h4>
							<input type="hidden" name="action" value="deleteworkim">
							<input type="hidden" name="work_id" value="${aWork.work_id}">
						</div>
						<div class="modal-body">
							<c:forEach var="a" items="${aWork.workims}">
								<img width="304" height="236" class="img-thumbnail workimsize" src='${pageContext.servletContext.contextPath}/master/master.do?type=work&image=${a.im_id}'/>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
		
		<div id="menu2" class="tab-pane fade">
			<div>
				<div>
					<div id="show"></div>
					<c:if test="${empty mdataVO.discussions}">
						<div class="ratediv">
		          			<h3 style="margin-top:8%; margin-bottom:1%; margin-left:25%">尚無問答記錄</h3>
		          		</div>
					</c:if>
					<c:if test="${not empty LoginOK}">
						<div class="commentarea">
							<div class="form-group">
								<form method="post" action="masterPage.do">
									<label for="comment" style="font-size:16px">提問：</label>
									<textarea class="form-control commentbox" rows="5" cols="50" name="d_des" id="d_des"></textarea>
									<div class="qbtncen"><input type="button" name="question" class="btn btn-info" value="送出">　<input type="reset" class="btn btn-default" value="取消"></div>
								</form>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div id="menu3" class="tab-pane fade">
<!-- 				<div class="ratstardiv"> -->
<%-- 					<input id="input-3" name="input-3" value="${mdataVO.m_arating}" class="rating-loading"> --%>
<!-- 				</div> -->
				
				<div class="ratediv">
					<c:if test="${not empty mdataVO.orders}">
						<table class="table table-hover" style="width:70%">
							<tr>
								<th class="text-center">會員</th>
								<th class="text-center">評分</th>
								<th class="text-center">日期</th>
								<th class="text-center">評價</th>
							</tr>
							<c:forEach var="orderCid" items="${mdataVO.orders}" varStatus="loop">
								<c:if test="${orderCid.s_name == '已完成'}">
									<c:if test="${loop.last}">
										<h3 style="margin-top:1%; margin-bottom:1%; margin-left:25%">共有${loop.count}人評價</h3>
									</c:if>
									<tr>
										<td class="text-center"><a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${orderCid.c_id.c_id}">${orderCid.c_id.c_id}</a></td>
										<td class="text-center">${orderCid.c_rating}顆星</td>
										<td class="text-center">${orderCid.o_edate}</td>
										<td class="text-center" style="width:50%">${orderCid.ca_des}</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${empty mdataVO.orders}">
						<h3 style="margin-top:8%; margin-bottom:8%; margin-left:25%">目前尚無評價</h3>
					</c:if>
				</div>
		</div>
		
		<div id="menu4" class="tab-pane fade">
			
			<div class="ratediv">
				<c:if test="${not empty mdataVO.orders}">
					<table class="table table-hover" style="width:70%">
						<tr>
							<th class="text-center">會員</th>
							<th class="text-center">日期</th>
						</tr>
						<c:forEach var="orderCid" items="${mdataVO.orders}" varStatus="loop">
							<c:if test="${orderCid.s_name == '已完成'}">
								<h3 style="margin-top:3%; margin-bottom:3%; margin-left:23%">
								<c:if test="${loop.last}">
									<h3 style="margin-top:3%; margin-bottom:3%; margin-left:23%">成功媒合人次：${loop.count}人</h3>
								</c:if>
								<tr>
									<td class="text-center"><a href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${orderCid.c_id.c_id}">${orderCid.c_id.c_id}</a></td>
									<td class="text-center">${orderCid.o_edate}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty mdataVO.orders}">
					<h3 style="margin-top:8%; margin-bottom:8%; margin-left:25%">尚無媒合紀錄</h3>
				</c:if>
			</div>

		</div>
	</div>
</div>	
</div>
	<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
<!-- 	<script src="${pageContext.servletContext.contextPath}/calendarformasterpage/cal.js"></script> -->
	<script>
	var data =null;
	var city = $('input[name="o_city"]');
	var district = $('input[name="o_district"]');
//-----------------------Benny Calendar-----------------------------
	//calendar
	var selectmenu=null;
	var dragevent = null;
	var randomnumber =null;
	var eventstart = $(this).data('start');
	var eventend = $(this).data('end');
	var eventidglobe =null;

		var coordinate=null;
		var googlecoordinate=null;
		var o_location=null;
// 		$(function() {
			        /* calendar
		-----------------------------------------------------------------*/
		
// 		$('#external-events2>div').on('click',assignrandom);
		draggableevent();
		showjsonevent();
		buildcalendar();
		/*end  calendar
		-----------------------------------------------------------------*/
		//calendar
// 	});//end ready

	 
	 /*-----------calendar---------*/

// 	 function assignrandom(event){
			
// 			randomnumber = Math.random().toString();//not working after drop, because the real id is still the original
			
// 			eventstart = $(this).data('start');
// 			eventend = $(this).data('end');
			
// 			}
			function draggableevent(){
				//not being used				
				$('#external-events .fc-event').each(function() {			
					$(this).data('event', {						
						id: 'orderevent',
						title: $(this).text(), // use the element's text as the event title
						duration: $(this).data('end'), // an end time (2pm in this example)
					   	
						start: $(this).data('start'), // a start time (10am in this example)
					    stick: true // maintain when user navigates (see docs on the renderEvent method)
					});
			
					// make the event draggable using jQuery UI
					$(this).draggable({		
						zIndex: 999,
						revert: true,      // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
					});
					
				});// end each
			}//end draggable event
			function showjsonevent(){
			 data = $.getJSON('/ToolMan/toolman.calendar/CalendarControllerget.do');
				
			}
			function buildcalendar(){
				
				$('#calendar').fullCalendar({

					buttonText: {
				        today: '今天',
				        month: '月',
				    },


				    allDayText: "全天",
				    weekMode: "variable",
				    monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
				    dayNamesShort: ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
				
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month',
					},
					editable: false,
					timezone:'UTC',
// 					timezone = 'Asia/Taipei',
					droppable: true, // this allows things to be dropped onto the calendar
					eventDrop: function(event, delta, revertFunc) {
							 
						var d = new Date();
							//to alter the time without altering the value of event.start._d
							var ds = new Date(event.start._d).getTime();
							var n = d.getTimezoneOffset()*60*1000;
							var s =new Date(ds+n);
							var datepick = moment(s).format('YYYY-MM-DD-HH:mm:ss');
							var datepick2 = moment(s).format('YYYY-MM-DD');
							$('#datepicker').val(datepick2+event.title);		
							$('#datepickersend').val(datepick);
							
						checkoverlapping(event);
				        alert(event.title + " was dropped on " + event.start.format());
			
				        if (!confirm("Are you sure about this change?")) {
				            revertFunc();
				        }
				        checkoverlapping2();
				    },
					eventDragStop: function(event,jsEvent) {
						
					    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
// 					    if( ( 130<= jsEvent.pageX)  && (jsEvent.pageX <= 230) &&(700 <= jsEvent.pageY)&& (jsEvent.pageY <=840))
					if( ( 1270<= jsEvent.pageX)  || (jsEvent.pageX <= 170) ||(928 <= jsEvent.pageY)|| (jsEvent.pageY <=160)){
					      alert('delete: '+ event.id);
					      $('#calendar').fullCalendar('removeEvents', event.id);
					    }
					},
					drop: function(date,event) {
						
//		 				console.log(event);
// 						assignrandom(event);
						eventidglobe =$(this).data('id');
// 						+randomnumber
						event._id =eventidglobe ;
						event.id=eventidglobe;
						event.eventOverlap = 'false';
						
//		 				event.start= $(this).data('start');
						// is the "remove after drop" checkbox checked?
						
						if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove();
						
						}//end if
					},//end drop
					eventRender:function( event ) {
						// Timezone calculation
// 						console.log(event);
						var d = new Date();
// 						//to alter the time without altering the value of event.start._d
						var ds = new Date(event.start._d).getTime();
						var n = d.getTimezoneOffset()*60*1000;
						var s =new Date(ds+n);
// 						$.fullCalendar.formatDate( event.start._d, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"  ) 
// 						$.fullCalendar.moment(event.start._d);
						//event.start._d and event._start._d is not the same
// 						console.log(s);
// 						console.log(d);
						//send to order form o_bdate

// 						var dt = new Date('2013-03-10T02:00:00Z');    
// 						var dd = dt.getDate();
// 						var mm = dt.getMonth()+1; 
// 						var yyyy = dt.getFullYear();
// 						if(dd<10){
// 						  dd='0'+dd;
// 						  } 
// 						if(mm<10){
// 						    mm='0'+mm;
// 						  } 
// 						var datepick =   yyyy+'-'+mm+'-'+ dd+'-'+event.title;
						//var datepick = s.toString().split(" ");
// 						datepick[3]+datepick[4]+datepick[5]
// 						datepick[1]+datepick[2]+datepick[3]+event.title

						event._start._d = s;
// 						checkoverlapping2(event);
// 						console.log(event.start._d);
// 						console.log(event._start._d);
// 						console.log(event);
					},
					eventReceive:function( event ) {
						 var d = new Date();
							//to alter the time without altering the value of event.start._d
							var ds = new Date(event.start._d).getTime();
							var n = d.getTimezoneOffset()*60*1000;
							var s =new Date(ds+n);
							var datepick = moment(s).format('YYYY-MM-DD-HH:mm:ss');
							var datepick2 = moment(s).format('YYYY-MM-DD');
							$('#datepicker').val(datepick2+event.title);		
							$('#datepickersend').val(datepick)
						event._id = eventidglobe;
						event.id = eventidglobe;
// 						console.log(event);
//		 				var randomnumber =Math.random().toString();//not working after drop, because the real id is still the original
						
						$(this).attr('data-id',$(this).data('id')+randomnumber);
						checkoverlapping(event); 
						
						},
					eventSources: [
		                    {
		                    	url:'/ToolMan/toolman.calendar/CalendarControllerget.do',		                        
									

		                    }                    
		                ],
						
						
				});// end full calendar
			}//end create calendar
			
			function checkoverlapping(event){// no event can exists twice in 1 day, and no event can be added under all day unavailable
				
				var events = $('#calendar').fullCalendar('clientEvents');
				
// 					var d = new Date();
// 					var ds = new Date(event.start._d).getTime();
// 					var n = d.getTimezoneOffset()*60*1000;
// 					d=new Date(ds+n);
// 					console.log(ds+n);
// 					console.log(d);
// 					event.start._d = d;
// 					event._start._d = d;
// 					console.log(event.start._d);
// 					console.log(event._start._d);
// 					console.log(event);
				if(events.length>1){
					
				for(i=0;i<events.length-1;i++){
				// start-time in between any of the events
					var k=0;
					var eventid1 = event.id;
					var eventid2 = event._id;
					
					var eventitle = event.title;
					var eventitle2 = events[i].title;
					var end1 = event.end._d;
					var start1 = event._start._d.toString();
					var start2 = events[i]._start._d.toString();
// 					console.log(start1);
					var end2 = events[i].end._d;
					var start4 = events[i].duration;
					var splitstring1 = start1.split(" ");
// 					console.log(splitstring1);
					
					var splitstring2 = start2.split(" ");
					
// 					console.log(splitstring2);
					//remove last event
					if(events[i].id=='orderevent'){
						k=k+1;
						if(k==1){
							events[i].id='lastevent';
							events[i]._id='lastevent';
							console.log(event);
							//the id removed is event._id, not event.id in this case 
							$('#calendar').fullCalendar('removeEvents', 'lastevent');
						}
					}
					
					
					if((events[i].title == "整天")||(event.title =="整天")){
						if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3])==
							(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3])){
				// I can remove with event.id because i have already given .id and ._id to the same value
								$('#calendar').fullCalendar('removeEvents', event.id);
								return true;
								
							}//end for
						}//end if
						
					else if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3]+splitstring1[4])==
						(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3]+splitstring2[4])){
				// I can remove with event.id because i have already given .id and ._id to the same value
							$('#calendar').fullCalendar('removeEvents', eventid1);
						    return true;	
						}//end if
//-----------------------End Benny Calendar-----------------------------						
					
				}//end for 
				//end-time in between any of the events
//		 		if(event.start > events[i].start && event.start < events[i].end){
//		 			$('#calendar').fullCalendar('removeEvents', event.id);
//		 		    return true;
//		 		}
//		 		//any of the events in between/on the start-time and end-time
//		 		if(event.start <= events[i].start && event.start >= events[i].end){
//		 			$('#calendar').fullCalendar('removeEvents', event.id);
//		 		    return true;
//		 		}
			  }//end if event!=0
			}
			//for checkbox
			$('#input-3').rating({displayOnly: true, step: 0.5});
	
			//編輯店家
			var pro = $('input[name="m_pro"]');
			
			$('#updatebtn').click(function(){
				
				var updatedata = $('form[name="updateform"]').serializeArray();
				var cerpho = $('input[name="m_cer"]')[0].files;
				var bpho = $('input[name="b_image"]')[0].files;
				var formData = new FormData();
				
				$.each(updatedata, function(index, input) {
					formData.append(input.name, input.value);
					console.log('name: ' + input.name);
					console.log('value: ' + input.value);
				});
				
				formData.append('m_cer', cerpho[0]);
				formData.append('b_image', bpho[0]);
				
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
			
			
			$('input[name="m_cer"]').on('change', function(event) {
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#m_cer').attr({
							'src' : e.target.result,
						});
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
			
			$('input[name="b_image"]').on('change', function(event) {
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#b_image').attr({
							'src' : e.target.result,
						});
					}
					reader.readAsDataURL(this.files[0]);
				}
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
								var replybtn = $('<input />').addClass('btn btn-success').attr({'type':'button','name':'replybtn','value':'回覆'});
								var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'4'});
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
									var replybtn = $('<input />').addClass('btn btn-success').attr({'type':'button','name':'replybtn','value':'回覆'});
									var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'4'});
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
									var replybtn = $('<input />').addClass('btn btn-success').attr({'type':'button','name':'replybtn','value':'回覆'});
									var reply = $('<textarea></textarea>').addClass('form-control masterreply').attr({'name':'reply','id':'reply','rows':'4'});
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
			var workname = $('input[name="workname"]');
			var workdes = $('#workdes');
			
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
			
			//預覽圖片
			function preview(input) {
	
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#img0').attr({
							'src' : e.target.result,
							'class' : 'img-thumbnail',
							'width' : '210px'
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
							'class' : 'img-thumbnail',
							'width' : '210px'
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
							'class' : 'img-thumbnail',
							'width' : '210px'
						});
					}
					reader.readAsDataURL(input.files[2]);
				} else {
					$('#img2').remove();
				}
			}
			
			//上傳作品圖片
			btn.on('click',function() {
	
				var others = $('form[name="myData"]').serializeArray();
				var photos = $('input[name="file[]"]')[0].files;
	
				var formData = new FormData();
	
				$.each(others, function(index, input) {
					formData.append(input.name, input.value);
					console.log('name: ' + input.name);
					console.log('value: ' + input.value);
				});
	
				for (var i = 0; i < photos.length; i++) {
					formData.append('file' + i, photos[i]);
					console.log(photos[i]);
				}
				
				formData.append('action','uploadwork');
				
				$.ajax({
					url : 'master.do',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					type : 'POST',
		 			success : function(reutrnData) {
						$('#img0').removeAttr('src').removeAttr('class').removeAttr('width');
						$('#img1').removeAttr('src').removeAttr('class').removeAttr('width');
						$('#img2').removeAttr('src').removeAttr('class').removeAttr('width');
						myDiv.find('#loading').remove();
// 						$('.workdiv').empty();
// 		 				alert(reutrnData);
// 						var successImg = $('<img />').attr('src','${pageContext.servletContext.contextPath}/image/jake.gif');
// 						myDiv.append(successImg);
						upload.val(null);
						workname.val(null);
						workdes.val(null);
// 						location.reload();
						myDiv.html('<div class="alert alert-success" role="alert" id="alertupload"><strong>新增作品成功！請重新回到<a href="${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${LoginOK.m_id}" class="alert-link" style="color:#00BFFF;">我的店家</a></strong></div>');
// 						
// 						$('.workdiv').empty();
						
// 						var works = [<c:forEach var="aWork" items="${mdataVO.works}">{"work_name":"${aWork.work_name}","work_des":"${aWork.work_des}","im_id":[<c:forEach var="a" items="${aWork.workims}">${a.im_id},</c:forEach>]},</c:forEach>];
						
// 						var docFragment = $(document.createDocumentFragment());
// 						$.each(works,function(key,val) {
// 							console.log(val.work_name);
// 							console.log(val.work_des);
// 							var work_name = val.work_name;
// 							var work_des = val.work_des;
// //		 					var dbtn = $('button').attr({'type':'button','id':'deleteworkim'}).addClass('btn').addClass('btn-danger').addClass('deleteworkim');
// 							var td = $('<td></td>').addClass('aWork');
// 							if (val.im_id.length != 'undefined' || val.im_id.length != null) {
// 								for (var i = 0; i < val.im_id.length; i++) {
// 									console.log(val.im_id[i]);
// 									var img = $('<img />').attr('src','${pageContext.servletContext.contextPath}/master/master.do?type=work&image='+val.im_id[i]);
// 									td.append(img);
// 								}
// 							}
// 							var tr = $('<tr></tr>').append(td);
// 							var table = $('<table></table>').addClass('table worktable').append(tr);
// 							var div = $('<div></div>').append(table);
// 							docFragment.append(div);
// 						});
// 						$('.workdiv').append(docFragment);
		 			},
		 			beforeSend : function() {
		 			},
		 			complete : function() {
		 			}
		 			
				});
			});
			
			
// 			var works = [<c:forEach var="aWork" items="${mdataVO.works}">{"work_name":"${aWork.work_name}","work_des":"${aWork.work_des}","im_id":[<c:forEach var="a" items="${aWork.workims}">${a.im_id},</c:forEach>]},</c:forEach>];

// 			$.each(works,function(key,val) {
// 				console.log(val.work_name);
// 				console.log(val.work_des);
// 				var work_name = val.work_name;
// 				var work_des = val.work_des;
				
// 				if (val.im_id.length != 'undefined' || val.im_id.length != null) {
// 					for (var i = 0; i < val.im_id.length; i++) {
// 						console.log(val.im_id[i]);
// 					}
// 				}
// 			});
			
			
			//刪除作品
			var deleteworkimbtn = $('.deleteworkim');
			deleteworkimbtn.click(function() {
				var tdparent = $(this).parents('.aWork');
				var workid = tdparent.find('input[name="work_id"]');
				console.log(workid.val());
				$.ajax({
					url : 'master.do',
					data: {'work_id':workid.val(),'action':'deleteworkim'},
					type : 'POST',
					success : function(returnData) {
						tdparent.remove();
					}
				});
			});
			
			
			
			var city = $('input[name="m_city"]');
			var district = $('input[name="m_district"]');

			$('#twzipcode').twzipcode({
				'css': ['form-control zip', 'form-control zip', 'zipcode'],
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