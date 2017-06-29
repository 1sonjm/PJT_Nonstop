<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Nonstop</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/nonstop.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet">

<link href="/resources/css/main.css" rel="stylesheet">

<script src="/resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
   <script src="/resources/javascript/bootstrap.min.js"></script>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- ///////////// 카카오 계정 연동 ////////////////// -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- ////////////////////////////////////////////////// -->


<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<style>

	@media (min-width: 768px) {
    .omb_row-sm-offset-3 div:first-child[class*="col-"] {
        margin-left: 25%;
    }
	}
	
	.omb_login .omb_authTitle {
	    text-align: center;
		line-height: 300%;
	}
		
	.omb_login .omb_socialButtons a {
		color: white; // In yourUse @body-bg 
		opacity:0.9;
	}
	.omb_login .omb_socialButtons a:hover {
	    color: white;
		opacity:1;    	
	}
	.omb_login .omb_socialButtons .omb_btn-facebook {background: #3b5998;}
	.omb_login .omb_socialButtons .omb_btn-twitter {background: #00aced;}
	.omb_login .omb_socialButtons .omb_btn-google {background: #c32f10;}
	
	
	.omb_login .omb_loginOr {
		position: relative;
		font-size: 1.5em;
		color: #aaa;
		margin-top: 1em;
		margin-bottom: 1em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	.omb_login .omb_loginOr .omb_hrOr {
		background-color: #cdcdcd;
		height: 1px;
		margin-top: 0px !important;
		margin-bottom: 0px !important;
	}
	.omb_login .omb_loginOr .omb_spanOr {
		display: block;
		position: absolute;
		left: 50%;
		top: -0.6em;
		margin-left: -1.5em;
		background-color: white;
		width: 3em;
		text-align: center;
	}			
	
	.omb_login .omb_loginForm .input-group.i {
		width: 2em;
	}
	.omb_login .omb_loginForm  .help-block {
	    color: red;
	}
	
		
	@media (min-width: 768px) {
	    .omb_login .omb_forgotPwd {
	        text-align: right;
			margin-top:10px;
	 	}		
	}
	
	::selection { color:white; background:blue; }
	::-moz-selection { color:white; background:blue; }

</style>



<!--  ///////////////////////// JavaScript ////////////////////////// -->
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
                   var tempId = userId.split(".");
                   console.log("userId :: " + userId);
                   console.log("tempId :: " + tempId);
                   
                   $.ajax(
                           {
                               url : '/user/checkUserId/'+tempId,
                               method : "GET",
                               dataType : "json",
                               headers : {
                                  "Accept" : "application/json",
                                  "Content-Type" : "application/json"
                               },
                               context : this,
                               success : function(JSONData, status) {                       
                                                 
                                  if(!JSONData.result ) {
                                	  
                                	  self.location="/view/user/loginView.jsp?userId="+tempId;   
                                  } else {
                                	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
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
               };

              
       		
       		
	    ///////////////////////////////////////////////
	   
		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				var id=$("input:text[name='userId']").val();
				var pw=$("input:password[name='password']").val();
						
				
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
				
				$("form").attr("method","POST").attr("action","/user/login").submit();
			});
		});	
		
		
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#addUserButton").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		/* $( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#addCompany").on("click" , function() {
				self.location = "/user/addCompany"
			});
		}); */
		
		
		
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>

	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="container" style="margin-top:100px">

    <div class="omb_login">
    	
		<div class="row omb_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">	
			    <form class="omb_loginForm" action="" autocomplete="off" method="POST">
			    
			    	<h3 class="omb_authTitle">로그인 or <a href="#" id="addUserButton">회원가입</a></h3>
					<div class="row omb_row-sm-offset-6 omb_socialButtons">
			    	    <div class="col-xs-12 col-sm-6" style="margin-left:0;">
					        <a id="kakao-login-btn" href="javascript:loginWithKakao()">
							<img src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png" width=100% />
						</a>
				        </div>
			        	<div class="col-xs-12 col-sm-6">
					      <a id="naver_id_login" >
                  	  		<img src="/resources/images/layout/naverLogin.png"/>
                  	  	</a>
				        </div>	
					</div>
			
					<div class="row omb_row-sm-offset-3 omb_loginOr" >
						<div class="col-xs-12 col-sm-12" style="margin-left:0;" >
							<hr class="omb_hrOr">
							<span class="omb_spanOr">or</span>
						</div>
					</div>
			    	
			    
			    
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						 <input type="text" class="form-control" name="userId" id="userId" placeholder="ID" >
					</div>
					<span class="help-block"></span>
										
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						 <input type="password" class="form-control" name="password" id="password" placeholder="Password">
					</div>
                    <span class="help-block"></span>

					<button class="btn btn-lg btn-primary btn-block"  id="loginButton">로그인</button>
				</form>
			</div>
    	</div>
	</div>



        </div>
        
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- ///////////////////////네이버///////////////////////////////////// -->
	
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,56);
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
	

	
</body>

</html>