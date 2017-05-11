<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<--full calendar-->
<link rel='stylesheet' href='../js/fullcalendar.min.css' />
<script src='../js/jquery-3.2.1.min.js'></script>
<script src='../js/moment.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<--jquery ui-->
<script src='../js/jquery-ui.min.js'></script>
<title>Insert title here</title>
<style>
.cool-event{
	border:3px solid blue;
	width:150px;
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
</style>
</head>
<body>
<div>
<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div>
			<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>remove after drop</label>
			</p>
		</div>
<div id="my-draggable" class='cool-event' >Drag me around</div>
</div>
<div id="calendar"></div>
<script>
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

	});
    // page is now ready, initialize the calendar...

		$('#my-draggable').data('event', {
			title: $('#my-draggable').text(), // use the element's text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});//end my draggable
// 		$('#my-draggable').data('event', { title: 'my event' });
		$('#my-draggable').draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});


	
    $('#calendar').fullCalendar({
    	editable:true,
    
        // put your options and callbacks here
    	aspectRatio: 2,
    	droppable: true,
    	
    	
        header: {
    		  left: 'prev,next today',
    		  center: 'title',
    		  right: 'listMonth,listWeek,listDay,Month,basicWeek, basicDay'
    		},
    	events: [
        {
            title  : 'event1',
            start  : '2017-05-01'
        },
        {
            title  : 'event2',
            start  : '2017-05-05',
            end    : '2017-05-07'
        },
        {
            title  : 'event3',
            start  : '2017-05-09T12:30:00',
            allDay : false // will make the time show
        }
    ],
    		drop: function() {
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
    		}
    })//end full calendar

});
</script>
</body>
</html>