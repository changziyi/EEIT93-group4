<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Wishing Page</title>

	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
     #wishblock {background-color:powderblue};
</style>	
</head>
<body>
	<H2 style="color:red">測試用頁面</H2>
			<div class=""col-xs-6 col-sm-3">
			   <div class="wb01">
				 <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal01">我要許願</button>			
					<div class="modal fade" id="myModal01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">	
					    <form method="POST" action="WishPool.do" enctype="multipart/form-data">
					      <table style="border:1PX black solid">
					        <tr>
					          <td>我想修 ：
					          <input type="text" name="w_pro" value="${param.w_pro}"/>${errorMsgs.pro1}${errorMsgs.pro2}
					          </td>
					        </tr>
					        <tr>
							  <td>位在地址：
							  <select name="w_city">
									<option>台北市</option>
									<option>桃園市</option>
									<option>新竹市</option>
									<option>台中市</option>
									<option>高雄市</option>
							  </select>
							  <select name="w_district">
									<option>大安區</option>
									<option>中山區</option>
									<option>新化區</option>
									<option>鳳山區</option>
									<option>北投區</option>	
							  </select>
							  </td>
							</tr>
							<tr>
						      <td>維修項目的照片：
						      <input type="file" name="w_image">
						      </td>
						    </tr>
						    <tr>
						      <td>
						      <label style="vertical-align:top">問題描述：</label>
						      <textarea name="w_content" style="width:400px;height:120px" placeholder="請描述問題原因"></textarea>
						      </td>   	   
						    </tr>    
						      <td>
						      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      <input type="submit" value="送出"/>
						      </td>
					  </table>
					</form>
				  </div>
				</div>
			 </div> <!--  我要許願按鈕wb01 -->
			 <BR>
			 <div>
			  <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal02">什麼事許願池</button>
			    <div class="modal fade" id="myModal02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
			      <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title" id="myModalLabel">許願池的作用是什麼?</h4>
				         </div>
				         <div class="modal-body">
				            <p>什麼情況會來許願呢?</p>
							<p>1.在我們的搜尋分類中找不到適合的維修選項。</p>
							<p>2.找不到合適的師父去處理您的問題。</p>
							<p>3.你想維修的東西屬於比較少見或是冷門的項目。</p>
							<p>在您許下願望後，我們的師傅將可以在許願池中
							       發現您的需求，如果師傅具備解決該問題的能力
							       ，都能夠自行接下單並盡速協助處理您的狀況。</p>
				        </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
			 </div>  <!-- 什麼是許願按鈕wb02 -->
		</div> <!-- 我要許願區塊wishblock -->
</body>
</html>