<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Success</title>
</head>
<body>
<<<<<<< HEAD
<H1>註冊資料成功，歡迎加入</H1>
=======
<H1>${ cdataVO.c_name }，註冊資料成功，歡迎加入</H1>
>>>>>>> branch 'master' of https://github.com/changziyi/EEIT93-group4.git
帳號: ${ cdataVO.c_id }<BR>
密碼: ${ cdataVO.c_pwd }<BR>
姓名: ${ cdataVO.c_name }<BR>
生日: ${ cdataVO.c_birth }<BR>
電話號碼: ${ cdataVO.c_cel }<BR>
E-mail: ${ cdataVO.c_email }<BR>
縣市: ${ cdataVO.c_city }<BR>
地區: ${ cdataVO.c_district }<BR>
地址: ${ cdataVO.c_addr }<BR>
</body>
</html>