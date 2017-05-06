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
				
					<li  data-toggle="tab" role="presentation"  id="masterlist" data-id="m"><a href="#"><div>師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist" data-id="o" class="active"><a href="#" ><div>訂單列表</div></a></li>
	
					<li  data-toggle="tab" role="presentation" id="customeranalysis" data-id="a"><a href="#"><div>用戶分析</div></a></li>
										
					<li  data-toggle="tab" role="presentation" id="adlist" data-id="ad"><a href="#"><div>廣告</div></a></li>
							
				</ul>
			</div>
		</nav>
	</header>
<!-- Function button -->
	<div>
		
	</div>
<!-- main content here -->		
	<article>
	<table id="eventlist" style="margin:auto;width:900px; border: 2px solid blue; horizontal-align:center;">
	<thead>
             <tr>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
             </tr>
    </thead>
	<tbody>
	
	</tbody>
	
	</table>
	<input type="hidden" />
	</article>


<script>

	$(function(){		
		
	   loadProduct("o");	
	   
	   $('#navigator>ul>li').on('click',function(){	
		   
		   var id = $(this).data('id');
		   loadProduct(id);
 		   $('#navigator>ul>li').removeClass('active');
  		   $('#navigator>ul>li[data-id="' + id + '"]').addClass('active');
	   });
	   
	   
	   function loadProduct(id){
		   $.getJSON('${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIservlet.do',{'action':id}, function(datas){
			   var th = $('#eventlist>thead');
			   var tb = $('#eventlist>tbody');
			   var docFrag = $(document.createDocumentFragment());
			   var docFrag2 = $(document.createDocumentFragment());
			   tb.empty();
			   
			   $.each(datas,function(i,data){
				   console.log(data);
				   
				   if(id=="o"){
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
						   var cell1 = $('<td></td>').text(data.o_tdate).addClass('eventlisttbodytrtd');
						   var cell2 = $('<td></td>').text(data.o_bname).addClass('eventlisttbodytrtd');
						   var cell3 = $('<td></td>').text(data.c_id).addClass('eventlisttbodytrtd');
						   var cell4 = $('<td></td>').text(data.o_id).addClass('eventlisttbodytrtd');
// 						   var cell5 = $('<td></td>').text(data.opros).addClass('eventlisttbodytrtd');
						   var cell6 = $('<td></td>').text(data.o_location).addClass('eventlisttbodytrtd');
						   var cell7 = $('<td></td>').text(data.s_name).addClass('eventlisttbodytrtd');
						   var cell8 = $('<td></td>').text(data.m_arating).addClass('eventlisttbodytrtd');
						   var cell9 = $('<td></td>').text(data.c_arating).addClass('eventlisttbodytrtd');
						   var sanote =  $('<input type="text" width="500px" /> ').val(data.sa_onote).addClass('eventlisttbodytrtd');
						   var cell10 = $('<td></td>').html(sanote).addClass('eventlisttbodytrtd');
						   var rowth = $('<tr></tr>').append([thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8,thc9,thc10]);
 						   var rowtb = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10]);
						   
 						   docFrag.append(rowth);
 						   docFrag2.append(rowtb);
							}	
				  
				  else if(id=="m"){
// 					var th = $('#eventlist>thead').html('');
// 					var tb = $('#eventlist>tbody').html('');
				   var thc1 = $('<th></th>').text('師傅編號').addClass('eventlistthreadtrth');
				   var thc2 = $('<th></th>').text('店家名稱').addClass('eventlistthreadtrth');
				   var thc3 = $('<th></th>').text('師傅名稱').addClass('eventlistthreadtrth');
				   var thc4 = $('<th></th>').text('店家地址').addClass('eventlistthreadtrth');
				   var thc5 = $('<th></th>').text('師傅專業').addClass('eventlistthreadtrth');
				   var thc6 = $('<th></th>').text('店家狀態').addClass('eventlistthreadtrth');
				   var thc7 = $('<th></th>').text('平均分數').addClass('eventlistthreadtrth');
				   var thc8 = $('<th></th>').text('管理者註記').addClass('eventlistthreadtrth');
				   var mid =  $('<input type="button" width="500px" /> ').val(data.M_id).addClass('eventlisttbodytrtd');
				   var cell1 = $('<td></td>').html(mid).addClass('eventlisttbodytrtd');
				   var cell2 = $('<td></td>').text(data.B_name).addClass('eventlisttbodytrtd');
				   var cell3 = $('<td></td>').text(data.M_name).addClass('eventlisttbodytrtd');
				   var cell4 = $('<td></td>').text(data.M_city+data.M_district+data.M_addr).addClass('eventlisttbodytrtd');
				   var cell5 = $('<td></td>').text(data.Mpros).addClass('eventlisttbodytrtd');
				   var cell6 = $('<td></td>').text(data.S_name).addClass('eventlisttbodytrtd');
				   var cell7 = $('<td></td>').text(data.M_arating).addClass('eventlisttbodytrtd');
				   var sanote =  $('<input type="text" width="500px" /> ').val(data.Sa_mnote).addClass('eventlisttbodytrtd');
				   var cell8 = $('<td></td>').html(sanote).addClass('eventlisttbodytrtd');
				   var rowth = $('<tr></tr>').append([thc1,thc2,thc3,thc4,thc5,thc6,thc7,thc8]).addClass('eventlistthreadtr');
				   var rowtb = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]).addClass('eventlisttbodytrtd');
				   
				   docFrag.append(rowth);
  				   docFrag2.append(rowtb);
					}
				   
				else if(id=="c"){
// 					   var th = $('#eventlist>thead').html('');
// 					   var tb = $('#eventlist>tbody').html('');
					   var cell1 = $('<td></td>').text(data[0].c_jdate);
					   var cell2 = $('<td></td>').text(data[1].c_id);
					   var cell3 = $('<td></td>').text(data[2].c_name);
					   var cell4 = $('<td></td>').text(data[3].c_city+thedata.c_district+thedata.c_addr);
					   var cell5 = $('<td></td>').text(data[0].s_name);
					   var cell6 = $('<td></td>').text(data[0].c_averrating);
					   var cell7 = $('<td></td>').text(data[0].sa_note);
					   var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
					   docFrag.append(row);
						}
				
				
			   });
			   th.append(docFrag2);
			   tb.append(docFrag);
			   
		   });   
	   }
	}); 

</script>


</body>
</html>