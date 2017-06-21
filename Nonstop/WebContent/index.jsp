<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="/resources/css/nonstop.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet">
<!-- Awesome Font -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="/resources/javascript/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/javascript/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<!-- Theme JavaScript -->
<script src="../../resources/javascript/mainpage.js"></script>
<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
body {
	padding-top: 0;
}
#center {
	margin-left: 0%;
	margin-right: 0%;
}
@media ( min-width : 1200px) {
	#center {
		margin-left: 24.5%;
		margin-right: 5%;
	}
}
</style>
<script type="text/javascript">
	//============= logout Event  처리 =============	
	$(function() {
		$("#logout").on("click", function() {
			$(self.location).attr("href", "/user/logout");
		});
	});
	//============= login 이동 Event 처리 =============	
	$(function() {
		$("#login").on("click", function() {
			self.location = "/user/login"
		});
	});
	//============= 회원가입 이동 Event 처리 =============	
	$(function() {
		$("#addUser").on("click", function() {
			self.location = "/user/addUser"
		});
	});
	//============= 쪽지함 이동 Event 처리 =============	
	$(function() {
		$("#listLetter").on("click", function() {
			var receiveId = $("#userId").val();
			self.location = "/letter/getReceiveLetterList?receiveId=" + receiveId;
		});
	});
	//============= 프로필 이동 Event 처리 =============	
	$(function() {
		$("#profile").on("click", function() {
			self.location = "/profile/getMineProfile"
		});
	});
	//============= 내정보보기 이동 Event 처리 =============	
	$(function() {
		$("#getUser").on("click", function() {
			//alert($("#userId").val());
			var userId = $("#userId").val();
			self.location = "/user/getUser?userId=" + userId;
		});
	});
	//============= 내정보수정 이동 Event 처리 =============	
	$(function() {
		$("#updateUser").on("click", function() {
			alert($("#userId").val());
			var userId = $("#userId").val();
			self.location = "/user/updateUser?userId=" + userId;
		});
	});
	//============= 내정보수정 이동 Event 처리 =============
	$(function() {
		$("#listFollow").on("click", function() {
			var reqUserId = $("#userId").val();
			self.location = "/profile/getFollowList?reqUserId=" + reqUserId;
			popWin = window.open("/view/profile/listFollow.jsp",
				"popWin",
				"left=300,top=200,width=500,height=720,marginwidth=0,marginheight=0," +
				"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
	});
	//============= 통계 이동 Event 처리 =============	
	$(function() {
		$("#statistics").on("click", function() {
			self.location = "/statistics/getListStatistics"
		});
	});
	//============= toolbar project 이동 Event 처리 =============	
	$(function() {
		$("#projDesigner").on("click", function() {
			self.location = "/project/listProject?projDivision=2&sortFlag=0"
		});
	});
	//============= toolbar project 이동 Event 처리 =============
	$(function() {
		$("#projDeveloper").on("click", function() {
			self.location = "/project/listProject?projDivision=1&sortFlag=0"
		});
	});
	//============= toolbar portfolio 이동 Event 처리 =============
	$(function() {
		$("#portDesigner").on("click", function() {
			self.location = "/portfolio/listPortfolio?postDivision=2"
		});
	});
	//============= toolbar portfolio 이동 Event 처리 =============
	$(function() {
		$("#portDeveloper").on("click", function() {
			self.location = "/portfolio/listPortfolio?postDivision=1"
		});
	});
	//============= toolbar chat 이동 Event 처리 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#chat").on("click", function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "https://192.168.0.16:8444/#" + Math.random().toString(16).substr(2);
		});
		
	//============= toolbar chat 이동 Event 처리 =============	
		
	});
</script>
</head>
<%-- <c:if test="${dataList==null}">
	<c:redirect url="/statistics/getJSONPostCountList" />
</c:if> --%>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
					Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand link_paging" href="#page-top"> NONSTOP </a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-main-collapse">
				<ul class="nav navbar-nav" id="center">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Portfolio</a>
						<ul class="dropdown-menu">
							<li><a href="#" id="portDesigner">Designer</a></li>
							<li><a href="#" id="portDeveloper">Developer</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project </a>
						<ul class="dropdown-menu">
							<li><a href="#" id="projDesigner">Designer</a></li>
							<li><a href="#" id="projDeveloper">Developer</a></li>
						</ul></li>
					<li><a href="#" id="statistics">Statistics</a></li>
					<li><a id="chat" href="#">CHAT</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty sessionScope.user.userId }">
						<li><a href="#myModalLogin" id="modalLogin" data-toggle="modal" data-target="#myModalLogin">로그인</a></li>
						<li><a href="#myModalAdd" id="modalAddUser" data-toggle="modal" data-target="#myModalAdd">회원가입</a></li>
					</c:if>
					<%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
					<c:if test="${!empty sessionScope.user.userId }">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
						<li>
							<a href="#" id="listLetter">
								<!-- 쪽지 -->
								<span class="glyphicon glyphicon-envelope" style="margin-top:3px; margin-bottom:5px"></span>
								<!-- 알림 -->
								<span class="label label-rounded label-primary" style="padding: 0 .8em .1em; border-radius: .5em">new</span>
							</a>
						</li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top:3px; margin-bottom:5px"></span></a>
							<ul class="dropdown-menu">
								<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
								<li><a href="#" id="profile">프로필</a></li>
								<li><a href="#" id="getUser">내정보보기</a></li>
								<li><a href="#" id="updateUser">내정보수정</a></li>
								<li><a href="#" id="listFollow">팔로우 목록보기</a></li>
								<li><a href="#" id="logout">로그아웃</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	
	<!-- Intro Header -->
	<header class="intro" id="intro">
		<div class="intro-body">
			<div class="container" style="margin-top: 60;">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
					<p class="intro-text" style="color:#ff6600;font-size: 20;font-weight: 400;">
							웹 / 어플리케이션 구인구직 솔루션
						</p>
						<h1 class="brand-heading">NONSTOP YOUR PROJECT AND PORTFOLIO</h1>
						<p class="intro-text">
							논스톱에서 웹사이트, 어플리케이션 개발 및 디자인 포트폴리오를 관리하고 관련 프로젝트에 참여해 보세요.
						</p>
						<div class="margin-bottom-120"></div>
						
						<%-- <div class="intro-main">
							<ul class="main-ul">
								<li>
									<h1>${dataList.DEVELOP}</h1>
									<p>개발자 포트폴리오</p>
								</li>
								<li>
									<div class="verticle-line">
										<br />
										<br />
										<br />
									</div>
								</li>
								<li>
									<h1>${dataList.DESIGN}</h1>
									<p>디자인 포트폴리오</p>
								</li>
								<li>
									<div class="verticle-line">
										<br />
										<br />
										<br />
									</div>
								</li>
								<li>
									<h1>${dataList.PROJECT}</h1>
									<p>등록된 프로젝트</p>
								</li>
							</ul>
						</div> --%>
						
						
						
						<div class="funfacts">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-keyboard-o" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" data-from="0" data-to="25964" data-runit="1">125</span>+</div>
											<strong class="funfact-title">Development Portfolio</strong>
										</div><!-- .funfact -->
									</div>
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" data-from="0" data-to="35469" data-runit="1">135</span>+</div>
											<strong class="funfact-title">Design Portfolio</strong>
										</div><!-- .funfact -->
									</div>
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" data-from="0" data-to="86214" data-runit="1">122</span>+</div>
											<strong class="funfact-title">Projects</strong>
										</div><!-- .funfact -->
									</div>
								</div>
							</div>
						</div>
										
						<div class="col-md-12" style="text-align:center">
							<a href="#about" class="page-scroll" data-index="0"> <!-- class="btn btn-circle page-scroll" -->
							<span class="fa fa-chevron-down" aria-hidden="true"><p>더 알아보기</p></span>
							</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<ul class="pagination paging_home">
			<li class="active">
				<a href="#intro" data-index="1" class="link_paging">1</a>
			</li>
			<li class="">
				<a href="#about" data-index="2" class="link_paging">1</a>
			</li>
			<li class="">
				<a href="#download" data-index="3" class="link_paging">1</a>
			</li>
			<li class="">
				<a href="#contact" data-index="4" class="link_paging">1</a>
			</li>
		</ul>
	</header>
	<!-- About Section -->
	<section id="about" class="about">
		<div class="about-section">
			<div class="container">
				<div class="col-md-12">
					<i class="fa fa-quote-left" aria-hidden="true"></i>
					<h2 class="brand-heading">Portfolio Service</h2>
					<p>
					그동안 작업한 포트폴리오를 손쉽게 올리고 관리할 수 있습니다. pdf 파일 형식 지원과 다중 이미지 업로드를 지원 등 이전에 만들어놓은 포트폴리오 파일을 수정없이 등록하여 사용할 수 있도록 서비스하기 위해 노력하고 있습니다. 각자 등록한 작업들은 프로필 페이지에서 따로 관리할 수 있으며 서로의 작업물을 추천하고 의견을 나눌 수 있습니다.
					</p>
					<div class="margin-bottom-30"></div>
					<hr style="width:20%; border-top:1px solid #bdbdbd">
				</div>
			</div>
		</div>
	</section>
	
	<!-- Download Section -->
	<section id="download" class="download">
		<div class="download-section">
			<div class="container">
			
				<div class="col-md-12">
					<i class="fa fa-quote-left" aria-hidden="true"></i>
					<h2 class="brand-heading">Project Service</h2>
					<p>
					그동안 작업한 포트폴리오를 손쉽게 올리고 관리할 수 있습니다. pdf 파일 형식 지원과 다중 이미지 업로드를 지원 등 이전에 만들어놓은 포트폴리오 파일을 수정없이 등록하여 사용할 수 있도록 서비스하기 위해 노력하고 있습니다. 각자 등록한 작업들은 프로필 페이지에서 따로 관리할 수 있으며 서로의 작업물을 추천하고 의견을 나눌 수 있습니다.
					</p>
					<div class="margin-bottom-30"></div>
					<hr style="width:20%">
				</div>
			
			</div>
		</div>
	</section>
	
	<!-- Contact Section -->
	<section id="contact" class="contact">
		<div class="contact-section">
			<div class="container">
			
				<div class="col-md-12">
					<i class="fa fa-quote-left" aria-hidden="true"></i>
					<h2 class="brand-heading">Tech Statistic Service</h2>
					<p>
					그동안 작업한 포트폴리오를 손쉽게 올리고 관리할 수 있습니다. pdf 파일 형식 지원과 다중 이미지 업로드를 지원 등 이전에 만들어놓은 포트폴리오 파일을 수정없이 등록하여 사용할 수 있도록 서비스하기 위해 노력하고 있습니다. 각자 등록한 작업들은 프로필 페이지에서 따로 관리할 수 있으며 서로의 작업물을 추천하고 의견을 나눌 수 있습니다.
					</p>
					<div class="margin-bottom-30"></div>
					<hr style="width:20%; border-top:1px solid #bdbdbd">
				</div>
				
			</div>
		</div>
	</section>
	
	<!-- modal login -->
	<div class="modal fade" id="myModalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
        	<div class="modal-content">
        	
        		<div class="tab-content">
	        		<form>
		                <div class="form-group">
		                    <input type="text" class="form-control" placeholder="User ID">
		                </div>
		
		                <div class="form-group">
		                    <input type="password" class="form-control" placeholder="Password">
		                </div>
		
		                <button class="btn btn-primary btn-block">LOGIN</button>
						
						<div class="text-div"><span>or</span><!-- <br/>Sign in using --></div>
						<div id="naver_id_login">카카오 아이디로 로그인</div>
						<div id="naver_id_login">네이버 아이디로 로그인</div>

		            </form>
        		</div>
        		
        	</div>
        </div>
    </div>
    
    <!-- modal Add User -->
	<!-- <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog" style="width: 450px">
        	<div class="modal-content add-user">
        	
        		<div class="tab-content">
	        		<form>
		                <div class="form-group">
		                    <input type="text" class="form-control" placeholder="User ID">
		                </div>
		
		                <div class="form-group">
		                    <input type="password" class="form-control" placeholder="Password">
		                </div>
		
		                <button class="btn btn-primary btn-block">회원가입</button>
		                <button class="btn btn-default btn-block">취소</button>
		            </form>
        		</div>
        		
        	</div>
        </div>
    </div> -->
    
    <!-- modal Add User -->
	<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog" style="width: 450px">
        	<div class="modal-content" style="margin-top: 10%; padding-bottom: 0; padding-top: 10px;">
        	
        		<div class="tab-content">
	        		
	        		<div class="tabbable-panel">
						<div class="tabbable-line">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tab_default_1" data-toggle="tab"><strong>개인 회원가입 </strong></a>
								</li>
								<li>
									<a href="#tab_default_2" data-toggle="tab"><strong>기업 회원가입</strong></a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab_default_1">
									<form>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="User ID">
						                </div>
						
						                <div class="form-group">
						                    <input type="password" class="form-control" placeholder="Password">
						                </div>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="이름">
						                </div>
						
						                <div class="form-group">
						                    <input type="password" class="form-control" placeholder="지역">
						                </div>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="메일주소">
						                </div>
						
						                <button class="btn btn-primary btn-block" style="margin-top:60px">회원가입</button>
						                <button class="btn btn-default btn-block">취소</button>
				
						            </form>
								</div>
								<div class="tab-pane" id="tab_default_2">
									<form>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="User ID">
						                </div>
						
						                <div class="form-group">
						                    <input type="password" class="form-control" placeholder="Password">
						                </div>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="User ID">
						                </div>
						
						                <div class="form-group">
						                    <input type="password" class="form-control" placeholder="Password">
						                </div>
						                <div class="form-group">
						                    <input type="text" class="form-control" placeholder="User ID">
						                </div>
						
						                <div class="form-group">
						                    <input type="password" class="form-control" placeholder="Password">
						                </div>
						
						                <button class="btn btn-primary btn-block" style="margin-top:60px">회원가입</button>
						                <button class="btn btn-default btn-block">취소</button>
						            </form>
								</div>
							</div>
						</div>
					</div>
	        		
        		</div>
        		
        	</div>
        </div>
    </div>
	
	
	
	
	
	
	
	
	<!-- Footer -->
	<footer>
		<div class="container text-center">
			<p>Copyright &copy; NONSTOP 2017</p>
		</div>
	</footer>
</body>
</html>