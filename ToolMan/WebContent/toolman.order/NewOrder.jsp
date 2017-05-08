<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--open while login service is combined --%>
<%-- 	<c:if test="${empty LoginOK}"> --%>
<%-- 		<c:redirect url="/_02_login/login.jsp" /> --%>
<%-- 	</c:if> --%>
	<!-- login please -->
		<!-- <script src="js/jquery-1.12.3.min.js"></script> -->
	<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<style>
	#map{
		height:100px;
		width:100px;
	}
	</style>
	
	
	<script
	  src="https://code.jquery.com/jquery-3.2.1.min.js"
	  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

   
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	
	<title>Insert title here</title>
	
	<jsp:useBean id="mdataVO" class="toolman.mdata.model.MdataVO" scope="session"/>
	<!-- retrieve MdataVO object from session-->

</head>
<body>
	
	<form name="orderform" action="OrderController.do">
		<div>
		<label>服務公司名稱:</label>
		<span>${mdataVO.b_name}</span>
<!--  for test <span>TOOL KING</span>  -->
		</div>
		<label>服務類別</label>
		<div id="pro" name="opro_id">
		
<!-- 	parameters come directly from servlet , so the Ajax may not be needed-->	
		<c:forEach var="oproset" varStatus="stat" items="${mdataVO.mpros}">
		
<!-- 	retrieve Collection object  mproset  from session.setAttribute("mproset",mproset)								 -->
				<input type="checkbox" value=${oproset.m_proid} name="o_proid"/>${oproset.m_pro}			
		</c:forEach>

<!-- 		for test -->
<!-- 		<div> -->
<%-- 			<c:forEach var="i" begin="1" end="5"> --%>
<!-- 			<input type="checkbox" value="oprotest" name="o_proid"/>oprotest1 -->
<%-- 			</c:forEach> --%>
<!-- 		</div><span value=${param.erroropro}></span> -->
		
		<div id="datecalendar">
			<label>預約日期</label>
			<input type="text" id="datepicker" name="o_bdate" value="${param.o_bdate}">
			<!-- 放jQuery的calendar -->
		</div>
		
		<div>
		<label>維修項目說明</label><!-- 	ok -->
			<input type="text" name="o_des"/>
		</div><span value=${param.erroro_des}></span>
		
		<div>
		<label>未回應請求失效時間</label>
			<input type="radio" name="req_exp" value="5000" checked="checked">5秒測試用
			<input type="radio" name="req_exp" value="15000" >15秒測試用
			<input type="radio" name="req_exp" value="2400000" >2小時
			<input type="radio" name="req_exp" value="86400000">1天
			<input type="radio" name="req_exp" value="172800000">2天
			<input type="radio" name="req_exp" value="604800000">一周
		</div><span value=${param.erroro_des}></span>
		
		<div>
		<label>建築物型態</label>		
		    <select name="h_type" value=${oproset.h_type}>
			    <option value="1" selected="selected">公寓</option>
			    <option value="2">三合院</option>
			    <option value="3">透天屋</option>
			    <option value="4">冰屋</option>
			    <option value="5">狗屋</option>
		    </select>
		</div>
		<div>
			<label>施工地址</label><!-- 	ok -->
			<input type="text" id="o_city" name="o_city" value="台北市"/>
			<input type="text" id="o_district" name="o_district" value="內湖區"/>
			<input type="text" id="o_addr"name="o_addr" value=""/>
		</div>
		
		<div id='map'></div>
		
		<div>
			<label>備註</label><!-- 	ok -->
			<input type="text" name="o_note"/>
		</div><span value=${param.erroro_note}></span>
		<div>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="送出">
		</div>
		
	</form>

	<script>
	var coordinate=null;
	var googlecoordinate=null;
	var o_location=null;
	$( function() {
	    $( "#datepicker" ).datepicker();
	    googlecoordinate = 'https://maps.googleapis.com/maps/api/geocode/json?'
	    $('#o_addr').on('blur',getCoordinate);	
	    
	 
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
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAj-PEjC_YSdYGHEvhIKnyojxufjKYy6OE&callback=initMap"
    ></script>

</body>
</html>