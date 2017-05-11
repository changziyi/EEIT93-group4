<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- jquery -->
<!-- bootstrap -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
<!-- bootstrap -->

<--zabuto calendar-->
	<script src="../js/zabuto_calendar.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../js/zabuto_calendar.min.css">
<--zabuto calendar-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.avaliablecolor{
	background-color:green;
	color:white;
}
.grade-1{
	background-color:blue;
}
.grade-2{
	background-color:purple;
}
.grade-3{
	background-color:green;
}
.grade-4{
	background-color:red;
}
.calendarclass{
	width:300px;
}
</style>
</head>
<body>
<div id="my-calendar" class="calendarclass"></div>

<script type="application/javascript">

$(document).ready(function () {
	var eventData = [
	    {"date":"2017-05-01","badge":true,"title":"不能預約"},
	    {"date":"2017-05-02","badge":true,"title":"不能預約"},
	    {"date":"2017-05-03","badge":true,"title":"不能預約"},
	    {"date":"2017-05-04","badge":false,"title":"能預約", "body":"<p>fucker</p>" ,"classname":"avaliablecolor"},
	    {"date":"2017-05-05","badge":false,"title":"能預約", "classname":"avaliablecolor"},
	    {"date":"2017-05-06","badge":true,"title":"不能預約"},
	    {"date":"2017-05-07","badge":true,"title":"不能預約"},
	    
	];
    $("#my-calendar").zabuto_calendar({
//      language: "en"
		today:true,
        legend: [
            {type: "text", label: "不可預約", badge: "00"},
            {type: "block", label: "可預約", classname: "avaliablecolor"},
            {type: "spacer"},
            {type: "text", label: "Bad"},
            {type: "list", list: ["grade-1", "grade-2", "grade-3", "grade-4"]},
            {type: "text", label: "Good"}
            ],
          data: eventData,
          
        });
});

</script>
</body>
</html>