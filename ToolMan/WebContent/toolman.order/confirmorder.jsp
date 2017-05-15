<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- smart_wizard -->
    <link href="../js/smartform/smart_wizard_theme_circles.min.css" rel="stylesheet" type="text/css" />
    <link href="../js/smartform/smart_wizard_theme_dots.min.css" rel="stylesheet" type="text/css" />
	<link href="../js/smartform/smart_wizard.min.css" rel="stylesheet" type="text/css" /> 
	<link href="../js/smartform/smart_wizard_theme_arrows.min.css" rel="stylesheet" type="text/css" />
<!-- smart_wizard -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">	
<title>預約完成</title>
	<jsp:useBean id="orderVO" class="toolman.order.model.OrderVO" scope="request"/>
<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>

<!-- login please -->
	
	<style>
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
            <ul class="textstyle">
            	<li><a href="#step-1">步驟一<br /><small>預約時間</small></a></li>
                <li><a href="#step-2">步驟一<br /><small>填寫預約表</small></a></li>
                <li><a href="#step-3">步驟三<br /><small>預約完成</small></a></li>
                <li><a href="#step-1">步驟四<br /><small>結案與評分</small></a></li>
            </ul>
            
         <div>
        	 <!--  step1  -->
                <div id="step-1" class=""></div>	
     		<!--  step1  -->
     		<!--  step2  -->
                <div id="step-2" class="">
 
                  </div> 
              <!--  step2  --> 
               <!--  step3  -->    
		               <!--  step3  -->    
		     <div id="step-3" class="textstyle">
				     <div>

						<table class="table textstyle" >
						<tr><td>店家名稱</td><td>${orderVO.getB_name()}</td></tr>
							<tr><td>消費者名稱</td><td>${orderVO.getC_id()}</td></tr>	
							<tr><td>預約時間</td><td>${orderVO.getO_bdate()}</td></tr>	
							<tr><td>工程類別</td><td id="oprolist"></tr>	
							<tr><td>工程描述</td><td>${orderVO.getO_des()}</tr>
							<tr><td>訂單失效時間</td><td>${orderVO.getReq_exp()}</td></tr>
							<tr><td>建築物型態</td><td>${orderVO.getH_type()}</td></tr>
							<tr><td>裝修地點</td><td>${orderVO.getO_location()}</td></tr>
							<tr><td>訂單狀態</td><td>${orderVO.getS_name()}</td></tr>	
						</table>
	<%-- 						<tr><td>${orderVO.getB_name()}</td> --%>
	<%-- 							<td>${orderVO.getM_id()}</td> --%>
	<%-- 							<td>${orderVO.getC_id()}</td></tr> --%>
							
	<%-- 						<tr><td>${orderVO.getO_bdate()}</td></tr> --%>
	<%-- 							<td>${orderVO.getO_des()}</td> --%>
	<%-- 							<td>${orderVO.getReq_exp()}</td> --%>
							
	<%-- 						<tr><td>${orderVO.getH_type()}</td> --%>
	<%-- 							<td>${orderVO.getO_location()}</td> --%>
	<%-- 							<td>${orderVO.getS_name()}</td></tr> --%>
	<!-- 					</table> -->
					</div>

						<form class="form-inline">
				             <div  >
				              <label >Choose Theme:</label>
				              <select id="theme_selector" class="form-control">
				                    <option value="default">default</option>
				                    <option value="arrows">arrows</option>
				                    <option value="circles">circles</option>
				                    <option value="dots">dots</option>
				              </select>
				            </div>           
				              <span >
				            	  <button id="btntobackstage" href="${pageContext.servletContext.contextPath}/order/listCOrder.jsp" class="btn btn-primary putmiddle" >進行訂單管理</button>
					    	</span>
				        </form>
		    	</div>     
			<!--  endstep3  --> 
 
          </div>
      </div>
   </div>
   
	<!-- smart wizard head -->



	<script
	  src="https://code.jquery.com/jquery-3.2.1.min.js"
	  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	var coordinate=null;
	var googlecoordinate=null;
	var o_location=null;
	var oprolist = [];

	$( function() {
		opro();

	    
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
            
                           
  
            // Smart Wizard initialize
            $('#smartwizard').smartWizard({ 
                    selected: 2, 
                    theme: 'circles',
                    transitionEffect:'fade',
                    anchorSettings:{
                    	removeDoneStepOnNavigateBack:false,
                    },
                    toolbarSettings: {
                    	toolbarPosition: 'buttom',
                    	showNextButton:false,
                    	showPreviousButton:false,
                       
                                    },
                 });           
            
            // External Button Events
            $("#reset-btn").on("click", function() {
                // Reset wizard
                $('#smartwizard').smartWizard("reset");
                return true;
            });
            
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
            
            $("#theme_selector").on("change", function() {
                // Change theme
                $('#smartwizard').smartWizard("theme", $(this).val());
                return true;
            })
	});	//end ready
	
	function opro(){	
		<c:forEach var="oproset" varStatus="stat" items="${oproVOlist}">
			oprolist.push("<c:out value="${oproset.o_pro}"></c:out>");
		</c:forEach>
		$('#oprolist').text(oprolist);
	}
	
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
	  
		
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"></script> -->
  
	<script type="text/javascript" src="../js/smartform/jquery.smartWizard.min.js"></script>	
	
  

</body>
</html>