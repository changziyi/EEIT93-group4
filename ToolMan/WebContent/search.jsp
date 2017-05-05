<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

	<div class="container" >
		<form name="myData" action="Index.jsp" method="get">
			<div class="form-group">
				<input type="text" class="form-control" id="txtSearch"
				name="keyword" autocomplete="off">
				<input type="button" value="Load" id="buttonLoad">
				<input type="hidden" name="m_city" value="${mdataVO.m_city}" >

			</div>
		</form>
		
			位在地址： 
				<select name="m_city">
					<option>台北市</option>
					<option>桃園市</option>
					<option>新竹市</option>
					<option>苗栗市</option>
					<option>台中市</option>
					<option>彰化市</option>
					<option>雲林市</option>
					<option>嘉義市</option>
					<option>台南市</option>
					<option>高雄市</option>
				</select>
	
		<div id="div1"></div>	
	</div>
	
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
		var show;
		var txt = document.getElementById("txtSearch");
		window.addEventListener("load", init, false);
		function init() {
			
			txt.addEventListener("keyup", getData, false);
			show = document.getElementById("div1");
		}
		function getData() {
			var xhr = new XMLHttpRequest();
			if(xhr!=null){
				xhr.addEventListener('load',function(){
					if(xhr.status==200){
						var datas = JSON.parse(xhr.responseText);
						show.style.display = "block";
							console.log(datas);
						var eleDiv = document.createElement("div");
						eleDiv.className = "list-group";
						
						
						if (show.childNodes.length > 0) {
								show.removeChild(show.childNodes[0]);
							}

							for (var j = 0, max = datas.length; j < max; j++) {
									var txtBtn = document.createTextNode(datas[j].B_name);
									var eleBtn = document.createElement("button");
										eleBtn.className = "list-group-item";
										eleBtn.setAttribute("type", "button");
										eleBtn.appendChild(txtBtn);
										eleBtn.addEventListener("click", function() {
											document.myData.keyword.value = this.firstChild.nodeValue;
											show.style.display = "none";
											
											showMaster();
											
										}, false)
									eleDiv.appendChild(eleBtn);
								}
								show.appendChild(eleDiv);
							if (txt.value=="") {
								show.removeChild(show.childNodes[0]);
							}
						} else {
							alert(xhr.status + ":" + xhr.statusText);
						}
				  })
			}
			xhr.open('get','master/MdataJsonServlet?city='+txt.value+'&input='+txt.value);
			xhr.send();
		}
		
		function showMaster(){
			$.getJSON('MdataJsonServlet',{'MdataJsonServlet':txt.value},function(list){
		console.log(123)
	
		for(var j=0,max=list.length; j<max;j++){
			var eleDiv00 = $('<div></div>')
							.addClass('col-sm-3 col-md-4')
							.css({'width':'390px','height':'462px'});
			var eleDiv01 = $('<div></div>').addClass('uk-box-shadow-small uk-box-shadow-hover-large').appendTo(eleDiv00);
			}
		})
	}
		
	</script>
	<script>
		var xhr = null,
		btn = document.getElementById("buttonLoad"),
		myDiv = document.getElementById("div1");
 		btn.addEventListener("click",load);
 		function load(){
		xhr = new XMLHttpRequest();
		
		if (xhr != null){
			xhr.open("GET","master.xml");
			xhr.send();
			xhr.addEventListener("readystatechange",callback);
		}else{
			alert("您的瀏覽器不支援Ajax功能!!");
			}
		}
 
		var city = $('input[name="m_city"]');
		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
		    'countySel'   : '${mdataVO.m_city}',
	
		    'onCountySelect': function () {
		    	city.attr("value", this.value);
		    }
		
	</script>
</body>
</html>