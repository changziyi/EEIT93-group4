<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- datatable-->
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

<style>
	#navigator ul li {
	　display:inline;
	 list-style-type:none;
	}
	#navigator ul li a {
	 min-width:150px;
	 text-align:center;
	}
	.eventlistthreadtr {
	 width:70px;
	 text-align:center;
	}
	.eventlistthreadtrth {
	 width:70px;
	 text-align:center;
	}
	.eventlisttbodytr {
	 width:70px;
	 text-align:center;
	}
	.eventlisttbodytrtd {
	 width:70px;
	 text-align:center;
	}
</style>
</head>
<body>
<!-- navigator -->
	<header >
		<nav >
			<div id="navigator" >
			
				<ul style="margin: auto;width:900px; horizontal-align:center;" class="nav nav-tabs nav-justified"  >
				
					<li  data-toggle="tab" role="presentation"  id="masterlist" data-id="m" class="active"><a href="#"><div>師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist" data-id="o" ><a href="#" ><div>訂單列表</div></a></li>
	
					<li  data-toggle="tab" role="presentation" id="customeranalysis" data-id="a"><a href="#"><div>用戶分析</div></a></li>
										
					<li  data-toggle="tab" role="presentation" id="adlist" data-id="ad"><a href="#"><div>廣告</div></a></li>
							
				</ul>
			</div>

		</nav>
			<div id="functionrow" style="margin: auto;width:900px; horizontal-align:center;" >
			   <ul id="functionrow2" role="navigation" style="border:2px solid black; margin: auto;width:900px; horizontal-align:center;" class="nav nav-pills " >
			   </ul>
			</div>
			
			<div id="subfunctionrow" style="margin: auto;width:900px; horizontal-align:center;" class="nav nav-tabs nav-justified">
				<form action="${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do"></form>
			</div>
	</header>
<!-- Function button -->
	<div>
		
	</div>
<!-- main content here -->		
	<article>
	<table id="eventlist" style="margin:auto;width:900px; border: 2px solid blue; horizontal-align:center;">
		<thead>
<!-- 			<th>1</th> -->
<!-- 			<th>2</th> -->
	    </thead>
		<tbody>
<!-- 			<tr><td>1</td><td>2</td></tr> -->
<!-- 			<tr><td>1</td><td>2</td></tr> -->
		</tbody>
	
	</table>
<!-- 	<div> -->
<!-- 		<select id="pageselectid" name="pageselectname"> -->
<!-- 			<option id="pagename" value="page1"/> -->
<!-- 			<option id="pagename" value="page2"/> -->
<!-- 			<option id="pagename" value="page3"/> -->
<!-- 		</select> -->
<!-- 	</div> -->
	<input type="hidden" />
	</article>


<script>
	var table ;
	var navagatorid = $('#navigator>ul>li.active').data('id');

$(function(){
		$(document).ajaxComplete(function(){
			 datatableinit();
		});	//let's try it
		
		loadProduct('m');
		$('#navigator>ul>li').on('click',navigatorevent);//end on do not add ()
		
		functionrow();
 	    subfunctionrow();
 	   $('#subfunctionrow>form>span').on('click',togglerow);
	}// end ready function
); //end ready   

	function navigatorevent(){
		
		 $('#eventlist').dataTable().fnDestroy();   
		   var id = $(this).data('id');
		   navagatorid = id;
		   loadProduct(id);
		   $('#navigator>ul>li').removeClass('active');
		   $('#navigator>ul>li[data-id="' + id + '"]').addClass('active');
		   
		   functionrow();
		   subfunctionrow(); 
		   
	}//navigatorevent()
	
	function functionrow(){

		var docFragfunction = $(document.createDocumentFragment());
		
	   if( navagatorid== 'm'){
		   
 			$('#functionrow2').empty();
			var allmaster = '<li data-toggle="tab" role="presentation" data-id="allmaster" class="active"><a href="#">所有師傅</a></li>';
			var masterstatus = '<li data-toggle="tab" role="presentation" data-id="masterstatus" ><a href="#">師傅狀態</a></li>';
			var toactm = '<li data-toggle="tab" role="presentation" data-id="toactm" ><a href="#">動作</a></li>';
			var showblacklistc = '<li data-toggle="tab" role="presentation" data-id="showblacklistc" ><a href="#">黑名單</a></li>';
			var li1 = $(allmaster);
			var li2 = $(masterstatus);
			var li3 = $(toactm);
			var li4 = $(showblacklistc);
			docFragfunction.append([li1,li2,li3,li4]);
			$('#functionrow2').append(docFragfunction);
			
		}//end else if
		
		else if(navagatorid== 'c'){
			
			$('#functionrow2').empty();
			var allcustomer = '<li data-toggle="tab" role="presentation" data-id="allmaster" class="active"><a href="#">所有消費者</a></li>';
			var customerstatus = '<li data-toggle="tab" role="presentation" data-id="allmaster" ><a href="#">消費者狀態</a></li>';
			var toactc = '<li data-toggle="tab" role="presentation" data-id="allmaster"><a href="#">動作</a></li>';
			var showblacklistm = '<li data-toggle="tab" role="presentation" data-id="allmaster"><a href="#">黑名單</a></li>';
			var li1 = $(allcustomer);
			var li2 = $(customerstatus );
			var li3 = $( toactc);
			var li4 = $(showblacklistm );
			docFragfunction.append([li1,li2,li3,li4]);
			$('#functionrow2').append(docFragfunction);
			
		}//end else if
		
		else if(navagatorid== 'o'){
			
			$('#functionrow2').empty();
			var allorder = '<li data-toggle="tab" role="presentation" data-id="allmaster" class="active" ><a href="#">所有訂單</a></li>';
			var orderstatus = '<li data-toggle="tab" role="presentation" data-id="allmaster" ><a href="#">訂單狀態</a></li>';
			var toacto = '<li data-toggle="tab" role="presentation" data-id="allmaster" ><a href="#">動作</a></li>';
			var showblacklisto = '<li data-toggle="tab" role="presentation" data-id="allmaster" ><a href="#">問題交易</a></li>';
			var li1 = $(allorder);
			var li2 = $(orderstatus);
			var li3 = $(toacto);
			var li4 = $(showblacklistc);
			docFragfunction.append([li1,li2,li3,li4]);
			$('#functionrow2').append(docFragfunction);
			
 		}// end else if 

	}//end functionrow
	

	   function subfunctionrow(){

			var docFragsubfunction = $(document.createDocumentFragment());
		   if( navagatorid== 'm'){
				$('#subfunctionrow>form').empty();
// 				$('#subfunctionrow>form>span').
				var applicationreviewm = '<span value="m_id" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="審核師傅" /></span>';
				var suspensionm = '<span value="suspensionm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="停權" "/></span>';
				var sendmessagem = '<span value="sendmessagem" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="傳送訊息" "/></span>';
				var blacklistm = '<span value="blacklistm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="黑名單" "/></span>';
				var b1 = $(applicationreviewm);
				var b2 = $(suspensionm);
				var b3 = $(sendmessagem);
				var b4 = $(blacklistm);
				docFragsubfunction.append([b1,b2,b3,b4]);
				$('#subfunctionrow>form').append(docFragsubfunction);
			}//end else if
			
			else if(navagatorid== 'c'){
				$('#subfunctionrow>form').empty();
				var suspensionc = '<span value="suspensionc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="停權"/></span>';
				var sendmessagec = '<span value="sendmessagec" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="傳送訊息" /></span>';
				var blacklistc = '<span value="blacklistc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="黑名單" /></span>';
				var b1 = $(suspensionc);
				var b2 = $(sendmessagec);
				var b3 = $(blacklistc);
				docFragsubfunction.append([b1,b2,b3]);
				$('#subfunctionrow>form').append(docFragsubfunction);
			}//end else if
			
			else if(navagatorid== 'o'){
				$('#subfunctionrow>form').empty();
				var sendmessageo = '<span value="sendmessageo" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="訊息" "/></span>';
				var b1 = $(sendmessageo);
				docFragsubfunction.append([b1]);
				$('#subfunctionrow>form').append(docFragsubfunction);
				
			}// end else if 
	
		}//end functionrow
		
		function togglerow(){
          
	            //get all toggled checkboxes
	           var datas = [];
	        	 $(":checkbox:checked").each(function(){            	  
	            	   datas.push($(this).val()); 
	            })
	            
// 	            $("#eventlist>tbody>tr>td>input:checked").each(function(){
// 	            	var toggledvalue =$(this).val();
	            	
// 	            })//end each
	            alert(datas);
		}//end togglerow
		
	   function loadProduct(id){

			   $.getJSON('${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIServlet.do',{'action':id}, function(datas){
					 var th = $('#eventlist>thead');
					 var tb = $('#eventlist>tbody');
				   var docFragth = $(document.createDocumentFragment());
				   var docFragtb = $(document.createDocumentFragment());
				   tb.empty();
				   th.empty();
				   
			   if(id=="o"){
				   
				   th.empty();
				   	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
				   	var thc1 = $('<th></th>').text('師傅編號').addClass('eventlistthreadtrth');
				   	var thc2 = $('<th></th>').text('店家名稱').addClass('eventlistthreadtrth');
				   	var thc3 = $('<th></th>').text('師傅名稱').addClass('eventlistthreadtrth');
				   	var thc4 = $('<th></th>').text('店家地址').addClass('eventlistthreadtrth');
				   	var thc5 = $('<th></th>').text('師傅專業').addClass('eventlistthreadtrth');
				   	var thc6 = $('<th></th>').text('店家狀態').addClass('eventlistthreadtrth');
				   	var thc7 = $('<th></th>').text('平均分數').addClass('eventlistthreadtrth');
				   	var thc8 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
				   	var thc9 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
				   	var thc10 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
				   	var thc1 = $('<th></th>').text('下單日期').addClass('eventlistthreadtrth');
					var thc2 = $('<th></th>').text('店家名稱').addClass('eventlistthreadtrth');
					var thc3 = $('<th></th>').text('消費者帳戶').addClass('eventlistthreadtrth');
					var thc4 = $('<th></th>').text('訂單編號').addClass('eventlistthreadtrth');
					var thc5 = $('<th></th>').text('服務類別').addClass('eventlistthreadtrth');
					var thc6 = $('<th></th>').text('服務地址').addClass('eventlistthreadtrth');
					var thc7 = $('<th></th>').text('訂單狀態').addClass('eventlistthreadtrth');
					var thc8 = $('<th></th>').text('師傅評分').addClass('eventlistthreadtrth');
					var thc9 = $('<th></th>').text('消費者評分').addClass('eventlistthreadtrth');
					var thc10 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
					var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8,thc9,thc10]);
					docFragth.append(rowth);
			   }
			   else if(id=="m"){
				   
				   th.empty();
				  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					var thc1 = $('<th></th>').text('師傅編號').addClass('eventlistthreadtrth');
					var thc2 = $('<th></th>').text('店家名稱').addClass('eventlistthreadtrth');
					var thc3 = $('<th></th>').text('師傅名稱').addClass('eventlistthreadtrth');
					var thc4 = $('<th></th>').text('店家地址').addClass('eventlistthreadtrth');
					var thc5 = $('<th></th>').text('師傅專業').addClass('eventlistthreadtrth');
					var thc6 = $('<th></th>').text('店家狀態').addClass('eventlistthreadtrth');
					var thc7 = $('<th></th>').text('平均分數').addClass('eventlistthreadtrth');
					var thc8 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
					var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8]);
					docFragth.append(rowth);
			   }
			   else if(id=="c"){
				   
				   th.empty();
				    var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
				    var thc1 = $('<th></th>').text('下單日期').addClass('eventlistthreadtrth');
					var thc2 = $('<th></th>').text('消費者名稱').addClass('eventlistthreadtrth');
					var thc3 = $('<th></th>').text('消費者帳戶').addClass('eventlistthreadtrth');
					var thc4 = $('<th></th>').text('消費者地址').addClass('eventlistthreadtrth');
					var thc5 = $('<th></th>').text('消費者狀態').addClass('eventlistthreadtrth');
					var thc6 = $('<th></th>').text('平均分數').addClass('eventlistthreadtrth');
					var thc7 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
					var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7]);
					docFragth.append(rowth);
				   
			   }
			   $.each(datas,function(i,data){
				   console.log(data);//for test
				   
// 				   		pageselection();
// 						for(var i=pageIndex;i<pageIndex+rowsPerPage;i++){
					   
					   if(id=="o"){
					   console.log(data);
					   tb.empty();
					   	var toggleword = $('<input type="checkbox" name="otoggle" />').val(data.o_id);
					   	var cell0 = $('<td></td>').append(toggleword);
					  	var cell1 = $('<td></td>').text(data.o_tdate).addClass('eventlisttbodytrtd');
						var cell2 = $('<td></td>').text(data.o_bname).addClass('eventlisttbodytrtd');
						var cell3 = $('<td></td>').text(data.c_id).addClass('eventlisttbodytrtd');
						var cell4 = $('<td></td>').text(data.o_id).addClass('eventlisttbodytrtd');
 						var cell5 = $('<td></td>').text(data.opros).addClass('eventlisttbodytrtd');
						var cell6 = $('<td></td>').text(data.o_location).addClass('eventlisttbodytrtd');
						var cell7 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');
						var cell8 = $('<td></td>').text(data.m_arating).addClass('eventlisttbodytrtd');
						var cell9 = $('<td></td>').text(data.c_arating).addClass('eventlisttbodytrtd');
						var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_onote).addClass('eventlisttbodytrtd');
						var saonote =  $('<input type="text" width="500px" /> ').val(data.sa_onote).addClass('eventlisttbodytrtd');
						var cell10 = $('<td></td>').html(saonote).addClass('eventlisttbodytrtd').append(wordsanote);
 						var rowtb = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10]);
 						docFragtb.append(rowtb);
						}//end if
				  
				  else if(id=="m"){					  	  				
					   tb.empty();
					   var toggleword =$('<input type="checkbox" name="otoggle"/>').val(data.M_id);     
					   var mid =  $('<input type="button" width="500px" /> ').val(data.M_id).addClass('eventlisttbodytrtd');
					   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.M_id).addClass('eventlisttbodytrtd');
					   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);  
					   var cell1 = $('<td></td>').html(mid).addClass('eventlisttbodytrtd').append(midwordmid);
					   var cell2 = $('<td></td>').text(data.B_name).addClass('eventlisttbodytrtd');
					   var cell3 = $('<td></td>').text(data.M_name).addClass('eventlisttbodytrtd');
					   var cell4 = $('<td></td>').text(data.M_city+data.M_district).addClass('eventlisttbodytrtd');
					   var cell5 = $('<td></td>').text(data.Mpros).addClass('eventlisttbodytrtd');
					   var cell6 = $('<td></td>').text(data.S_name).addClass('eventlisttbodytrtd');
					   var cell7 = $('<td></td>').text(data.M_arating).addClass('eventlisttbodytrtd');
					   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:3px;"></span> ').text(data.Sa_mnote).addClass('eventlisttbodytrtd');
					   var samnote =  $('<input type="text" width="500px" /> ').val(data.Sa_mnote).addClass('eventlisttbodytrtd');
					   var cell8 = $('<td></td>').html(samnote).addClass('eventlisttbodytrtd').append(wordsanote);
					   var rowtb = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]).addClass('eventlisttbodytrtd');				   
	  				   docFragtb.append(rowtb);
					}//end if
				   
					else if(id=="c"){
					   tb.empty();
					   var toggleword = $('<input type="checkbox" name="ctoggle" />').val(data.c_id);
					   var cell0 = $('<td></td>').append(toggleword);
					   var cell1 = $('<td></td>').text(data.c_jdate).addClass('eventlisttbodytrtd');;
					   var cell2 = $('<td></td>').text(data.c_id).addClass('eventlisttbodytrtd');;
					   var cell3 = $('<td></td>').text(data.c_name).addClass('eventlisttbodytrtd');;
					   var cell4 = $('<td></td>').text(data.c_city+data.c_district).addClass('eventlisttbodytrtd');;
					   var cell5 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');;
					   var cell6 = $('<td></td>').text(data.c_averrating).addClass('eventlisttbodytrtd');;
					   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_cnote).addClass('eventlisttbodytrtd');
					   var sacnote =  $('<input type="text" width="500px" /> ').val(data.sa_cnote).addClass('eventlisttbodytrtd');
					   var cell7 = $('<td></td>').text(samnote).addClass('eventlisttbodytrtd').append(wordsanote);;
					   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
					   docFragtb.append(row);
					   
						}// end if
					}// end each function
// 			   	}//end for loop
			   );//each
			   
			   th.append(docFragth);
			   tb.append(docFragtb);
// 			   datatableinit();// goes wrong often
			   
		  	 }//end get json function
			);//end get json
			   
	   }//end loadProduct(id) function
				function datatableinit(){
				table =	$('#eventlist').DataTable({
// 						retrieve: true,
			// 			"lengthMenu":[1, 2, 3, "All"],
// 						destroy: true,
// 						"pageLength": 1,
						 "lengthMenu": [ [1, 2, 50, -1], [1, 2, 50, "All"] ],
			// 			"iDisplayLength": 10
			//			  	destroy: true,
			//			 		aaData: response.data	
								 }//end datable attribute
						 );	//end datable		   
				   }//end datatableinit
				function datatabledestory(){
					$('#eventlist').DataTable({
						  	destroy: true,
			// 			 	aaData: response.data	
								 }//end datable attribute
						 );	//end datable	   
				   }//end datatabledestory function
				   
				   
</script>


</body>
</html>