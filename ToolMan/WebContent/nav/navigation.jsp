<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="toolman.cdata.model.*"%>
<%@ page import="toolman.order.model.*"%>
 	   <%@ page import=" java.util.*"%>
<div class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.servletContext.contextPath}/index.jsp">ToolMan</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.servletContext.contextPath}/index.jsp" class="">首頁</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/master/master.do?city=all&action=SearchAll" class="">我要找師傅</a></li>          
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我要開店  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
  <%-----------------------------------------------訂單表-暫時先擺這------------------------------------------------------------------- --%>
                                <li>
                                <a href="${pageContext.servletContext.contextPath}/mdata/MdataOrderServlet.do?m_id=${LoginOK.m_id}&action=listOrder">師傅訂單</a>
                                </li>
                                
                            <li><a href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=listOrder">消費者訂單</a> </li>
   <%-----------------------------------------------墨西哥長城------------------------------------------------------------------- --%>
                            
                            </ul>
                        </li>
                        <li><a href="${pageContext.servletContext.contextPath}/wishpool/Wishing+waterfall.jsp">許願池  </a></li>
                           </ul>
                         
                     <!----------- 搜尋列----- -->
                       <ul class="navbar-right">
					    <form class="navbar-form">
					        <div class="form-group">
					          <input type="text" class="form-control" placeholder="Search">
					        </div>
					        <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
					      </form>
					</ul>
                     <!----------- 搜尋列----- -->
                    <ul class="nav navbar-nav pull-right">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">登入  <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.servletContext.contextPath}/cdata/login-in.jsp">ToolMan 帳號</a></li>
                                <li><a href="#">Facebook 帳號</a></li>
                            </ul>
                        </li>
                        <li class=""><a href="${pageContext.servletContext.contextPath}/loginoutServlet">登出</a></li>
                    </ul>
                </div>
           
                </div>
            
            </div>
        </nav>
    </div>