<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<script src="../js/datatable/datatable/jquery.dataTables.min.js"></script>
	<script src="../js/datatable/jszip/jszip.min.js"></script>
	<script src="../js/datatable/pdf/pdfmake.min.js"></script>
	<script src="../js/datatable/button/buttons.html5.min.js"></script>
	<script src="../js/datatable/button/dataTables.buttons.min.js"></script>
<!-- 	<script src="../js/datatable/datatable/buttons.bootstrap.min.js"></script> -->
	<script src="../js/datatable/datatable/jquery.dataTables.min.js"></script>
	<script src="../js/datatable/datatable/dataTables.bootstrap.min.js"></script>
<!-- 	<script src="../js/datatable/fixedheader/dataTables.fixedHeader.min.js"></script> -->
	<script src="../js/datatable/responsive/dataTables.responsive.min.js"></script>
	<script src="../js/datatable/responsive/responsive.bootstrap.min.js"></script>
	<script src="../js/datatable/select/dataTables.select.min.js"></script>
	<link rel="stylesheet" href="../js/datatable/button/buttons.dataTables.min.css">
	<link rel="stylesheet" href="../js/datatable/button/buttons.bootstrap.min.css">
<!-- 	<link rel="stylesheet" href="../js/datatable/datatable/jquery.dataTables.min.css">	 -->
	<link rel="stylesheet" href="../js/datatable/datatable/dataTables.bootstrap.min.css">
<!-- 	<link rel="stylesheet" href="../js/datatable/fixedheader/fixedHeader.bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="../js/datatable/key/keyTable.bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="../js/datatable/responsive/responsive.dataTables.min.css"> -->
	<link rel="stylesheet" href="../js/datatable/responsive/responsive.bootstrap.min.css">
	<link rel="stylesheet" href="../js/datatable/select/select.foundation.min.css">


	
<style>
	.dataTables_wrapper{
		width:100%;
		margin:auto;width:80%;  
/* 		border: 2px solid blue; */
		horizontal-align:center;
		display:table;
	}
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
			
				<ul style="margin: auto;width:80%; horizontal-align:center;" class="nav nav-tabs nav-justified"  >
				
					<li  data-toggle="tab" role="presentation"  id="masterlist" data-id="m" class="active"><a href="#"><div>師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist" data-id="o" ><a href="#" ><div>訂單列表</div></a></li>
	
					<li  data-toggle="tab" role="presentation" id="customeranalysis" data-id="a"><a href="#"><div>用戶分析</div></a></li>
										
					<li  data-toggle="tab" role="presentation" id="adlist" data-id="ad"><a href="#"><div>廣告</div></a></li>
							
				</ul>
			</div>

		</nav>
			<div id="functionrow" style="margin: auto;width:80%; horizontal-align:center;" class="nav nav-tabs nav-justified">
			</div>
			
			<div id="subfunctionrow" style="margin: auto;width:80%; horizontal-align:center;" class="nav nav-tabs nav-justified">
			</div>
	</header>
<!-- Function button -->
	<div>
		
	</div>
<!-- main content here -->		
	<article>
	<table id="eventlist" class="table table-striped table-bordered" style="word-break: keep-all;display:table;text-align:center" >
<!-- 		<thead> -->
<!-- 			<th>1</th> -->
<!-- 			<th>2</th> -->
<!-- 	    </thead> -->
<!-- 		<tbody> -->
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
	
<!-- mail block from LIN DAN-->	

	<div class="modal fade" id="myModal01" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form method="POST" action="${pageContext.servletContext.contextPath}/email/Email.do"
				enctype="multipart/form-data">

				<div class="modal-content">
					<div class="modal-header">
						<H4 style="color: blue">
							email
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>

							</button>
						</H4>
					</div>
					<div class="modal-body">
						<table>
							<tr>
								<td>收件人 ： <input type="text" id="receiver" name="mss_id" required="true"
									/>
								</td>
							</tr>
						
							<tr>
								<td>主旨 ： <input type="text" id="messum" name="ms_summary" required="true"
									value="${param.ms_summary}" />${errorMsgs.email1}${errorMsgs.email2}
								</td>
							</tr>
						
							<tr>
								<td><label style="vertical-align: top">內容：
								
								<textarea name="ms_content" id="mescontent" style="width: 400px; height: 120px"
								placeholder="請輸入內容"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" id="btnsubmitmail" class="btn btn-primary" data-dismiss="modal">送出</button>			
					</div>
				</div>
			</form>
		</div>
	</div>
<!-- end mail block-->
	
<script>
	var table ;//datatable variable not in use
	var navagatorid = $('#navigator>ul>li.active').data('id');//top navigator
	var dfd = $.Deferred();
	var dfd2 = $.Deferred();
	var datastatus = null;
 	var datatime = null;
 	var xhr = null;
// 		$(document).ajaxComplete(function(){
// 			datatableinit(); //execute datable when ajax is done//fuck it, use deferred instead
// 		});	
$(function(){


		$('#eventlist').empty();
		$('#navigator>ul>li').on('click',navigatorevent);//upon swithing tab
		functionrow();// build functionrow
		subfunctionrow();// build function buttons

		$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		$('input[name="samnote"],[name="saonote"],[name="sacnote"]').on('change',updatenote);// input note
 	  	$('#subfunctionrow>a').on('click',togglehyper);//verify the master direct to other pages
 	  	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano)').on('click',togglegetmethod);//change m c o s_name//will return something when clicked, maill has it's own form action
 	  	$('#messagespanm,#messagespanc,#messagespano').on('click',mail);//mail
		
 	  	loadProduct('m','allmaster','alldate');//build dynamic table
 	  	datastatus = $('#functionrow>div>ul>li[name="datastatus"][data-buttonstate="selected"]').data('statusvalue');
 	 	datatime = $('#functionrow>div>ul>li[name="datatime"][data-buttonstate="selected"]').data('statusvalue');

		}// end ready function
	); //end ready   

	function mail(){
		var clickornot=false;
		  //get all toggled checkboxes 
        var checkboxdatas = [];
		var checkboxdatasmaster = [];
		var checkboxdatacustomer = [];
		 if(navagatorid=='o'){// mail to both side of the transaction//tested ok
	     	 $(":checkbox:checked").each(function(){            	  
	     		checkboxdatasmaster.push($(this).attr('data-receiver1'));
	     		checkboxdatacustomer.push($(this).attr('data-receiver2'));
	         }) 
	         if((checkboxdatasmaster.toString()=="")||(checkboxdatacustomer.toString()=="")){
 	     		 	alert("u forget to toggle the checkbox u dumb XD");
 	     	 }//end if
 	     	else{
 	     		 $('#btnsubmitmail').on('click',function(){
 	     			var hyperlinkstring = "${pageContext.servletContext.contextPath}/email/Email.do";
 	     			clickornot=!clickornot;
 					var mssid=$('#receiver').val();
	 				var mssum=$('#messum').val();
	 				var mscontent=$('#mescontent').val();
					$.post(hyperlinkstring,{"mss_id":mssid,"ms_content":mscontent,"ms_summary":mssum},function(){
						
							$('#myModal01').modal("hide");
					   
						if (clickornot==true){
			 	     		setTimeout(function () {
			 	     		$('#receiver').val(checkboxdatacustomer.toString()).text(checkboxdatacustomer.toString());
			 	     		$('#myModal01').modal('show');
			 	     		 }, 300);
			 	     			
						}	
					});//end get function

 				});//end on clck
 				if(clickornot==false){
	 				$('#receiver').val(checkboxdatasmaster.toString()).text(checkboxdatasmaster.toString());
	 				$('#myModal01').modal('show');
 				}//end if				

 	   		}//end else 
 		 }//end if o
 		 else{//mail to only one side//tested ok
 			$('#btnsubmitmail').unbind("click");
     	 		$(":checkbox:checked").each(function(){            	  
         	   		checkboxdatas.push($(this).attr('data-receiver'));  		
         	});//end each        
     	 	if(checkboxdatas.toString()==""){
     	     		 alert("u forget to toggle the checkbox u dumb XD");
     	     	 }//end if
     	 else{
					$('#receiver').val(checkboxdatas.toString()).text(checkboxdatas.toString());
		     		$('#myModal01').modal();
		     		
		     		$('#btnsubmitmail').on('click',function(){
		     			var hyperlinkstring = "${pageContext.servletContext.contextPath}/email/Email.do";
	 					var mssid=$('#receiver').val();
		 				var mssum=$('#messum').val();
		 				var mscontent=$('#mescontent').val();
						$.post(hyperlinkstring,{"mss_id":mssid,"ms_content":mscontent,"ms_summary":mssum},function(){
					    $('#myModal01').modal("hide");

					});	//end post function
				});//end post 
   			 }//end else 
 		 }//end else
 	}// end mail
 	

 	
 	function updatenote(){
				//tested ok
        		var valueattrr=$(this).val();// get input value
        		var nameattr=$(this).attr('name');//get input  name
        		var noteid=$(this).data('noteid');// get input id
        		console.log(noteid);
        		var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
// 				var ajaxurl = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?";
// 				var ajaxparam = "functionaction="+nameattr+"&notevalue="+valueattrr+"&noteid="+noteid;
        		//         		var hyperlinkparameter = "functionaction="+valueattrr+"&+toggledcheckbox="+checkboxdatas2;
//        	 	var hyperlinkstringwithparameter=hyperlinkstring+hyperlinkparameter;
      	$.post(hyperlinkstring,{"functionaction":nameattr,"notevalue":valueattrr,"noteid":noteid},function(data,status){alert(data)} )//end get function
// 		 	$('#eventlist').dataTable().fnDestroy();//in datatable initialization  use destory= true is better
// 			$('#eventlist').empty();//in datatable initialization use destory= true is better
		loadProduct(navagatorid,datastatus,datatime)
//       			loadajax(ajaxurl,ajaxparam);
//       			//assign the parameter to loadproduct or the code return nothing
//       			loadProduct(navagatorid,datastatus,datatime);
 		}// end updatenote
 		
 	function loadajax(ajaxurl,ajaxparam) {		
 	        xhr = new XMLHttpRequest();
 			
 			if (xhr != null){
 				xhr.addEventListener("readystatechange",callbackajax);
 	            xhr.open('GET',ajaxurl+ajaxparam);
 				xhr.send();	
 			}else{
 				alert("您的瀏覽器不支援Ajax功能!!");
 			}	
 		}
 		function callbackajax(){
 			if(xhr.readyState == 4){
 				if(xhr.status == 200){			
 	                var data = xhr.responseText;
 					alert(data);
 					console.log(data);
 					loadProduct(navagatorid,datastatus,datatime);
 					
 				}else{
 					alert(xhr.status + ":" + xhr.statusText);
 				}
 			}					
 			
 		}
	function navigatorevent(){// order is of utmost,get navigator id, clear the table, build 2nd row and buttons, set active and selected filter, send 3 parameters to loadproduct
		var id = $(this).data('id');
		navagatorid = id;

// 		$('#eventlist').empty();
		 $('#eventlist').DataTable().destroy();
		   $('#navigator>ul>li').removeClass('active');
		   $('#navigator>ul>li[data-id="' + id + '"]').addClass('active');
		 	functionrow();
		   
		    
		 datastatus = $('#functionrow>div>ul>li[name="datastatus"][data-buttonstate="selected"]').data('statusvalue');
		 if(id=='o'){
		  	 datatime = $('#functionrow>div>ul>li[name="datatime"][data-buttonstate="selected"]').data('statusvalue');//tested ok//only order tab has this event
		   }//end if  
		   else{
			 datatime = 'alltime';
		   }
		 subfunctionrow(); 
		 loadProduct(navagatorid,datastatus,datatime);

		   
	}//navigatorevent()
	
	function functionrow(){

		var docFragfunction2 = $(document.createDocumentFragment());
		
	   if( navagatorid== 'm'){
		   
 			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">'
			var dropdowntitlestate = 
				'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">師傅狀態<span class="caret"></span></button>';
			var dropdownmenucontent=
				'<li data-statusvalue="allmaster" data-buttonstate="selected" name="datastatus"><a href="#">所有師傅</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="未審核" name="datastatus"><a href="#" >未審核</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="審核通過" name="datastatus"><a href="#" >審核通過</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="審核未過" name="datastatus"><a href="#" >審核未過</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="停權中" name="datastatus"><a href="#">停權中</a></li>';
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontent +'</ul>';
			var buttongroupdivend ='</div>'	
			var masterstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;
			

			var showblacklistc = '<button type="button" data-id="showblacklistc" class="btn " style="background-color: #555555; color:white" >黑名單</button>';
			
			var li1 = $(masterstatus);
			var li2 = $(showblacklistc);
			docFragfunction2.append([li1,li2]);
			$('#functionrow').append(docFragfunction2);
			
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}//end else if
		
		else if(navagatorid== 'c'){
			
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">'
			var dropdowntitlestate = 
					'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">消費者狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
					'<li data-statusvalue="allcustomer" data-buttonstate="selected" name="datastatus"><a href="#">所有消費者</a></li><li role="separator" class="divider"></li>'
					+'<li data-statusvalue="停權中" name="datastatus"><a href="#">停權中</a></li>';
					
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';		
			var customerstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;
							
			var showblacklistc = '<button type="button" data-id="showblacklistc" class="btn " style="background-color: #555555; color:white" >黑名單</button>';				

			var li1 = $(customerstatus);
			var li2 = $(showblacklistc );
			docFragfunction2.append([li1,li2]);
			$('#functionrow').append(docFragfunction2);
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}//end else if
		
		else if(navagatorid== 'o'){
			
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">訂單狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
						'<li data-statusvalue="allorder" data-buttonstate="selected" name="datastatus"><a href="#">所有訂單</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="進行中" name="datastatus"><a href="#">進行中</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已刪除" name="datastatus"><a href="#">已刪除</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="一方未評分" name="datastatus"><a href="#">一方未評分</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已完成" name="datastatus"><a href="#">已完成</a></li>';
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';
			var orderstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;
				
			var dropdowntitletime = 
				'<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">日期篩選<span class="caret"></span></button>';
			var dropdownmenucontenttime=
				'<li  data-statusvalue="halfyear" name="datatime"><a href="#">最近半年</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="oneyear" name="datatime"><a href="#">最近一年</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="onemonth" name="datatime"><a href="#">最近一個月</a></li><li role="separator" class="divider"></li>'
				+'<li data-statusvalue="alldate" data-buttonstate="selected" name="datatime" ><a href="#">全部</a></li><li role="separator" class="divider"></li>';
			var dropdownmenutime = '<ul class="dropdown-menu">'+dropdownmenucontenttime +'</ul>';
			var mastertime = buttongroupdiv+dropdowntitletime+dropdownmenutime+buttongroupdivend;
			
			var li1 = $(orderstatus);
			var li2 = $(mastertime);
			docFragfunction2.append([li1,li2]);
			$('#functionrow').append(docFragfunction2);
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
 		}// end else if 

	}//end functionrow
	
		function functionrowfiltering(){
		
 
				id = navagatorid;//tested ok//get navagitor id
			 	datastatus = $(this).data('statusvalue');//tested ok//both status and time selection have datastatus which makes me easiler to change their selected attribute without knowing what they are
			 	whattype= $(this).attr('name');//tested ok// to know the type of the clicked
			 	if(whattype=="datastatus"){//tested ok
				   $('#functionrow>div>ul>li[name="datastatus"]').removeAttr('data-buttonstate');//remove the selected attribute of all status 
				   $('#functionrow>div>ul>li[data-statusvalue="'+datastatus+'"]').attr('data-buttonstate','selected');// assign the clicked to the currently selected 		   
			 	}//end if
			 	if(whattype=="datatime"){
					   $('#functionrow>div>ul>li[name="datatime"]').removeAttr('data-buttonstate');//remove the selected attribute of all status 
					   $('#functionrow>div>ul>li[data-statusvalue="'+datastatus+'"]').attr('data-buttonstate','selected');// assign the clicked as currently selected 		   
				 }//end if
			   datastatus = $('#functionrow>div>ul>li[name="datastatus"][data-buttonstate="selected"]').data('statusvalue');//tested ok// asign the variable to utilized the still selected datastatus
			   if(id=='o'){
			  	 datatime = $('#functionrow>div>ul>li[name="datatime"][data-buttonstate="selected"]').data('statusvalue');//tested ok//only order tab has this event
			   }//end if
			   else{
				   datatime='alltime';
			   }
			   $('#eventlist').DataTable().destroy(); 
// 				$('#eventlist').empty();
			   loadProduct(id,datastatus,datatime);
			   // $('#navigator>ul>li[data-id="' + id + '"]')
			   
			   //rebinding
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
			
		}//end table filtering
	
	   function subfunctionrow(){

			var docFragsubfunction = $(document.createDocumentFragment());
		   if( navagatorid== 'm'){
				$('#subfunctionrow').empty();
				var applicationreviewm = '<a href="" id="applymasterlink" name="applicationreviewm"><input type="button" value="審核師傅" /></a>';
				var suspensionm = '<span id="suspensionm" value="suspensionm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="停權" "/></span>';
				var sendmessagem = '<span id="messagespanm" value="sendmessagem" name="functionaction" style="padding:0px; margin:0px;" ><input type="button"   value="傳送訊息" "/></span>';
				var blacklistm = '<span value="blacklistm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="黑名單" "/></span>';
				var b1 = $(applicationreviewm);
				var b2 = $(suspensionm);
				var b3 = $(sendmessagem);
				var b4 = $(blacklistm);
				docFragsubfunction.append([b1,b2,b3,b4]);
				$('#subfunctionrow').append(docFragsubfunction);
				
				//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano').on('click',mail);//will return something when clicked, maill has it's own form action

		   }//end else if
			
			else if(navagatorid== 'c'){
				$('#subfunctionrow').empty();
				var suspensionc = '<span id="suspensionc" value="suspensionc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="停權"/></span>';
				var sendmessagec = '<span id="messagespanc" value="sendmessagec" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="傳送訊息" /></span>';
				var blacklistc = '<span value="blacklistc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="黑名單" /></span>';
				var b1 = $(suspensionc);
				var b2 = $(sendmessagec);
				var b3 = $(blacklistc);
				docFragsubfunction.append([b1,b2,b3]);
				$('#subfunctionrow').append(docFragsubfunction);
				
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('span:not(#messagespanm,#messagespanc,#messagespano)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano').on('click',mail);//will return something when clicked, maill has it's own form action

			}//end else if
			
			else if(navagatorid== 'o'){
				$('#subfunctionrow').empty();
				var sendmessageo = '<span id="messagespano" value="sendmessageo" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="訊息" "/></span>';
				var b1 = $(sendmessageo);
				docFragsubfunction.append([b1]);
				$('#subfunctionrow').append(docFragsubfunction);
				
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
// 			 	$('#subfunctionrow>span[id!="messagespanm"],#subfunctionrow>span[id!="messagespanc"],#subfunctionrow>span[id!="messagespano"]').on('click',mail);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano').on('click',mail);//will return something when clicked, maill has it's own form action

			}// end else if 
	
		}//end functionrow
		
		
		
		function togglehyper(){
			var valueattr =$(this).val();
			var nameattr=$(this).attr('name');
	            //get all toggled checkboxes 
	           var checkboxdatas = [];
	        	 $(":checkbox:checked").each(function(){            	  
	            	   checkboxdatas.push($(this).val()); 
	            })
	            var checkboxdatas2=checkboxdatas.toString();
	            if(checkboxdatas2==""){
	        		 alert("u forget to toggle the checkbox u dumb XD");
	        	 }//end if
	        	 else{
	        	   var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?";
	               var hyperlinkparameter = "functionaction="+nameattr+"&+toggledcheckbox="+checkboxdatas2;
	               var hyperlinkstringwithparameter=hyperlinkstring+hyperlinkparameter;
		           $('#applymasterlink').attr("href",hyperlinkstringwithparameter);
		           $('#applymasterlink').click();
	            // $('#subfunctionrow').submit();
// 	            $("#eventlist>tbody>tr>td>input:checked").each(function(){
// 	            	var toggledvalue =$(this).val();	            	
// 	            })//end each
				//tested ok
	         }//end else 
		}//end togglerow
		
		function togglegetmethod(){
	          
            //get all toggled checkboxes 
           var checkboxdatas = [];
        	 $(":checkbox:checked").each(function(){            	  
            	   checkboxdatas.push($(this).val()); 
            })
            
            var checkboxdatas2=checkboxdatas.toString();
        	 if(checkboxdatas2==""){
        		 alert("u forget to toggle the checkbox u dumb XD");
        	 }//end if
        	 else{
           	var valueattrr=$(this).attr('value');//retrieve the value from functinaction
           	var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
//            	var hyperlinkparameter = "functionaction="+valueattrr+"&+toggledcheckbox="+checkboxdatas2;
//           	var hyperlinkstringwithparameter=hyperlinkstring+hyperlinkparameter;
//          		var ajaxurl = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?";
// 				var ajaxparam = "functionaction="+valueattrr+"&toggledcheckbox="+checkboxdatas2;
// 				loadajax(ajaxurl,ajaxparam);

			$.post(hyperlinkstring,{"functionaction":valueattrr,"toggledcheckbox":checkboxdatas2},function(data){
				alert(data);
           });//end get function
// 		 	$('#eventlist').dataTable().fnDestroy();
//    			$('#eventlist').empty();

           loadProduct(navagatorid,datastatus,datatime);
       }//end else 
	}//end togglerow
	
	
	   function loadProduct(id,datastatus,datatime){
// 		   "datastatus":datastatus,"datatime":datatime
			
					   
			 $.getJSON('${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIServlet.do',{'navigatorid':id,"datastatus":datastatus,"datatime":datatime}, function(data){
				 buildtable(id,data,datatime);
				 $.when(dfd)//super great
// 				 .done(alert("first"))
// 				 .done(alert("second"))
				 .done(datatableinit);//super great
// 				 .done($(".dataTables_wrapper").css("width","80%"));
			 });//end get json
	}//end loadproduct
	
	 function buildtable(id,datas){	
		 dfd = $.Deferred();
		 var table = $('#eventlist');
		 table.empty();
		 var th = $('<thead></thead>'); 
		 var tb = $('<tbody></tbody>'); 
		   var docFragth = $(document.createDocumentFragment());
		   var docFragtb = $(document.createDocumentFragment());
		   
			   if(id=="o"){   					  
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
				   else if(id=="r"){
					  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					    var thc1 = $('<th></th>').text('檢舉日期').addClass('eventlistthreadtrth');
						var thc2 = $('<th></th>').text('檢舉人').addClass('eventlistthreadtrth');
						var thc3 = $('<th></th>').text('檢舉主旨').addClass('eventlistthreadtrth');
						var thc4 = $('<th></th>').text('檢舉案件狀態').addClass('eventlistthreadtrth');
						var thc5 = $('<th></th>').text('檢舉訂單').addClass('eventlistthreadtrth');
						var thc6 = $('<th></th>').text('檢舉留言').addClass('eventlistthreadtrth');
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
						   	
						   	var toggleword = $('<input type="checkbox" name="otoggle" />').val(data.o_id).attr('data-receiver1',data.o_bname).attr('data-receiver2',data.c_id);
						   	var mid =  $('<input type="button"/> ').val(data.o_id).addClass('eventlisttbodytrtd');
							var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findorder&targetid="+data.o_id).append(mid);						  
							var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.o_id).addClass('eventlisttbodytrtd');
							var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
						  	var cell1 = $('<td></td>').text(data.o_tdate).addClass('eventlisttbodytrtd');
							var cell2 = $('<td></td>').text(data.o_bname).addClass('eventlisttbodytrtd');
							var cell3 = $('<td></td>').text(data.c_id).addClass('eventlisttbodytrtd');
							var cell4 = $('<td></td>').html(a).addClass('eventlisttbodytrtd');
	 						var cell5 = $('<td></td>').text(data.opros).addClass('eventlisttbodytrtd');
							var cell6 = $('<td></td>').text(data.o_location).addClass('eventlisttbodytrtd');
							var cell7 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');
							var cell8 = $('<td></td>').text(data.m_rating).addClass('eventlisttbodytrtd');
							var cell9 = $('<td></td>').text(data.c_rating).addClass('eventlisttbodytrtd');
							var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_onote).addClass('eventlisttbodytrtd');
							var saonote =  $('<input type="text"name="saonote" width="500px" /> ').val(data.sa_onote).attr('data-noteid',data.o_id).addClass('eventlisttbodytrtd');
							var cell10 = $('<td></td>').html(saonote).addClass('eventlisttbodytrtd').append(wordsanote);
	 						var rowtb = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10]);
	 						docFragtb.append(rowtb);
	 						
						}//end if
				  
				  else if(id=="m"){				
					  
					  
					   var toggleword =$('<input type="checkbox" name="mtoggle"/>').val(data.M_id).attr('data-receiver',data.B_name);;     
					   var mid =  $('<input type="button"/> ').val(data.M_id).addClass('eventlisttbodytrtd');
					   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.M_id).append(mid);						  
					   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.M_id).addClass('eventlisttbodytrtd');
					   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);  
					   var cell1 = $('<td></td>').html(a).addClass('eventlisttbodytrtd').append(midwordmid);
					   var cell2 = $('<td></td>').text(data.B_name).addClass('eventlisttbodytrtd');
					   var cell3 = $('<td></td>').text(data.M_name).addClass('eventlisttbodytrtd');
					   var cell4 = $('<td></td>').text(data.M_city+data.M_district).addClass('eventlisttbodytrtd');
					   var cell5 = $('<td></td>').text(data.Mpros).addClass('eventlisttbodytrtd');
					   var cell6 = $('<td></td>').text(data.S_name).addClass('eventlisttbodytrtd');
					   var cell7 = $('<td></td>').text(data.M_arating).addClass('eventlisttbodytrtd');
					   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:3px;"></span> ').text(data.Sa_mnote).addClass('eventlisttbodytrtd');
					   var samnote =  $('<input type="text" name="samnote" width="500px" /> ').val(data.Sa_mnote).attr('data-noteid',data.M_id).addClass('eventlisttbodytrtd');
					   var cell8 = $('<td></td>').html(samnote).addClass('eventlisttbodytrtd').append(wordsanote);
					   var rowtb = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]).addClass('eventlisttbodytrtd');				   
	  				   docFragtb.append(rowtb);
	  				   
					}//end if
				   
					else if(id=="c"){
						
						
					   var toggleword = $('<input type="checkbox" name="ctoggle" />').val(data.c_id).attr('data-receiver',data.c_id);
					   var mid =  $('<input type="button" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
					   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid);						  
					   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
					   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
					   var cell1 = $('<td></td>').text(data.c_jdate).addClass('eventlisttbodytrtd');;
					   var cell2 = $('<td></td>').html(a).addClass('eventlisttbodytrtd').append(midwordmid);
					   var cell3 = $('<td></td>').text(data.c_name).addClass('eventlisttbodytrtd');;
					   var cell4 = $('<td></td>').text(data.c_city+data.c_district).addClass('eventlisttbodytrtd');;
					   var cell5 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');;
					   var cell6 = $('<td></td>').text(data.c_averrating).addClass('eventlisttbodytrtd');;
					   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_cnote).addClass('eventlisttbodytrtd');
					   var sacnote =  $('<input type="text" name="sacnote" id= width="500px" /> ').val(data.sa_cnote).attr('data-noteid',data.c_id).addClass('eventlisttbodytrtd');
					   var cell7 = $('<td></td>').html(sacnote).addClass('eventlisttbodytrtd').append(wordsanote);;
					   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
					   docFragtb.append(row);
					   
						}// end if
						
					else if(id=="r"){
						   var toggleword = $('<input type="checkbox" name="ctoggle" />').val(data.c_id).attr('data-receiver',data.c_id);
						   var mid =  $('<input type="button" style="width:100px;word-break: keep-all"/> ').val(data.r_id).addClass('eventlisttbodytrtd');
						   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid);						  
						   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
						   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
						   var cell1 = $('<td></td>').text(data.r_date).addClass('eventlisttbodytrtd');;
						   var cell2 = $('<td></td>').html(a).addClass('eventlisttbodytrtd').append(midwordmid);
						   var cell3 = $('<td></td>').text(data.c_id).addClass('eventlisttbodytrtd');;
						   var cell4 = $('<td></td>').text(data.p_summary).addClass('eventlisttbodytrtd');;
						   var cell5 = $('<td></td>').text(data.p_content).addClass('eventlisttbodytrtd');;
						   var cell6 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');;
						   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_rnote).addClass('eventlisttbodytrtd');
						   var sacnote =  $('<input type="text" name="sacnote" id= width="500px" /> ').val(data.sa_rnote).attr('data-noteid',data.r_id).addClass('eventlisttbodytrtd');
						   var cell7 = $('<td></td>').html(sacnote).addClass('eventlisttbodytrtd').append(wordsanote);;
						   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
						   docFragtb.append(row);						
					}
				}// end each function
// 			 }//end for loop
		 );//each
			   
			   th.append(docFragth);
			   tb.append(docFragtb);
			   table.append(th);
			   table.append(tb);
			   //rebinding tested ok
			   $('input[name="samnote"],[name="saonote"],[name="sacnote"]').on('change',updatenote);// input note

			   dfd.resolve();
			   return dfd;
// 			   datatableinit();// goes wrong often
			   			   
	   }//end loadtable function
				function datatableinit(){
					dom: 'Bfrtip', 
				table =	$('#eventlist').DataTable({
					 "autoWidth": true,
					buttons: [
						'copy', 'csv', 'excel', 'pdf', 'print'
				    ],
				    
			    select: true,
// 			        responsive: {
// 			            details: {
// 			                display: $.fn.dataTable.Responsive.display.modal( {
// 			                    header: function ( row ) {
// 			                        var data = row.data();
// 			                        return 'Details for '+data[0]+' '+data[1];
// 			                    }
// 			                } ),
// 			                renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
// 			                    tableClass: 'ui table'
// 			                } )
// 			            }
// 			        },
// 						retrieve: true,
						destroy: true,
// 						"pageLength": 1,
// 						"dom": '<lf<t>ip>',
						 "lengthMenu": [ [5, 10, 50, -1], [5, 10, 50, "All"] ]
			// 			"iDisplayLength": 10
			//			  	destroy: true,
						 	   
				   }//end datatableinit
				);}	//end datable	
				   
				   
</script>


</body>
</html>