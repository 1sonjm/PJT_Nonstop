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

<!-- ///////////// īī�� ���� ���� ////////////////// -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/> -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- ////////////////////////////////////////////////// -->

<!-- ///////////////////////���̹�///////////////////////////////////// -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- ///////////////////////���̹�///////////////////////////////////// -->


<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
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
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ �巴�ٿ�-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--  ����˾� -->
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
	//============= ����ȸ������ ��ư=============	
	$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addUserV" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= ���ȸ������ ��ư=============
		
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addCompanyV" ).on("click" , function() {
				fncAddCompany();
			});
		});	
		
		//============= ����ȸ������ =============	
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
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(pw == null || pw.length <1){
				alert("�н������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(email == null || email.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(tel == null || tel.length <1){
				alert("����ó�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(addr == null || addr.length <1){
				alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			
			$("#addUserF").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
//============= ���ȸ������ =============
function fncAddCompany() {
			
			var id2=$("input[name='userId2']").val();
			var name2=$("input[name='userName2']").val();
			var pw2=$("input[name='password22']").val();
			var pw_confirm2=$("input[name='password222']").val();
			var email2=$("input[name='email2']").val();
			var tel2=$("input[name='tel2']").val();
			var addr2=$("input[name='addr2']").val();
			var image2=$("input[name='image2']").val();
			var companyName2=$("input[name='companyName2']").val();
			var empNum2=$("input[name='empNum2']").val();
			var pubDate=$("input[name='pubDate']").val();
			
			
			if(id2 == null || id2.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(name2 == null || name2.length <1){
				alert("�̸��� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(pw2 == null || pw2.length <1){
				alert("�н������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm2 == null || pw_confirm2.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(email2 == null || email2.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(tel2 == null || tel2.length <1){
				alert("����ó�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(addr2 == null || addr2.length <1){
				alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			
			if( pw2 != pw_confirm2 ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}

			
			$("#addCompanyF").attr("method" , "POST").attr("action" , "/user/addCompany").submit();
		}
	//======= �̸��� ==========	
$(function() {
	 
	 $("input[name='email']").on("change" , function() {
		
		 var email=$("input[name='email']").val();
	    
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
	    	alert("�̸��� ������ �ƴմϴ�.");
	     }
	});
	 
});	
	//====== datePicker ========
$(function(){
	$("#datepicker").datepicker({dateFormat:"yy-mm-dd", 
		dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��' ], 
		  monthNames : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��']

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
                        $("#checkId").html("�����ϴ� ���̵��Դϴ�.");
                     } 
                     else {
                  	   $("#checkId").html("��밡���� ���̵��Դϴ�.");
	                       
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
  	$("#checkpw").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	} else {
  	$("#checkpw").text('');
  	$("#checkpw").html("��й�ȣ�� ��ġ�մϴ�.");
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
	
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#loginButton").on("click" , function() {
		
		
		var id=$("input:text").val();
		var pw=$("input:password").val();
		
		
		if(id == null || id.length <1) {
			alert('ID �� �Է����� �����̽��ϴ�.');
			$("#userId").focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('�н����带 �Է����� �����̽��ϴ�.');
			$("#password").focus();
			return;
		}
		
		
		$("#aaa").attr("method","POST").attr("action","/user/login").submit();
	});
});	


//============= ������ �̵� Event ó�� =============	
$(function() {
	$("#listLetter").on("click" , function() {
		var receiveId = $("#userId").val();		
		self.location = "/letter/getReceiveLetterList?receiveId="+receiveId;
	}); 
});

//============= ������ �̵� Event ó�� =============	
$(function() {
	$("#profile").on("click" , function() {
		var role= $(this).attr('role');
		self.location = "/profile/getMineProfile?role="+role;
	}); 
});

//============= ���������� �̵� Event ó�� =============	
$(function() {
	$("#getUser").on("click" , function() {
		//alert($("#userId").val());
		var userId = $("#userId").val();	 	
		self.location = "/user/getUser?userId="+userId;
	}); 
});

//============= ���������� �̵� Event ó�� =============	
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




//============= ��� �̵� Event ó�� =============	
$(function() {
	$("#statistics").on("click", function() {
		self.location = "/statistics/getListStatistics"
	});
});

//============= toolbar project �̵� Event ó�� =============	
$(function() {
	$("#projDesigner").on("click", function() {
		self.location = "/project/listProject?postDivision=2"
	});
});

//============= toolbar project �̵� Event ó�� =============

$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("#projDeveloper").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/project/listProject"
		}); 
	 });

//============= toolbar portfolio �̵� Event ó�� =============
$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("#portDesigner").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/portfolio/listPortfolio?portDivision=2"
		}); 
	 });

//============= toolbar portfolio �̵� Event ó�� =============
$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("#portDeveloper").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/portfolio/listPortfolio?portDivision=1"
		}); 
	 });
	 
//============= toolbar chat �̵� Event ó�� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#chat").on("click", function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "https://192.168.0.16:8444/#" + Math.random().toString(16).substr(2);
	});
});
	 }); 


 <!-- //���̹����̵�ηα��� ��ư ���� ���� -->

	
 

 		//========== īī�� ==============
 		Kakao.init('fc5658887af25f840e94144f6722b228');
		
        function loginWithKakao() {
     // �α��� â�� ���ϴ�.
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
                            	  alert("������ �����ϴ�. ȸ�������� ���ֽñ� �ٶ��ϴ�.");
                            	  self.location="/view/user/addUserView.jsp?userId="+userId;                 
                              }else if(JSONData.user.role == 4){
                            	alert("Ż���� �����Դϴ�.");  
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
                  <li><a href="#myModalLogin" id="modalLogin" data-toggle="modal" data-target="#myModalLogin">�α���</a></li>
                  <li><a href="#myModalAdd" id="modalAddUser" data-toggle="modal" data-target="#myModalAdd">ȸ������</a></li>
               </c:if>
               <%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
               <c:if test="${!empty sessionScope.user.userId }">
                  <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}�� ȯ���մϴ�.</a></li>
                  <li>
                     <a href="#" id="listLetter">
                        <!-- ���� -->
                        <span class="glyphicon glyphicon-envelope" style="margin-top:3px; margin-bottom:5px"></span>
                        <!-- �˸� -->
                        <span class="label label-rounded label-primary" style="padding: 0 .8em .1em; border-radius: .5em">new</span>
                     </a>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top:3px; margin-bottom:5px"></span></a>
                     <ul class="dropdown-menu">
                        <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
                        <li><a href="#" id="profile">������</a></li>
                        <li><a href="#" id="getUser">����������</a></li>
                        <li><a href="#" id="updateUser">����������</a></li>
                        <li><a href="#" id="listFollow">�ȷο� ��Ϻ���</a></li>
                        <li><a href="#" id="logout">�α׾ƿ�</a></li>
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
                     ���鿡�� ������Ʈ, ���ø����̼� ���� �� ������ ��Ʈ�������� �����ϰ� ���� ������Ʈ�� ������ ������.<br /> 
                     �����ϰ� �ڽ��� ��Ʈ�������� ������ �� �ְ� �پ��� ������Ʈ ������ ���� Ŀ��� ���� �� �ֽ��ϴ�. 
                  </p>
                  <div class="margin-bottom-50"></div>
                  
                  <div class="intro-main">
                     <ul class="main-ul">
                        <li>
                           <h1>${dataList.DEVELOP}</h1>
                           <p>������ ��Ʈ������</p>
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
                           <p>������ ��Ʈ������</p>
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
                           <p>��ϵ� ������Ʈ</p>
                        </li>
                     </ul>
                  </div>
                  
                  
                  <!-- ��ư �ּ�ó��
                  <div class="margin-bottom-50"></div>
                  <button class="sq_button" type="button" style="background-color: #ff6600">ȸ������</button>
                  <button class="sq_button" type="button">�ϴ�, �ѷ����Կ�</button>
                  -->
                  
                  <div class="center-block">
                     <a href="#about" class="page-scroll" data-index="0" style="position: fixed; margin-top: 6%; margin-left: -2%;"> <!-- class="btn btn-circle page-scroll" -->
                     <span class="fa fa-chevron-down" aria-hidden="true" style="color:rgb(189, 189, 189); font-size:40px"><p>�� �˾ƺ���</p></span>
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
               �׵��� �۾��� ��Ʈ�������� �ս��� �ø��� ������ �� �ֽ��ϴ�. pdf ���� ���� ������ ���� �̹��� ���ε带 ���� �� ������ �������� ��Ʈ������ ������ �������� ����Ͽ� ����� �� �ֵ��� �����ϱ� ���� ����ϰ� �ֽ��ϴ�. ���� ����� �۾����� ������ ���������� ���� ������ �� ������ ������ �۾����� ��õ�ϰ� �ǰ��� ���� �� �ֽ��ϴ�.
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
               �׵��� �۾��� ��Ʈ�������� �ս��� �ø��� ������ �� �ֽ��ϴ�. pdf ���� ���� ������ ���� �̹��� ���ε带 ���� �� ������ �������� ��Ʈ������ ������ �������� ����Ͽ� ����� �� �ֵ��� �����ϱ� ���� ����ϰ� �ֽ��ϴ�. ���� ����� �۾����� ������ ���������� ���� ������ �� ������ ������ �۾����� ��õ�ϰ� �ǰ��� ���� �� �ֽ��ϴ�.
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
               �׵��� �۾��� ��Ʈ�������� �ս��� �ø��� ������ �� �ֽ��ϴ�. pdf ���� ���� ������ ���� �̹��� ���ε带 ���� �� ������ �������� ��Ʈ������ ������ �������� ����Ͽ� ����� �� �ֵ��� �����ϱ� ���� ����ϰ� �ֽ��ϴ�. ���� ����� �۾����� ������ ���������� ���� ������ �� ������ ������ �۾����� ��õ�ϰ� �ǰ��� ���� �� �ֽ��ϴ�.
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
							<img src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png" width="100%"/>
						</a>
					  </div>
					  
					  <div class="form-group" id="naver_id_login">
                  	  	<img src="/resources/images/layout/naverLogin.PNG"/>
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
              	alert("Ż���� �����Դϴ�.");
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
                           <a href="#tab_default_1" data-toggle="tab"><strong>���� ȸ������ </strong></a>
                        </li>
                        <li>
                           <a href="#tab_default_2" data-toggle="tab"><strong>��� ȸ������</strong></a>
                        </li>
                     </ul>
                     <div class="tab-content">
                        <div class="tab-pane active" id="tab_default_1">
                           <form id="addUserF">
                                  <div class="form-group">
                                      <input type="text" id="userId" name="userId1" class="form-control" placeholder="User ID">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password" name="password1" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password2" name="password21" class="form-control" placeholder="Password Ȯ��">
                                  </div>
                                  <div id="checkpw" style="color:red; font-size:12px;"></div>
                                  <div class="form-group">
                                      <input type="text" id="userName" name="userName1" class="form-control" placeholder="�̸�">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="addr" name="addr1" class="form-control" placeholder="�ּ�">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="tel" name="tel1" class="form-control" placeholder="����ó">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="email" name="email1" class="form-control" placeholder="�̸���">
                                  </div>
                 				
                 				
                 				  <!-- ===================������ ����========================= --> 
                 				
                 				
                 				
                                  <button class="btn btn-primary btn-block" id="addUserV" style="margin-top:60px">ȸ������</button>
                                  <button class="btn btn-default btn-block">���</button>
            
                              </form>
                        </div>
                        <div class="tab-pane" id="tab_default_2">
                           <form id="addCompanyF">
                                  <div class="form-group">
                                      <input type="text" id="userId" name="userId2" class="form-control" placeholder="User ID">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password" name="password22" class="form-control" placeholder="Password">
                                  </div>
                                  <div class="form-group">
                                      <input type="password" id="password2" name="password222" class="form-control" placeholder="Password Ȯ��">
                                  </div>
                                  <div id="checkpw" style="color:red; font-size:12px;"></div>
                                  <div class="form-group">
                                      <input type="text" id="userName" name="userName2" class="form-control" placeholder="�̸�">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="addr" name="addr2" class="form-control" placeholder="�̸�">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="tel" name="tel2" class="form-control" placeholder="����ó">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="email" name="email2" class="form-control" placeholder="�̸���">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" id="companyName" name="companyName2" class="form-control" placeholder="�����">
                                  </div>
                                   <div class="form-group">
                                      <input type="text" id="empNum" name="empNum2" class="form-control" placeholder="������">
                                  </div>
                                  
                                  <div class="form-group">
                                      <input type="text" id="datepicker" name="pubDate" class="form-control" placeholder="������" readonly>
                                  </div>
                 				  



									<!-- =========================����ΰ�======================================= -->


               
                                  <button class="btn btn-primary btn-block" id="addCompanyV" style="margin-top:60px">ȸ������</button>
                                  <button class="btn btn-default btn-block">���</button>
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




										