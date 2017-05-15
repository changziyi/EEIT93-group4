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



	<script
	  src="https://code.jquery.com/jquery-3.2.1.min.js"
	  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	var coordinate=null;
	var googlecoordinate=null;
	var o_location=null;
	$( function() {
		
	    $( "#datepicker" ).datepicker();
	    
	    //google map
	    googlecoordinate = 'https://maps.googleapis.com/maps/api/geocode/json?'
	   
	    $('#o_addr').on('blur',getCoordinate);	
	    
	      
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
	});	    
	
	function getCoordinate(){
		var a1 = $('#o_city').val();
		var a2 = $('#o_district').val();
		var a3 = $('#o_addr').val();
		o_location =a1+a2+a3;
		$.getJSON(googlecoordinate,{'address':o_location},function(data){
			for(var i=0;i<data.results.length;i++) {
		        var location = data.results[i].geometry.location;
		        alert(location);
		        }
		//data 就是server端回傳的結果
		coordinate = location;
		initMap();
			});
// 		
				
	}
	 function initMap() {
		 var uluru =null;
	        if(coordinate==null){ 
	        	uluru={ "lat" : 25.0339639, "lng" : 121.5644722}
	        }
	        else{
	        	uluru = coordinate;
	        }           
	            
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 15,
	          center: uluru
	        });
	        var marker = new google.maps.Marker({
	          position: uluru,
	          map: map
	        });
	 	}
	  
		
	</script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"></script> -->
  
	<script type="text/javascript" src="../js/smartform/jquery.smartWizard.min.js"></script>	
	
  

</body>
</html>