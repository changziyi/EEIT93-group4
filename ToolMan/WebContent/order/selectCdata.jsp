<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<FORM METHOD="post" ACTION="OrderController.do" >
        <b>輸入會員帳號:</b>
        <input type="text" name="c_id">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getCdata">
    </FORM>
</body>
</html>