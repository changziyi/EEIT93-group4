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
.allunavaliable{
	background-color:red;
	color:white;
}
.morningavaliable{
	background-color:yellow;
	color:white;
}
.noonavaliable{
	background-color:#E2C07C;
	color:white;
}
.nightavaliable{
	background-color:black;
	color:white;
}
.allavaliable{
	background-color:green;
	color:white;
}
.todaycolor{
	background-color:blue;
	color:white;
}
.reservedcolor{
	background-color:#5CB5A6;
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
<div id="date-popover-content" class="popover-content"></div>
</div>
<div id="my-calendar" class="calendarclass"></div>

<script type="application/javascript">

$(document).ready(function () {
	var eventData = [
		
	    {"date":"2017-05-01","badge":false,"title":"整天不可預約",classname: "allunavaliable"},
	    {"date":"2017-05-02","badge":false,"title":"上午可預約", classname: "morningavaliable"},
	    {"date":"2017-05-03","badge":false,"title":"下午可預約", classname: "noonavaliable"},
	    {"date":"2017-05-04","badge":false,"title":"晚上可預約", classname: "nightavaliable"},
	    {"date":"2017-05-05","badge":false,"title":"整天可預約", classname: "allavaliable"},

	    
	];
	
    $("#my-calendar").zabuto_calendar({
//      language: "en"
          action: function () {
              return myDateFunction(this.id, false);
          },
          action_nav: function () {
              return myNavFunction(this.id);
          },
		today:true,
        legend: [
            {type: "block", label: "整天不可預約",classname: "allunavaliable"},
            {type: "block", label: "上午可預約", classname: "morningavaliable"},
            {type: "block", label: "下午可預約", classname: "noonavaliable"},
            {type: "block", label: "晚上可預約", classname: "nightavaliable"},
            {type: "block", label: "整天可預約",classname: "allavaliable"},
            {type: "block", label: "今日",classname: "todaycolor"},
            {type: "block", label: "已預約", badge: "今",classname: "reservedcolor"},
            
            {type: "spacer"},
            {type: "text", label: "Bad"},
            {type: "list", list: ["grade-1", "grade-2", "grade-3", "grade-4"]},
            {type: "text", label: "Good"}
            ],
            
          data: eventData,

        });
});//end ready

function myDateFunction(id, fromModal)  {
		 $("#date-popover").hide();
	        if (fromModal) {
	            $("#" + id + "_modal").modal("hide");
	        }
	        var date = $("#" + id).data("date");
	        var hasEvent = $("#" + id).data("hasEvent");
	        if (hasEvent && !fromModal) {
	            return false;
	        }
	        $("#date-popover-content").html('You clicked on date ' + date);
	        return true;
	
	}
	
	function myNavFunction(id) {

	    var nav = $("#" + id).data("navigation");
	    var to = $("#" + id).data("to");
	    console.log('nav ' + nav + ' to: \ + to.month + ' + to.year);
}
	

</script>
</body>
</html>