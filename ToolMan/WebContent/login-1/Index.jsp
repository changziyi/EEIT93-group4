<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lab04_02 加入會員</title>
</head> 
<style>
	.color{color:red}
</style>
<body>
<center>  
<!-- 
<form name="insertMemberFormA" action="member.do" method="POST">
-->
<form name="insertMemberFormA" action="" method="POST">
<table border="1" >
<thead>
<tr bgcolor='tan' ><th height="60" colspan="2" align="center">新增會員資料</th></tr>
</thead>
<tbody >
<tr bgcolor='tan' >
    <td width="120" height="40">帳號:</td>
    <td width="400" height="40" align="left" >
    <input id='num' style="text-align:left" name="id" type="text" size="14">
    <div class="color" >${errorMsgs.c_id}</div>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">密碼:</td>
    <td width="400" height="40" align="left" >
         <input id='num' style="text-align:left" name="pswd" type="password" size="14">
         <div class="color" >${errorMsgs.c_pwd}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">姓名:</td>
    <td width="400" height="40" align="left" >
         <input name="name" type="text" size="14">
         <div class="color" >${errorMsgs.c_name}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">生日:</td>
    <td width="400" height="40" align="left" >
         <input name="birth" type="text" size="14">
         <div class="color" >${errorMsgs.bday}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">電話號碼:</td>
    <td width="400" height="40" align="left" >
         <input name="phone" type="text" size="14">
         <div class="color" >${errorMsgs.phone}</div>
    </td>
</tr>

<tr bgcolor='tan' >
    <td width="120" height="40">E-mail:</td>
    <td width="400" height="40" align="left" >
         <input name="mail" type="text" size="14">
         <div class="color" >${errorMsgs.c_email}</div>
    </td>
</tr>

<tr bgcolor='tan' >
    <td width="120" height="40">縣市:</td>
    <td width="400" height="40" align="left" >
<!--          <input name="city" type="text" size="14"> -->
              <select name="city" class="select">
                   <option  value="台北市">台北市</option>
                   <option value="新北市">新北市</option>
                   <option value="桃園市">桃園市</option>
               </select>
         <div class="color" >${errorMsgs.c_city}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">地區:</td>
    <td width="400" height="40" align="left" >
<!--          <input name="district" type="text" size="14"> -->
                 		<select name="district" class="select1">
                   			<option value="大安區">大安區</option>
                    		<option value="中正區">中正區</option>
                    		<option value="萬華區">萬華區</option>
                    		<option value="信義區">信義區</option>
                 		</select>
         <div class="color" >${errorMsgs.c_district}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td width="120" height="40">住址:</td>
    <td width="400" height="40" align="left" >
         <input name="addr" type="text" size="14">
         <div class="color" >${errorMsgs.c_addr}</div>
    </td>
</tr>
<tr bgcolor='tan' >
    <td height="50" colspan="2" align="center">
    <input type="hidden" name="other" value="sign-up">
       <input type="submit" value="送出" >
    </td>
</tr>

</tbody>
</table>
</form>
</center>
</body>
</html>