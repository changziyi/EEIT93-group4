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
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.servletContext.contextPath}/index.jsp">ToolMan</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/index.jsp"
							class="">首頁</a></li>
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/master/master.do?city=all&action=SearchAll"
							class="">我要找師傅</a></li>
							
							
							
							<c:if test="${not empty LoginOK }">
							<c:if test="${empty LoginOK.m_id}">
						<li><a class="alist" href="${pageContext.servletContext.contextPath}/master/OpenStoreInfo.jsp">我要開店 </a></li>
							</c:if>
						</c:if>
						<li><a class="alist"
							href="${pageContext.servletContext.contextPath}/wishpool/Wishing+waterfall.jsp">許願池
						</a></li>
					</ul>

					<!----------- 搜尋列----- -->
					<ul class="navbar-right">
						<form class="navbar-form">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							</button>

						</form>
					</ul>
					<!----------- 搜尋列----- -->

					<ul class="nav navbar-nav pull-right">

						<%	if (session.getAttribute("LoginOK") == null) {%>
						<li><a class="alist" href="${pageContext.servletContext.contextPath}/cdata/login-in.jsp">登入 </a>
							</li>
						
						<%	} else if(session.getAttribute("LoginOK") != null && session.getAttribute("LoginOK2").equals("sa")){%>
						
						<li class=" dropdown"><a class="alist" href="#"
							class="dropdown-toggle " data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-king"></span> 管理者<span class="caret"></span> </a>        
							<ul class="dropdown-menu">
								
								<li><a
									href="${pageContext.servletContext.contextPath}/manager.backstageUI/managerUI.jsp">管理員後台</a></li>
								
								<li><a
									href="${pageContext.servletContext.contextPath}/loginoutServlet">登出</a></li>

							</ul></li>
						
						<%	} else { %>

						<%-----------------------------------------------訂單表------------------------------------------------------------------- --%>

						<li class=" dropdown"><a class="alist" href="#"
							class="dropdown-toggle " data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><span
								class="glyphicon">&#xe008;</span> ${LoginOK.c_id}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdatadessServlet.do?c_id=${LoginOK.c_id}">我的資料</a>
								</li>
								<c:if test="${LoginOK.m_id != null}">
									<li><a href="${pageContext.servletContext.contextPath}/master/masterPage.do?m_id=${LoginOK.m_id}">我的店家</a></li>
								</c:if>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=listOrder">我的訂單</a>
								</li>
							<c:if test="${LoginOK.m_id != null}">
								<li><a
									href="${pageContext.servletContext.contextPath}/mdata/MdataOrderServlet.do?m_id=${LoginOK.m_id}&action=listOrder">我的工作</a></li>
								</c:if>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myLike">我的最愛</a>
								</li>
								<li><a
									href="${pageContext.servletContext.contextPath}/cdata/CdataOrderServlet.do?c_id=${LoginOK.c_id}&action=myHate">黑名單</a>
								</li>
								<li><a href="#">刊登廣告</a></li>
								<li><a
									href="${pageContext.servletContext.contextPath}/loginoutServlet">登出</a></li>

							</ul></li>
							
							
							
							
							
						<%----------------------------------------------墨西哥長城------------------------------------------------------------------- --%>

						<%
							}
						%>
					</ul>
				</div>

			</div>
	</div>
	</nav>
</div>