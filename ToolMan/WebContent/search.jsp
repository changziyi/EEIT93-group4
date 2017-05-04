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


			</div>
		</form>
		
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
							
						var eleDiv = document.createElement("div");
						eleDiv.className = "list-group";
						
						
						if (show.childNodes.length > 0) {
								show.removeChild(show.childNodes[0]);
							}

							for (var j = 0, max = datas.length; j < max; j++) {
									var txtBtn = document.createTextNode(datas[j]);
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
			xhr.open('get','search?keyword='+txt.value);
			xhr.send();
		}
		
		function showMaster(){
			$.getJSON('search',{'search':txt.value},function(list){
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
 
// 		function callback(){

// 		if (xhr.readyState == 4){
//  		if(xhr.status == 200){
//  			//要如何接收Server端回傳的XML資料
// 			var doc = xhr.responseXML;

//  			//讀取XML中的資料
 			
// 			var sections = doc.getElementsByTagName("Section");

// 			while(myDiv.hasChildNodes()){
// 			myDiv.removeChild(myDiv.lastChild);
// 			}
// 			for(var i=0,max=sections.length;i<max;i++){
// 					var title =   sections[i].getElementsByTagName("stitle")[0].firstChild.nodeValue;
// 					var body =    sections[i].getElementsByTagName("xbody")[0].firstChild.nodeValue;
// 					var desc =    sections[i].getElementsByTagName("img")[0].getAttribute("description");
//  					var imgPath = sections[i].getElementsByTagName("img")[0].firstChild.nodeValue;
// 				    var eleImg =  document.createElement("img");
				    
// 				    eleImg.setAttribute("src",imgPath);
// 				    eleImg.setAttribute("title",desc);
// 				    eleImg.className = "img-thumbnail"
				    
// 	 				var eleDiv1 = document.createElement("div");
// 	 				eleDiv1.className = "col-md-4";
// 	 				eleDiv1.appendChild(eleImg);
	 				
// 				    var eleH3 = document.createElement("h3");
// 				    var txtH3 = document.createTextNode(title);
// 				    eleH3.appendChild(txtH3);
				    
// 				    var eleP = document.createElement("p");
// 				    var txtP = document.createTextNode(body.substr(0 , 150) +"...");
// 				    eleP.appendChild(txtP);
				    
// 				    var eleDiv2 = document.createElement("div");
// 				    eleDiv2.className = "col-md-8";
// 				    eleDiv2.appendChild(eleH3);
// 				    eleDiv2.appendChild(eleP);
				    
				    					    
// 				    var eleRow = document.createElement("div");
// 				    eleRow.className = "row";
// 				    eleRow.appendChild(eleDiv1);
// 				    eleRow.appendChild(eleDiv2);
// 				    myDiv.appendChild(eleRow);
// 					};	
// 			}else{
//  			alert(xhr.status + ":" + xhr.statusText);
// 				}
// 			}
// 		}
	</script>
</body>
</html>