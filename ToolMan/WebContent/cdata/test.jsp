<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
   <head>
      <meta charset="utf-8">
      <title>jQuery UI Dialog functionality</title>
      <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <!-- CSS -->
      <style>
         .ui-widget-header,.ui-state-default, ui-button{
            background:#b9cd6d;
            border: 1px solid ;
            color: #FFFFFF;
            font-weight: bold;
         }
         
      </style>
      <!-- Javascript -->
      <script>
         $(function() {
            $( "#dialog-4" ).dialog({
               autoOpen: false, //開起網頁自動開啟
               modal: true,//鎖定頁面功能
               draggable: false,//無法拖曳
               height: 300,
               resizable: false,//無法更改視窗大小
               buttons: {
          	       取消: function() {$(this).dialog("close");}
               },
            });
            $( "#opener-4" ).click(function() {
               $( "#dialog-4" ).dialog( "open" );
            });
         });
      </script>
   </head>
   <body>
      <div id="dialog-4" title="忘記密碼">
		<div>
			<div style="font-size:16px;">請填寫您註冊帳號的E-mail，帳號密碼將會寄到您的E-mail信箱。</div>
     		mail:<input type="text" class="input" placeholder="E-mail" name="mail">
       </div>
      </div>
      
      
      <button id="opener-4">Open Dialog</button>
   </body>
</html>