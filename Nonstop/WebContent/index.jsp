<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="full" lang="ko">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nonstop</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="../../resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/javascript/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="../../resources/javascript/mainpage.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
    body {
    	padding-top: 0; 
    }
    
   	#center {
   		margin-left:0%;
	    margin-right:0%;
		
	}
	
	@media (min-width: 1200px) {
		#center {
		margin-left:25%;
        margin-right:5%;
	}
	
	}
    </style>
    <script type="text/javascript">
	//============= logout Event  처리 =============	
	$(function() {
	 	$("#logout").on("click" , function() {
			$(self.location).attr("href","/user/logout");
			//self.location = "/user/logout"
		}); 
	 });
	
	 //============= login 이동 Event 처리 =============	
	 $(function() {
	 	$("#login").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/login"
		}); 
	 });
	 
	 //============= 회원가입 이동 Event 처리 =============	
	 $(function() {
	 	$("#addUser").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/addUser"
		}); 
	 });
	 
	 //============= 쪽지함 이동 Event 처리 =============	
	 $(function() {
	 	$("#listLetter").on("click" , function() {
	 		var receiveId = $("#userId").val();		
	 		self.location = "/letter/getReceiveLetterList?receiveId="+receiveId;
		}); 
	 });
	 
	 //============= 프로필 이동 Event 처리 =============	
	 $(function() {
	 	$("#profile").on("click" , function() {
			self.location = "/profile/getMineProfile"
		}); 
	 });
	 
	 //============= 내정보보기 이동 Event 처리 =============	
	 $(function() {
	 	$("#getUser").on("click" , function() {
	 		//alert($("#userId").val());
	 		var userId = $("#userId").val();	 	
 			self.location = "/user/getUser?userId="+userId;
		}); 
	 });
	 
	 //============= 내정보수정 이동 Event 처리 =============	
	 $(function() {
	 	$("#updateUser").on("click" , function() {
	 		alert($("#userId").val());
	 		var userId = $("#userId").val();	 	
 			 self.location = "/user/updateUser?userId="+userId;
		}); 
	 });
	 
	 //============= 내정보수정 이동 Event 처리 =============
 	 $(function() {
		 
		 $("#listFollow").on("click" , function() {
 		
		var reqUserId = $("#userId").val();
	
		self.location = "/profile/getFollowList?reqUserId="+reqUserId;
		
	  	 popWin 
		= window.open("/view/profile/listFollow.jsp",
								"popWin", 
								"left=300,top=200,width=500,height=720,marginwidth=0,marginheight=0,"+
								"scrollbars=no,scrolling=no,menubar=no,resizable=no");   
		});
 	 });
		 
	//============= 통계 이동 Event 처리 =============	
	 $(function() {
	 	$("#statistics").on("click" , function() {
			self.location = "/view/statistics/statistics.jsp"
		}); 
	 });
		
	//============= toolbar project 이동 Event 처리 =============	
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("#projDesigner").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/project/listProject"
		}); 
	 });
	
	//============= toolbar project 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/listProject"
			}); 
		 });
	
	//============= toolbar portfolio 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#portDesigner").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/portfolio/listPortfolio?portDivision=2"
			}); 
		 });
	
	//============= toolbar portfolio 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#portDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/portfolio/listPortfolio?portDivision=1"
			}); 
		 });
	
	</script> 

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- ToolBar Start /////////////////////////////////////-->
<%-- <jsp:include page="/view/common/toolbar.jsp" /> --%>
<!-- ToolBar End   /////////////////////////////////////-->

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-play-circle"></i> NONSTOP
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-main-collapse">
                <ul class="nav navbar-nav" id="center">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Portfolio</a>
				       <ul class="dropdown-menu">
				         <li><a href="#" id="portDesigner">Designer</a></li>
				         <li><a href="#" id="portDeveloper">Developer</a></li>
				       </ul>
				    </li>

				    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project </a>
				       <ul class="dropdown-menu">
				         <li><a href="#" id="projDesigner">Designer</a></li>
				         <li><a href="#" id="projDeveloper">Developer</a></li>
				       </ul>
				    </li>
				      
				      
				    <li><a href="#" id="statistics">Statistics</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty sessionScope.user.userId }">
                      <li><a href="#" id="login">로그인</a></li>
                      <li><a href="#" id="addUser">회원가입</a></li>
                    </c:if>
	 			    <%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
	 			    <c:if test="${!empty sessionScope.user.userId }">
				   	  <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
				   	  <li><a href="#" id="listLetter"><span class="glyphicon glyphicon-envelope"></span></a></li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify"></span></a>
				        <ul class="dropdown-menu">
				          <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}"/>				         
				          <li><a href="#" id="profile">프로필</a></li>
				          <li><a href="#" id="getUser">내정보보기</a></li>
				          <li><a href="#" id="updateUser">내정보수정</a></li>
				          <li><a href="#" id="listFollow">팔로우 목록보기</a></li>
				          <li><a href="#" id="logout">로그아웃</a></li>
				        </ul>
				      </li>
				     </c:if>  
				      
			    </ul>
	         </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                	<div class="col-md-10 col-md-offset-1">
                        <h1 class="brand-heading">NONSTOP</h1>
                        <div class="margin-bottom-30"></div>
                        <ul class="main-ul">
                        	<li>
                        		<h2>123</h2>
                        		<p>개발자 포트폴리오</p>
                        	</li>
                        	<li>
								<div class="verticle-line"><br/><br/><br/></div>
                        	</li>                        	
                        	<li>
                        		<h2>123</h2>
                        		<p>디자인 포트폴리오</p>
                        	</li>
                        	<li>
                        		<div class="verticle-line"><br/><br/><br/></div>
                        	</li>
                        	<li>
                        		<h2>123</h2>
                        		<p>등록된 프로젝트</p>
                        	</li>
                        </ul>


                       	<p class="intro-text">개발자, 디자이너 모집 및 프로젝트 진행을 논스톱에서 한번에 해결하세요.<br/> 뭐라고 써야할지 모르겠다 도움 필요.</p>

                        <button class="sq_button" type="button">회원가입</button>
						<button class="sq_button" type="button">일단, 둘러볼게요</button>			                        
                    
                       	<div class="margin-top-30">
                        <a href="#about" class="btn btn-circle page-scroll"> 
                            <i class="fa fa-angle-double-down animated"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span> </i>
                        </a>
						</div>
                	</div>
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about" class="about">
        <div class="about-section">
       		<div class="container">
	      		<div class="col-lg-8 col-lg-offset-2">
	                <h2>About Grayscale</h2>
	                <p>Grayscale is a free Bootstrap 3 theme created by Start Bootstrap. It can be yours right now, simply download the template on <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</p>
	                <p>This theme features stock photos by <a href="http://gratisography.com/">Gratisography</a> along with a custom Google Maps skin courtesy of <a href="http://snazzymaps.com/">Snazzy Maps</a>.</p>
	                <p>Grayscale includes full HTML, CSS, and custom JavaScript files along with LESS files for easy customization.</p>
	            </div> 
	         </div> 
        </div>
    </section>

    <!-- Download Section -->
    <section id="download" class="download">
        <div class="download-section">
            <div class="container">
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="contact-section">
            <div class="container">             
            </div>
        </div>
    </section>

  
    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; Your Website 2016</p>
        </div>
    </footer>



</body>


</html>