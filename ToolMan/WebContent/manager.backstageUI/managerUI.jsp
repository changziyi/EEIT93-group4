<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.9">
<title>Insert title here</title>
<!-- jquery -->
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.css">
	<script src="${pageContext.servletContext.contextPath}/js/jqueryui/jquery-ui.min.js"></script>
<!-- jquery -->
<!-- bootstrap -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap.min.css" >
	<!-- Optional theme -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/bootstrap-theme.min.css" >
	<!-- Latest compiled and minified JavaScript -->
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js" ></script>
	
<!-- bootstrap -->
<!-- datatable-->
	<script src="${pageContext.servletContext.contextPath}/js/datatable/datatable/jquery.dataTables.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/datatable/jszip/jszip.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/datatable/pdf/pdfmake.min.js"></script>
<!-- 	<script src="${pageContext.servletContext.contextPath}/js/datatable/button/buttons.html5.min.js"></script> -->
<!-- 	<script src="${pageContext.servletContext.contextPath}/js/datatable/button/dataTables.buttons.min.js"></script> -->
<!-- 	<script src="${pageContext.servletContext.contextPath}/js/datatable/datatable/buttons.bootstrap.min.js"></script> -->
	<script src="${pageContext.servletContext.contextPath}/js/datatable/datatable/jquery.dataTables.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/datatable/datatable/dataTables.bootstrap.min.js"></script>
<!-- 	<script src="${pageContext.servletContext.contextPath}/js/datatable/fixedheader/dataTables.fixedHeader.min.js"></script> -->
	<script src="${pageContext.servletContext.contextPath}/js/datatable/responsive/dataTables.responsive.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/datatable/responsive/responsive.bootstrap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/datatable/select/dataTables.select.min.js"></script>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/button/buttons.dataTables.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/button/buttons.bootstrap.min.css">
<!-- 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/datatable/jquery.dataTables.min.css">	 -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/datatable/dataTables.bootstrap.min.css">
<!-- 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/fixedheader/fixedHeader.bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/key/keyTable.bootstrap.min.css"> -->
<!-- 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/responsive/responsive.dataTables.min.css"> -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/responsive/responsive.bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/datatable/select/select.foundation.min.css">
<!------------------------ flatui ------------------------------>	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/flatui/dist/css/flat-ui.min.css" rel="stylesheet">
<!-- --------when open js, the filtering won't work ----------------->
<%-- 	<script src="${pageContext.servletContext.contextPath}/js/flatui/dist/js/flat-ui.min.js"></script> --%>

<!-------------------- navigation for this application---------- -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">

<!-------------------- sweetalert---------- -->
<script src="${pageContext.servletContext.contextPath}/js/sweetalert/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/sweetalert/sweetalert.css">
<!--------------------end sweetalert---------- -->
	
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
	.articles{
    width:90%; /*Takes 90% width from WebContainer*/
    height: auto;
    margin: auto;
} 
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
.textstyle{
		font-family: Arial, "Microsoft Jhenghei",  
		"WenQuanYi Zen Hei", "儷黑 Pro", 
		"LiHei Pro","文泉驛正黑", 
		"DFKai-sb", DFKai-SB, 
		sans-serif;
	}
</style>
</head>
<body>
<jsp:include page="/nav/navigation.jsp" />
<!-- navigator -->
	<header >
		<nav >
			<div id="navigator" class="textstyle" style="margin:1%;" >
		
<br/>
<br/>
				<ul style="margin: auto;width:100%; horizontal-align:center;" class="nav nav-tabs nav-justified "  >
				
					<li  data-toggle="tab" role="presentation"  id="masterlist" data-id="m" class="active"><a href="#"><div >師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist" data-id="o" ><a href="#" ><div>訂單列表</div></a></li>
	
<!-- 					<li  data-toggle="tab" role="presentation" id="managerchart" data-id="a"><a href="#"><div>統計圖表</div></a></li> -->
										
<!-- 					<li  data-toggle="tab" role="presentation" id="adlist" data-id="ad"><a href="#"><div>廣告</div></a></li> -->
							
				</ul>
			</div>

		</nav>
			<div  id="functionrow"  class="nav nav-tabs nav-justified textstyle" style="margin-top:10px;margin-left:40%;width:80%; vertical-align:center;">
			</div>
			
			<div id="subfunctionrow" style="margin-top:10px;margin-left:20%;width:80%; horizontal-align:center;" class="nav nav-tabs nav-justified textstyle">
			</div>
	</header>
	
<!-- Function button -->
	<div>
		
	</div>
<!-------------------------------------- main content here -->		
	<article >
	<div class="tablewrapper">
		
		<div id="tabletool" class="bg-info" style=" padding:0px;width:100%; margin:auto;display:table;text-align:left">
			<span id="tabletoo2" style="background-color:#5ea2fd;width:50%;height:70px;margin:0px;padding:0px;text-align:left;float:left;"></span>
			<span id="tabletoo3" style="background-color:#4091fd;width:50%; height:70px;margin:0px;padding:0px;text-align:left;float:left;"></span>
		</div>
		
		<table id="eventlist" class="table table-striped table-bordered table-hover textstyle" style="word-break: keep-all;display:table;text-align:center" >
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

	<div class="modal fade textstyle"  id="myModal01" tabindex="-1" role="dialog"
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
								<td>收件人 ： </td>
								<td>
								<input type="text" id="receiver"  required="true"
									/>
								<input type="hidden" id="receiver2" name="mss_id" 
									/>
								</td>
							</tr>
						
							<tr>
								<td>主旨 ：</td>
								<td>
								 <input type="text" id="messum"  required="true"
									value="${param.ms_summary}" />${errorMsgs.email1}${errorMsgs.email2}
								<input type="hidden" id="messum2" name="ms_summary" 
									/>
								</td>
							</tr>
						
							<tr>
								<td><label style="vertical-align: top;font-size:18px">內容：</td>
								
								<td><textarea id="mescontent" style="width: 400px; height: 120px"
								placeholder="請輸入內容"></textarea></td>
								<td><input type="hidden" name="ms_content" id="mescontent2" 
								></textarea></td>
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
<div class="modal fade textstyle" id="ormodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<table>
      	<tbody>
	        <tr><td><div class="modal-title" style="width:100px;">檢舉人:</div></td>
	        <td><span  id="reporter"></span></td></tr> 
	             
			<tr><td><div class="modal-title" style="width:100px;">被檢舉人:</div></td>
			<td><span  id="reported"></span></td></tr>
        </tbody>
        </table>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label" >主旨:</label>
            <textarea readonly class="form-control" style=" background-color:white;color:black"id="reportextract"></textarea>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label" >檢舉內容:</label>
            <textarea readonly class="form-control" style=" background-color:white;color:black" id="reportcontent"></textarea>
            
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
<!-- -----------------------------master Modal---------------------------------------- -->
<div class="modal fade textstyle" id="mmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<div class="modal-header">
				<h3 class="text-center">店家資訊</h3>
			</div>
			
			<div class="modal-body" style="display:table;">
				<div>
						<div class="form-group">
							<table class="table table-hover">
								<tr>
									<td class="form-control-label" style="width:100px;">首頁圖片</td>
									<td ><div><img id="m_cer" class="img-thumbnail" width="350px" src=""></div>
								</tr>
								<tr style="vertical-align:middle;margin:auto">
									<td class="form-control-label" style="padding-top:16px;width:100px;">店家名稱</td>
									<td style="margin-top:10px;width:400px;height:50px;" id="bname"  class="form-control"></td>
								</tr>
								<tr>
									<td  class="form-control-label" style="padding-top:16px;width:100px;">店家介紹</td>
									<td><textarea readonly style="background-color:white;color:black;margin-top:10px;width:400px;" id="bdes" class="form-control"></textarea></td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">師傅姓名</td>
									<td id="mname" style="margin-top:10px;width:400px;height:50px;" class="form-control"></td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">電話</td>
									<td id="mtel" style="margin-top:10px;width:400px;height:50px;" class="form-control"></td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">信箱</td>
									<td id="mmail" style="margin-top:10px;width:400px;height:50px;" class="form-control"></td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">地址</td>
									<td id="maddr" style="margin-top:10px;width:400px;height:50px;" class="form-control">$</td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">維修類別</td>
									<td id="mpros" style="margin-top:10px;width:400px;height:50px;" class="form-control"><c:forEach var="aMpro" items="${cdata_mdataVO.mpros}"></c:forEach></td>
								</tr>
								<tr>
									<td class="form-control-label" style="padding-top:16px;width:100px;">專業證照</td>
									<td ><div ><img id="m_cer2" class="img-thumbnail" height="300px" src=""></div>
								</tr>
							</table>
							<label>審核未過之訊息</label>
							<div><textarea id="notpassword"></textarea></div>
						</div>
						
						</div>
					</div>
					<div class="modal-footer">
							<button type="button" id="mpass1" class="btn btn-secondary" data-dismiss="modal">審核通過</button>
                     		<button type="button" id="mnotpass" class="btn btn-secondary" data-dismiss="modal">審核未過</button>
                      </div>	
                     </div>
				 </div>
				
			</div>
<!-- -----------------------------end master Modal---------------------------------------- --><style>   
input[type='checkbox'] {
margin: 0 auto;
display: block;
	width:20px;height:20px;
}

input[type='checkbox'] {
	-webkit-font-smoothing: antialiased;
	text-rendering: optimizeSpeed;
	
	
	display: block;
	float: left;
	position: relative;
	cursor: pointer;
	width:20px;
	height:20px;
	horizontal-align:middle;
	vertical-align:middle;
}

input[type='checkbox']:after {
	content: "";
	vertical-align: middle;
	text-align: center;
	line-height: 13px;
	position: absolute;
	cursor: pointer;
	height: 13px;
	width: 13px;
	left: 0;
	top: 0;
	font-size: 10px;
	-webkit-box-shadow: inset 0 1px 1px #5F95FC, 0 1px 0 #5F95FC;
	-moz-box-shadow: inset 0 1px 1px #5F95FC, 0 1px 0 #5F95FC;
	box-shadow: inset 0 1px 1px #5F95FC, 0 1px 0 #5F95FC;
	background: #5F95FC;
	width:20px;height:20px
}

input[type='checkbox']:hover:after, input[type='checkbox']:checked:hover:after {
	background: #5F95FC;
	content: '\2714';
	color: #fff;
	width:20px;height:20px
}

input[type='checkbox']:checked:after {
	background: #5F95FC;
	content: '\2714';
	color: #fff;
	width:20px;height:20px
}
.textstyle{
		font-family: Arial, "Microsoft Jhenghei",  
		"WenQuanYi Zen Hei", "儷黑 Pro", 
		"LiHei Pro","文泉驛正黑", 
		"DFKai-sb", DFKai-SB, 
		sans-serif;
	}
</style><script>
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
	 	
				var receiver1 =	"m"+$(this).attr('data-receiver1').toString();
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
		var mailtype=null;
		// double mail effect---need to set c_id in mail servlet,or there will be only 1 time mail,because the quest has been forward to other place
		
		if((navagatorid=='o')||(navagatorid=='r')){// mail to both side of the transaction//tested ok
		     	 $(":checkbox:checked").each(function(){            	  
		     		checkboxdatasmaster.push($(this).attr('data-receiver1'));
		     		checkboxdatacustomer.push($(this).attr('data-receiver2'));
		     		mailtype = $(this).data('mailtype');
		         }) 
		         if((checkboxdatasmaster.toString()=="")||(checkboxdatacustomer.toString()=="")){
		        	 swal("請勾選項目");
	 	     	 }//end if
	 	     	else{
	 	     		var unbind=false;
	 	     		 $('#btnsubmitmail').on('click',function(){
	 	     			var hyperlinkstring = "${pageContext.servletContext.contextPath}/email/Email.do";
	 	     			// must unbind the event, or it will accumulate forever
	 	     			if(unbind==true){
	 	     				$('#btnsubmitmail').unbind('click');
	 	     			}
	 	     			clickornot=!clickornot;
	 					var mssid=$('#receiver').val();
		 				var mssum=$('#messum').val();
		 				var mscontent=$('#mescontent').val();
						$.post(hyperlinkstring,{"mss_id":mssid,"ms_content":mscontent,"ms_summary":mssum,"mailtype":mailtype},function(){
							
								$('#myModal01').modal("hide");
						   
							if (clickornot==true){
				 	     		setTimeout(function () {
				 	     		$('#receiver').val(checkboxdatacustomer.toString()).text(checkboxdatacustomer.toString());
				 	     		$('#myModal01').modal('show');
				 	     		 }, 500);
				 	     		mailtype="toc"
				 	     		unbind=true;
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
         	   	mailtype = $(this).data('mailtype');
         	});//end each        
     	 	if(checkboxdatas.toString()==""){
     	 		swal("請勾選項目");
     	     	 }//end if
     	 else{
					$('#receiver').val(checkboxdatas.toString()).text(checkboxdatas.toString());
		     		$('#myModal01').modal();
		     		
		     		$('#btnsubmitmail').on('click',function(){
		     			var hyperlinkstring = "${pageContext.servletContext.contextPath}/email/Email.do";
	 					var mssid=$('#receiver').val();
		 				var mssum=$('#messum').val();
		 				var mscontent=$('#mescontent').val();
						$.post(hyperlinkstring,{"mss_id":mssid,"ms_content":mscontent,"ms_summary":mssum,"mailtype":mailtype},function(){
					    $('#myModal01').modal("hide");
					    $('#btnsubmitmail').unbind('click');
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
      	 $.post(hyperlinkstring,{"functionaction":nameattr,"notevalue":valueattrr,"noteid":noteid},function(data,status){} )//end get function
// 		 	$('#eventlist').dataTable().fnDestroy();//in datatable initialization  use destory= true is better
// 			$('#eventlist').empty();//in datatable initialization use destory= true is better
		$.when(updatenote).done(loadProduct(navagatorid,datastatus,datatime)).done(loadProduct(navagatorid,datastatus,datatime));
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
 				swal("您的瀏覽器不支援Ajax功能!!");
 			}	
 		}
 		function callbackajax(){
 			if(xhr.readyState == 4){
 				if(xhr.status == 200){			
 	                var data = xhr.responseText;
 					
 					console.log(data);
 					loadProduct(navagatorid,datastatus,datatime);
 					
 				}else{
 					swal(xhr.status + ":" + xhr.statusText);
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
				'<button type="button" class="btn btn-primary dropdown-toggle" style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">狀態<span class="caret"></span></button>';
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
			$('#tabletoo2').append($('#functionrow').append(docFragfunction2));
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}//end else if
		
		else if(navagatorid== 'c'){
			
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">'
			var dropdowntitlestate = 
					'<button type="button" class="btn btn-primary dropdown-toggle"  style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
					'<li data-statusvalue="allcustomer" data-buttonstate="selected" name="datastatus"><a href="#">所有消費者</a></li><li role="separator" class="divider"></li>'
					+'<li data-statusvalue="停權中" name="datastatus"><a href="#">停權中</a></li>';
					
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';		
			var customerstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;
							
// 			var showblacklistc = '<button type="button" data-id="showblacklistc" class="btn " style="background-color: #555555; color:white" >黑名單</button>';				

			var li1 = $(customerstatus);
			
			docFragfunction2.append([li1]);
			$('#tabletoo2').append($('#functionrow').append(docFragfunction2));
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}//end else if
		
		else if(navagatorid== 'o'){
			
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">狀態<span class="caret"></span></button>';
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
				'<button type="button" class="btn btn-info dropdown-toggle" style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">日期篩選<span class="caret"></span></button>';
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
			$('#tabletoo2').append($('#functionrow').append(docFragfunction2));
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
 		}// end else if 
		else if(navagatorid== 'r'){
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
						'<li data-statusvalue="allreport" data-buttonstate="selected" name="datastatus"><a href="#">所有檢舉</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="未解決" name="datastatus"><a href="#">未解決</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已解決" name="datastatus"><a href="#">已解決</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已刪除" name="datastatus"><a href="#">已刪除</a></li><li role="separator" class="divider"></li>';						
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';
			var reportstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;		
			var li1 = $(reportstatus);
			docFragfunction2.append([li1]);
			$('#tabletoo2').append($('#functionrow').append(docFragfunction2));
			$('#functionrow>div>ul>li').on('click',functionrowfiltering);//filtering
		}
		else if(navagatorid== 'ad'){
			$('#functionrow').empty();
			var buttongroupdiv ='<div class="btn-group">';
			var dropdowntitlestate = 
						'<button type="button" class="btn btn-primary dropdown-toggle" style="width:130px;height:50px;font-size:20px;" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false">狀態<span class="caret"></span></button>';
			var dropdownmenucontentstate=
						'<li data-statusvalue="allad" data-buttonstate="selected"  name="datastatus"><a href="#">所有廣告</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="尚未進行" name="datastatus"><a href="#">尚未進行</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="進行中" name="datastatus"><a href="#">進行中</a></li><li role="separator" class="divider"></li>'
						+'<li data-statusvalue="已中止" name="datastatus"><a href="#">已中止</a></li><li role="separator" class="divider"></li>';
												
			var dropdownmenustate = '<ul class="dropdown-menu">'+dropdownmenucontentstate +'</ul>';
			var buttongroupdivend ='</div>';
			var reportstatus = buttongroupdiv+dropdowntitlestate+dropdownmenustate+buttongroupdivend;		
			var li1 = $(reportstatus);
			docFragfunction2.append([li1]);
			$('#tabletoo2').append($('#functionrow').append(docFragfunction2));
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
		var checkboxdatas2 = null;
		function verifymaster(){
			
			var valueattr =$(this).val();
			var nameattr=$(this).attr('name');
	            //get all toggled checkboxes 
	           var checkboxdatas = null;
	        	 $(":checkbox:checked").each(function(){            	  
	            	   checkboxdatas=$(this).val(); 
	            })
	            checkboxdatas2=checkboxdatas.toString();
	            if(checkboxdatas2==""){
	            	swal("請勾選項目");
	        	 }//end if
	        	 else{
	                	var valueattrr=$(this).attr('value');//retrieve the value from functinaction
	                	var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
	     			var dfd4 = $.get(hyperlinkstring,{"functionaction":"type","image":checkboxdatas2},function(data){
	     				$('#m_cer2').attr("src","${pageContext.servletContext.contextPath}/master/master.do?type=master&image="+checkboxdatas2);
	     				
	                });//end get function
	                var dfd5 = $.get(hyperlinkstring,{"functionaction":"type","image":checkboxdatas2},function(data){
	     				$('#m_cer').attr("src","${pageContext.servletContext.contextPath}/master/master.do?type=cer&image="+checkboxdatas2);
	     				
	                });//end get function
	     			var dfd3 = $.getJSON(hyperlinkstring,{"functionaction":"applicationreviewm","toggledcheckbox":checkboxdatas2},function(data){
	     				
	     				$('#bname').html(data.bname);
	     				$('#bdes').html(data.bdes+"asssssssssssssssssssssssssssssssssssssssssssssssssssssssddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
	     				$('#mname').html(data.mname);
	     				$('#mtel').html(data.mtel);
	     				$('#mmail').html(data.mmail);
	     				$('#maddr').html(data.maddr);
	     				$('#mpros').html(data.mpros);
	     				
	                });//end get function
//	      		 	$('#eventlist').dataTable().fnDestroy();
//	         			$('#eventlist').empty();
	     		$.when(dfd3,dfd4,dfd5).done( $('#mmodal').modal());
	            }//end else 
	            
	            $('#mnotpass').on('click',mnotpass);
	            $('#mpass1').on('click', mpass);
		}//end verify master
		
		function mpass(){
			var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
			$.post(hyperlinkstring,{"functionaction":"mpass","toggledcheckbox":checkboxdatas2},function(data){
				swal("審核完成");
				 $('#mpass1').unbind('click');
				 $('#mnotpass').unbind('click');
				 loadProduct(navagatorid,datastatus,datatime);
				 
           });//end get function
		}//mpass
		
		function mnotpass(){
			var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
			var notpassword = $('#notpassword').val();
			$.post(hyperlinkstring,{"functionaction":"mnotpass","toggledcheckbox":checkboxdatas2,"notpassword":notpassword},function(data){
				swal("已退回申請");
				$('#mnotpass').unbind('click');
				 $('#mpass1').unbind('click');
				loadProduct(navagatorid,datastatus,datatime);
           });//end get function
		}//end mnotpass
		
	   function subfunctionrow(){

			var docFragsubfunction = $(document.createDocumentFragment());
		   if( navagatorid== 'm'){
				$('#subfunctionrow').empty();
				var applicationreviewm = '<sapn id="applymasterlink" name="applicationreviewm"><input type="button"style="width:130px;height:50px;font-size:20px;" class="btn btn-success"value="審核師傅" /></span>';
				var suspensionm = '<span id="suspensionm" value="suspensionm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-danger" style="width:130px;height:50px;font-size:20px;" value="停權" "/></span>';
				var recoverm = '<span id="recoverm" value="recoverm" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-warning" style="width:130px;height:50px;font-size:20px;" value="復權" "/></span>';
				var sendmessagem = '<span id="messagespanm" value="sendmessagem" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-info"  style="width:130px;height:50px;font-size:20px;" value="傳送訊息" "/></span>';				
				var b1 = $(applicationreviewm);
				var b2 = $(suspensionm);
				var b3 = $(recoverm);
				var b4 = $(sendmessagem);			
				docFragsubfunction.append([b1,b2,b3,b4]);
				
				$('#tabletoo3').append($('#subfunctionrow').append(docFragsubfunction));
				//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action
			 	$('#applymasterlink').on('click',verifymaster);
		   }//end else if
			
			else if(navagatorid== 'c'){
				$('#subfunctionrow').empty();
				var suspensionc = '<span id="suspensionc" value="suspensionc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" class="btn btn-danger" style="width:130px;height:50px;font-size:20px;" value="停權"/></span>';
				var recoverc = '<span id="recoverc" value="recoverc" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" class="btn btn-warning" style="width:130px;height:50px;font-size:20px;" value="復權"/></span>';
				var sendmessagec = '<span id="messagespanc" value="sendmessagec" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" class="btn btn-info" style="width:130px;height:50px;font-size:20px;"  value="傳送訊息" /></span>';
				var b1 = $(suspensionc);
				var b2 = $(recoverc);
				var b3 = $(sendmessagec);
				docFragsubfunction.append([b1,b2,b3]);
				
				$('#tabletoo3').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

			}//end else if
			
			else if(navagatorid== 'o'){
				$('#subfunctionrow').empty();
				var sendmessageo = '<span id="messagespano" value="sendmessageo" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-info" style="width:130px;height:50px;font-size:20px;" value="訊息" /></span>';
				var b1 = $(sendmessageo);
				docFragsubfunction.append([b1]);
				
				$('#tabletoo3').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
// 			 	$('#subfunctionrow>span[id!="messagespanm"],#subfunctionrow>span[id!="messagespanc"],#subfunctionrow>span[id!="messagespano"]').on('click',mail);//will return something when clicked, maill has it's own form action
			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action

			}// end else if 
			else if(navagatorid== 'r'){
				$('#subfunctionrow').empty();
				var endr = '<span id="endr" value="endr" name="functionaction" style=" padding:0px; margin:0px;" ><input type="button" class="btn btn-danger" style="width:130px;height:50px;font-size:20px;" value="結案"/></span>';
				var sendmessager = '<span id="messagespanr" value="sendmessager" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-info" style="width:130px;height:50px;font-size:20px;" value="訊息" /></span>';

				var b1 = $(endr);
				var b2 = $(sendmessager);
				docFragsubfunction.append([b1,b2]);
				
				$('#tabletoo3').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
 			 	$('#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad').on('click',mail);//will return something when clicked, maill has it's own form action
 			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action

				
			}
			else if(navagatorid== 'ad'){
				$('#subfunctionrow').empty();
				var sendmessager = '<span id="messagespanad" value="sendmessagead" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-info" style="width:130px;height:50px;font-size:20px;"  value="訊息" /></span>';
				var stopad = '<span id="stopad" value="stopad" name="functionaction" style="padding:0px; margin:0px;" ><input type="button" class="btn btn-danger" style="width:130px;height:50px;font-size:20px;"  value="終止廣告"/></span>';
				var b1 = $(sendmessager);
				var b2 = $(stopad);
				docFragsubfunction.append([b1,b2]);
				
				$('#tabletoo3').append($('#subfunctionrow').append(docFragsubfunction));
					//rebinding
			 	$('#subfunctionrow>a').on('click',togglehyper);//direct to other pages
 			 	$('#subfunctionrow>span:not(#messagespanm,#messagespanc,#messagespano,#messagespanr,#messagespanad)').on('click',togglegetmethod);//will return something when clicked, maill has it's own form action
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
	            	swal("請勾選項目");
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
			var dfd3 = $.Deferred();
            //get all toggled checkboxes 
           var checkboxdatas = [];
        	 $(":checkbox:checked").each(function(){            	  
            	   checkboxdatas.push($(this).val()); 
            })
            
            var checkboxdatas2=checkboxdatas.toString();
        	 if(checkboxdatas2==""){
        		 swal("請勾選項目");
        	 }//end if
        	 else{
           	var valueattrr=$(this).attr('value');//retrieve the value from functinaction
           	var hyperlinkstring = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do";
//            	var hyperlinkparameter = "functionaction="+valueattrr+"&+toggledcheckbox="+checkboxdatas2;
//           	var hyperlinkstringwithparameter=hyperlinkstring+hyperlinkparameter;
//          		var ajaxurl = "${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?";
// 				var ajaxparam = "functionaction="+valueattrr+"&toggledcheckbox="+checkboxdatas2;
// 				loadajax(ajaxurl,ajaxparam);
			var a=null;
			$.post(hyperlinkstring,{"functionaction":valueattrr,"toggledcheckbox":checkboxdatas2},function(data){
				a=data;
				
           });//end get function
// 		 	$('#eventlist').dataTable().fnDestroy();
//    			$('#eventlist').empty();
		$.when(dfd3).done(loadProduct(navagatorid,datastatus,datatime)).done( loadProduct(navagatorid,datastatus,datatime));
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
		   
			   if(id=="o"){   					  
					   	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					   	var thc1 = $('<th style="text-align:center"></th>').text('師傅編號').addClass('eventlistthreadtrth');
					   	var thc2 = $('<th style="text-align:center"></th>').text('店家名稱').addClass('eventlistthreadtrth');
					   	var thc3 = $('<th style="text-align:center"></th>').text('師傅名稱').addClass('eventlistthreadtrth');
					   	var thc4 = $('<th style="text-align:center"></th>').text('店家地址').addClass('eventlistthreadtrth');
					   	var thc5 = $('<th style="text-align:center"></th>').text('師傅專業').addClass('eventlistthreadtrth');
					   	var thc6 = $('<th style="text-align:center"></th>').text('店家狀態').addClass('eventlistthreadtrth');
					   	var thc7 = $('<th style="text-align:center"></th>').text('平均分數').addClass('eventlistthreadtrth');
					   	var thc8 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
					   	var thc9 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
					   	var thc10 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
					   	var thc1 = $('<th style="text-align:center"></th>').text('下單日期').addClass('eventlistthreadtrth');
						var thc2 = $('<th style="text-align:center"></th>').text('店家名稱').addClass('eventlistthreadtrth');
						var thc3 = $('<th style="text-align:center"></th>').text('消費者帳戶').addClass('eventlistthreadtrth');
						var thc4 = $('<th style="text-align:center"></th>').text('訂單編號').addClass('eventlistthreadtrth');
						var thc5 = $('<th style="text-align:center"></th>').text('服務類別').addClass('eventlistthreadtrth');
						var thc6 = $('<th style="text-align:center"></th>').text('服務地址').addClass('eventlistthreadtrth');
						var thc7 = $('<th style="text-align:center"></th>').text('訂單狀態').addClass('eventlistthreadtrth');
						var thc8 = $('<th style="text-align:center"></th>').text('師傅評分').addClass('eventlistthreadtrth');
						var thc9 = $('<th style="text-align:center"></th>').text('消費者評分').addClass('eventlistthreadtrth');
						var thc10 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
						var rowth = $('<tr style="text-align:center"></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8,thc9,thc10]);						
						docFragth.append(rowth);
				   }
				   else if(id=="m"){
					   
					   
					  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
						var thc1 = $('<th style="text-align:center"></th>').text('師傅編號').addClass('eventlistthreadtrth');
						var thc2 = $('<th style="text-align:center"></th>').text('店家名稱').addClass('eventlistthreadtrth');
						var thc3 = $('<th style="text-align:center"></th>').text('師傅名稱').addClass('eventlistthreadtrth');
						var thc4 = $('<th style="text-align:center"></th>').text('店家地址').addClass('eventlistthreadtrth');
						var thc5 = $('<th style="text-align:center"></th>').text('師傅專業').addClass('eventlistthreadtrth');
						var thc6 = $('<th style="text-align:center"></th>').text('店家狀態').addClass('eventlistthreadtrth');
						var thc7 = $('<th style="text-align:center"></th>').text('平均分數').addClass('eventlistthreadtrth');
						var thc8 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
						var rowth = $('<tr style="text-align:center"></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8]);
						docFragth.append(rowth);
				   }
				   else if(id=="c"){					   					  
					    var thc0 = $('<th style="text-align:center"></th>').addClass('eventlistthreadtrth');
					    var thc1 = $('<th style="text-align:center"></th>').text('下單日期').addClass('eventlistthreadtrth');
						var thc2 = $('<th style="text-align:center"></th>').text('消費者名稱').addClass('eventlistthreadtrth');
						var thc3 = $('<th style="text-align:center"></th>').text('消費者帳戶').addClass('eventlistthreadtrth');
						var thc4 = $('<th style="text-align:center"></th>').text('消費者地址').addClass('eventlistthreadtrth');
						var thc5 = $('<th style="text-align:center"></th>').text('消費者狀態').addClass('eventlistthreadtrth');
						var thc6 = $('<th style="text-align:center"></th>').text('平均分數').addClass('eventlistthreadtrth');
						var thc7 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
						var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7]);
						docFragth.append(rowth);
					   
				   }
				   else if(id=="r"){
					  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					  	var thc1 = $('<th style="text-align:center"></th>').text('檢舉編號').addClass('eventlistthreadtrth');
					  	var thc2 = $('<th style="text-align:center"></th>').text('檢舉日期').addClass('eventlistthreadtrth');
						var thc3 = $('<th style="text-align:center" ></th>').text('消費者').addClass('eventlistthreadtrth');
						var thc4 = $('<th style="text-align:center"></th>').text('師傅').addClass('eventlistthreadtrth');
						var thc5 = $('<th style="text-align:center"></th>').text('檢舉主旨').addClass('eventlistthreadtrth');
						var thc6 = $('<th style="text-align:center"></th>').text('檢舉案件狀態').addClass('eventlistthreadtrth');
						var thc9 = $('<th style="text-align:center"></th>').text('管理者註記').addClass('eventlistthreadtrth');
						var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8,,thc9]);
						docFragth.append(rowth);					   
				   }
				   else if(id=="ad"){
					  	var thc0 = $('<th></th>').addClass('eventlistthreadtrth');
					  	var thc1 = $('<th style="text-align:center"></th>').text('廣告編號').addClass('eventlistthreadtrth');
					  	var thc2 = $('<th style="text-align:center"></th>').text('預約日期').addClass('eventlistthreadtrth');
						var thc3 = $('<th style="text-align:center"></th>').text('結束日期').addClass('eventlistthreadtrth');
						var thc4 = $('<th style="text-align:center"></th>').text('師傅編號').addClass('eventlistthreadtrth');
						var thc5 = $('<th style="text-align:center"></th>').text('廣告狀態').addClass('eventlistthreadtrth');
						var rowth = $('<tr></tr>').append([thc0,thc1,thc2,thc3,thc4,thc5]);
						docFragth.append(rowth);					   
				   }
			   $.each(datas,function(i,data){
				   console.log(data);//for test
				   
// 				   		pageselection();
// 						for(var i=pageIndex;i<pageIndex+rowsPerPage;i++){
					   
					   if(id=="o"){
						   
						   	console.log(data);
						   	// set mail type tom first, then use mail function to change second mail to toc
						   	var toggleword = $('<input  type="checkbox" style="width:20px;height:20px"name="otoggle" />').val(data.o_id).attr('data-receiver1',data.o_bname).attr('data-receiver2',data.c_id).attr('data-mailtype','tob');
						   	
						   	var cell0 = $('<td style="text-align:center;display:table;"></td>').addClass('eventlisttbodytrtd').append(toggleword);
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
							var saonote =  $('<input type="text" name="saonote" style="width:180px;"/> ').val(data.sa_onote).attr('data-noteid',data.o_id);
							var cell10 = $('<td ></td>').html(saonote).addClass('eventlisttbodytrtd').append(wordsanote);
	 						var rowtb = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10]);
	 						docFragtb.append(rowtb);
	 						
						}//end if
				  
				  else if(id=="m"){				
					  
					  
					   var toggleword =$('<input type="checkbox" class="cb" style="width:20px;height:20px"  name="mtoggle"/>').val(data.M_id).attr('data-receiver',data.B_name).attr('data-mailtype','tob');     
					   var mid =  $('<input type="button" class="btn btn-success"/> ').val("m"+data.M_id).addClass('eventlisttbodytrtd');
					   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.M_id).append(mid);						  
					   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.M_id).addClass('eventlisttbodytrtd');
					   var cell0 = $('<td style="text-align:center;display:table;"></td>').addClass('eventlisttbodytrtd').append(toggleword);  
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
					   var rowtb = $('<tr ></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]).addClass('eventlisttbodytrtd');				   
	  				   docFragtb.append(rowtb);
	  				   
					}//end if
				   
					else if(id=="c"){
						
						
					   var toggleword = $('<input type="checkbox" style="width:20px;height:20px" name="ctoggle" />').val(data.c_id).attr('data-receiver',data.c_id).attr('data-mailtype','toc');
					   var mid =  $('<input type="button" class="btn btn-info" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
					   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid);						  
					   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
					   var cell0 = $('<td style="text-align:center;display:table;"></td>').addClass('eventlisttbodytrtd').append(toggleword);
					   var cell1 = $('<td></td>').text(data.c_jdate).addClass('eventlisttbodytrtd');;
					   var cell2 = $('<td></td>').html(a).addClass('eventlisttbodytrtd').append(midwordmid);
					   var cell3 = $('<td></td>').text(data.c_name).addClass('eventlisttbodytrtd');;
					   var cell4 = $('<td></td>').text(data.c_city+data.c_district).addClass('eventlisttbodytrtd');;
					   var cell5 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');;
					   var cell6 = $('<td></td>').text(data.c_averrating).addClass('eventlisttbodytrtd');;
					   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_cnote).addClass('eventlisttbodytrtd');
					   var sacnote =  $('<input type="text" name="sacnote"  width="500px" /> ').val(data.sa_cnote).attr('data-noteid',data.c_id).addClass('eventlisttbodytrtd');
					   var cell7 = $('<td></td>').html(sacnote).addClass('eventlisttbodytrtd').append(wordsanote);;
					   var row = $('<tr ></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
					   docFragtb.append(row);
					   
						}// end if
						
					else if(id=="r"){
						   var toggleword = $('<input type="checkbox" style="width:20px;height:20px" name="ctoggle" />').val(data.r_id).attr('data-receiver1',data.m_id).attr('data-receiver2',data.c_id).attr('data-extract',data.p_summary).attr('data-content',data.p_content).attr('data-mailtype','tom');
						   var mid =  $('<input type="button" class="btn btn-primary" name="reportevent"  />').val("r"+data.r_id).addClass('eventlisttbodytrtd').attr('data-receiver1',data.m_id).attr('data-receiver2',data.c_id).attr('data-extract',data.p_summary).attr('data-content',data.p_content);
						   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.r_id).addClass('eventlisttbodytrtd');
						   var cell0 = $('<td style="text-align:center;display:table;"></td>').addClass('eventlisttbodytrtd').append(toggleword);
						   var cell1 = $('<td name="reportevent"></td>').html(mid).addClass('eventlisttbodytrtd').append(midwordmid);
						   var cell2 = $('<td></td>').text(data.r_date).addClass('eventlisttbodytrtd');;			   
						   var mid3 =  $('<input type="button" class="btn btn-info" style="width:100px;word-break: keep-all"/> ').val(data.c_id).addClass('eventlisttbodytrtd');
						   var a3 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.c_id).append(mid3);						  
						   var midwordmid3 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.c_id).addClass('eventlisttbodytrtd');
						   var cell3 = $('<td></td>').html(a3).addClass('eventlisttbodytrtd').append(midwordmid3);
						   var mid2 =  $('<input type="button" class="btn btn-success"/> ').val("m"+data.m_id).addClass('eventlisttbodytrtd');
						   var a2 =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findmaster&targetid="+data.m_id).append(mid2);						  
						   var midwordmid2 =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.m_id).addClass('eventlisttbodytrtd');
						   var cell4 = $('<td></td>').html(a2).addClass('eventlisttbodytrtd').append(midwordmid2);
						   var cell5 = $('<td></td>').text(data.p_summary).addClass('eventlisttbodytrtd');
						   var cell6 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');
						   var wordsanote =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.sa_rnote).addClass('eventlisttbodytrtd');
						   var sarnote =  $('<input type="text" name="sarnote"  width="500px" /> ').val(data.sa_rnote).attr('data-noteid',data.r_id).addClass('eventlisttbodytrtd');
						   var cell7 = $('<td></td>').html(sarnote).addClass('eventlisttbodytrtd').append(wordsanote);
						   var row = $('<tr></tr>').append([cell0,cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
						   docFragtb.append(row);						
					}
					else if(id=="ad"){
						
						   var toggleword = $('<input type="checkbox" style="width:20px;height:20px;" name="ctoggle" />').val(data.ad_id).attr('data-receiver',data.m_id).attr('data-mailtype','tom');
						   var mid =  $('<input type="button" class="btn btn-warning"/>').val("ad"+data.ad_id).addClass('eventlisttbodytrtd');
						   var a =  $('<a></a> ').attr('href',"${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIFunctionServlet.do?"+"functionaction=findcustomer&targetid="+data.ad_id).append(mid);						  
						   var midwordmid =  $('<span style="visibility: hidden;font-size:0px;margin:0pxlpadding:0px;"></span> ').text(data.ad_id).addClass('eventlisttbodytrtd');
						   var cell0 = $('<td style="text-align:center;display:table;"></td>').addClass('eventlisttbodytrtd').append(toggleword);
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
// 					else if(id=="a"){
// 						 var chardiv = $('<div id="managerchart"></div>');
// 						 docFragtb3.append(chardiv);
// 						 $('#charts').append(docFragtb3);
// 						 chart();
					 
// 					}
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
				    select: false,
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
						 "lengthMenu": [ [ 10, 20, -1], [ 10, 20, "全部"] ]
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