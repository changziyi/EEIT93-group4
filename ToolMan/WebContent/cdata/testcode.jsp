<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>  
<html>  
    <head>  
        <meta charset="UTF-8">  
        <title></title>  
        <script src="jquery/jquery.js"></script>  
    <style>  
        body{padding: 0;margin: 0;background: #F7FAFC;}  
        a{text-decoration: none;}  
        .index-box{width:300px;height: auto;margin:0 auto;margin-top: 40px;}          
        .logo{background:url(images/header/headerNew4.png) no-repeat;;width: 350px;height: 100px;margin:0 auto}  
        .title{font-size: 18px;text-align: center;color: #707171;font-weight: bold;margin: 30px auto;}        
        .index-body{text-align: center;}  
        .nav-sliders{position: relative;display: inline-block;margin-bottom: 20px;}  
        .nav-sliders>a{font-size: 20px;display: inline-block;width:60px ;font-family: "微软雅黑";color: #999;cursor: pointer;float: left;$width}  
        .nav-sliders>a.active{color: #0f88eb;}  
        .nav-sliders>span{position: absolute;height: 2px;background:#0f88eb;display:block;left: 5px;width: 50px;bottom:-8px;}  
  
        .stage{position:absolute;left:0;top:0;width:100%;height:100%;background:#F7FAFC;}  
  
          
        .login-box{width: 300px;}  
        .wrap{border:1px solid #d5d5d5;border-radius: 5px;background: #fff;}  
        .wrap>div{position: relative;overflow: hidden;}  
        .wrap>div>input{width: 95%;border:none;padding:17px 2.5%;border-radius: 5px;}  
        .wrap>div>label.error{position: absolute;color: #c33;top: 0;line-height: 50px;transform: translate(25px,0);transition: all 0.5s ease-out;-webkit-transform: translate(25px,0);-moz-transform: translate(25px,0);opacity: 0;visibility:hidden;cursor: text;}  
        .wrap>div>label.move{transform: translate(0,0);transition: all 0.5s ease-out;-webkit-transform: translate(0,0);-moz-transform: translate(0,0);opacity: 1;visibility: visible;}  
        .password{border-top: solid 1px #d5d5d5 ;}  
        .code{right:115px ;}  
        .name{right:5px ;}  
        .loginName{right:5px ;}  
        .loginPass{right:5px ;}  
        .pass{right:5px ;}  
        .passagain{right:5px ;}  
        .button{height: 40px;background:#0f88eb;text-align: center;line-height: 40px;border-radius: 5px;margin-top: 25px;color: #fff;font-family: "微软雅黑";cursor: pointer;}  
        .remember{text-align: left;margin-top: 20px;font-family: "微软雅黑";color: #666666;}  
        .remember>a{float:right;cursor: pointer;color: #666666;}  
        .other{text-align: left;margin-top: 20px;font-family: "微软雅黑";color: #666666;overflow: hidden;}  
        .other>span{font-size: 14px;float: left;margin-top: 2px;cursor: pointer;}  
        .other>div{float: left; transition: all 1s ease-in;-webkit-transition: all 0.3s ease-in;opacity: 0;transform: translateX(-20px);-webkit-transform: translateX(-18px);-moz-transform: translateX(-18px);visibility: hidden;}  
        .other>div>a{margin-left: 20px;color: #666666;font-size: 15px;}  
        .other>.hidden{ transition: all 1s ease-in;display: block;-webkit-transition: all 0.3s ease-in;opacity: 1;transform: translateX(0);-webkit-transform: translateX(0);-moz-transform: translateX(0);visibility: visible;}  
        .download{border:solid 1px #0f88eb;height: 40px;line-height: 40px;border-radius: 5px;color:#0f88eb ;font-family: "微软雅黑";margin-top: 50px;cursor: pointer;position: relative;}  
        .download>.close{display: none;}  
        .download .pic{display:none;position: absolute;background: #fff;bottom: 78px;width: 310px;left: -10px;z-index: 5;padding: 40px 0;border-radius: 8px;box-shadow: 0 0 8px 0 rgba(0,0,0,.15);}  
        .registered-box{width: 300px; display: none;}  
        .text{font-size: 14px;margin-top: 20px;font-family: "微软雅黑";color: #666666;}  
        .text>a{color: #0f88eb;}  
        .verification-code{position: absolute;right:22px;top: 14px;font-family: "微软雅黑";font-size: 18px;cursor: pointer;}  
        #register:hover{opacity: 0.7;}  
        #login:hover{opacity: 0.7;}  
    </style>  
    </head>  
    <body>  
        <div class="index-box" style="z-index:9999;position:relative">  
            <div class="index-header">  
                <h1 class="logo"></h1>  
                <h2 class="title">Speed4C开发平台</h2>  
            </div>  
            <div class="index-body">  
                <div class="nav-sliders">  
                    <a id="loginButton" class="login active">登录</a>  
                    <a class="registered">注册</a>  
                    <span class="on"></span>  
                </div>  
                <div class="change">  
                  
                <!--登录开始-->  
                    <div class="login-box">  
                    <form id="loginForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">  
                        <div class="wrap">  
                            <div class="phone">  
                                <input type="email" id="username" name='j_username' value="" placeholder="用户名">  
                                <label class="error loginName">请输入登录名（email地址）</label>  
                            </div>  
                            <div class="password">  
                                <input type="password" id="password" name='j_password' placeholder="密码">  
                                <label class="error loginPass">密码</label>  
                            </div>  
                        </div>  
                        <div class="button" id="login">登录</div>               
                        <div class="remember">  
                            <label><input id="rememberMe" name="_spring_security_remember_me" type="checkbox">记住我:</label>  
                            <a>无法登陆?</a>  
                        </div>  
                        </form>  
                        <div class="other">  
                            <span>社交账号登录</span>  
                            <div class="other-login">  
                                <a  href ="javascript:volid(0);">扣扣</a>  
                                <a  href ="javascript:volid(0);">微信</a>  
                                <a  href ="javascript:volid(0);">微博</a>  
                            </div>  
                        </div>  
                        <div class="other">  
                            <span style="color:red">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</span>  
                        </div>  
                    </div>  
                <!--登录结束-->  
                  
                                    <!--注册开始-->  
                    <div class="registered-box">  
                    <form id="registerForm" method="post" action="registerUser.do">  
                        <div class="wrap">  
                            <div class="phone">  
                                <input type="email" name="name" value="" id="name" placeholder="用户名（邮箱）">  
                                <label class="error name">请输入用户名</label>  
                            </div>  
<!--                             <div class="password">  
                                <input type="text"  id="phone" value="" placeholder="手机号">  
                                <label class="error phone restet">请输入手机号</label>  
                            </div> -->  
                            <div class="password">  
                                <input type="password" id="passwor" name="passwor"  value="" placeholder="密码">  
                                <label class="error pass" >请输入密码</label>  
                            </div>  
                            <div class="password">  
                                <input type="password" id="pssworAgain" name=""  value="" placeholder="再次输入密码">  
                                <label class="error passagain">请再次输入密码</label>  
                            </div>  
                            <div class="password">  
                                <input type="text" id="code" name="" maxlength="6" value="" placeholder="验证码">  
                                <label class="error passwor code">请输入验证码</label>  
                                <div class="verification-code" id="createCade"></div>  
                            </div>  
                        </div>  
                        <div class="button" id="register">注册</div>  
                    </form>  
                    </div>  
                      
                <!--注册结束-->  
                </div>  
                </div>  
            </div>  
          <canvas id="canvas" class="stage" style="z-index:1000"></canvas>  
            <script>  
        "use strict";(function(h,d){var g=typeof d==="string"?document.querySelector(d):d,f=g.getBoundingClientRect(),c=f.width,l=f.height,n=g.getContext("2d"),j={x:c/2,y:l/2,radius:180},k=40,e=60,a=[],b;g.width=c;g.height=l;h.raf=h.requestAnimationFrame||webkitRequestAnimationFrame||function(p){return setTimeout(p,1000/60);};h.caf=h.cancelAnimationFrame||webkitCancelAnimationFrame||function(p){clearTimeout(p);};Function.prototype.method=function(q,p){return this.prototype[q]=p,this;};function i(p,r,q){this.x=this.ox=p;this.y=this.oy=r;this.radius=Math.random()*1+2;this.timer=q|0;}i.method("draw",function(p,v,r){var s=this.closest,q,u,t=this.getAlpha(r);if(t>0){p.fillStyle=p.strokeStyle="rgba(156,217,249,"+t+")";p.beginPath();p.arc(this.x,this.y,this.radius,0,Math.PI*2,true);p.closePath();p.fill();if(s){q=s.length;while(q--){u=v[s[q]];p.beginPath();p.moveTo(this.x,this.y);p.lineTo(u.x,u.y);p.stroke();}}}if(this._isMove){this.move();return;}if(this.timer++===this._moveFrames){this.setMove();}}).method("setMove",function(){this._isMove=true;this._frames=Math.random()*100+120;this._frame=0;this._tx=this.ox+Math.random()*100-50;this._ty=this.oy+Math.random()*100-50;}).method("move",function(){this.x=this.ease(this._frame++,this.x,this._tx-this.x,this._frames);this.y=this.ease(this._frame,this.y,this._ty-this.y,this._frames);if(Math.abs(this.x-this._tx)<0.5&&Math.abs(this.y-this._ty)<0.5){this._isMove=false;this.timer=0;}}).method("getAlpha",function(s){var q=this.x-s.x,p=this.y-s.y,u=Math.sqrt(q*q+p*p),t=s.radius;return u>t?0:(1-u/t)*0.6;}).method("ease",function(q,p,s,r){if((q/=r/2)<1){return s/2*q*q+p;}return -s/2*((--q)*(q-2)-1)+p;}).method("_moveFrames",e);function m(){var q=Math.max(60,c*1.5/k),t=l*1.5/q+0.5|0,v,r=0,s,u,p;v=c/q+0.5|0;for(;r<t;r++){for(s=0;s<v;s++){u=new i(s*q+(Math.random()*q*2-q),r*q+(Math.random()*q*2-q),Math.random()*e);p=r*v+s;a[p]=u;if(r&1&&s&&1){u.closest=[p-1,p-v,p-v-1];s<v-1&&u.closest.push(p+1);r<t-1&&u.closest.push(p+v);}}}o();}function o(){n.clearRect(0,0,c,l);a.forEach(function(r,q,p){r.draw(n,p,j);});b=raf(o);}g.addEventListener("mousemove",function(p){j.x=p.clientX-f.left;j.y=p.clientY-f.top;},false);h.addEventListener("resize",function(){caf(b);a=[];f=g.getBoundingClientRect();g.width=c=f.width;g.height=l=f.height;m();},false);m();})(this,document.querySelector(".stage"));  
            </script>   
        <script>  
            var code;//定义一个全局验证码  
            $(function(){  
                jcPublic.register();  
                jcPublic.Tab();  
                jcPublic.login();     
                /* jcPublic.downLoad(); */  
                jcPublic.createCode();  
                jcPublic.clickCode();  
                $(".wrap>div>input").focus(function(){  
                    $(this).css({"outline": "none" });  
                    var $this = $(this);  
                    $this.next("label").removeClass("move");//隐藏提示信息  
                });  
                $(".other>span").on("click",function(){  
                    $(this).parent().children("div").toggleClass("hidden");  
                });  
                  
            });  
              
              
            var jcPublic = {  
                register:function(){//注册  
                    var currentThis = this;//当前对象  
                    $("#register").on("click",function(){  
                        var $this = $(this);  
                        var name = $("#name").val();//姓名  
                        var registerName = document.getElementById("name");  
                        var passwor = $("#passwor").val();  
                        var passworAgain = $("#pssworAgain").val();  
                        var Code = $("#code").val();//验证码  
                        if(name.length==0 && passwor.length==0){//同时为空  
                            $this.prev(".wrap").find("label").addClass("move");  
                            return false;  
                        }else if(name == "" || name == "undefined" || name == "null"){  
                            $this.prev(".wrap").find(".name").html("请输入用户名").addClass("move");  
                            return false;  
                        }else if(!registerName.checkValidity()){  
                            $this.prev(".wrap").find(".name").html("请输入有效的email地址").addClass("move");  
                            return false;  
                        }else if(passwor == "" || passwor == "undefined" || passwor == null ){  
                            $this.prev(".wrap").find(".pass").addClass("move");  
                            return false;  
                        }else if(passworAgain == "" || passworAgain == "undefined" || passworAgain == null ){  
                            $this.prev(".wrap").find(".passagain").addClass("move");  
                            return false;  
                        }else if(passworAgain == "" || passworAgain == "undefined" || passworAgain == null ){  
                            $this.prev(".wrap").find(".passagain").addClass("move");  
                            return false;  
                        }else if(passworAgain != passwor){  
                            $this.prev(".wrap").find(".passagain").html("请确保输入的密码一致").addClass("move");  
                            return false;  
                        }else if(code !== Code ){  
                            $this.prev(".wrap").find(".code").html("验证码有误").addClass("move");  
                            return currentThis.createCode();//验证码输入有误就刷新验证码重新输入  
                        }else{  
                             //发送添加用户申请  
                            $.ajax({  
                                type : "POST",  
                                url : "registerUser.do",  
                                data : {"name":name,"password":passwor},  
                                dataType: "json",   
                                error: function(XMLHttpRequest, textStatus, errorThrown){  
                                    alert("Error:"+XMLHttpRequest.status+",,,"+textStatus);  
                                },  
                                success : function(msg) {  
                                    alert(msg.messageString);  
                                    if(msg.messageString == "注册成功"){  
                                        $("#loginButton").click();  
                                        $("#registerForm")[0].reset();  
                                          
                                    }                         
                                }  
                            });   
                            /* $("#registerForm").ajaxSubmit(function(message){  
                                alert(message.messageString);  
                            }); */  
                        }  
                    });  
                },  
                Tab:function(){//切换注册和登录  
                    $(".nav-sliders>a").on("click",function(){  
                        $(this).addClass("active").siblings().removeClass("active");  
                        var $width = $(this).width();//当前a的宽度  
                        var $index = $(this).index();//索引  
                        $(".on").stop(true,true).animate({"left":$width*$index+5+"px"},300);  
                        $(this).parents(".index-body").children(".change").children().eq($index).stop(true,false).show().siblings().hide();  
                    });  
                },  
                login:function(){  
                    $("#login").on("click",function(){  
                        var $this = $(this);  
                        var username = $("#username").val();  
                        var password = $("#password").val();  
                        var checkloginName = document.getElementById("username");  
                        if((password.length==0) && (username.length==0)){//同时为空  
                            $this.prev(".wrap").find("label").addClass("move");  
                            return false;  
                        }else if(username == "" || username == "undefined" || username == null ){  
                            $this.prev(".wrap").find(".loginName").addClass("move");  
                            return false;  
                        }else if(!checkloginName.checkValidity()){  
                            $this.prev(".wrap").find(".loginName").html("请输入有效的email地址").addClass("move");  
                            return false;  
                        }else if(password == "" || password == "undefined" || password == null ){  
                            $this.prev(".wrap").find(".loginPass").addClass("move");  
                            return false;  
                        }else{  
                            //全部通过再提交  
                            $("#loginForm").submit();  
                              
                        }  
                    });  
                },  
                downLoad:function(){  
                    $(".download").on("click",function(){  
                        $(this).children(".pic").toggle(300);  
                    });  
                },  
                createCode:function(){//验证码  
                        var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，也可以用中文的   
                        code="";  
                        var codeLength=4;//验证码的长度  
                        for(var i =0;i<codeLength;i++){  
                            var index = Math.floor(Math.random()*selectChar.length);//随机数  
                            code +=selectChar[index];  
                            //$("#createCade").html(code)  
                        }  
                        return $("#createCade").html(code);  
                          
                      
                },  
                clickCode:function(){//切换验证码  
                    var $this = this;  
                    $("#createCade").on("click",function(){  
                        return $this.createCode();  
                    });  
                      
                }  
            };  
        </script>  
    </body>  
</html>  
