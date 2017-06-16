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

<!-- ///////////// 카카오 계정 연동 ////////////////// -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/> -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- ////////////////////////////////////////////////// -->

<!-- ///////////////////////네이버///////////////////////////////////// -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- ///////////////////////네이버///////////////////////////////////// -->


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Nonstop</title>
<!-- Bootstrap Core CSS -->
 <link href="/resources/css/nonstop.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet">


<!-- jQuery -->
<script src="/resources/javascript/jquery.js"></script> 


<!-- Bootstrap Core JavaScript -->
<!-- <script src="/resources/javascript/bootstrap.min.js"></script> -->

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<!-- Theme JavaScript -->
<script src="../../resources/javascript/mainpage.js"></script>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->

<!-- <script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
   integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
   crossorigin="anonymous"></script> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 드럽다운-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--  모달팝업 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


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
	margin-left: 0%;
	margin-right: 0%;
}

@media ( min-width : 1200px) {
	#center {
		margin-left: 25%; @media ( min-width : 1200px) { #center {
		margin-left: 24.5%;
		margin-right: 5%;
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
	
	 //============= login Event 처리 =============	
	 $( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				
				alert(1);
				var id=$("input:text").val();
				var pw=$("input:password").val();
				var role=$("user.role").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				if(role == 4) {
					alert('탈퇴한 계정입니다.');
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
	 
	 //============= 회원가입 이동 Event 처리 =============	
	 $(function() {
	 	$("a:contains('회원가입')").on("click" , function() {
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
	 
	 
 	 $(function() {
		 
		 $("#listFollow").on("click" , function() {
 		
		var reqUserId = $("#userId").val();
	
		self.location = "/profile/getFollowList?reqUserId="+reqUserId;
		
	  	 popWin 
		= window.open("/view/profile/listFollow.jsp",
								"popWin", 
								"left=300,top=200,width=500,height=720,marginwidth=0,marginheight=0,"+
								"scrollbars=no,scrolling=no,menubar=no,resizable=no");   

		$("#logout").on("click", function() {
			$(self.location).attr("href", "/user/logout");

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
			self.location = "/project/listProject?postDivision=2"
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
	

	//============= 회원원가입화면이동 =============
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#addUserView").on("click" , function() {
			self.location = "/user/addUser"
		});
	});

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#addCompany").on("click" , function() {
			self.location = "/user/addCompany"
		});
	});
			
	//============= toolbar chat 이동 Event 처리 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#chat").on("click", function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "https://192.168.0.16:8444/#" + Math.random().toString(16).substr(2);
		});
	});
 	 });
</script>
</head>




<c:if test="${dataList==null}">
	<c:redirect url="/statistics/getJSONPostCountList" />
</c:if>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">



	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"> NONSTOP </a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-main-collapse">
				<ul class="nav navbar-nav" id="center">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Portfolio</a>
						<ul class="dropdown-menu">
							<li><a href="#" id="portDesigner">Designer</a></li>
							<li><a href="#" id="portDeveloper">Developer</a></li>
						</ul></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Project </a>
						<ul class="dropdown-menu">
							<li><a href="#" id="projDesigner">Designer</a></li>
							<li><a href="#" id="projDeveloper">Developer</a></li>
						</ul></li>

					<li><a href="#" id="statistics">Statistics</a></li>

					<li><a id="chat" href="#">CHAT</a></li>

				</ul>




				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty sessionScope.user.userId }">
						<li><a href="#myModal" id="modalLogin" data-toggle="modal" data-target="#myModal">로그인</a></li>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Login</h4>
									</div>
									<div class="modal-body">


										<form class="form-horizontal">

											<div class="form-group">
												<label for="userId" class="col-sm-4 control-label">아 이 디</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" value="${param.userId}">
												</div>
											</div>

											<div class="form-group">
												<label for="password" class="col-sm-4 control-label">패 스 워 드</label>
												<div class="col-sm-6">
													<input type="password" class="form-control" name="password" id="password" placeholder="패스워드">
												</div>
											</div>

										</form>


									</div>
									<div class="modal-footer">
									
										<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<a id="kakao-login-btn" href="javascript:loginWithKakao()">
									<img
									src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png"
									width="180" />
								</a>

							</div>
						</div>
				<div class="col-sm-offset-4 col-sm-6 text-center">		
 				<a id="naver_id_login">
 				<img src="/resources/images/layout/naverLogin.PNG"/>
 				</a></div>
 				
 				<button type="button" id="loginButton" class="btn btn-info" >Login</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" >Back</button>
				
				</div>

									<!-- 네이버아이디로로그인 버튼 노출 영역 -->

									<!-- //네이버아이디로로그인 버튼 노출 영역 -->
<script type="text/javascript">
  	var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,38.7);
  	naver_id_login.setDomain(".service.com");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  	
  </script>
								
  
 <script type="text/javascript"> 
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    var userId=naver_id_login.getProfileData('email');    
    var tempId = userId.replace(".", ",");
    console.log("userId :: " + userId);
    console.log("tempId :: " + tempId);
    
    
    $.ajax(
            {
                url : '/user/checkUserId/'+tempId,
                method : "POST",
                dataType : "json",
                headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                },
                context : this,
                success : function(JSONData, status) {     
                   if(JSONData.user ==null ) {
                 	  
                 	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
                   }else if(JSONData.user.role == 4){
                 	alert("탈퇴한 계정입니다.");
                 	$(self.location).attr("href","/user/logout");
                 	location.reload();
                   }else{
                 	  location.reload();
                   }
                }
          });   
         }                  
       
    		naver_id_login.get_naver_userprofile("naverSignInCallback()");
    
   
  
</script>		
							
					
					<script type="text/javascript">
   					
					Kakao.init('fc5658887af25f840e94144f6722b228');
					
					        function loginWithKakao() {
				         // 로그인 창을 띄웁니다.
				         Kakao.Auth.login({
				           success: function(authObj) {
				        	   /* alert("dddddddd :: "+JSON.stringify(authObj)); */
				             var accessToken = Kakao.Auth.getAccessToken();
				             Kakao.Auth.setAccessToken(accessToken);
				             
				             Kakao.API.request({
				                url: '/v1/user/me',
				                success: function(res) {
				                	console.log("ressssss :: " + res);
				                   var userId = res.kaccount_email;       
				                   var tempId = userId.replace(".", ",");
				                   console.log("userId :: " + userId);
				                   console.log("tempId :: " + tempId);
				                   $.ajax(
				                       {
				                               url : "/user/checkUserId/"+tempId,
				                               method : "POST",
				                               dataType : "json",
				                               headers : {
				                                  "Accept" : "application/json",
				                                  "Content-Type" : "application/json"
				                               },
				                               success : function(JSONData, status) {     
				                                  if(JSONData.user ==null ) {
				                                	  alert("계정이 없습니다. 회원가입을 해주시기 바랍니다.");
				                                	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
				                                  }else if(JSONData.user.role == 4){
				                                	alert("탈퇴한 계정입니다.");  
				                                	$(self.location).attr("href","/user/logout");
     	
				                                	  location.reload();
				                                  }else{
				                                	  location.reload();
				                                  }
				                               }
				                         });
				                        }                  
				                     });
				                   },
				                   fail: function(err) {
				                     alert(JSON.stringify(err));
				                   }
				                 });
					        }
				               
				               
				               
</script>


									
								</div>
							</div>
						</div>
					



					<li><a href="#" id="addUser">회원가입</a></li>
					</c:if>
					
					<%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
					<c:if test="${!empty sessionScope.user.userId }">
						<li><a href="#">
						<span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
						<li><a href="#" id="listLetter"> <!-- 쪽지 --> <span
								class="glyphicon glyphicon-envelope"
								style="margin-top: 3px; margin-bottom: 5px"></span> <!-- 알림 -->
								<span class="label label-rounded label-primary"
								style="padding: 0 .8em .1em; border-radius: .5em">new</span>
						</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top: 3px; margin-bottom: 5px"></span></a>
							<ul class="dropdown-menu">
								<li><input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" /></li>
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
						<div class="margin-bottom-20"></div>
						<div class="intro-main">
							<ul class="main-ul">
								<li>
									<h1>${dataList.DEVELOP}</h1>
									<p>개발자 포트폴리오</p>
								</li>
								<li>
									<div class="verticle-line">
										<br /> <br /> <br />
									</div>
								</li>
								<li>
									<h1>${dataList.DESIGN}</h1>
									<p>디자인 포트폴리오</p>
								</li>
								<li>
									<div class="verticle-line">
										<br /> <br /> <br />
									</div>
								</li>
								<li>
									<h1>${dataList.PROJECT}</h1>
									<p>등록된 프로젝트</p>
								</li>
							</ul>

							<p class="intro-text">
								개발자, 디자이너 모집 및 프로젝트 진행을 논스톱에서 한번에 해결하세요.<br /> 뭐라고 써야할지 모르겠다 도움
								필요.
							</p>

							<button class="sq_button" type="button">회원가입</button>
							<button class="sq_button" type="button">일단, 둘러볼게요</button>

							<div class="margin-top-30">
								<a href="#about" class="btn btn-circle page-scroll"> <i
									class="fa fa-angle-double-down animated"><span
										class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
								</i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- About Section -->



	<div class="margin-bottom-20"></div>
	<p class="intro-text">
		웹사이트, 어플리케이션 개발 및 디자인 통합솔루션 논스톱<br />포트폴리오 등록과 구인구직을 위한 프로젝트 등록 논스톱에서
		한번에 해결하세요.<br /> 웹사이트, 어플리케이션 개발 및 디자인 통합솔루션 논스톱포트폴리오 등록과 구인구직을 <br />위한
		프로젝트 등록 논스톱에서 한번에 해결하세요.
	</p>
	<div class="margin-bottom-50"></div>
	<button class="sq_button" type="button"
		style="background-color: #ff6600">회원가입</button>
	<button class="sq_button" type="button">일단, 둘러볼게요</button>
	<div class="center-block">
		<a href="#about" class="btn btn-circle page-scroll"> <span
			class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
		</a>
	</div>

	<!-- Download Section -->
	<section id="download" class="download">
		<div class="download-section">
			<div class="container"></div>
		</div>
	</section>
	<!-- Contact Section -->
	<section id="contact" class="contact">
		<div class="contact-section">
			<div class="container"></div>
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


<%-- 
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
<!-- jQuery -->
<script src="/resources/javascript/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/javascript/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<!-- Theme JavaScript -->
<script src="../../resources/javascript/mainpage.js"></script>
<style>
body {
	padding-top: 0;
}

/* 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
 */
#center {
	margin-left: 0%;
	margin-right: 0%;
}

<!-- ///////////// 카카오 계정 연동 ////////////////// -->
   <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/> -->
   <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>   
   <!-- ////////////////////////////////////////////////// -->
   
   <!-- ///////////////////////네이버///////////////////////////////////// -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- ///////////////////////네이버///////////////////////////////////// -->

<title>Nonstop</title>

<!-- Bootstrap Core CSS -->
<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="/resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/javascript/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="../../resources/javascript/mainpage.js"></script>


 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->


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
	margin-left: 0%;
	margin-right: 0%;
}

@media ( min-width : 1200px) {
	#center {
		margin-left: 25%;
=======
@media ( min-width : 1200px) {
	#center {
		margin-left: 24.5%;
>>>>>>> refs/remotes/origin/master
		margin-right: 5%;
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
	
	 //============= login Event 처리 =============	
	 $( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				var role=$("user.role").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				if(role == 4) {
					alert('탈퇴한 계정입니다.');
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
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
			self.location = "/project/listProject?postDivision=2"
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
	
	
	
		
		
		





	//============= 회원원가입화면이동 =============
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#addUserView").on("click" , function() {
			self.location = "/user/addUser"
		});
	});

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#addCompany").on("click" , function() {
			self.location = "/user/addCompany"
		});
	});
			

		
	</script>


</head>



=======
<c:if test="${dataList==null}">
	<c:redirect url="/statistics/getJSONPostCountList" />
</c:if>
>>>>>>> refs/remotes/origin/master
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<<<<<<< HEAD

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
	<!-- ToolBar End   /////////////////////////////////////-->

	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"> <i
					class="fa fa-play-circle"></i> NONSTOP
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-main-collapse">
				<ul class="nav navbar-nav" id="center">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Portfolio</a>
						<ul class="dropdown-menu">
							<li><a href="#" id="portDesigner">Designer</a></li>
							<li><a href="#" id="portDeveloper">Developer</a></li>
						</ul></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Project </a>
						<ul class="dropdown-menu">
							<li><a href="#" id="projDesigner">Designer</a></li>
							<li><a href="#" id="projDeveloper">Developer</a></li>
						</ul></li>


					<li><a href="#" id="statistics">Statistics</a></li>
=======
	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
					Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"> NONSTOP </a>
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

						<li><a href="#myModal" id="login" data-toggle="modal" data-target="#myModal">로그인</a></li>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Login</h4>
									</div>
									<div class="modal-body">


										<form class="form-horizontal">

											<div class="form-group">
												<label for="userId" class="col-sm-4 control-label">아 이 디</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" value="${param.userId}">
												</div>
											</div>

											<div class="form-group">
												<label for="password" class="col-sm-4 control-label">패 스 워 드</label>
												<div class="col-sm-6">
													<input type="password" class="form-control" name="password" id="password" placeholder="패스워드">
												</div>
											</div>

										</form>


									</div>
									<div class="modal-footer">
									
										<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<a id="kakao-login-btn" href="javascript:loginWithKakao()">
									<img
									src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png"
									width="180" />
								</a>

							</div>

						<li><a href="#" id="login">로그인</a></li>
						<li><a href="#" id="addUser">회원가입</a></li>
					</c:if>
					<c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}">
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
	<header class="intro">
		<div class="intro-body">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h1 class="brand-heading">NONSTOP</h1>
						<div class="margin-bottom-20"></div>
						<div class="intro-main">
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

						</div>

				<div class="col-sm-offset-4 col-sm-6 text-center">		
 				<a id="naver_id_login">
 				<img src="/resources/images/layout/naverLogin.PNG"/>
 				</a></div>
 				
 				<button type="button" id="loginButton" class="btn btn-info" >Login</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" >Back</button>
				
				</div>
									
									 
										
					
							
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->

  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,38.7);
  	naver_id_login.setDomain(".service.com");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  	
  </script>




<!-- <script type="text/javascript">
  var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function -->
  
 <script type="text/javascript"> 
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    var userId=naver_id_login.getProfileData('email');    
    var tempId = userId.replace(".", ",");
    console.log("userId :: " + userId);
    console.log("tempId :: " + tempId);
    
    
    $.ajax(
            {
                url : '/user/checkUserId/'+tempId,
                method : "POST",
                dataType : "json",
                headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                },
                context : this,
                success : function(JSONData, status) {     
                   if(JSONData.user ==null ) {
                 	  
                 	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
                   }else if(JSONData.user.role == 4){
                 	alert("탈퇴한 계정입니다.");
                 	$(self.location).attr("href","/user/logout");
                 	location.reload();
                   }else{
                 	  location.reload();
                   }
                }
          });   
         }                  
       
    		naver_id_login.get_naver_userprofile("naverSignInCallback()");
    
   
	
							
					
					<script type="text/javascript">
   					
					Kakao.init('fc5658887af25f840e94144f6722b228');
					
					        function loginWithKakao() {
				         // 로그인 창을 띄웁니다.
				         Kakao.Auth.login({
				           success: function(authObj) {
				        	   /* alert("dddddddd :: "+JSON.stringify(authObj)); */
				             var accessToken = Kakao.Auth.getAccessToken();
				             Kakao.Auth.setAccessToken(accessToken);
				             
				             Kakao.API.request({
				                url: '/v1/user/me',
				                success: function(res) {
				                	console.log("ressssss :: " + res);
				                   var userId = res.kaccount_email;       
				                   var tempId = userId.replace(".", ",");
				                   console.log("userId :: " + userId);
				                   console.log("tempId :: " + tempId);
				                   
				                   $.ajax(
				                           {
				                               url : '/user/checkUserId/'+tempId,
				                               method : "POST",
				                               dataType : "json",
				                               headers : {
				                                  "Accept" : "application/json",
				                                  "Content-Type" : "application/json"
				                               },
				                               context : this,
				                               success : function(JSONData, status) {     
				                                  if(JSONData.user ==null ) {
				                                	  alert("계정이 없습니다. 회원가입을 해주시기 바랍니다.");
				                                	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
				                                  }else if(JSONData.user.role == 4){
				                                	alert("탈퇴한 계정입니다.");  
				                                	$(self.location).attr("href","/user/logout");
     	
				                                	  location.reload();
				                                  }else{
				                                	  location.reload();
				                                  }
				                               }
				                         });   
				                        }                  
				                     });
				                   },
				                   fail: function(err) {
				                     alert(JSON.stringify(err));
				                   }
				         }
				               
				               
				               
				               
				               
				               
				               
				               
				               
				               
</script>

		
		


		
		
		
									</div>
								</div>
							</div>
						</div>
						<li><a href="#" id="addUser">회원가입</a></li>
					</c:if>
					
					<c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}">
					<c:if test="${!empty sessionScope.user.userId }">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
						<li><a href="#" id="listLetter"><span class="glyphicon glyphicon-envelope"></span></a></li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<span class="glyphicon glyphicon-align-justify"></span></a>
							<ul class="dropdown-menu">
								<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
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
								<div class="verticle-line">
									<br />
									<br />
									<br />
								</div>
							</li>
							<li>
								<h2>123</h2>
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
								<h2>123</h2>
								<p>등록된 프로젝트</p>
							</li>
						</ul>


						<p class="intro-text">
							개발자, 디자이너 모집 및 프로젝트 진행을 논스톱에서 한번에 해결하세요.<br /> 뭐라고 써야할지 모르겠다 도움
							필요.
						</p>

						<button class="sq_button" type="button">회원가입</button>
						<button class="sq_button" type="button">일단, 둘러볼게요</button>

						<div class="margin-top-30">
							<a href="#about" class="btn btn-circle page-scroll"> <i
								class="fa fa-angle-double-down animated"><span
									class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							</i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	
</body>



</html> --%>