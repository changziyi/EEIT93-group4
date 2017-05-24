<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ToolMan</title>
    
	<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">
    <link href="${pageContext.servletContext.contextPath}/css/index/magnific-popup.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/creative.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/index/expandsearch.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/nav/nav.css" rel="stylesheet">
	<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/index/tether.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>    
    
    <style>
		body {font-family:Microsoft JhengHei;}
	    .zipcode {display: none;}
		.district {display: none;}
	    .fontmicro {font-family:Microsoft JhengHei;}
		.form-control {margin:auto; width:100px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
	    .bg-customer {background-color: #00BFFF;}
	    .navbar-brand {color:blue;}
	    .btn-master {color: White; background-color: #00BFFF;}
	    .btn-master:hover {background-color: #87CEFA;color: white}
	    .search-text {width: 300px;}
	    .proselect {width: 120px;}
	    .title2 {color:White;}
	    .bigtitle {font-size:50px; font-weight: bold;text-shadow: -1px 0 #A9A9A9, 0 1px #A9A9A9, 1px 0 #A9A9A9, 0 -1px #A9A9A9;}
	    .searchbar {margin-top:45px;margin-bottom:30px}
	    #btn {font-family:Microsoft JhengHei;box-shadow:4px 4px 12px -2px rgba(20%,20%,40%,0.5);}
    </style>

</head>

<body>
<jsp:include page="/nav/navigation.jsp" />
    <header class="masthead">
        <div class="header-content">
            <h1 id="homeHeading" class="title2 bigtitle">Tool Man</h1>
            <div>
                <div class="searchbar">
		            <form action="master.do" method="post">
					<div class="form-group">
						<span id="twzipcode"></span><select class="form-control proselect" id="pro" name="pro"><option value="">類別</option><option value="地板地磚">地板地磚</option><option value="防水抓漏">防水抓漏</option><option value="室內裝潢">室內裝潢</option><option value="冷氣空調">冷氣空調</option><option value="水電工程">水電工程</option><option value="門窗工程">門窗工程</option><option value="木作工程">木作工程</option><option value="泥作工程">泥作工程</option><option value="照明工程">照明工程</option></select><input type="search" name="input" placeholder="or店家名稱">
					</div>
					<input type="hidden" name="action" value="SearchResult">
					<input type="hidden" name="city" >
					<input type="hidden" name="district" >
					</form>
				</div>
				<button type="button" id="btn" class="btn btn-master btn-xl">找師傅</button>
            </div>
        </div>
    </header>

    <section class="bg-customer" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <h2 class="section-heading title2">最有效率的修繕裝潢媒合平台</h2>
                    <hr class="light">
                    <p class="title2">網路資訊雖然充足但混亂，消費者無法迅速尋找師傅，而師傅難以推廣業務量。<br>因此，我們建立一個公開、透明、操作容易的平台，統整市場資訊，<br/>提供予消費者、師傅雙方最有效率的尋找與媒合。</p>
                    <a class="btn btn-default btn-xl sr-button fontmicro" href="#services">了解更多</a>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">我們提供</h2>
                    <hr style="color:blue">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                	<i class="fa fa-4x fa-heart text-primary sr-icons"><img src="${pageContext.servletContext.contextPath}/img/network.png"></i>
                    <div class="service-box">
                        <h3>公開平台</h3>
                        <p class="text-muted">資訊透明，操作容易。</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <i class="fa fa-4x fa-heart text-primary sr-icons"><img src="${pageContext.servletContext.contextPath}/img/pro.png"></i>
                    <div class="service-box">
                        <h3>專業師傅</h3>
                        <p class="text-muted">嚴格把關，挑選最專業的師傅。</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                <i class="fa fa-4x fa-heart text-primary sr-icons"><img src="${pageContext.servletContext.contextPath}/img/handshake.png"></i>
                    <div class="service-box">
                        <h3>快速媒合</h3>
                        <p class="text-muted">提供最有效率的媒合機制。</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <i class="fa fa-4x fa-heart text-primary sr-icons"><img src="${pageContext.servletContext.contextPath}/img/godzilla.png"></i>
                    <div class="service-box">
                        <h3>哥吉拉</h3>
                        <p class="text-muted">幫您快速拆房子。</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/wood.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/wood.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                	木作工程
                                </div>
                                <div class="project-name">
                                	專業木工
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/window.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/window.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                	門窗工程
                                </div>
                                <div class="project-name">
                                   	 上推氣密窗、鋁合金護欄、氣密門	
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/bathroom.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/bathroom.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                	衛浴裝潢
                                </div>
                                <div class="project-name">
									淋浴拉門、乾溼分離
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/wall.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/wall.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                	泥做工程
                                </div>
                                <div class="project-name">
                                	米白磚文化石
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/light.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/light.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                	居家照明
                                </div>
                                <div class="project-name">
                                	情調崁燈
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/in.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/in.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
									室內裝潢
                                </div>
                                <div class="project-name">
									北歐風格
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <div class="call-to-action bg-customer">
        <div class="container text-center">
            <h2 class="title2">看看還有哪些師傅</h2>
			<a href="${pageContext.servletContext.contextPath}/master/master.do?city=all&action=SearchAll" class="btn btn-default btn-xl sr-button">我要找師傅</a>
        </div>
    </div>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <h2 class="section-heading fontmicro">聯絡我們</h2>
                    <hr class="primary">
                    <p>您選擇了找師傅，因此您值得擁有卓越的服務。精準、專業並且全心全意。<br>
                    	而最重要的是，這些服務是針對您的需求量身打造，這就是找師傅的一貫理念。</p>
                    <p>如果您有任何意見與問題，歡迎與我們聯繫！</p><br>
                </div>
                <div class="col-lg-4 offset-lg-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:your-email@your-domain.com">ToolMan@Tmail.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Plugin JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/js/index/jquery.easing.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/index/scrollreveal.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/index/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/jquery.search.twzipcode.min.js"></script>
	
    <!-- Custom scripts for this template -->
    <script src="${pageContext.servletContext.contextPath}/js/creative.min.js"></script>
	
	<script>
	
		var city = $('input[name="city"]');
	
		$('#twzipcode').twzipcode({
			'css': ['form-control', 'district', 'zipcode'],
			'onCountySelect': function () {
		    	city.attr("value", this.value);
		    },
			'countySel':'臺北市'
		});
		
		var input = $('input[name="input"]');
		var pro = $('#pro');
		
		$('#btn').click(function() {
			
			$.ajax({
				url : '${pageContext.servletContext.contextPath}/master/master.do',
				data: {'city':city.val(), 'input':input.val(), 'pro':pro.val(), 'action':'SearchMaster'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','${pageContext.servletContext.contextPath}/master/masterList.jsp');
				}
			});
		});
		
	</script>
	
</body>

</html>
