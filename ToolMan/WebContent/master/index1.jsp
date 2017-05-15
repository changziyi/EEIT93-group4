<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.servletContext.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%--     <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"> --%>

    <!-- Plugin CSS -->
    <link href="${pageContext.servletContext.contextPath}/css/index/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.servletContext.contextPath}/css/creative.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/index/expandsearch.css" rel="stylesheet">

    <!-- Temporary navbar container fix -->
    <style>
	body {font-family:Microsoft JhengHei;}
    .navbar-toggler {
        z-index: 1;
    }
    @media (max-width: 576px) {
        nav > .container {
            width: 100%;
        }
    }
    .zipcode {display: none;}
	.district {display: none;}
	.form-control {margin:auto; width:100px; display:inline; font-family:Microsoft JhengHei; vertical-align: top}
    .bg-customer {background-color: #00BFFF;}
    .navbar-brand {color:blue;}
    .btn-master {color: White; background-color: #00BFFF;}
    .btn-master:hover {background-color: #87CEFA;}
    .search-text {width: 300px;}
    .proselect {width: 120px;}
    #btn {font-family:Microsoft JhengHei;box-shadow:4px 4px 12px -2px rgba(20%,20%,40%,0.5);}
    
    </style>

</head>

<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-toggleable-md navbar-light" id="mainNav">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarExample" aria-controls="navbarExample" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="container">
<!--             <a class="navbar-brand" href="#page-top">Tool Man</a> -->
            <div class="collapse navbar-collapse" id="navbarExample">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#about">關於</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">服務</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#portfolio">師傅作品</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">聯絡</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="masthead">
        <div class="header-content">
                <h1 id="homeHeading">Tool Man</h1>
            <div>
                <div style="margin:20px">
		            <form action="master.do" method="post">
					<div class="form-group">
<%-- 						<span id="twzipcode"></span><input type="text" class="form-control search-text" name="input" value="${search.b_name}"> --%>
<%-- 						<span id="twzipcode"></span><select class="form-control proselect"><option>類別</option><option>地板地磚</option></select><input type="text" class="form-control search-text" name="input" value="${search.b_name}"> --%>
						<span id="twzipcode"></span><select class="form-control proselect" id="pro" name="pro"><option value="">類別</option><option value="地板地磚">地板地磚</option><option value="防水抓漏">防水抓漏</option><option value="室內裝潢">室內裝潢</option><option>冷氣空調</option><option>水電工程</option><option>門窗工程</option><option>木作工程</option><option>泥作工程</option><option>照明工程</option></select><input type="search" name="input" placeholder="or店家名稱">
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
                    <h2 class="section-heading text-white">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-white">網路資訊雖然充足但混亂，消費者無法迅速搜尋，師傅難以推廣業務量。因此，我們建立一個公開、透明、操作容易的平台，統整市場資訊，提供予消費者、師傅最有效率的尋找與媒合。
</p>
                    <a class="btn btn-default btn-xl sr-button" href="#services">Get Started!</a>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Your Service</h2>
                    <hr style="color:blue">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
                        <h3>Sturdy Templates</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
                        <h3>Ready to Ship</h3>
                        <p class="text-muted">You can use this theme as is, or you can make changes!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o text-primary sr-icons"></i>
                        <h3>Up to Date</h3>
                        <p class="text-muted">We update dependencies to keep things fresh.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
                        <h3>Made with Love</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter popup-gallery">
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/1.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/1.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/2.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/2.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/3.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/3.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/4.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/4.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/5.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/5.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a class="portfolio-box" href="${pageContext.servletContext.contextPath}/img/portfolio/fullsize/6.jpg">
                        <img class="img-fluid" src="${pageContext.servletContext.contextPath}/img/portfolio/thumbnails/6.jpg" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <div class="call-to-action bg-dark">
        <div class="container text-center">
            <h2>Free Download at Start Bootstrap!</h2>
            <button type="button" id="btnall" class="btn btn-default btn-xl sr-button">現在開始找師傅</button>
<!--             <a class="btn btn-default btn-xl sr-button" id="btnall" href="">現在開始找師傅</a> -->
        </div>
    </div>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 offset-lg-2 text-center">
                    <i class="fa fa-phone fa-3x sr-contact"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                    <p><a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap core JavaScript -->
    
    <script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/vendor/tether/tether.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>    

    <!-- Plugin JavaScript -->
    <script src="${pageContext.servletContext.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
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
				url : 'master.do',
				data: {'city':city.val(), 'input':input.val(), 'pro':pro.val(), 'action':'SearchMaster'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','searchResult.jsp');
				}
			});
		});
		
		$('#btnall').click(function() {
			
			$.ajax({
				url : 'master.do',
				data: {'city':'all','action':'SearchAll'},
				type : 'POST',
				success : function(returnData) {
					$(location).attr('href','searchResult.jsp');
				}
			});
		});
	
	</script>
	
</body>

</html>
