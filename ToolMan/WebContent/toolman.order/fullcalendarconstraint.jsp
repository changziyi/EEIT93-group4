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
<script>

	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listMonth'
			},
			defaultDate: '2017-05-12',
			navLinks: true, // can click day/week names to navigate views
			businessHours: true, // display business hours
			editable: true,
			events: [
				{
					title: 'Business Lunch',
					start: '2017-05-03T13:00:00',
					constraint: 'businessHours'
				},
				{
					title: 'Business Lunch',
					start: '2017-05-03T13:00:00',
					constraint: 'businessHours'
				},
				{
					title: 'Meeting',
					start: '2017-05-13T11:00:00',
					constraint: 'availableForMeeting', // defined below
					color: '#257e4a'
				},
				{
					title: 'Conference',
					start: '2017-05-18',
					end: '2017-05-20'
				},
				{
					title: 'Party',
					start: '2017-05-29T20:00:00'
				},

				// areas where "Meeting" must be dropped
				{
					id: 'availableForMeeting',
					start: '2017-05-11T10:00:00',
					end: '2017-05-11T16:00:00',
					rendering: 'background'
				},
				{
					id: 'availableForMeeting',
					start: '2017-05-13T10:00:00',
					end: '2017-05-13T16:00:00',
					rendering: 'background'
				},
				{
					id: 'availableForMeeting',
					start: '2017-05-13T10:00:00',
					end: '2017-05-13T16:00:00',
					rendering: 'background'
				},
				{
					id: 'availableForMeeting',
					start: '2017-05-13T10:00:00',
					end: '2017-05-13T16:00:00',
					rendering: 'background'
				},

				// red areas where no events can be dropped
				{
					start: '2017-05-24',
					end: '2017-05-28',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				},
				{
					start: '2017-05-06',
					end: '2017-05-08',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				}
			]
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
