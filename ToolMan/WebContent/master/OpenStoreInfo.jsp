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
				<input type="text" name="m_name" value="${param.m_name}"/>${errorMsgs.name1}${errorMsgs.name2}</td>
			</tr>
			<tr>
				<td>電話:
				<input type="text" name="m_cel" /></td>
			<tr>
				<td>信箱:
				<input type="text" name="m_email" /></td>
			</tr>
			<tr>
				<td>地址:
				<span id="twzipcode"></span>
				<input type="text" name="m_addr" />${errorMsgs.city}
				</td>
			</tr>
			<tr>
				<td>維修類別:
				<input type="checkbox" name="m_pro" value="地板地磚">地板地磚
				<input type="checkbox" name="m_pro" value="水電工程">水電工程
				<input type="checkbox" name="m_pro" value="防水抓漏">防水抓漏
				<input type="checkbox" name="m_pro" value="油漆工程">油漆工程
				<input type="checkbox" name="m_pro" value="室內裝潢">室內裝潢
				${errorMsgs.m_pro}
				</td>
			</tr>
			<tr>
				<td>相關證照:
				<div><img id="m_cel"></div>
				<input type="file" name="m_cel" class="upl"></td>
			</tr>
			<tr>
<!-- 				<td><input type="submit" value="送出審核"></td> -->
<!-- 				<td><input type="hidden" name="action" value="OpenStore"></td> -->
				<td><input type="button" name="nextPage" value="下一頁"></td>
				<td><input type="hidden" name="m_city" ></td>
				<td><input type="hidden" name="m_district" ></td>
			</tr>
		</table>
	</div>
</form>
</div>

	<script>
	
	$(function() {
		
		$('input[name="m_cel"]').on('change', function(event) {
			preview(this);
		});
		
		function preview(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#m_cel').attr({
						'src' : e.target.result,
						'class' : 'changeImg'
					});
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	
		$('#twzipcode').twzipcode({
			'css': ['county', 'district', 'zipcode'],
		    'zipcodeSel'  : '106',
// 		    'countySel'   : '臺北市',
// 		    'districtSel' : '大安區',
		    'onCountySelect': function () {
		    	$('input[name="m_city"]').attr("value",this.value);
		    },
			'onDistrictSelect': function () {
		    	$('input[name="m_district"]').attr("value",this.value);
		    }
		});
		
		$('input[name="nextPage"]').click(function() {
			$(location).attr('href', 'OpenStoreDesc.jsp');
		});
		
	});

	</script>
	
</body>
</html>