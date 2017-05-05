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
			
				<ul class="nav nav-tabs nav-justified" style="width:800px; margin:auto;" >
				
					<li data-id="m" data-toggle="tab" role="presentation" class="active" id="masterlist"><a href="#"><div>師傅列表</div></a></li>
					
					<li data-id="c" data-toggle="tab" role="presentation" id="customerlist" ><a href="#" ><div >消費者列表</div></a></li>
					
					<li data-id="r" data-toggle="tab" role="presentation" id="reportlist" ><a href="#" ><div>檢舉案件</div></a></li>
					
					<li data-id="o" data-toggle="tab" role="presentation" id="orderlist"><a href="#" ><div>訂單列表</div></a></li>
	
					<li data-id="a" data-toggle="tab" role="presentation" id="customeranalysis"><a href="#" ><div>用戶分析</div></a></li>
										
					<li data-id="ad" data-toggle="tab" role="presentation" id="adlist"><a href="#" ><div>廣告</div></a></li>
							
				</ul>
			</div>
		</nav>
	</header>
<!-- Function button -->
	<div>
		
	</div>
<!-- main content here -->		
	<article>
	<table>
	<tbody id="eventlist">
	
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
	   
	   $('#navigator>ul>li').on('click','li',function(){	
		   var id = $(this).data('id');
		   loadProduct(id);
// 		   $('ul.list-group>li').removeClass('active');
// 		   $('ul.list-group>li[data-id="' + id + '"]').addClass('active');
	   });
	   
	   
	   function loadProduct(id){
		   $.getJSON('${pageContext.servletContext.contextPath}/toolman.managerUI.controller/ManagerUIservlet.do',{'action':id}, function(datas){
			   var tb = $('#eventlist>tbody');
			   var docFrag = $(document.createDocumentFragment());
			   tb.empty();
			   $.each(datas,function(idx,thedata){
				   //onsole.log(product.ProductName);
				   var cell1 = $('<td></td>').text(thedata.c_jdate);
				   var cell2 = $('<td></td>').text(thedata.c_id);
				   var cell3 = $('<td></td>').text(thedata.c_name);
				   var cell4 = $('<td></td>').text(thedata.c_city+thedata.c_district+thedata.c_addr);
				   var cell5 = $('<td></td>').text(thedata.s_name);
				   var cell6 = $('<td></td>').text(thedata.c_averrating);
				   var cell7 = $('<td></td>').text(thedata.sa_note);
				   var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				   docFrag.append(row);
			   });
			   tb.append(docFrag);
		   });   
	   }
	}); 

</script>


</body>
</html>