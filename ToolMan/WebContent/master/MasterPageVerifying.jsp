<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ToolMan</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="Shortcut Icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
</head>
	<style>
		body {font-family:Microsoft JhengHei;}
		.myDiv {position:relative; top:300px;}
		.h3n {margin:1%;}
		.zipcode {display: none;}
		.zip {margin:auto; width:100px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
	</style>
<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="myDiv">
		<div class="text-center">
			<h3 class="h3n">店家審核中，敬請等待</h3>
			<a href="${pageContext.servletContext.contextPath}/index.jsp" class="btn btn-info">回首頁</a>
			<a class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span> 編輯店家</a>
		</div>
		
		
						<div class="container">
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog" style="width:43%">
						      <!-- Modal content-->
						      
							<form method="post" action="master.do" enctype="multipart/form-data" name="updateform">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">編輯店家資訊</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<table class="table">
											<tr>
												<td>專業證照</td>
												<td><div><img id="m_cer" class="img-thumbnail" width="350px" src="${pageContext.servletContext.contextPath}/master/master.do?type=cer&image=${LoginOK.m_id}"></div>
												<input type="file" name="m_cer" ></td>
											</tr>
											<tr>
												<td>師傅姓名</td>
												<td><input type="text" name="m_name" class="form-control" value="${mdataVOVeri.m_name}"/></td>
											</tr>
											<tr>
												<td>電話</td>
												<td><input type="text" name="m_cel" class="form-control" value="${mdataVOVeri.m_cel}"/></td>
											<tr>
												<td>信箱</td>
												<td><input type="text" name="m_email" class="form-control" value="${mdataVOVeri.m_email}"/></td>
											</tr>
											<tr>
												<td>地址</td>
												<td><span id="twzipcode"></span>
												<input type="text" name="m_addr" class="form-control" value="${mdataVOVeri.m_addr}"/>
												</td>
											</tr>
											<tr>
												<td>維修類別</td>
												<td>
													<input type="checkbox" name="m_pro" value="地板地磚">地板地磚
													<input type="checkbox" name="m_pro" value="防水抓漏">防水抓漏
													<input type="checkbox" name="m_pro" value="室內裝潢">室內裝潢
													<input type="checkbox" name="m_pro" value="冷氣空調">冷氣空調
													<input type="checkbox" name="m_pro" value="水電工程">水電工程 <br>
													<input type="checkbox" name="m_pro" value="門窗工程">門窗工程
													<input type="checkbox" name="m_pro" value="油漆工程">油漆工程
													<input type="checkbox" name="m_pro" value="木作工程">木作工程
													<input type="checkbox" name="m_pro" value="泥作工程">泥作工程
													<input type="checkbox" name="m_pro" value="照明工程">照明工程
												</td>
											</tr>
											<tr>
												<td>首頁圖片</td>
												<td><div><img id="b_image" width="350px" class="img-thumbnail" src="${pageContext.servletContext.contextPath}/master/master.do?type=master&image=${LoginOK.m_id}"></div>
												<input type="file" name="b_image" ></td>
											</tr>
											<tr>
												<td>店家名稱</td>
												<td><input type="text" name="b_name" class="form-control" value="${mdataVOVeri.b_name}" /></td>
											</tr>
											<tr>
												<td>店家介紹</td>
												<td><textarea name="b_des" class="form-control" rows="8">${mdataVOVeri.b_des}</textarea></td>
											</tr>
										</table>
									</div>
						        </div>
						        <div class="modal-footer">
						        	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
						        	<button type="button" class="btn btn-default" id="updatebtn">送出</button>
						        </div>
									<input type="hidden" name="action" value="updateMasterVeri" >
									<input type="hidden" name="m_city" value="${mdataVOVeri.m_city}" >
									<input type="hidden" name="m_district" value="${mdataVOVeri.m_district}">
									<c:forEach var="aMpro" varStatus="count1" items="${mdataVOVeri.mpros}">
									<div class="prc"><input type="hidden" name="hidpro" value="${aMpro.m_pro}"></div>
								</c:forEach>
						      </div>
							</form>
		</div>
	</div>
	
</div>

	</div>
	
	<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
	<script>
		
	
		var city = $('input[name="m_city"]');
		var district = $('input[name="m_district"]');
	
		$('#twzipcode').twzipcode({
			'css': ['form-control zip', 'form-control zip', 'zipcode'],
		    'countySel'   : '${mdataVOVeri.m_city}',
		    'districtSel' : '${mdataVOVeri.m_district}',
		    'onCountySelect': function () {
		    	city.attr("value", this.value);
		    },
			'onDistrictSelect': function () {
				district.attr("value", this.value);
		    }
		});
	
		var pro = $('input[name="m_pro"]');
		
		$('#updatebtn').click(function(){
			
			var updatedata = $('form[name="updateform"]').serializeArray();
			var cerpho = $('input[name="m_cer"]')[0].files[0];
			var bpho = $('input[name="b_image"]')[0].files[0];
			var formData = new FormData();
			
			$.each(updatedata, function(index, input) {
				formData.append(input.name, input.value);
				console.log('name: ' + input.name);
				console.log('value: ' + input.value);
			});
			
			formData.append('m_cer', cerpho);
			formData.append('b_image', bpho);
			
			$.ajax({
				url : 'master.do',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				type : 'POST',
					success : function(reutrnData) {
						$(location).attr('href','MasterPageVerifying.jsp');
					}
			});
		});
		
		$('input[name="m_cer"]').on('change', function(event) {
			if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#m_cer').attr({
						'src' : e.target.result,
					});
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		
		$('input[name="b_image"]').on('change', function(event) {
			if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#b_image').attr({
						'src' : e.target.result,
					});
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		
		var hpros = $('input[name="hidpro"]');
	
		$.each(hpros, function() {
			var parentd = $(this).parent('.prc');
			var apro = parentd.find('input[name="hidpro"]').val();
			console.log(apro);
			$("input[name=m_pro][value=" + apro + "]").prop('checked', true);
		})
	
	</script>
</body>
</html>