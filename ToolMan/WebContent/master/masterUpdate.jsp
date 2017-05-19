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
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/theme.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/nav/nav.css">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<style>
		body {font-family:Microsoft JhengHei;}
		.myDiv {position:relative; top:90px;}
		.zipcode {display: none;}
	</style>
</head>

<body>
<jsp:include page="/nav/navigation.jsp" />
	<div class="container myDiv">
		<form method="post" action="master.do" enctype="multipart/form-data">
			<div>
				<table>
					<tr>
						<td>專業證照:
						<div><img id="m_cer"></div>
						<input type="file" name="m_cer" ></td>
					</tr>
					<tr>
						<td>師傅姓名:
						<input type="text" name="m_name" value="${mdataVO.m_name}"/></td>
					</tr>
					<tr>
						<td>電話:
						<input type="text" name="m_cel" value="${mdataVO.m_cel}"/></td>
					<tr>
						<td>信箱:
						<input type="text" name="m_email" value="${mdataVO.m_email}"/></td>
					</tr>
					<tr>
						<td>地址:
						<span id="twzipcode"></span>
						<input type="text" name="m_addr" value="${mdataVO.m_addr}"/>
						</td>
					</tr>
					<tr>
						<td>維修類別:<br >
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
					<td>首頁圖片:
						<div><img id="b_image"></div>
						<input type="file" name="b_image" /></td>
					</tr>
					<tr>
						<td>店家名稱:
						<input type="text" name="b_name" value="${mdataVO.b_name}" /></td>
					</tr>
					<tr>
						<td>店家介紹:
						<textarea name="b_des">${mdataVO.b_des}</textarea></td>
					</tr>
					<tr>
						<td><input type="hidden" name="action" value="OpenStoreStep" ></td>
						<td><input type="hidden" name="m_city" value="${mdataVO.m_city}" ></td>
						<td><input type="hidden" name="m_district" value="${mdataVO.m_district}"></td>
						<c:forEach var="aMpro" varStatus="count1" items="${mdataVO.mpros}">
							<td class="prc"><input type="hidden" name="hidpro" value="${aMpro.m_pro}"></td>
						</c:forEach>
						<td><input type="submit" name="nextPage" value="送出"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
<script src="${pageContext.servletContext.contextPath}/js/jquery.twzipcode.min.js"></script>		
<script>
	var city = $('input[name="m_city"]');
	var district = $('input[name="m_district"]');

	$('#twzipcode').twzipcode({
		'css': ['county', 'district', 'zipcode'],
	    'countySel'   : '${mdataVO.m_city}',
	    'districtSel' : '${mdataVO.m_district}',
	    'onCountySelect': function () {
	    	city.attr("value", this.value);
	    },
		'onDistrictSelect': function () {
			district.attr("value", this.value);
	    }
	});
	
	//預設勾選專業 
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