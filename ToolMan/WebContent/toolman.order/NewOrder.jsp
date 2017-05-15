<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--full calendar-->
	<link rel='stylesheet' href='../js/fullcalendar.min.css' />
	<script src='../js/jquery-3.2.1.min.js'></script>
	<script src='../js/moment.min.js'></script>
	<script src='../js/fullcalendar.min.js'></script>
<!--full calendar-->

<!--  jquery  -->
<!-- 	already exists in full calendar<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	 -->
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- 	already at the end of the body<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<!--  jquery -->
<!-- bootstrap -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>	
<!-- bootstrap -->
<!-- smart_wizard -->
    <link href="../js/smartform/smart_wizard_theme_circles.min.css" rel="stylesheet" type="text/css" />
    <link href="../js/smartform/smart_wizard_theme_dots.min.css" rel="stylesheet" type="text/css" />
	<link href="../js/smartform/smart_wizard.min.css" rel="stylesheet" type="text/css" /> 
	<link href="../js/smartform/smart_wizard_theme_arrows.min.css" rel="stylesheet" type="text/css" />
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
	</style>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<title>預約師傅</title>
	
	<jsp:useBean id="mdataVO" class="toolman.mdata.model.MdataVO" scope="session"/>
	<!-- retrieve MdataVO object from session-->

</head>
<body>
<!-- smart wizard head -->

        

        <br />
        <div class="container containerstyle textstyle putmiddle">
        <!-- SmartWizard html -->
     
        <div id="smartwizard">
            <ul class="stepstyle textstyle">
            	<li><a href="#step-1">步驟一<br /><small>預約時間</small></a></li>
                <li><a href="#step-2">步驟一<br /><small>填寫預約表</small></a></li>
                <li><a href="#step-3">步驟三<br /><small>預約完成</small></a></li>
                
            </ul>
      
         <div>
        	 <!--  step1  -->
         <div id="step-1" class="">
                <div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div id='external-events2'>
			<div class='fc-event' data-id="morning"data-start="01:00" data-end='08:00'>早上不可預約</div>
			<div class='fc-event' data-id="noon"data-start="12:00" data-end='06:00'>下午不可預約</div>
			<div class='fc-event' data-id="night"data-start="18:00" data-end='06:00'>晚上不可預約</div>
			
		</div>
		<div class='fc-event' id="alldayevent" data-id="allday"data-start="00:00" data-end='24:00'>整天不可預約</div>
<!-- 			<p> -->
<!-- 				<input type='checkbox' id='drop-remove' /> -->
<!-- 				<label for='drop-remove'>remove after drop</label> -->
<!-- 			</p> -->
	
			<div class='.repeatingevent'id="selectmenu" > 
				<table>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="1" >每週一早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning"value="2" >每週二早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="3" >每週三早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="4" >每週四早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="5" >每週五早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="6" >每週六早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxmorning" value="0" >每週日早上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="1" >每週一下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon"value="2" >每週二下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="3" >每週三下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="4" >每週四下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="5" >每週五下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="6" >每週六下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnoon" value="0" >每週日下午不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="1" >每週一晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight"value="2" >每週二晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="3" >每週三晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="4" >每週四晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="5" >每週五晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="6" >每週六晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingboxnight" value="0" >每週日晚上不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="1" >每週一整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox"value="2" >每週二整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="3" >每週三整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="4" >每週四整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="5" >每週五整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="6" >每週六整天不可預約</td></tr>
					<tr><td><input type="checkbox" name="repeatingbox" value="0" >每週日整天不可預約</td></tr>
	<!-- 				<select id="selectmenu" multiple="multiple" size="6">	 -->
	<!-- 				<option  value="2">週一</option> -->
	<!-- 				<option  value="3">週二</option> -->
	<!-- 				<option  value="4">週三</option> -->
	<!-- 				<option  value="5">週四</option> -->
	<!-- 				<option  value="6">週五</option> -->
	<!-- 				<option  value="7">週六</option> -->
	<!-- 				<option  value="1">週日</option> -->
	<!-- 			</select> -->
				</table>
			</div>
			<div style="width:200px; border:2px solid blue;height:200px;">
			    	垃圾桶
			</div>
		</div>


		<div id='calendar' style="float:left;"></div>
	
		<div style='clear:both'></div>
	</div>
                <form class="form-inline">
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
				                
				            </div>
				        </form>
                
                </div>	
     		<!--  step1  -->
     		<!--  step2  -->
     	
                <div id="step-2" class="">
                    <form id="bookform"name="orderform" role="form" action="OrderController.do" class="form-inline">
						<div class="panel panel-default">
							<div class="panel-heading">預約表</div>
								<table class="table">
                        		

							<thead>

							</thead>
							<tbody>
									<tr>
										<td>
										
											<label class="labelstyle">服務公司名稱:</label>
										</td>
										<td>
											<div>
												<span class="inputstyle" >${mdataVO.b_name}</span>
										<!--  for test <span>TOOL KING</span>  -->
											</div>
										</td>
									</tr>
									<tr>
										<td>
											
											<label class="labelstyle">服務類別</label>
											
										</td>
										<td>
										<div id="pro" name="opro_id" class="inputstyle">
								<!-- 	parameters come directly from servlet , so the Ajax may not be needed-->	
										<c:forEach var="oproset"  varStatus="stat" items="${mdataVO.mpros}">
										
								<!-- 	retrieve Collection object  mproset  from session.setAttribute("mproset",mproset)								 -->
												<input type="checkbox" class="inputstyle"   value=${oproset.m_pro} checked="checked" name="o_pro"/>${oproset.m_pro}
															
										</c:forEach>
								
								<!-- 		for test -->
										
								<%-- 			<c:forEach var="i" begin="1" end="5"> --%>
								<!-- 			<input type="checkbox" value="oprotest" name="o_proid"/>oprotest1 -->
								<%-- 			</c:forEach> --%>
								<!-- 		</div><span value=${param.erroropro}>${param.erroropro}</span> -->
										<span class="errormsg" value=${errormsg.erroro_pro}>${errormsg.erroro_pro}</span>
										</div>
										</td>
									</tr>
									<tr>
										<td>
											
												<label class="labelstyle">預約日期</label>
										</td>
										<td>
											<div id="datecalendar" >
												<input type="text" class="inputstyle" id="datepicker" name="o_bdate" value="${orderVO.o_bdate}">
												<!-- 放jQuery的calendar -->
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<label class="labelstyle">維修項目說明</label><!-- 	ok -->
										</td>
		
										<td>	
											<textarea   Style="width:200px;float:left;height:50px;" name="o_des" maxlength="50"></textarea>
											<span class="errormsg" value=${errormsg.erroro_des}>${errormsg.erroro_des}</span>
										</td>
									</tr>
									<tr>
										<td>
											
											<label class="labelstyle">未回應請求失效時間</label>
										</td>
										<td>
											<div style="width: 400px;">
												<input type="radio" style="margin-left:0px;" name="req_exp" value="5000" checked="checked">5秒測試用
												<input type="radio" name="req_exp" value="15000" >15秒測試用
												<input type="radio" name="req_exp" value="2400000" >2小時
												<input type="radio" name="req_exp" value="86400000">1天
												<input type="radio" name="req_exp" value="172800000">2天
												<input type="radio" name="req_exp" value="604800000">一週
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
												    <option value="1" selected="selected">公寓</option>
												    <option value="2">三合院</option>
												    <option value="3">透天屋</option>
												    <option value="4">冰屋</option>
												    <option value="5">狗屋</option>
											    </select>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											
												<label class="labelstyle">施工地址</label><!-- 	ok -->
										</td>
										<td>
											<div>
												<input type="text" class="inputstyle" style="width:100px;" id=" o_city" name="o_city" value=${addrlist.o_city}/>
												<input type="text" class="inputstyle" style="width:100px;" id="o_district" name="o_district" value=${addrlist.o_district}/>
												<input type="text" class="inputstyle" id="  id="o_addr" name="o_addr" value=${addrlist.o_addr}/>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
		
		$('#external-events2>div').on('click',assignrandom);
		draggableevent();
		$('input[name="repeatingbox"]').on('change',repeatingevent);// end select change
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
	});	    
	
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
	 function assignrandom(event){
			
			randomnumber = Math.random().toString();//not working after drop, because the real id is still the original
			
			eventstart = $(this).data('start');
			eventend = $(this).data('end');
			
			}
			function draggableevent(){
				
				$('#alldayevent').each(function() {
					
					
					// 		var dragevent = {
									
					// 				id: $(this).text(),	
					// 				title: $(this).text(), // use the element's text as the event title
					// 				start: $(this).data('start'), // a start time (10am in this example)
					// 				time: $(this).data('endd'), // an end time (2pm in this example)
					// 			    stick: true
					// 		}
							// store data so the calendar knows to render an event upon drop
					
							$(this).data('event', {
								
								id: $(this).data('id'),
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
							
						});
				
				$('#external-events .fc-event').each(function() {

			
					$(this).data('event', {
						
						id: $(this).data('id'),
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
			
			function repeatingevent(){
				$('#calendar').fullCalendar( 'removeEvents', 'repeateventeveryallday');
				
				selectmenu = [];
				var checkedbox = $('input[name="repeatingbox"]:checked');
				checkedbox.each(function () {
					selectmenu.push($(this).val());
				});//end each
//		 		console.log(checkedbox);
//		 		console.log(selectmenu);
				var repeateventallday = 	{
					//means delete all repeating items and rebuild new ones
					id:"repeateventeveryallday",
				    title:"每整天",
				    start: '00:00', // a start time (10am in this example)				
				    overlap: false,
					end: '24:00', // an end time (2pm in this example)
				    dow: selectmenu // Repeat monday and thursday
				}
				$('#calendar').fullCalendar( 'renderEvent', repeateventallday);
				
				//	 $('#calendar').fullCalendar( 'destroy' );
				//	 buildcalendar();
			}//end repeating event
			
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
				    title:"每早",
				    start: '01:00', // a start time (10am in this example)				
				    overlap: true,
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
					
				    title:"每下午",
				    start: '12:00', // a start time (10am in this example)				
				    overlap: true,
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
				    title:"每晚",
				    start: '18:00', // a start time (10am in this example)				
				    overlap: true,
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
						right: 'month,agendaWeek,agendaDay'
					},
					editable: true,
					timezone:'UTC',
					
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
					    if( (20 <= jsEvent.pageX) & (jsEvent.pageX <= 220) & (240 <= jsEvent.pageY) & (jsEvent.pageY <= 350)){
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
						console.log(event);
						var d = new Date();
						var ds = new Date(event.start._d).getTime();
						var n = d.getTimezoneOffset()*60*1000;
						var s =new Date(ds+n);
						
						//event.start._d and event._start._d is not the same
// 						console.log(s);
// 						console.log(d);
// 						event.start._d = s;
						event._start._d = s;
// 						console.log(event.start._d);
// 						console.log(event._start._d);
// 						console.log(event);
					},
					eventReceive:function( event ) {

						event._id = eventidglobe;
						event.id = eventidglobe;
						console.log(event);
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
					console.log(event);
				if(events.length!=0){
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
					console.log(splitstring1);
					
					var splitstring2 = start2.split(" ");
					console.log(splitstring2);
					if((events[i].title == "整天不可預約")||(event.title =="整天不可預約")){
						if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3])==
							(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3])){
		
								$('#calendar').fullCalendar('removeEvents', event.id);
								return true;
								
							}//end for
						}//end if
					else if((splitstring1[0]+splitstring1[1]+splitstring1[2]+splitstring1[3]+splitstring1[4])==
						(splitstring2[0]+splitstring2[1]+splitstring2[2]+splitstring2[3]+splitstring2[4])){
	
						
							$('#calendar').fullCalendar('removeEvents', event.id);
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
		
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"></script> -->
  
	<script type="text/javascript" src="../js/smartform/jquery.smartWizard.min.js"></script>	
	
  

</body>
</html>