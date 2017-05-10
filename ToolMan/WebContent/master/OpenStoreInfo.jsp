<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OpenStore Page</title>
<style type="text/css">
	.zipcode {
		display: none;
	}
	.changeImg {
		width: 200px;
	}
</style>
<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>
</head>
<body>

<h3>我要開店</h3>

<div>
<form method="post" action="master.do" enctype="multipart/form-data" >
	<div>
		<table>
			<tr>
				<td>師傅姓名:
				<input type="text" name="m_name" value="${cdata_mdataVO.m_name}"/>${errorMsgs.name1}${errorMsgs.name2}</td>
			</tr>
			<tr>
				<td>電話:
				<input type="text" name="m_cel" value="${cdata_mdataVO.m_cel}"/></td>
			<tr>
				<td>信箱:
				<input type="text" name="m_email" value="${cdata_mdataVO.m_email}"/></td>
			</tr>
			<tr>
				<td>地址:
				<span id="twzipcode"></span>
				<input type="text" name="m_addr" value="${cdata_mdataVO.m_addr}"/>${errorMsgs.city}${errorMsgs.addr}
				</td>
			</tr>
			<tr>
				<td>維修類別:
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
				${errorMsgs.m_pro}
				</td>
			</tr>
			<tr>
				<td>專業證照:
				<div><img id="m_cer"></div>
				<input type="file" name="m_cer" ></td>
			</tr>
			<tr>
				<td><input type="submit" name="nextPage" value="下一步"></td>
				<td><input type="hidden" name="action" value="OpenStoreStep" ></td>
				<td><input type="hidden" name="m_city" value="${cdata_mdataVO.m_city}" ></td>
				<td><input type="hidden" name="m_district" value="${cdata_mdataVO.m_district}"></td>
			</tr>
		</table>
	</div>
</form>
</div>

	<script>
	
	$(function() {
		
		//使用者選取圖片時觸發
		$('input[name="m_cer"]').on('change', function(event) {
			preview(this);
		});
		
		//預覽圖片
		function preview(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#m_cer').attr({
						'src' : e.target.result,
						'class' : 'changeImg'
					});
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		
// 		$(':checkbox').click(function(){
// 		    var data = [];
//         	$(':checkbox[name = "m_pro"]:checked').each(function() {
// //         		console.log($(this).val());
//         		data.push($(this).val());
//         	});
// //         	console.log(data);
//     		$.each(data, function(idx,value) {
// // 				console.log(idx);
// // 				console.log(value);
				
// 			});
//         });
    	
		
		//縣市選單，透過hidden欄位取值ˋ
		var city = $('input[name="m_city"]');
		var district = $('input[name="m_district"]');
		
		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
		    'countySel'   : '${cdata_mdataVO.m_city}',
		    'districtSel' : '${cdata_mdataVO.m_district}',
		    'onCountySelect': function () {
		    	city.attr("value", this.value);
		    },
			'onDistrictSelect': function () {
				district.attr("value", this.value);
		    }
// 		    'countySel'   : city.attr("value"),
// 		    'districtSel' : district.attr("value")
		});
		
		
	});

	</script>
	
</body>
</html>