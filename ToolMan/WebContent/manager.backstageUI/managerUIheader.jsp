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
</style>
</head>
<body>
<!-- navigator -->
	<header >
		<nav >
			<div id="navigator" >
			
				<ul class="nav nav-tabs nav-justified" style="width:400px; margin:auto;" >
				
					<li  data-toggle="tab" role="presentation" class="active" id="masterlist" data-id="m"><a href="#"><div>師傅列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="customerlist" data-id="c"><a href="#"><div >消費者列表</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="reportlist" data-id="r"><a href="#"><div>檢舉案件</div></a></li>
					
					<li  data-toggle="tab" role="presentation" id="orderlist"><a href="#" data-id="o"><div>訂單列表</div></a></li>
	
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
	<table id="eventlist">
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
		
	   loadProduct("m");	
	   //讀取xml資料
// 	   $.ajax({
// 		   'url':'XMLServlet',
// 		   'type':'GET',
// 		   'dataType':'xml'
// 	   }).done(function(datas){
// 		   var myUl = $('ul.list-group');
// 		   myUl.empty();
// 		   var docFrag = $(document.createDocumentFragment());
// 		   $(datas).find("Category").each(function(){
// 			   //  <li data-id="2" class="list-group-item">Condiments</li>
// 		 	  //console.log($(this).children('CategoryID').text());
// 		 	  //console.log($(this).children('CategoryName').text());
// 		 	  var eleLi = $("<li></li>").text($(this).children('CategoryName').text())
// 		 	                            .addClass('list-group-item')
// 		 	                            .attr('data-id',$(this).children('CategoryID').text());
// 		 	  docFrag.append(eleLi);
// 		   });
// 		   myUl.append(docFrag);
// 	   });
	   
// 	   $('#navigator>ul>li').on('click','li',function(){	
// 		   var id = $(this).data('id');
// 		   loadProduct(id);
// // 		   $('ul.list-group>li').removeClass('active');
// // 		   $('ul.list-group>li[data-id="' + id + '"]').addClass('active');
// 	   });
	   
	   
	   function loadProduct(id){
		   $.getJSON('${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIservlet.do',{'action':id}, function(datas){
			   var th = $('#eventlist>thead');
			   var tb = $('#eventlist>tbody');
			   var docFrag = $(document.createDocumentFragment());
			   var docFrag2 = $(document.createDocumentFragment());
			   tb.empty();
			   $.each(datas,function(i,data){
				   console.log(data);
				   console.log(data.B_name);
				if(id=="m"){
				   var thc1 = $('<th></th>').text('師傅編號');
				   var thc2 = $('<th></th>').text('店家名稱');
				   var thc3 = $('<th></th>').text('師傅名稱');
				   var thc4 = $('<th></th>').text('店家地址');
				   var thc5 = $('<th></th>').text('店家狀態');
				   var thc6 = $('<th></th>').text('平均分數');
				   var thc7 = $('<th></th>').text('管理者註記');
				   var cell1 = $('<td></td>').text(data.M_id);
				   var cell2 = $('<td></td>').text(data.B_name);
				   var cell3 = $('<td></td>').text(data.c_name);
				   var cell4 = $('<td></td>').text(data.c_city+data.c_district+data.c_addr);
				   var cell5 = $('<td></td>').text(data.s_name);
				   var cell6 = $('<td></td>').text(data.c_averrating);
				   var cell7 = $('<td></td>').text(data.sa_note);
				   var rowth = $('<tr></tr>').append([thc1,thc2,thc3,thc4,thc5,thc6,thc7]);
				   var rowtb = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				   
				   docFrag.append(rowth);
				   docFrag.append(rowtb);
					}
				if(id=="c"){
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