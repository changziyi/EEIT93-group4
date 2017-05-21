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

<!--  jquery ui -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css"><!--  jquery -->
<!-- bootstrap -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap.min.css" >
	<!-- Optional theme -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap-theme.min.css" >	<!-- Latest compiled and minified JavaScript -->
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js" ></script>
<!-- bootstrap -->
<!-- smart_wizard -->
    <link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_circles.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_dots.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard.min.css" rel="stylesheet" type="text/css" /> 
	<link href="${pageContext.servletContext.contextPath}/js/smartform/smart_wizard_theme_arrows.min.css" rel="stylesheet" type="text/css" />
<!-- smart_wizard -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<!-- smart_wizard -->




<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>

<!-- login please -->
	
	<style>
	
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
	
/* calendar */	
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
	.repeattable tr td{
		width:100px;
		margin-left:30px;
		border:1px solid blue;
		text-align:center;
	}
	.repeattable tr:nth-child(even){
		background-color:#EFF5FB;
	}
	.repeattable tr:nth-child(odd){
		background-color:#4E79D5;
		color:white;
	}
	</style>

	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css">
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
		<div id='external-events'  style=" border:1px solid blue;width:200px;margin-top:46px;margin-left:13%;">
			<h4 style="margin-left:30%;">預約時間</h4>
			<div id='external-events2' style="margin-left:25%;text-align:center">
				<div class='fc-event' style="background-color:#C6E8EA" data-color="#C6E8EA" data-id="morning"data-start="01:00" data-end='08:00'>早上</div>
				<div class='fc-event' style="background-color:#48AE59" data-color="#48AE59" data-id="noon"data-start="12:00" data-end='06:00'>下午</div>
				<div class='fc-event' style="background-color:#7BAFF8" data-color="#7BAFF8" data-id="night"data-start="18:00" data-end='06:00'>晚上</div>
				<div class='fc-event' style="background-color:#A5B4B5" data-color="#A5B4B5" id="alldayevent" data-id="allday"data-start="00:00" data-end='24:00'>整天</div>
				
			</div>
		<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove' /> -->
<!-- 				<label for='drop-remove'>remove after drop</label> -->
<!-- 			</p> -->
	
			<div class='.repeatingevent'id="selectmenu" style="margin-left:1.5%;"> 
				<table id="repeattable" class="repeattable"style="border-collapse: collapse; display: inline; ">
<!-- 				beware that value is for dow, so it must be plain number-->
					<tr><td colspan="3" style="text-align:center">每週一不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="1" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="1" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight" value="1" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="1" >整天</td></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週二不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning"value="2" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon"value="2" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight"value="2" >晚上</td>
<!-- 					<td><input type="checkbox" name="repeatingbox"value="2" >整天</td></tr></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週三不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="3" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="3" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight" value="3" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="3" >整天</td></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週四不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="4" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="4" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight" value="4" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="4" >整天</td></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週五不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="5" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="5" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight" value="5" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="5" >整天</td></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週六不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="6" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="6" >下午</td>
					<td><input type="checkbox" name="repeatingboxnight" value="6" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="6" >整天</td></tr> -->
					
					<tr><td colspan="3" style="text-align:center">每週日不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="0" >早上</td>
					<td><input type="checkbox" name="repeatingboxnoon" value="0" >下午</td>
					</td><td><input type="checkbox" name="repeatingboxnight" value="0" >晚上</td></tr>
<!-- 					<td><input type="checkbox" name="repeatingbox" value="0" >整天</td></tr> -->
					
				</table>
			</div>
		</div>


		<div id='calendar' style="float:left;width:800px;"></div>
<!--------------------------------end calendar---------------------------------->
		<div style='clear:both'></div>
	</div>
                <form class="form-inline" style="display:table;margin:auto">
				             <div class="form-group" >
				              <label >Choose Theme:</label>
				              <select id="theme_selector1" class="form-control">
				                    <option value="default">default</option>
				                    <option value="arrows">arrows</option>
				                    <option value="circles">circles</option>
				                    <option value="dots">dots</option>
				              </select>
				            </div>           
				            
				            <label>External Buttons:</label>
				            <div class="btn-group navbar-btn" role="group">
				                <button class="btn btn-default" id="prev-btn1" type="button" disabled>上一步</button>
				                <button class="btn btn-default" id="next-btn1" type="button">下一步</button>
				                <button class="btn btn-primary" id="submitcalendar" type="button">完成日程表</button>
				            </div>
				        </form>
                
                </div>	
     		<!--  step1  -->
     		<!--  step2  -->
     	
                <div id="step-2" class="">

						<form class="form-inline">
				             <div class="form-group" >
				              <label >Choose Theme:</label>
				              <select id="theme_selector" class="form-control">
				                    <option value="default">default</option>
				                    <option value="arrows">arrows</option>
				                    <option value="circles">circles</option>
				                    <option value="dots">dots</option>
				              </select>
				            </div>           
				            
				            <label>External Buttons:</label>
				            <div class="btn-group navbar-btn" role="group">
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
	<script src='${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.js'></script>
	
<script>
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
		$('#external-events2>div').on('click',assignrandom);
		draggableevent();
		$('input[name="repeatingboxmorning"]').on('change',repeatingeventmorning);// end select change
		$('input[name="repeatingboxnoon"]').on('change',repeatingeventnoon);// end select change
		$('input[name="repeatingboxnight"]').on('change',repeatingeventnight);// end select change
		buildcalendar();
		/* calendar
		-----------------------------------------------------------------*/

	    $( "#datepicker" ).datepicker();
	    
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
// 	 		var cache = [];
// 	 		var calendarobj=$('#calendar').fullCalendar('clientEvents')
// 	 		var calendarjson = JSON.stringify(calendarobj, function(key, value) {
// 	 		    if (typeof value === 'calendarobj' && value !== null) {
// 	 		        if (cache.indexOf(value) !== -1) {
// 	 		            // Circular reference found, discard key
// 	 		            return;
// 	 		        }
// 	 		        // Store value in our collection
// 	 		        cache.push(value);
// 	 		    }
// 	 		    return value;
// 	 		});
	 		// Enable garbage collection
// 		var calendarjson = JSON.stringify($('#calendar').fullCalendar('clientEvents'));
	
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
	 function assignrandom(event){
			
			randomnumber = Math.random().toString();//not working after drop, because the real id is still the original
			
			eventstart = $(this).data('start');
			eventend = $(this).data('end');
			
			}
			function draggableevent(){
				//not being used
// 				$('#alldayevent').each(function() {
					
					
// 					// 		var dragevent = {
									
// 					// 				id: $(this).text(),	
// 					// 				title: $(this).text(), // use the element's text as the event title
// 					// 				start: $(this).data('start'), // a start time (10am in this example)
// 					// 				time: $(this).data('endd'), // an end time (2pm in this example)
// 					// 			    stick: true
// 					// 		}
// 							// store data so the calendar knows to render an event upon drop
					
// 							$(this).data('events', [{
								
// 								id: 'morning',
// 								title: '早上', // use the element's text as the event title
// 								duration: '09:00', // an end time (2pm in this example)
// 								start:'01:00', // a start time (10am in this example)
// 							    stick: true // maintain when user navigates (see docs on the renderEvent method)
// 							},
// {
								
// 								id: 'noon',
// 								title: '下午', // use the element's text as the event title
// 								duration: '06:00', // an end time (2pm in this example)
// 								start: '12:00', // a start time (10am in this example)
// 							    stick: true // maintain when user navigates (see docs on the renderEvent method)
// 							},{
// 								id: 'night',
// 								title: '晚上', // use the element's text as the event title
// 								duration: '06:00', // an end time (2pm in this example)
// 								start: '18:00', // a start time (10am in this example)
// 							    stick: true // maintain when user navigates (see docs on the renderEvent method)
// 							}]);
					
// 							// make the event draggable using jQuery UI
// 							$(this).draggable({		
// 								zIndex: 999,
// 								revert: true,      // will cause the event to go back to its
// 								revertDuration: 0  //  original position after the drag
// 							});
							
// 						});
				
				$('#external-events .fc-event').each(function() {

			
					$(this).data('event', {
						
						id: $(this).data('id'),
						title: $(this).text(), // use the element's text as the event title
						duration: $(this).data('end'), // an end time (2pm in this example)
					   	color:$(this).data('color'),
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
			// i don't want to add another judgment for allday event
// 			function repeatingevent(){
// 				$('#calendar').fullCalendar( 'removeEvents', 'repeateventeveryallday');
				
// 				selectmenu = [];
// 				var checkedbox = $('input[name="repeatingbox"]:checked');
// 				checkedbox.each(function () {
// 					selectmenu.push($(this).val());
// 				});//end each
// // 		 		console.log(checkedbox);
// //		 		console.log(selectmenu);
// 				var repeateventallday = [{
// 					//means delete all repeating items and rebuild new ones
// 					id:"repeateventeveryallday",
// 				    title:"早上",
// 				    start: '01:00', // a start time (10am in this example)				
// 				    overlap: false,
// 					end: '12:00', // an end time (2pm in this example)
// 				    dow: selectmenu // Repeat monday and thursday
// 				},{
// 					//means delete all repeating items and rebuild new ones
// 					id:"repeateventeveryallday",
// 				    title:"下午",
// 				    start: '12:00', // a start time (10am in this example)				
// 				    overlap: false,
// 					end: '18:00', // an end time (2pm in this example)
// 				    dow: selectmenu // Repeat monday and thursday
// 				},{
// 					//means delete all repeating items and rebuild new ones
// 					id:"repeateventeveryallday",
// 				    title:"晚上",
// 				    start: '18:00', // a start time (10am in this example)				
// 				    overlap: false,
// 					end: '24:00', // an end time (2pm in this example)
// 				    dow: selectmenu // Repeat monday and thursday
// 				}]
// 				$('#calendar').fullCalendar( 'renderEvents', repeateventallday);
				
// 				//	 $('#calendar').fullCalendar( 'destroy' );
// 				//	 buildcalendar();
// 			}//end repeating event
			
			function repeatingeventmorning(){
				$('#calendar').fullCalendar( 'removeEvents', 'repeateventmorning');
				
				selectmenu = [];
				var checkedbox = $('input[name="repeatingboxmorning"]:checked');
				checkedbox.each(function () {
					selectmenu.push($(this).val());
				});//end each
//		 		console.log(checkedbox);
//		 		console.log(selectmenu);
				var repeateventmorning = 	{
					//means delete all repeating items and rebuild new ones
					id:"repeateventmorning",
				    title:"早上",
				    start: '01:00', // a start time (10am in this example)				
				    overlap: true,
				    color:'#C6E8EA',
					end: '09:00', // an end time (2pm in this example)
				    dow: selectmenu // Repeat monday and thursday
				}
				$('#calendar').fullCalendar( 'renderEvent', repeateventmorning);
				
				//	 $('#calendar').fullCalendar( 'destroy' );
				//	 buildcalendar();
			}//end repeating event
			
			function repeatingeventnoon(){
				$('#calendar').fullCalendar( 'removeEvents', 'repeateventeverynoon');
				
				selectmenu = [];
				var checkedbox = $('input[name="repeatingboxnoon"]:checked');
				checkedbox.each(function () {
					selectmenu.push($(this).val());
				});//end each
//		 		console.log(checkedbox);
//		 		console.log(selectmenu);
				var repeateventnoon = 	{
					//means delete all repeating items and rebuild new ones
					id:"repeateventeverynoon",
					
				    title:"下午",
				    start: '12:00', // a start time (10am in this example)				
				    overlap: true,
				    color:'#48AE59',
					end: '18:00', // an end time (2pm in this example)
				    dow: selectmenu, // Repeat monday and thursday
				    
				}
				$('#calendar').fullCalendar( 'renderEvent', repeateventnoon);
				
				//	 $('#calendar').fullCalendar( 'destroy' );
				//	 buildcalendar();
			}//end repeating event
			
			function repeatingeventnight(){
				$('#calendar').fullCalendar( 'removeEvents', 'repeateventnight');
				
				selectmenu = [];
				var checkedbox = $('input[name="repeatingboxnight"]:checked');
				checkedbox.each(function () {
					selectmenu.push($(this).val());
				});//end each
//		 		console.log(checkedbox);
//		 		console.log(selectmenu);
				var repeateventnight = 	{
					//means delete all repeating items and rebuild new ones
					id:"repeateventnight",
				    title:"晚上",
				    start: '18:00', // a start time (10am in this example)				
				    overlap: true,
				    color:'#7BAFF8',
					end: '24:00', // an end time (2pm in this example)
				    dow: selectmenu // Repeat monday and thursday
				}
				
				$('#calendar').fullCalendar( 'renderEvent', repeateventnight);
				
				//	 $('#calendar').fullCalendar( 'destroy' );
				//	 buildcalendar();
			}//end repeating event
			
			function buildcalendar(){
				
				$('#calendar').fullCalendar({
					
				
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month'
// 							,agendaWeek,agendaDay
					},
					editable: true,
					
					timezone:'UTC',
// 					timezone = 'Asia/Taipei',
					droppable: true, // this allows things to be dropped onto the calendar
					eventDrop: function(event, delta, revertFunc) {
						checkoverlapping(event);
				        alert(event.title + " was dropped on " + event.start.format());
			
				        if (!confirm("Are you sure about this change?")) {
				            revertFunc();
				        }
				       
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
			// 			$('#calendar').fullCalendar( 'renderEvent', dragevent);
//		 				console.log(event);
						assignrandom(event);
						eventidglobe =$(this).data('id')+randomnumber;
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
						var ds = new Date(event.start._d).getTime();
						var n = d.getTimezoneOffset()*60*1000;
						var s =new Date(ds+n);
// 						$.fullCalendar.moment(event.start._d);
						//event.start._d and event._start._d is not the same
// 						console.log(s);
// 						console.log(d);
// 						event.start._d = s;
						event._start._d = s;
						checkoverlapping2(event);
// 						console.log(event.start._d);
// 						console.log(event._start._d);
// 						console.log(event);
					},
					eventReceive:function( event ) {

						event._id = eventidglobe;
						event.id = eventidglobe;
// 						console.log(event);
//		 				var randomnumber =Math.random().toString();//not working after drop, because the real id is still the original
						
						$(this).attr('data-id',$(this).data('id')+randomnumber);
						checkoverlapping(event); 
						
						},
					events: [{
						
						id:999,
					    title:"programming",
					    start: '00:00', // a start time (10am in this example)
					    end: '24:00', // an end time (2pm in this example)
					    dow: "\[" +selectmenu+" \]" // Repeat monday and thursday
					}],//end repeating event
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
					if((events[i].title == "整天")||(event.title =="整天")){
						if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3])==
							(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3])){
							//the id removed should be event._id, not event.id 
							// the reason I can remove with event.id is because i have already given .id and ._id to the same value							
								$('#calendar').fullCalendar('removeEvents', event.id);
								return true;
								
							}//end for
						}//end if
						
					else if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3]+splitstring1[4])==
						(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3]+splitstring2[4])){
						//the id removed should be event._id, not event.id 
						// the reason I can remove with event.id because i have already given .id and ._id to the same value						
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
			function checkoverlapping2(event){// no event can exists twice in 1 day, and no event can be added under all day unavailable
				
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
				
				if(events.length>6){
				for(i=0;i<events.length-1;i++){
				// start-time in between any of the events
					
					var eventid1 = event.id;					
					var eventid2 = event._id;
					var eventid3 = events[i].id;
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
					if((events[i].title == "整天")||(event.title =="整天")){
						if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3])==
							(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3])&&(eventid1!=eventid3)){
								console.log("all"+eventid1+eventid3);
								$('#calendar').fullCalendar('removeEvents', event.id);
								return true;
								
							}//end if
						}//end if
						
					else if(((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3]+splitstring1[4])==
						(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3]+splitstring2[4]))&&(eventid1!=eventid3)){							
						console.log("notall"+eventid1+eventid3);
							if((eventid1.substring(5)=="repeat")){
								$('#calendar').fullCalendar('removeEvents', eventid1);//beware, drag after repeating will remove entire repeating events
							}else if((eventid3.substring(5)=="repeat")){
								$('#calendar').fullCalendar('removeEvents', eventid3);
							}
								// 							$('#calendar').fullCalendar('removeEvents', eventid1);
// 							$('#calendar').fullCalendar('renderEvents', eventid1);
						    return true;
						}//end if
					}//end for
				}//end if

		}//end check2 function
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"></script> -->
  
	<script type="text/javascript" src="../js/smartform/jquery.smartWizard.min.js"></script>	
	
  

</body>
</html>