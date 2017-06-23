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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap Core JavaScript -->
<!-- <script src="/resources/javascript/bootstrap.min.js"></script> -->

<!-- Awesome Font -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">


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

.input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group {
    z-index: 2;
    margin-left: -1px;
    background: mistyrose;
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

.log-frm {
}
.log-frm ul {
    margin: 0 !important;
    padding: 0 !important;
}
.log-frm ul li {
    color: #666;
    display: block;
    font-size: 14px;
    line-height: 25px;
}
.log-frm ul li a {
    color: #f47521;
    cursor: pointer;
    display: block;
    padding: 10px 0;
}
.log-frm ul li p {
    border: 1px solid #ccc;
    color: #666;
    font-size: 12px;
    line-height: 18px;
    margin: 10px 0;
    padding: 2px 5px;
}
.log-frm ul li input[type="text"] {
    border: 1px solid #ccc;
    border-radius: 0;
    color: #000;
    display: block;
    font-size: 13px;
    line-height: 19px;
    margin-bottom: 10px;
    width: 100%;
}
.model-l {    
    padding-right: 0px;    
}
.model-r .o-r {
    background: #fff none repeat scroll 0 0;
    border: medium none;
    border-radius: 100%;
    bottom: 0;
    height: 40px;
    margin: auto;
    overflow: hidden;
    position: absolute;
    left: -19px;
    top: 0;
    width: 40px;
    z-index: 99999;
}
.model-r .o-r span {
    background: #fff none repeat scroll 0 0;
    border: 2px solid #ccc;
    color: #666;
    display: block;
    height: 100%;
    padding: 8px 0 0;
    text-align: center;
    width: 100%;
    border-radius: 100%;
    display:block;
    position: relative;
}
.model-r {
    padding-left: 30px;
    position: relative;
    border-left: 1px dotted #cccccc;
}
.forgot {
    display: none;
}

input[type="file"] {
    display: block;
    margin-top: 7px;
    margin-left: -66;
}

.input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group {
    z-index: 2;
    margin-left: -50px;
    width: 210px;
    height: 37px;
}


</style>



<script type="text/javascript">
	//============= 개인회원가입 버튼=============	
	$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addUserV" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= 기업회원가입 버튼=============
		
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addCompanyV" ).on("click" , function() {
				fncAddCompany();
			});
		});	
		
		//============= 개인회원가입 =============	
function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var email=$("input[name='email']").val();
			var tel=$("input[name='tel']").val();
			var addr=$("input[name='addr']").val();
			var image=$("input[name='image']").val();
			
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("이름은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("패스워드는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(tel == null || tel.length <1){
				alert("연락처는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(addr == null || addr.length <1){
				alert("주소는 반드시 입력하셔야 합니다.");
				return;
			}
			
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			
			$("#logFrm").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
//============= 기업회원가입 =============
function fncAddCompany() {
			
			var id=$("input[name='userId']").val();
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var email=$("input[name='email']").val();
			var tel=$("input[name='tel']").val();
			var addr=$("input[name='addr']").val();
			var image=$("input[name='image']").val();
			var companyName=$("input[name='companyName']").val();
			var empNum=$("input[name='empNum']").val();
			var pubDate=$("input[name='pubDate']").val();
			
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("이름은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("패스워드는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(tel == null || tel.length <1){
				alert("연락처는 반드시 입력하셔야 합니다.");
				return;
			}
			
			if(addr == null || addr.length <1){
				alert("주소는 반드시 입력하셔야 합니다.");
				return;
			}
			
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}

			
			$("#companyFrm").attr("method" , "POST").attr("action" , "/user/addCompany").submit();
		}
	//======= 이메일 ==========	
$(function() {
	 
	 $("input[name='email']").on("change" , function() {
		
		 var email=$("input[name='email']").val();
	    
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
	    	alert("이메일 형식이 아닙니다.");
	     }
	});
	 
});	
	//====== datePicker ========
$(function(){
	$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ], 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

	});
});	
	
$(function(){
    
    $("#userId").on("keyup", function(){
       
       var userId = $("#userId").val();
       
       
                
        $.ajax(
              {
                  url : '/user/checkUserId/'+userId,
                  method : "GET",
                  dataType : "json",
                  headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  context : this,
                  success : function(JSONData, status) {   
                                          
                     if(! JSONData.result) {
                        $("#checkId").html("존재하는 아이디입니다.");
                     } 
                     else {
                  	   $("#checkId").html("사용가능한 아이디입니다.");
	                       
                     }
                  }
            });         
       });      
    });

$(function(){      

$("#password").keyup( function(){
	$("#checkpw").text('');
	});

$("#password2").keyup( function() {
	if( $("#password").val() != $("#password2").val() ) {
  	$("#checkpw").text('');
  	$("#checkpw").html("비밀번호가 일치하지 않습니다.");
	} else {
  	$("#checkpw").text('');
  	$("#checkpw").html("비밀번호가 일치합니다.");
		}
	});
}); 


function ayantoggle(){
$(".forgot").slideToggle('slow');
}

$(function() {

$("#logout").on("click" , function() {
$(self.location).attr("href","/user/logout");
//self.location = "/user/logout"
}); 
});

$( function() {
	
	$("#userId").focus();
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#loginButton").on("click" , function() {
		
		
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
		
		
		$("#aaa").attr("method","POST").attr("action","/user/login").submit();
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
		var role= $(this).attr('role');
		self.location = "/profile/getMineProfile?role="+role;
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
			self.location = "/project/listProject?postDivision=1"
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
	 
//============= toolbar chat 이동 Event 처리 =============
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#chat").on("click", function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "https://192.168.0.16:8444/#" + Math.random().toString(16).substr(2);
	});
});
	 }); 


 <!-- //네이버아이디로로그인 버튼 노출 영역 -->

	
 

 		//========== 카카오 ==============
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
</head>




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
<header class="intro" id="intro">
      <div class="intro-body">
         <div class="container">
            <div class="row">
               <div class="col-md-10 col-md-offset-1">
                  <h1 class="brand-heading">NONSTOP <br/> PROJECT AND PORTFOLIO</h1>
                  <div class="margin-bottom-20"></div>
                  
                  <p class="intro-text">
                     논스톱에서 웹사이트, 어플리케이션 개발 및 디자인 포트폴리오를 관리하고 관련 프로젝트에 참여해 보세요.<br /> 
                     간편하게 자신의 포트폴리오를 관리할 수 있고 다양한 프로젝트 참여를 통해 커리어를 높일 수 있습니다. 
                  </p>
                  <div class="margin-bottom-50"></div>
                  
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
                  
                  
                  <!-- 버튼 주석처리
                  <div class="margin-bottom-50"></div>
                  <button class="sq_button" type="button" style="background-color: #ff6600">회원가입</button>
                  <button class="sq_button" type="button">일단, 둘러볼게요</button>
                  -->
                  
                  <div class="center-block">
                     <a href="#about" class="page-scroll" data-index="0" style="position: fixed; margin-top: 6%; margin-left: -2%;"> <!-- class="btn btn-circle page-scroll" -->
                     <span class="fa fa-chevron-down" aria-hidden="true" style="color:rgb(189, 189, 189); font-size:40px"><p>더 알아보기</p></span>
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
                 <form id="aaa">
                      <div class="form-group">
                          <input type="text" class="form-control" name="userId" id="userId" placeholder="User ID">
                      </div>
      
                      <div class="form-group">
                          <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                      </div>
     
                      <button class="btn btn-primary btn-block" id="loginButton">LOGIN</button>
                  
                 	  <div class="text-div"><span>or</span><!-- <br/>Sign in using --></div>
                  	  
                  	  <div class="form-group">
                  	  	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
							<img src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png" />
						</a>
					  </div>
					  
					  <div class="form-group" id="naver_id_login">
                  	  	<img src="/resources/images/layout/naverLogin.png"/>
					  </div>

                  </form>
              </div>
              
           </div>
        </div>
    </div>
<script type="text/javascript">

var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,52);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
	

								


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
                                      <input type="text" id="userId" name="userId" class="form-control" placeholder="User ID">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password2" name="password2" class="form-control" placeholder="Password 확인">
                                  </div>
                                  <div id="checkpw" style="color:red; font-size:12px;"></div>
                                  <div class="form-group">
                                      <input type="text" id="userName" name="userName" class="form-control" placeholder="이름">
                                  </div>
                  
                                  <div class="form-group">
                                      <input type="password" id="tel" name="tel" class="form-control" placeholder="연락처">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="email" name="email" class="form-control" placeholder="이메일">
                                  </div>
                 				
                 				
                 				  <!-- ===================프로필 사진========================= --> 
                 				
                 				
                 				
                                  <button class="btn btn-primary btn-block" id="addUserV" style="margin-top:60px">회원가입</button>
                                  <button class="btn btn-default btn-block">취소</button>
            
                              </form>
                        </div>
                        <div class="tab-pane" id="tab_default_2">
                           <form>
                                  <div class="form-group">
                                      <input type="text" id="userId" name="userId" class="form-control" placeholder="User ID">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password2" name="password2" class="form-control" placeholder="Password 확인">
                                  </div>
                                  <div id="checkpw" style="color:red; font-size:12px;"></div>
                                  <div class="form-group">
                                      <input type="text" id="userName" name="userName" class="form-control" placeholder="이름">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="tel" name="tel" class="form-control" placeholder="연락처">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="email" name="email" class="form-control" placeholder="이메일">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="companyName" name="companyName" class="form-control" placeholder="기업명">
                                  </div>
                                   <div class="form-group">
                                      <input type="text" id="empNum" name="empNum" class="form-control" placeholder="직원수">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="datepicker" name="pubDate" class="form-control" placeholder="설립일" readonly>
                                  </div>
                 				  



									<!-- =========================기업로고======================================= -->


               
                                  <button class="btn btn-primary btn-block" id="addCompanyV" style="margin-top:60px">회원가입</button>
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




										