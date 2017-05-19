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
<!------------------------ flatui ------------------------------>	
	<link href="../js/flatui/flat-ui.min.css" rel="stylesheet">
	<link href="../js/flatui/lato/*" rel="stylesheet">
	<script src="../js/flatui/flat-ui.min.js"></script>

<!-------------------- navigation for this application---------- -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">

<!-------------------------------- chart----------------- -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<!--------------------------------end chart----------------- -->	
<style>
/* ---------------------charts------------------------ */
#charts {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
/* ---------------------end charts------------------------ */
 	.dataTables_wrapper{ 
 		padding:30px; 
 		width:100%; 
 		margin:auto;
 		  
/*  	border: 2px solid blue;  */
 		horizontal-align:center; 
 		display:table; 
/* 		background-color:#e7eae1;*/  
/* 		color:white;  */
/* 	} */
/* 	.tablewrapper{ */
/* 		padding:30px; */
/* 		width:70%; */
/* 		margin:auto;width:80%;   */
/* /* 		border: 2px solid blue; */ */
/* 		horizontal-align:center; */
/* 		display:block; */

/* 	} */
/* 	#eventlist thead tr th { */
/* 		background-color:blue; */
/* 	} */
/* 	#eventlist tbody tr { */
		
/* 		color:black; */
/* 	} */
/* 	#eventlist tbody tr:nth-child(even) { */
/* 		background-color:#e7eae1; */
/* 		color:black; */
/* 	} */
/* 	#eventlist tbody tr:hover { */
/* 		background-color:#e4eff1; */
/* 		color:white; */
/* 	} */
/* 	#eventlist tbody tr:selected { */
/* 		background-color:#e4eff1; */
/* 		color:white; */
/* 	} */
	.buttonstyle{
		width:130px;
		height:60px;
		font-size:20px;
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
	
	$('#eventlist').dataTable tbody tr td:selected {
    color: black;
    background-color: #9AAAE1;
}
	
</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<!-- navigator -->
	<header >
		<nav style="margin-top:50px;">
			<div id="navigator"  >
			
				<ul style="margin: auto;width:100%; horizontal-align:center;" class="nav nav-tabs nav-justified"  >
				
					<li  data-toggle="tab" role="presentation"  id="masterlist" data-id="m" class="active"><a href="#"><div>師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist" data-id="o" ><a href="#" ><div>訂單列表</div></a></li>
	
					<li  data-toggle="tab" role="presentation" id="managerchart" data-id="a"><a href="#"><div>統計圖表</div></a></li>
										
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
<!-------------------------------------- main content here -->		
	<article>
	<div class="tablewrapper">
		
		<div id="tabletool" class="bg-info"style="width:100%; border:1px solid blue;margin:auto;padding:20px;display:table;text-align:left">
			
		</div>
		
		<table id="eventlist" class="table table-striped table-bordered table-hover" style="word-break: keep-all;display:table;text-align:center" >
	<!-- 		<thead> -->
	<!-- 			<th>1</th> -->
	<!-- 			<th>2</th> -->
	<!-- 	    </thead> -->
	<!-- 		<tbody> -->
	<!-- 			<tr><td>1</td><td>2</td></tr> -->
	<!-- 			<tr><td>1</td><td>2</td></tr> -->
	<!-- 		</tbody> -->
		
		</table>
	</div>
<!-- 	<div> -->
<!-- 		<select id="pageselectid" name="pageselectname"> -->
<!-- 			<option id="pagename" value="page1"/> -->
<!-- 			<option id="pagename" value="page2"/> -->
<!-- 			<option id="pagename" value="page3"/> -->
<!-- 		</select> -->
<!-- 	</div> -->
	<input type="hidden" />
	</article>
	
<!-- ------------------------------------mail block from LIN DAN------------------------------->	

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
<!-- ----------------------------------end mail block------------------------------------------------->
<!-- -----------------------------Report Modal---------------------------------------- -->
<div class="modal fade" id="ormodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	
        <div class="modal-title" style="margin-top:30px;">檢舉人</div><span  id="reporter"></span>
		<br>       
		<div class="modal-title">被檢舉人<div><span  id="reported"></span></span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label" >主旨:</label>
            <textarea readonly class="form-control" id="reportextract"></textarea>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label" >檢舉內容:</label>
            <textarea readonly class="form-control" id="reportcontent"></textarea>
            
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>	
<!-- -----------------------------end Report Modal---------------------------------------- -->
<!-- -----------------------------Order Modal---------------------------------------- -->

<!-- -----------------------------end Order and Report Modal---------------------------------------- -->

<!-- ---------------------------chart--------- -->
<div id="charts"></div>
<!-- ---------------------------end chart--------- -->
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
		
		$('input[name="samnote"],[name="saonote"],[name="sacnote"]').on('change',updatenote);// input note
 	  	$('#subfunctionrow>a').on('click',togglehyper);//verify the master direct to other pages
 	  	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad)').on('click',togglegetmethod);//change m c o s_name//will return something when clicked, maill has it's own form action
 	  	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad').on('click',mail);//mail
		
 	  	loadProduct('m','allmaster','alldate');//build dynamic table
 	  	datastatus = $('#functionrow>div>ul>li[name="datastatus"][data-buttonstate="selected"]').data('statusvalue');
 	 	datatime = $('#functionrow>div>ul>li[name="datatime"][data-buttonstate="selected"]').data('statusvalue');

		}// end ready function
	); //end ready  
	function chart(){
		
		Highcharts.chart('managerchart', {

		    title: {
		        text: 'Solar Employment Growth by Sector, 2010-2016'
		    },

		    subtitle: {
		        text: 'Source: thesolarfoundation.com'
		    },

		    yAxis: {
		        title: {
		            text: 'Number of Employees'
		        }
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle'
		    },

		    plotOptions: {
		        series: {
		            pointStart: 2010
		        }
		    },

		    series: [{
		        name: 'Installation',
		        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
		    }, {
		        name: 'Manufacturing',
		        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
		    }, {
		        name: 'Sales & Distribution',
		        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
		    }, {
		        name: 'Project Development',
		        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
		    }, {
		        name: 'Other',
		        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
		    }]

		});
	}
	function showreport(){
	 	
				var receiver1 =	$(this).attr('data-receiver1');
				var receiver2 =	$(this).attr('data-receiver2');
				var extract =	$(this).attr('data-extract');
				var datacontent =	$(this).attr('data-content');
				$('#reporter').text(receiver1);
				$('#reported').text( receiver2);
				$('#reportextract').text(extract);				
				$('#reportcontent').text(datacontent);
				$('#ormodal').modal();
	     				  				
	}
	function mail(){
		var clickornot=false;
		  //get all toggled checkboxes 
        var checkboxdatas = [];
		var checkboxdatasmaster = [];
		var checkboxdatacustomer = [];
		// double mail effect---need to set c_id in mail servlet,or there will be only 1 time mail,because the quest has been forward to other place
		 if((navagatorid=='o')||(navagatorid=='r')){// mail to both side of the transaction//tested ok
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
				'<button type="button" class="btn btn-primary dropdown-toggle" style="width:130px;height:50px" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">師傅狀態<span class="caret"></span></button>';
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
			
			docFragfunction2.append([li1]);			
			$('#tabletool').append($('#functionrow').append(docFragfunction2));
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
			
			docFragfunction2.append([li1]);
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
						+'<li data-statusvalue="未回應" name="datastatus"><a href="#">已刪除</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="一方未評分" name="datastatus"><a href="#">一方未評分</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已完成" name="datastatus"><a href="#">已完成</a></li>'
						+'<li data-statusvalue="已刪除" name="datastatus"><a href="#">已完成</a></li>';
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
		else if(navagatorid== 'r'){
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">訂單狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
						'<li data-statusvalue="allreport" data-buttonstate="selected" name="datastatus"><a href="#">所有檢舉</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="進行中" name="datastatus"><a href="#">未解決</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已刪除" name="datastatus"><a href="#">已解決</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="一方未評分" name="datastatus"><a href="#">已刪除</a></li><li role="separator" class="divider"></li>';						
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';
			var reportstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;		
			var li1 = $(reportstatus);
			docFragfunction2.append([li1]);
			$('#functionrow').append(docFragfunction2);
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}
		else if(navagatorid== 'ad'){
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">訂單狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
						'<li data-statusvalue="allreport" data-buttonstate="selected" name="datastatus"><a href="#">所有廣告</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="進行中" name="datastatus"><a href="#">未解決</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已結束" name="datastatus"><a href="#">已解決</a></li><li role="separator" class="divider"></li>';
												
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';
			var reportstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;		
			var li1 = $(reportstatus);
			docFragfunction2.append([li1]);
			$('#functionrow').append(docFragfunction2);
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}
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
			   
			   // $('#navigator>ul>li[data-id="' + id + '"]')
			   
			   //rebinding
			
			loadProduct(id,datastatus,datatime);
			
		}//end table filtering
	
	   function subfunctionrow(){

			var docFragsubfunction = $(document.createDocumentFragment());
		   if( navagatorid== 'm'){
				$('#subfunctionrow').empty();
				var applicationreviewm = '<a href="" id="applymasterlink" name="applicationreviewm"><input type="button" class="btn btn-success"value="審核師傅" /></a>';
				var suspensionm = '<span id="suspensionm" value="suspensionm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button"class="btn btn-danger" value="停權" "/></span>';
				var sendmessagem = '<span id="messagespanm" value="sendmessagem" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-info"  value="傳送訊息" "/></span>';
				var b1 = $(applicationreviewm);
				var b2 = $(suspensionm);
				var b3 = $(sendmessagem);
				docFragsubfunction.append([b1,b2,b3]);
				
				$('#tabletool').append($('#subfunctionrow').append(docFragsubfunction));
				//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

		   }//end else if
			
			else if(navagatorid== 'c'){
				$('#subfunctionrow').empty();
				var suspensionc = '<span id="suspensionc" value="suspensionc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="停權"/></span>';
				var sendmessagec = '<span id="messagespanc" value="sendmessagec" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" value="傳送訊息" /></span>';
				var b1 = $(suspensionc);
				var b2 = $(sendmessagec);
				docFragsubfunction.append([b1,b2]);
				
				$('#tabletool').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

			}//end else if
			
			else if(navagatorid== 'o'){
				$('#subfunctionrow').empty();
				var sendmessageo = '<span id="messagespano" value="sendmessageo" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="訊息" /></span>';
				var b1 = $(sendmessageo);
				docFragsubfunction.append([b1]);
				
				$('#tabletool').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
// 			 	$('#subfunctionrow>span[id!="messagespanm"],#subfunctionrow>span[id!="messagespanc"],#subfunctionrow>span[id!="messagespano"]').on('click',mail);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

			}// end else if 
			else if(navagatorid== 'r'){
				$('#subfunctionrow').empty();
				var sendmessager = '<span id="messagespanr" value="sendmessager" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="訊息" /></span>';
				var b1 = $(sendmessager);
				docFragsubfunction.append([b1]);
				
				$('#tabletool').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
 			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

				
			}
			else if(navagatorid== 'ad'){
				$('#subfunctionrow').empty();
				var sendmessager = '<span id="messagespanad" value="sendmessagead" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="訊息" /></span>';
				var stopad = '<span id="stopad" value="stopad" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" value="終止廣告" "/></span>';
				var b1 = $(sendmessager);
				var b2 = $(stopad);
				docFragsubfunction.append([b1,b2]);
				
				$('#tabletool').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
 			 	$('span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

				
			}
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
				 buildtable(id,data);
				 $.when(dfd)//super great
//				 .done(alert("first"))
//				 .done(alert("second"))
			 .done(datatableinit);//super great
//				 .done($(".dataTables_wrapper").css("width","80%"));
			 });//end get json
// 			 setTimeout(function () {
// 	 	     		$('#receiver').val(checkboxdatacustomer.toString()).text(checkboxdatacustomer.toString());
// 	 	     		$('#myModal01').modal('show');
// 	 	     		 }, 300);
			
	}//end loadproduct
	
	 function buildtable(id,datas){	
		 dfd = $.Deferred();
		 var table = $('#eventlist');
		 table.empty();
		 var th = $('<thead></thead>'); 
		 var tb = $('<tbody></tbody>'); 
		   var docFragth = $(document.createDocumentFragment());
		   var docFragtb = $(document.createDocumentFragment());
		   var docFrag3 = $(document.createDocumentFragment());
		   
		   if(id=="a"){
				 var chardiv = $('<div id="managerchart"></div>');
				 docFrag3.append(chardiv);
				 $('#charts').append(docFrag3);
				 chart();			 
			}
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
					  	var thc1 = $('<th></th>').text('檢舉編號').addClass('eventlistthreadtrth');
					  	var thc2 = $('<th></th>').text('檢舉日期').addClass('eventlistthreadtrth');
						var thc3 = $('<th></th>').text('消費者').addClass('eventlistthreadtrth');
						var thc4 = $('<th></th>').text('師傅').addClass('eventlistthreadtrth');
						var thc5 = $('<th></th>').text('檢舉主旨').addClass('eventlistthreadtrth');
						var thc6 = $('<th></th>').text('檢舉案件狀態').addClass('eventlistthreadtrth');
						var thc9 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
						var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8,,thc9]);
						docFragth.append(rowth);					   
				   }
				   else if(id=="ad"){
					  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					  	var thc1 = $('<th></th>').text('廣告編號').addClass('eventlistthreadtrth');
					  	var thc2 = $('<th></th>').text('預約日期').addClass('eventlistthreadtrth');
						var thc3 = $('<th></th>').text('結束日期').addClass('eventlistthreadtrth');
						var thc4 = $('<th></th>').text('師傅編號').addClass('eventlistthreadtrth');
						var thc5 = $('<th></th>').text('廣告狀態').addClass('eventlistthreadtrth');
						var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5]);
						docFragth.append(rowth);					   
				   }
			   $.each(datas,function(i,data){
				   console.log(data);//for test
				   
// 				   		pageselection();
// 						for(var i=pageIndex;i<pageIndex+rowsPerPage;i++){
					   
					   if(id=="o"){
						   
						   	console.log(data);
						   	
						   	var toggleword = $('<input  type="checkbox" name="otoggle" />').val(data.o_id).attr('data-receiver1',data.o_bname).attr('data-receiver2',data.c_id);
						   	
						   	var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
						  	var cell1 = $('<td></td>').text(data.o_tdate).addClass('eventlisttbodytrtd');
						  	var mid =  $('<input type="button" class="btn btn-success"/> ').val("m"+data.m_id).addClass('eventlisttbodytrtd');
							var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.m_id).append(mid);						  
							var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.o_bname).addClass('eventlisttbodytrtd');
						  	var cell2 = $('<td></td>').text(data.o_bname).html(a).val(data.m_id).addClass('eventlisttbodytrtd').append(midwordmid);
						  	var mid2 =  $('<input type="button" class="btn btn-info" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
							var a2 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid2);						  
							var midwordmid2 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
						  	var cell3 = $('<td></td>').html(a2).addClass('eventlisttbodytrtd').append(midwordmid2);
							var cell4 = $('<td></td>').text("ord"+data.o_id).addClass('eventlisttbodytrtd');
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
					  
					  
					   var toggleword =$('<input type="checkbox"   name="mtoggle"/>').val(data.M_id).attr('data-receiver',data.B_name);;     
					   var mid =  $('<input type="button" class="btn btn-success"/> ').val("m"+data.M_id).addClass('eventlisttbodytrtd');
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
					   var mid =  $('<input type="button" class="btn btn-info" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
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
						   var toggleword = $('<input type="checkbox" name="ctoggle" />').val(data.r_id).attr('data-receiver1',data.m_id).attr('data-receiver2',data.c_id).attr('data-extract',data.p_summary).attr('data-content',data.p_content);
						   var mid =  $('<input type="button" class="btn btn-primary" name="reportevent"  />').val(data.r_id).addClass('eventlisttbodytrtd').attr('data-receiver1',data.m_id).attr('data-receiver2',data.c_id).attr('data-extract',data.p_summary).attr('data-content',data.p_content);
						   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.r_id).addClass('eventlisttbodytrtd');
						   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
						   var cell1 = $('<td name="reportevent"></td>').html(mid).addClass('eventlisttbodytrtd').append(midwordmid);
						   var cell2 = $('<td></td>').text(data.r_date).addClass('eventlisttbodytrtd');;			   
						   var mid3 =  $('<input type="button" class="btn btn-info" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
						   var a3 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid3);						  
						   var midwordmid3 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
						   var cell3 = $('<td></td>').html(a3).addClass('eventlisttbodytrtd').append(midwordmid3);
						   var mid2 =  $('<input type="button" class="btn btn-success"/> ').val(data.m_id).addClass('eventlisttbodytrtd');
						   var a2 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.m_id).append(mid2);						  
						   var midwordmid2 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.m_id).addClass('eventlisttbodytrtd');
						   var cell4 = $('<td></td>').html(a2).addClass('eventlisttbodytrtd').append(midwordmid2);
						   var cell5 = $('<td></td>').text(data.p_summary).addClass('eventlisttbodytrtd');
						   var cell6 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');
						   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_rnote).addClass('eventlisttbodytrtd');
						   var sarnote =  $('<input type="text" name="sarnote" id= width="500px" /> ').val(data.sa_rnote).attr('data-noteid',data.r_id).addClass('eventlisttbodytrtd');
						   var cell7 = $('<td></td>').html(sarnote).addClass('eventlisttbodytrtd').append(wordsanote);
						   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
						   docFragtb.append(row);						
					}
					else if(id=="ad"){
						
						   var toggleword = $('<input type="checkbox" name="ctoggle" />').val(data.ad_id).attr('data-receiver',data.m_id);
						   var mid =  $('<input type="button" class="btn btn-warning"/>').val(data.ad_id).addClass('eventlisttbodytrtd');
						   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.ad_id).append(mid);						  
						   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.ad_id).addClass('eventlisttbodytrtd');
						   var cell0 = $('<td></td>').addClass('eventlisttbodytrtd').append(toggleword);
						   var cell1 = $('<td></td>').html(a).addClass('eventlisttbodytrtd').append(midwordmid);
						   var cell2 = $('<td></td>').text(data.ad_bdate).addClass('eventlisttbodytrtd');;			   
						   var cell3 = $('<td></td>').text(data.ad_enddate).addClass('eventlisttbodytrtd');
						   var mid2 =  $('<input type="button" class="btn btn-success"/>').val(data.m_id).addClass('eventlisttbodytrtd');
						   var a2 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.m_id).append(mid2);						  
						   var midwordmid2 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.m_id).addClass('eventlisttbodytrtd');
						   var cell4 = $('<td></td>').html(a2).addClass('eventlisttbodytrtd').append(midwordmid2);				
						   var cell5 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');	
						   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5]);
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
			   $('input[name="samnote"],[name="saonote"],[name="sacnote"],[name="sarnote"]').on('change',updatenote);// input note
			   $('[name="reportevent"]').on('click',showreport);
			   dfd.resolve();
			   return dfd;
// 			   datatableinit();// goes wrong often
			   			   
	   }//end loadtable function
				function datatableinit(){
					
				table =	$('#eventlist').DataTable({
					 "autoWidth": true,
					buttons: [
						'copy', 'csv', 'excel', 'pdf', 'print'
				    ],
// 				    "<'row'<'col-md-4'><'col-md-4'><'col-md-4'>>ftp<'bottom'<'col-md-4'l>><'clear'>",
// 				    ' <"search"fl><"top">rt<"bottom"ip><"clear">'
				    "dom":
				    "<'row'<'col-sm-6'l><'col-sm-6'f>>" +
				    "<'row'<'col-sm-12't>>" +
				    "<'row'<'col-sm-5'><'col-sm-7'p>>",
				    select: true,
				    "language":{                    //Custom Message Setting
                        "lengthMenu": "每頁 _MENU_ 筆資料",    //Customizing menu Text
                        "zeroRecords": "查無資料 ",             //Customizing zero record text - filtered
                        "info": "Showing page _PAGE_ of _PAGES_",           //Customizing showing record no
                        "infoEmpty": "查無資料",                //Customizing zero record message - base
                        "infoFiltered": "(filtered from _MAX_ total records)"   //Customizing filtered message
                    },
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
						 "lengthMenu": [ [5, 10, 50, -1], [5, 10, 50, "全部"] ]
			// 			"iDisplayLength": 10
			//			  	destroy: true,
						 	   
			
				   }//end datatableinit
				 );
// 				$('#eventlist tbody tr td').on( 'click', 'tr', function () {
// 			        if ( $(this).hasClass('selected') ) {
// 			            $(this).removeClass('selected');
// 			            $(this).find('input').prop('checked', false);
// 			        }
// 			        else {
// 			            table.$('tr.selected').removeClass('selected');
// 			            $(this).addClass('selected');
// 			            $(this).find('input').prop('checked', true);
// 			        }
// 			    } );
	   }	//end datable	
				   
				   
</script>


</body>
</html>