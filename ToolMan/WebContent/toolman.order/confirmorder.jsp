<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="orderVO" class="toolman.order.model.OrderVO"/>
</head>
<body>


			<div>
				<table>
					<tr><td>${orderVO.getB_name()}</td>
						<td>${orderVO.getM_id()}</td>
						<td>${orderVO.getC_id()}</td></tr>
					
					<tr><td>${orderVO.getO_bdate()}</td>
						<td>${orderVO.getO_des()}</td>
						<td>${orderVO.getReq_exp()}</td></tr>
					
					<tr><td>${orderVO.getH_type()}</td>
						<td>${orderVO.getO_location()}</td>
						<td>${orderVO.getS_name()}</td></tr>
				</table>
			</div>
			<div>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/toolman.order/OrderController.do">
				<input type="hidden" name="action"value="confirmorder">
				    <input type="submit" value="確認訂單">

				</FORM>
			</div>
</body>
</html>