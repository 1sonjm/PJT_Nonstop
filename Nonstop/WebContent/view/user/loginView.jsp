<%@ page contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
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



<!-- ///////////////////////네이버///////////////////////////////////// -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- ///////////////////////네이버///////////////////////////////////// -->




<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

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
			$("#loginView").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				
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
				
				
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
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

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>

	<!--  화면구성 div Start /////////////////////////////////////-->

	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6">

				<br />
				<br />

				<div class="jumbotron">
					<h1 class="text-center">로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>

					<form class="form-horizontal">

						<div class="form-group">
							<label for="userId" class="col-sm-4 control-label">아 이 디</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="userId"
									id="userId" placeholder="아이디" value="${param.userId}">
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-4 control-label">패 스
								워 드</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" name="password"
									id="password" placeholder="패스워드">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<button type="button" class="btn btn-primary" id="loginView">로
									그 인</button>
								<br />
								<br />
								<button type="button" class="btn btn-primary" id="addUserView">개
									인 회 원 가 입</button>
								<br />
								<br />
								<button type="button" class="btn btn-primary" id="addCompany">기
									업 회 원 가 입</button>
							</div>
						</div>

						<!-- 카카오 API -->
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-6 text-center">
								<a id="kakao-login-btn" href="javascript:loginWithKakao()">
									<img
									src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png"
									width="180" />
								</a>

							</div>
						</div>

						




				<!-- 네이버 -->
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6 text-center">
						<a id="naver_id_login" style="width: 180"></a>
					</div>

				</div>


				<!-- 네이버 -->
				
				



				
				
				
				
				
				
				<script type="text/javascript">
				 var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080/view/user/addUserView.jsp?userId='tempId");
       		
				var state = naver_id_login.getUniqState();
       		naver_id_login.setButton("white", 2,40);
       		naver_id_login.setDomain("http://127.0.0.1:8080/");
       		naver_id_login.setState(state);
       		
       		naver_id_login.init_naver_id_login();
       		
       		function naverSignInCallback() {
       			// naver_id_login.getProfileData('프로필항목명');
       			// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
       			alert(naver_id_login.getProfileData('email'));
       			alert(naver_id_login.getProfileData('nickname'));
       			
       			
       			
       			
       		} 

       		
       		var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N", "http://127.0.0.1:8080/view/user/addUserView.jsp?userId='tempId'");

       		

       		

       		/* 사용 가능한버튼 Option

       		버튼 색상 : white, green

       		크기 : 1(버튼형), 2(작은 배너), 3(큰 배너)

       		배너 및 버튼 높이 : 사용자 지정값 */

       		

       		naver_id_login.setButton("white", 3,40);

       		naver_id_login.setDomain(".service.com");

       		naver_id_login.setState("abcdefghijkmnopqrst");
       		naver_id_login.init_naver_id_login();  // 로그인 시작
       	    naver_id_login.get_naver_userprofile("callback()");
       	    
       		

       		//로그인 popup 형태로 설정

       		

       		

       		



       		function testcallback()

       		{

       		    alert(naver_id_login.getProfileData('email'));

       		    alert(naver_id_login.getProfileData('name'));
       		 var userId=naver_id_login.getProfileData('email'); 
             var tempId = userId.split("."); 



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

       		naver_id_login.get_naver_userprofile("testcallback()");
       		
       		
       		
       		</script>


				</form>
			</div>
		</div>
		<!--  row Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>