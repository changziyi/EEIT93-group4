<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--full calendar-->
	<link rel='stylesheet' href='../js/fullcalendar.min.css' />
	<script src='${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/moment.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/fullcalendar.min.js'></script>
<!--full calendar-->
<!------------------------------  jquery  -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css">
<!-- ----------------------------- jquery -->
<!-- ----------------------bootstrap -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap.min.css" >
	<!-- Optional theme -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap-theme.min.css" >
	<!-- Latest compiled and minified JavaScript -->
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js" ></script>
<!---- --------------------bootstrap -->
<!-- --------------------smart_wizard -->
    <link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_circles.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_dots.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard.min.css" rel="stylesheet" type="text/css" /> 
	<link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_arrows.min.css" rel="stylesheet" type="text/css" />
<!------------------------ smart_wizard -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<!-------------------------- smart_wizard -->
<!--------------------- twzipcode -->
<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
<!---------------------end twzipcode -->

<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>

<!-- login please -->
<!---------------------nav----------------------------------- -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
<!---------------------end nav----------------------------------- -->
	<style>
/*------------twzipcode hide zipcode--------------------------------*/	
.zipcode {
		display: none;
	}
	.county {
/*     background-color: #4169E1; */
/*     color: #fff; */
     height:25px; 
}
.district {
/*     background-color: #008000; */
/*     color: #fff; */
    height:25px;
}
/*------------end twzipcode hide zipcode--------------------------------*/		

	
/* calendar */
		body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1500px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 300px;
		height:500px;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
	.repeatingevent {
 		float: left; 
 		width: 100px;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}

		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
		float: right;
		width: 900px;
	}
	.trashcan {
	
		margin:100px;
		width:900px
		border: 1px solid #ccc;

	}
	

		#map{
		height:100px;
		width:100px;
	}
	.containerstyle{
		text-align:center;
		width:800px;
		margin:auto;
		horizontal-align:center;
/* 		border:1px solid blue; */
	}
	.stepstyle{
		text-align:center;
		width:800px;
		margin:auto;
		display:table;
	}
	.table{
	text-align:center;
	 vertical-align:middle;
	}
	#ordertable tbody tr td{
	width:500px;
	text-align:right;
	 vertical-align:middle;
	margin:0px;
	} 
	.putmiddle{
		margin:0 auto;
		display:table;

	}
	.inputstyle{
		width:200px;
		float:left;
	}
	.errormsg{
		width:150px;
		float:left;
	}
	.textstyle{
		font-family: Arial, "Microsoft Jhenghei",  
		"WenQuanYi Zen Hei", "儷黑 Pro", 
		"LiHei Pro","文泉驛正黑", 
		"Microsoft JhengHei", 
		"DFKai-sb", DFKai-SB, 
		sans-serif;
	}
	.labelstyle{
		text-align:right;
	}
	.fc-event{
		width:100px;
		display:table;
		margin:auto;
		
	}

	</style>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<title>預約師傅</title>
	
	<jsp:useBean id="mdataVO" class="toolman.mdata.model.MdataVO" scope="session"/>
	<!-- retrieve MdataVO object from session-->

</head>
<body>

<!-------------------------nav------------------------------------->
<jsp:include page="/nav/navigation.jsp" />
<!---------------------end nav------------------------------------->

<!----------------------------------- smart wizard head----------------------------- -->
        <br />
        <div class="container containerstyle textstyle putmiddle">
        <!-- SmartWizard html -->
     
        <div id="smartwizard">
            <ul class="stepstyle textstyle">
            	<li><a href="#step-1" style="white-space: nowrap">步驟一<br /><small>建立預約日程</small></a></li>
                <li><a href="#step-2">步驟一<br /><small>填寫申請表</small></a></li>
                <li><a href="#step-3">步驟三<br /><small>送出審核</small></a></li>
                
            </ul>
      
         <div>
        	 <!--  step1  -->
         <div id="step-1" class="">
  <!--------------------------------calendar---------------------------------->  
        <div id='wrap'>
			<!-- draggable -->
		<div id='external-events'  style="width:200px;height:210px;margin-top:46px;margin-left:13%;">
			<h4 style="margin-left:20%;">預約時間</h4>
			<div id='external-events2' style="margin-left:20%;text-align:center;margin:auto;display:table">
				<div class='fc-event' data-id="orderevent"data-start="01:00" data-end='08:00'>早上</div>
				<div class='fc-event' data-id="orderevent"data-start="12:00" data-end='06:00'>下午</div>
				<div class='fc-event' data-id="orderevent"data-start="18:00" data-end='06:00'>晚上</div>
				<div class='fc-event' id="allday" data-id="orderevent"data-start="00:00" data-end='24:00'>整天</div>
				
			</div>
		<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove' /> -->
<!-- 				<label for='drop-remove'>remove after drop</label> -->
<!-- 			</p> -->
	
			
		</div>


		<div id='calendar' style="float:left;width:800px;"></div>
<!--------------------------------end calendar---------------------------------->
		<div style='clear:both'></div>
	</div>
                <form class="form-inline">
				            <div class="btn-group navbar-btn" role="group" style="text-align:center;margin:auto;display:table">
				                <button class="btn btn-default" id="prev-btn1" type="button" disabled>上一步</button>
				                <button class="btn btn-default" id="next-btn1" type="button">下一步</button>
				            </div>
				        </form>
                
                </div>	
     		<!--  step1  -->
     		<!--  step2  -->
     	
                <div id="step-2" class="">
                    <form id="bookform"name="orderform" role="form" action="OrderController.do" class="form-inline">
						<div class="panel panel-default">
							<div class="panel-heading">預約表</div>
								<table id="ordertable"class="table">
                        		

							<thead>

							</thead>
							<tbody>
									<tr>
										<td>
										
											<label class="labelstyle">服務公司名稱:</label>
										</td>
										<td>
											<div style="float:left;>
												<span class="inputstyle" ">${mdataVO.b_name}</span>
										<!--  for test <span>TOOL KING</span>  -->
											</div>
										</td>
									</tr>
									<tr>
										<td>
											
											<label class="labelstyle">服務類別</label>
											
										</td>
										<td style="text-align:left;">
										

										<c:forEach var="oproset"  varStatus="stat" items="${mdataVO.mpros}">
												<div id="pro" name="opro_id" class="checkbox-inline" style="border:1px solid blud;float:left">
													<label><input type="checkbox"  style=" border:1px solid blue;" value=${oproset.m_pro} checked="checked" name="o_pro">${oproset.m_pro}</label>
												</div>			
										</c:forEach>

										<span class="errormsg" value=${errormsg.erroro_pro}>${errormsg.erroro_pro}</span>
										
										</td>
									</tr>
									<tr>
										<td>
											
												<label class="labelstyle">預約日期</label>
										</td>
										<td>
											<div id="datecalendar" >																							
												<input type="text" class="inputstyle" id="datepicker"  value="${orderVO.o_bdate}">
<%-- 												<input type="text" class="inputstyle" id="datepickersend" name="o_bdate" value="${orderVO.o_bdate}"> --%>
												
												<!-- 放jQuery的calendar -->
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<label class="labelstyle" >維修項目說明</label><!-- 	ok -->
										</td>
		
										<td>	
											<textarea   Style="width:200px;float:left;height:50px;" name="o_des" maxlength="50"></textarea>
											<span class="errormsg" value=${errormsg.erroro_des}>${errormsg.erroro_des}</span>
										</td>
									</tr>
									<tr>
										<td>
											
											<label class="labelstyle" style="padding:12px;">未回應請求失效時間</label>
										</td>
										<td style="">
											<div style="width: 500px;"  >
												<label class="radio-inline"style="float:left"><input type="radio"  name="req_exp" value="300000" checked="checked">3分鐘</label>
												<label class="radio-inline" style="float:left"><input type="radio" name="req_exp" value="3600000" >1小時</label>
												<label class="radio-inline" style="float:left"><input type="radio" name="req_exp" value="2400000" >2小時</label>
												<label class="radio-inline" style="float:left"><input type="radio" name="req_exp" value="86400000">1天</label>
												<label class="radio-inline" style="float:left"><input type="radio" name="req_exp" value="172800000">2天</label>
												<label class="radio-inline" style="float:left"><input type="radio" name="req_exp" value="604800000">一週</label>
											</div>
											<span class="errormsg"  value=${errormsg.erroro_des}>${errormsg.errorreq_exp}</span>
										</td>
									</tr>
									<tr>	
										<td>																
										
											<label class="labelstyle">建築物型態</label>	
										</td>
										<td>	
											<div>
											    <select class="inputstyle" name="h_type" value=${orderVO.h_type}>
												    <option value="公寓" selected="selected">公寓</option>
												    <option value="大廈">大廈</option>
												    <option value="透天">透天</option>
												    <option value="一樓">一樓</option>
												    <option value="平房">平房</option>
											    </select>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											
												<label class="labelstyle">施工地址</label><!-- 	ok -->
										</td>
										<td>
										<span id="twzipcode" style="float:left;"></span>
											<div>
<!-- ----------------------------------------------------addrlist is from ordercontroller ------------------------------------------------------------>
												<input type="hidden" class="inputstyle" style="width:100px;" id=" o_city" name="o_city" value=${addrlist.o_city}/>
												<input type="hidden" class="inputstyle" style="width:100px;" id="o_district" name="o_district" value=${addrlist.o_district}/>
												<input type="text" class="inputstyle"   id="o_addr" name="o_addr" style="height:25px;" value=${addrlist.o_addr}>
												<span class="errormsg"  value=${errormsg.erroro_location}>${errormsg.erroro_location}</span>
											</div>
										</td>
										</tr>
<!-- 									<tr> -->
<!-- 										<td> -->
<!-- 											<div id='map'></div> -->
<!-- 										</td> -->
<!-- 									</tr>	 -->
									<tr>
										<td>
										
											<label class="labelstyle">備註</label><!-- 	ok -->
										</td>
										<td>
												<div>
													<textarea Style="width:200px;float:left;height:50px;" name="o_note" maxlength="100"></textarea>
												</div>
												<span class="errormsg" value=${errormsg.erroro_note}></span>
										</td>
									</tr>	
										<input type="hidden" name="action" value="insert"/>
<!-- 									<input type="submit"  value="submit"/> -->
								</tbody>
								
						</table>
						</div>
					</form>
						<form class="form-inline">
				            <div class="btn-group navbar-btn" role="group" style="text-align:center;margin:auto;display:table">
				                <button class="btn btn-default" id="prev-btn" type="button">上一步</button>
				                <button class="btn btn-default" id="next-btn" type="button" disabled>下一步</button>
				                <button class="btn btn-danger" id="reset-btn" type="button">確認送出</button>
				            </div>
				        </form>
                  </div> 
              <!--  step2  --> 
               <!--  step3  -->    
		              
			<!--  step3  --> 
			
          <div id="step-3" class=""></div>
                    
      </div>
  </div>
 </div>    
 
	<!-- smart wizard head -->



<!-- 	<script -->
<!-- 	  src="https://code.jquery.com/jquery-3.2.1.min.js" -->
<!-- 	  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" -->
<!-- 	  crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script>
var data =null;
var city = $('input[name="o_city"]');
var district = $('input[name="o_district"]');
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
	
	$( function() {
        /* calendar
		-----------------------------------------------------------------*/
		$('#submitcalendar').on('click',calendarsubmit);
// 		$('#external-events2>div').on('click',assignrandom);
		draggableevent();
		showjsonevent();
		buildcalendar();
		/*end  calendar
		-----------------------------------------------------------------*/
		/* twzipcode
		-----------------------------------------------------------------*/
		$('#twzipcode').twzipcode({
		'css': ['county', 'district', 'zipcode'],
// 		zipcodeIntoDistrict:true,
		//addrlist is from ordercontroller
		'countySel'   : '${addrlist.o_city}',
	    'districtSel' : '${addrlist.o_district}',
	    'onCountySelect': function () {
	    	city.attr("value", this.value);
	 	   },
		'onDistrictSelect': function () {
			district.attr("value", this.value);
	    	}
		});
		/*end  twzipcode
		-----------------------------------------------------------------*/
		//jqueryUI datepicker
// 	    $( "#datepicker" ).datepicker();
	    
	    //google map
// 	    googlecoordinate = 'https://maps.googleapis.com/maps/api/geocode/json?'
	   
// 	    $('#o_addr').on('blur',getCoordinate);	
	    
	      
	            // Smart Wizard events
            $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
                
            });
            
            // This event should initialize before initializing smartWizard
            // Otherwise this event wont load on first page load 
            $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection, stepPosition) {
                $("#message-box").append(" > <strong>showStep</strong> called on " + stepNumber + ". Direction: " + stepDirection+ ". Position: " + stepPosition);
            });
            
            $("#smartwizard").on("beginReset", function(e) {
                $("#message-box").append("<br /> > <strong>beginReset</strong> called");
            });
            
            $("#smartwizard").on("endReset", function(e) {
                $("#message-box").append(" > <strong>endReset</strong> called");
            });  
            
            $("#smartwizard").on("themeChanged", function(e, theme) {
                $("#message-box").append("<br /> > <strong>themeChanged</strong> called. New theme: " + theme);
            });
            
            // Toolbar extra buttons
            
//               var btnsubmit = $('<button></button>').text('提交')
// 	            	.addClass('btn btn-danger')
// 	            	.on('click', function(){ $('#bookform').submit(); });                         
  
            // Smart Wizard initialize
            $('#smartwizard').smartWizard({ 
                    selected: 0, 
                    theme: 'circles',
                    transitionEffect:'fade',
                    anchorSettings:{
                    	removeDoneStepOnNavigateBack:true,
                    },
                    toolbarSettings: {
						
						showPreviousButton:false,
                    	showNextButton:false,                 
//                       toolbarExtraButtons: [btnsubmit]
                                    },
                 });           
            
            // External Button Events

            
            $("#prev-btn1").on("click", function() {
                // Navigate previous
                $('#smartwizard').smartWizard("prev");
                return true;
            });
            
            $("#next-btn1").on("click", function() {
                // Navigate next
                $('#smartwizard').smartWizard("next");
                
                
                return true;
            });
            
            $("#reset-btn").on('click', function(){ $('#bookform').submit(); }); 
            
            $("#prev-btn").on("click", function() {
                // Navigate previous
                $('#smartwizard').smartWizard("prev");
                return true;
            });
            
            $("#next-btn").on("click", function() {
                // Navigate next
                $('#smartwizard').smartWizard("next");
                return true;
            });
            $("#theme_selector1").on("change", function() {
                // Change theme
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            })
            $("#theme_selector").on("change", function() {
                // Change theme
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            })
 
		//calendar
	});//end ready

// 	function getCoordinate(){
// 		var a1 = $('#o_city').val();
// 		var a2 = $('#o_district').val();
// 		var a3 = $('#o_addr').val();
// 		o_location =a1+a2+a3;
// 		$.getJSON(googlecoordinate,{'address':o_location},function(data){
// 			for(var i=0;i<data.results.length;i++) {
// 		        var location = data.results[i].geometry.location;
// 		        alert(location);
// 		        }
// 		//data 就是server端回傳的結果
// 		coordinate = location;
// 		initMap();
// 			});
// // 		
				
// 	}
// 	 function initMap() {
// 		 var uluru =null;
// 	        if(coordinate==null){ 
// 	        	uluru={ "lat" : 25.0339639, "lng" : 121.5644722}
// 	        }
// 	        else{
// 	        	uluru = coordinate;
// 	        }           
	            
// 	        var map = new google.maps.Map(document.getElementById('map'), {
// 	          zoom: 15,
// 	          center: uluru
// 	        });
// 	        var marker = new google.maps.Marker({
// 	          position: uluru,
// 	          map: map
// 	        });
// 	 	}
	 
	 /*-----------calendar---------*/
function calendarsubmit(){
	
	var calendarjson = JSON.stringify($("#calendar").fullCalendar("clientEvents").map(function(e) {
	    var rv = {};
	    Object.keys(e)
	        .filter(function(k) {
	            return k != "source" && !k.startsWith("_");
	         })
	        .forEach(function(k) {
	            rv[k] = e[k];
	        });
	    return rv;
	}));
	console.log(calendarjson);
// 	console.log(rv);
		console.log($('#calendar').fullCalendar('clientEvents').toString());
// 		console.log(calendarjson);
		$.post('${pageContext.servletContext.contextPath}/toolman.calendar/CalendarController.do',{'calendarjson':calendarjson}, function(data){
			alert("ok");
		 });//end post
		
	}//end calendarsubmit
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
			 data = $.getJSON('${pageContext.servletContext.contextPath}/toolman.calendar/CalendarControllerget.do');
				
			}
			function buildcalendar(){
				
				$('#calendar').fullCalendar({
					
				
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					editable: true,
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
							console.log("datepick="+datepick);
						checkoverlapping(event);
				        alert(event.title + " was dropped on " + event.start.format());
			
				        if (!confirm("Are you sure about this change?")) {
				            revertFunc();
				        }
				        checkoverlapping2();
				    },
					eventDragStop: function(event,jsEvent) {
						
// 					    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
// 					    if( ( 130<= jsEvent.pageX)  && (jsEvent.pageX <= 230) &&(700 <= jsEvent.pageY)&& (jsEvent.pageY <=840))
					    if( ( 1300<= jsEvent.pageX)  || (jsEvent.pageX <= 370) ||(780 <= jsEvent.pageY)|| (jsEvent.pageY <=130)){
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
		                    	url:'${pageContext.servletContext.contextPath}/toolman.calendar/CalendarControllerget.do',		                        
									

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
	
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"></script> -->
  
	<script type="text/javascript" src="../js/smartform/jquery.smartWizard.min.js"></script>	
	
  

</body>
</html>