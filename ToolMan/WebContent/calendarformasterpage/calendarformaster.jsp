<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--full calendar-->
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel='stylesheet' href='${pageContext.servletContext.contextPath}/js/fullcalendar.min.css' />
	<script src='${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/moment.min.js'></script>
	<script src='${pageContext.servletContext.contextPath}/js/fullcalendar.min.js'></script>
<!--full calendar-->

<!------------------------------  jquery ui -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css">
<script src='${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.js'></script>
<!-- ----------------------------- jquery ui-->


<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>

<!-- login please -->
	
	<style>
	

	
/* calendar */
		
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


#calendar {
    width: 200px;
    margin: 0 auto;
    font-size: 10px;
}
.fc-header-title h2 {
    font-size: .9em;
    white-space: normal !important;
}
.fc-view-month .fc-event, .fc-view-agendaWeek .fc-event {
    font-size: 0;
    overflow: hidden;
    height: 2px;
}
.fc-view-agendaWeek .fc-event-vert {
    font-size: 0;
    overflow: hidden;
    width: 2px !important;
}
.fc-agenda-axis {
    width: 20px !important;
    font-size: .7em;
}

.fc-button-content {
    padding:0;
    }

	</style>

	<jsp:useBean id="mdataVO" class="toolman.mdata.model.MdataVO" scope="session"/>
	<!-- retrieve MdataVO object from session-->

</head>
<body>
	

  <!--------------------------------calendar---------------------------------->  
       

		<div id='calendar' style="float:left;width:300px; height:200px"></div>

<!--------------------------------end calendar---------------------------------->
	




	
	
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
		//calendar
	});//end ready

	 
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

</body>
</html>