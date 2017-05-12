<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--full calendar-->
<link rel='stylesheet' href='../js/fullcalendar.min.css' />
<script src='../js/jquery-3.2.1.min.js'></script>
<script src='../js/moment.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--jquery ui-->
<script src='../js/jquery-ui.min.js'></script>
<title>Insert title here</title>
<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 150px;
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

</style>
</head>
<body>
<div>

<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event'>早上不可預約</div>
			<div class='fc-event'>下午不可預約</div>
			<div class='fc-event'>晚上不可預約</div>
			<div class='fc-event'>整天不可預約</div>
<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove' /> -->
<!-- 				<label for='drop-remove'>remove after drop</label> -->
<!-- 			</p> -->

		<div class='.repeatingevent'id="selectmenu" > 
			
				<input type="checkbox" name="repeatingbox" value="1" seleted="selected">週一</option>
				<input type="checkbox" name="repeatingbox"value="2" seleted="selected">週二</option>
				<input type="checkbox" name="repeatingbox" value="3" seleted="selected">週三</option>
				<input type="checkbox" name="repeatingbox" value="4" seleted="selected">週四</option>
				<input type="checkbox" name="repeatingbox" value="5" seleted="selected">週五</option>
				<input type="checkbox" name="repeatingbox" value="6" seleted="selected">週六</option>
				<input type="checkbox" name="repeatingbox" value="0" seleted="selected">週日</option>
<!-- 				<select id="selectmenu" multiple="multiple" size="6">	 -->
<!-- 				<option  value="2">週一</option> -->
<!-- 				<option  value="3">週二</option> -->
<!-- 				<option  value="4">週三</option> -->
<!-- 				<option  value="5">週四</option> -->
<!-- 				<option  value="6">週五</option> -->
<!-- 				<option  value="7">週六</option> -->
<!-- 				<option  value="1">週日</option> -->
<!-- 			</select> -->
			
		</div>
		
		</div>


	<div id='calendar'></div>

	<div style='clear:both'></div>
	</div>
<script>
var selectmenu=null;
$(function() {
	$('#external-events .fc-event').each(function() {

		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});

	});// end each
	
	$('#selectmenu>input').on('change',function(){
		$('#calendar').fullCalendar( 'removeEvents', event._999);
		
		selectmenu = [];
		var checkedbox = $('input[name="repeatingbox"]:checked');
		checkedbox.each(function () {
			selectmenu.push($(this).val());
		});//end each
		console.log(checkedbox);
		console.log(selectmenu);
		var repeatevent = 	{
			
			id:"repeatingitem",
		    title:"programming",
// 		    start: '09:00', // a start time (10am in this example)
// 		    end: '24:00', // an end time (2pm in this example)
		    dow: selectmenu // Repeat monday and thursday
		}
		$('#calendar').fullCalendar( 'renderEvent', repeatevent);
	
// 		 $('#calendar').fullCalendar( 'destroy' );
// 		 buildcalendar();
	});// end select change
	/* initialize the calendar
	-----------------------------------------------------------------*/
	buildcalendar();


});// end ready
function buildcalendar(){
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			
			}//end if
		},//end drop
		
		events: [{
			
			id:999,
		    title:"programming",
// 		    start: '09:00', // a start time (10am in this example)
// 		    end: '24:00', // an end time (2pm in this example)
		    dow: "\[" +selectmenu+" \]" // Repeat monday and thursday
		}],//end repeating event
	});// end full calendar
}//end create calendar
</script>
</body>
</html>