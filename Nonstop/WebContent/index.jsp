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
<!-- Custom CSS -->
<link href="/resources/css/main.css" rel="stylesheet">
<!-- Awesome Font -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/javascript/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/javascript/bootstrap.min.js"></script>
<!-- Plugin JavaScript -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> -->
<!-- Theme JavaScript -->
<script src="/resources/javascript/mainpage.js"></script>
<!-- ///////////////////////네이버//////////////////////// -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- ///////////// 카카오 계정 연동 ////////////////// -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- ////////////////////////////////////////////////// -->

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
::selection { color:white; background:blue; }
::-moz-selection { color:white; background:blue; }
</style>
<script type="text/javascript">
//============= 개인회원가입 버튼 =============	
$(function() {
	$( "#addUserV" ).on("click" , function() {
		fncAddUser();
	});
});	
	
//============= 기업회원가입 버튼 =============
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#addCompanyV" ).on("click" , function() {
		fncAddCompany();
	});
});	
//============= 개인회원가입 =============	
function fncAddUser() {
		
	var id=$("input[id='addUser11']").val();
	var name=$("input[id='userName1']").val();
	var pw=$("input[id='password11']").val();
	var pw_confirm=$("input[id='password22']").val();
	var email=$("input[id='email1']").val();
	var tel=$("input[id='tel1']").val();
	var addr=$("input[id='addr1']").val();
	var image=$("input[id='image1']").val();
	
	
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
		
	
	$("#addUserF").attr("method" , "POST").attr("action" , "/user/addUser").submit();
}
	
//============= 기업회원가입 =============
function fncAddCompany() {
		
	var id=$("input[id='addUser22']").val();
	var name=$("input[id='userName2']").val();
	var pw=$("input[id='password33']").val();
	var pw_confirm=$("input[id='password44']").val();
	var email=$("input[id='email2']").val();
	var tel=$("input[id='tel2']").val();
	var addr=$("input[id='addr2']").val();
	var image=$("input[id='image2']").val();
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
	
	$("#addCompanyF").attr("method" , "POST").attr("action" , "/user/addCompany").submit();
}
	
$(function() {
	//======= 이메일 ==========
 	$("input[name='email']").on("change" , function() {
				
		 var email=$("input[name='email']").val();
	    
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
	    	alert("이메일 형식이 아닙니다.");
	     }
	});
 	//====== datePicker ========
 	$("#datepicker").datepicker({
 		dateFormat:"yy-mm-dd", 
 		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ], 
 		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
 	});
});	
//============ 아이디 중복 체크 =====================
$(function(){
    
	$("#userId").on("keyup", function(){
       
    	var userId = $("#userId").val();
       
       		$.ajax(
            	{
                  url : '/user/checkId/'+userId,
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
	                  }else {
	                	  
                   	  	$("#checkId").html("사용가능한 아이디입니다.");
                       
                      }
                  }
            });//ajax         
     });
	
	$("#password11").keyup( function(){
        $("#checkpw1").text('');
     });
     
     $("#password22").keyup( function() {
        if( $("#password11").val() != $("#password22").val() ) {
           $("#checkpw1").text('');
           $("#checkpw1").html("비밀번호가 일치하지 않습니다.");
        } else {
           $("#checkpw1").text('');
           $("#checkpw1").html("비밀번호가 일치합니다.");
        }
     });
     $("#password33").keyup( function(){
         $("#checkpw2").text('');
      });
      
      $("#password44").keyup( function() {
         if( $("#password33").val() != $("#password44").val() ) {
            $("#checkpw2").text('');
            $("#checkpw2").html("비밀번호가 일치하지 않습니다.");
         } else {
            $("#checkpw2").text('');
            $("#checkpw2").html("비밀번호가 일치합니다.");
         }
      });
      
      $("#addUser11").on("keyup", function(){
          
      	var userId = $("#addUser11").val();
         
         		$.ajax(
              	{
                    url : '/user/checkId/'+userId,
                    method : "GET",
                    dataType : "json",
                    headers : {
                       "Accept" : "application/json",
                       "Content-Type" : "application/json"
                    },
                    context : this,
                    success : function(JSONData, status) {   
                                            
                       if(! JSONData.result) {
                           $("#checkId1").text("존재하는 아이디입니다.");
                       } 
                       else if(userId <4){
                      	 $("#checkId1").text("아이디는 4자 이상이어야 합니다."); 
                       }
                       else{
                    	   	 $("#checkId1").text("사용가능한 아이디입니다.");
  	                       
                       }
                    }
              });//ajax      
	});
    $("#addUser22").on("keyup", function(){
        
    	var userId = $("#addUser22").val();
       
       		$.ajax(
            	{
                  url : '/user/checkId/'+userId,
                  method : "GET",
                  dataType : "json",
                  headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  context : this,
                  success : function(JSONData, status) {   
                                          
                     if(! JSONData.result) {
                         $("#checkId2").text("존재하는 아이디입니다.");
                     } 
                     else if(userId <4){
                    	 $("#checkId2").text("아이디는 4자 이상이어야 합니다."); 
                     }
                     else{
                  	   	 $("#checkId2").text("사용가능한 아이디입니다.");
	                       
                     }
                  }
            }); 
    });  
});
//============= login/logout 이동 Event 처리 =============	
$(function() {
	
	$("#loginButton").on("click", function() {
		
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
		$.ajax(
	        	{
		        	url : '/user/checkUserId/'+id,
		            method : "POST",
		            dataType : "json",
		            headers : {
		                "Accept" : "application/json",
		                "Content-Type" : "application/json"
		            },
		            context : this,
		            success : function(JSONData, status) {     
		            	if(JSONData.user ==null ) {
		            		alert('회원정보가 일치하지 않습니다.');	
		            		$(self.location).attr("href","/user/logout");
		            		location.reload();            
	                }else if(JSONData.user.role == 4){
	              		alert("탈퇴한 계정입니다.");
	              		$(self.location).attr("href","/user/logout");
	              		location.reload();
	                }else{
	                	
	                	if(JSONData.user.userId == id && JSONData.user.password == pw){
	                	$("#aaa").attr("method","POST").attr("action","/user/login").submit();
	              	  location.reload();
	                }else if(JSONData.user.userId != id || JSONData.user.password != pw){
	                alert('회원정보가 일치하지 않습니다.');	
	                $(self.location).attr("href","/user/logout");
	                location.reload();
	                	}
	                }
	             }
	       	});   
	
	});
	
	$("#logout").on("click" , function() {
		$(self.location).attr("href","/user/logout");
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
	$("#mail").on("click", function() {
		var receiveId = $("#userId").val();
		self.location = "/letter/getReceiveLetterList?receiveId=" + receiveId;
	});
});
//============= 프로필 이동 Event 처리 =============   
$(function() {
   $("#profile").on("click", function() {
      var role = $(this).attr('role');
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
//============= 기업정보보기 이동 Event 처리 =============	
$(function() {
	$("#getCompany").on("click" , function() {
		//alert($("#userId").val());
		var userId = $("#userId").val();	 	
		self.location = "/user/getCompany?userId="+userId;
	}); 
});
//============= 내정보수정 이동 Event 처리 =============	
$(function() {
	$("#updateUser").on("click" , function() {
		
		var userId = $("#userId").val();	 	
		 self.location = "/user/updateUser?userId="+userId;
	}); 
});
//============= 기업정보수정 이동 Event 처리 =============	
$(function() {
	$("#updateCompany").on("click" , function() {
		
		var userId = $("#userId").val();	 	
		 self.location = "/user/updateCompany?userId="+userId;
	}); 
});
//============= 회원목록조회 이동 Event 처리 =============	
$(function() {
	$("#listUser").on("click" , function() {
		
		var userId = $("#userId").val();	 	
		 self.location = "/user/listUser"
	}); 
});
//============= 기업목록조회 이동 Event 처리 =============	
$(function() {
	$("#listCompany").on("click" , function() {
		
		var userId = $("#userId").val();	 	
		 self.location = "/user/listCompany"
	}); 
});
//============= 통계 이동 Event 처리 =============	
$(function() {
	$("#statistics").on("click", function() {
		self.location = "/statistics/getListStatistics"
	});
});
//============= toolbar chat 및 메인 통계 데이터 받아오기  이동 Event 처리 =============
$(function() {
	$("#chat").on("click", function() {
		self.location = "https://192.168.0.16:8444/#" + Math.random().toString(16).substr(2);
	});
	
	$.ajax("/statistics/getJSONPostCountList",{
		method : "GET", dataType : "json",
		success : function(jsonData){
			$("#countDevelop").text(jsonData.dataList.DEVELOP);
			$("#countDevelop").attr("data-to",jsonData.dataList.DEVELOP);
			$("#countDesign").text(jsonData.dataList.DESIGN);
			$("#countDesign").attr("data-to",jsonData.dataList.DESIGN);
			$("#countProject").text(jsonData.dataList.PROJECT);
			$("#countProject").attr("data-to",jsonData.dataList.PROJECT);
			//countTo 이벤트
			$(".st-ff-count").countTo();
		}
	})
	
});
$(document).ready(function(){
	$.ajax(
	{
		url:"/letter/toolbarMailCheck",
		method: "GET",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"	
		},
		success : function(a , status) {
			if(a.flag == true){
				var displayValue = "<span class='glyphicon glyphicon-envelope' id='listLetter' style='margin-top:3px; margin-bottom:5px'></span>"
								  +"<span class='label label-rounded label-primary' style='padding: 0 .8em .1em; border-radius: .5em; background:#ff6600; margin-left:4px;'>NEW</span>";
				$("#mail").html(displayValue);
			}
		}
	})
})
//============= toolbar project 이동 Event 처리 =============   
$(function() {
   $("#projDesigner").on("click" , function() {
     self.location = "/project/listProject?postDivision=2"
  }); 
});
//============= toolbar project 이동 Event 처리 =============
$(function() {
    $("#projDeveloper").on("click" , function() {
     	self.location = "/project/listProject?postDivision=1"
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
//============ 카카오 ==============
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
/* $(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});
//이미지=====================
$(function() {
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });   
});*/
  	
</script>
</head>

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
               
		            	<c:if test="${sessionScope.user.role == '1'}">
		                	<li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
		                  	<li>
		                    	<a href="#" id="mail">
		                        	<!-- 쪽지 -->
		                        	<span class="glyphicon glyphicon-envelope" style="margin-top:3px; margin-bottom:5px"></span>
		                        	
		                     	</a>
		                  	</li>
		                  	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top:3px; margin-bottom:5px"></span></a>
		                    	<ul class="dropdown-menu">
		                        	<input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
		                        	<li><a href="#" id="profile" role="${user.role}">프로필</a></li>
		                        	<li><a href="#" id="listUser">개인회원목록조회</a></li>
		                        	<li><a href="#" id="listCompany">기업회원목록조회</a></li>
		                        	<li><a href="#" id="getUser">내정보보기</a></li>
		                        	<li><a href="#" id="updateUser">내정보수정</a></li>
		                        	<!-- <li><a href="#" id="listFollow">팔로우 목록보기</a></li> -->
		                        	<li><a href="#" id="logout">로그아웃</a></li>
		                     	</ul>
		                  	</li>
                     	</c:if>
		               	<c:if test="${sessionScope.user.role == '2'}">
		                  	<li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
		                  	<li>
		                    	<a href="#" id="mail">
		                        	<!-- 쪽지 -->
		                        	<span class="glyphicon glyphicon-envelope" style="margin-top:3px; margin-bottom:5px"></span>
		                     	</a>
		                  	</li>
		                  	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top:3px; margin-bottom:5px"></span></a>
		                    <ul class="dropdown-menu">
		                        <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
		                        <li><a href="#" id="profile" role="${user.role}">프로필</a></li>
		                        <li><a href="#" id="getUser">내정보보기</a></li>
		                        <li><a href="#" id="updateUser">내정보수정</a></li>
		                        <!-- <li><a href="#" id="listFollow">팔로우 목록보기</a></li> -->
		                        <li><a href="#" id="logout">로그아웃</a></li>
		                     </ul></li>
		                </c:if>
		                <c:if test="${sessionScope.user.role == '3'}">
		                	<li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
		                  	<li>
		                    	<a href="#" id="mail">
		                        <!-- 쪽지 -->
		                        <span class="glyphicon glyphicon-envelope" style="margin-top:3px; margin-bottom:5px"></span>
		                     	</a>
		                  	</li>
		                  	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify" style="margin-top:3px; margin-bottom:5px"></span></a>
		                    <ul class="dropdown-menu">
		                        <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}" />
		                        <li><a href="#" id="profile" role="${user.role}">프로필</a></li>
		                        <li><a href="#" id="getCompany">기업정보보기</a></li>
		                        <li><a href="#" id="updateCompany">기업정보수정</a></li>
		                        <!-- <li><a href="#" id="listFollow">팔로우 목록보기</a></li> -->
		                        <li><a href="#" id="logout">로그아웃</a></li>
		                    </ul></li>
		                 </c:if>	
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
						<div class="margin-bottom-80"></div>
						
						<div class="funfacts">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-keyboard-o" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" id="countDevelop" data-from="0" data-to="0" data-runit="1"></span>+</div>
											<strong class="funfact-title">Development Portfolio</strong>
										</div><!-- .funfact -->
									</div>
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" id="countDesign" data-from="0" data-to="0" data-runit="1"></span>+</div>
											<strong class="funfact-title">Design Portfolio</strong>
										</div><!-- .funfact -->
									</div>
									<div class="col-md-4">
										<div class="funfact">
											<div class="st-funfact-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
											<div class="st-funfact-counter"><span class="st-ff-count" id="countProject" data-from="0" data-to="0" data-runit="1"></span>+</div>
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
					<div class="margin-bottom-50"></div>
					<hr style="width:20%; border-top:1px solid #bdbdbd">
					<div class="margin-bottom-70"></div>
				</div>
			</div>
			
			<div class="col-md-12">
				<div class="col-md-4 col-sm-4">
					<div class="single-blog">
			
						<div class="featured-content">
							<img class="img-responsive" src="/resources/images/upload/designApp(1).jpg" alt="">
							<div class="portfolio-detail">
								<div class="portfolio-overlay"></div>
								<a href="img/demo-images/portfolio/full/01.jpg" data-litebox-group="myGallery" class="litebox"></a>
							</div>
						</div>
						<div class="single-blog-text">
							<h3>다중 이미지 업로드</h3>
							<p>여러개의 이미지를 업로드 할 수 있고 이미지 클릭시 전체화면으로 볼 수 있기에 편리합니다.</p>
							<p><a href="" class="btn blog-btn">View Image</a></p>
						</div>
					</div>
				</div><!--blog col end-->
				<div class="col-md-4 col-sm-4">
					<div class="single-blog">
						<div class="featured-content">
							<img class="img-responsive" src="/resources/images/upload/designApp(8).jpg" alt="">
							<div class="portfolio-detail">
								<div class="portfolio-overlay"></div>
								<a href="img/demo-images/portfolio/full/02.jpg" data-litebox-group="myGallery" class="litebox"></a>
							</div>
						</div>
						<div class="single-blog-text">
							<h3>PDF 파일 형식 지원</h3>
							<p>PDF 파일 형식 포트폴리오가 있다면 추가 작업 없이 그대로 업로드하여 사용할 수 있습니다.</p>
							<p><a href="" class="btn blog-btn">View PDF</a></p>
						</div>
					</div>
				</div><!--blog col end-->
				<div class="col-md-4 col-sm-4">
					<div class="single-blog">
						<div class="featured-content">
							<img class="img-responsive" src="/resources/images/upload/designApp(7).jpg" alt="">
							<div class="portfolio-detail">
								<div class="portfolio-overlay"></div>
								<a href="img/demo-images/portfolio/full/03.jpg" data-litebox-group="myGallery" class="litebox"></a>
							</div>
						</div>
						<div class="single-blog-text">
							<h3>ODP 파일 형식 지원</h3>
							<p>	Open Document 파일 형식을 지원합니다. 갖고 있는 PPT파일이 있다면 ODP파일 업로드를 이용해보세요.</p>
							<p><a href="" class="btn blog-btn">View ODP</a></p>
						</div>	
					</div>
				</div><!--blog col end-->
			</div>
			
			<div class="col-md-12" style="text-align:center">
				<span class="fa fa-chevron-down" aria-hidden="true" style="margin-top: 150px; font-size: 30; color: #cccccc;"><p>Project Service</p></span>
			</div>
		</div>
	</section>
	
	<!-- Download Section -->
	<section id="download" class="download">
		<div class="download-section">
			<div class="container">
			
				<div class="col-md-12">
					<i class="fa fa-quote-left" id="download-icon" aria-hidden="true"></i>
					<h2 class="brand-heading">Project Service</h2>
					<p>
					골치아픈 프로젝트 빨리해결할 수 없을까? 믿을만한 프리랜서 어디없을까? 검증되지않은 프리랜서는 프로젝트를 망칠 수도 있습니다. 프리랜서의 개인 기술능력 정보를 직접확인해보고 공동 프로젝트에 착수하세요.
					적합한 작업자를 찾느라 지친당신 NONSTOP에서 성공을 기원합니다.
					</p>
					<div class="margin-bottom-50"></div>
					<hr style="width:20%">
					<div class="margin-bottom-100"></div>
				</div>
				
				<div class="container">
	                <div class="row">
	                    <div class="col-md-3">
                            <span class="rotate-box-icon"><i class="fa fa-users"></i></span>
                            <div class="rotate-box-info">
                                <h4>프로젝트 등록</h4>
                                <p>진행하고자 하는 프로젝트를 사이트에 등록합니다. 등록된 프로젝트는 사이트의 프리랜서 회원들에게 공개됩니다.</p>
                            </div>
	                    </div>
	
	                    <div class="col-md-3">
                            <span class="rotate-box-icon"><i class="fa fa-diamond"></i></span>
                            <div class="rotate-box-info">
                                <h4>프리랜서 검증</h4>
                                <p>프로필 페이지를 통해 프리랜서의 기술력과 그동안 참여한 프로젝트 및 프리랜서가 등록한 포트폴리오를 조회할 수 있습니다.</p>
                            </div>
	                    </div>
	
	                    <div class="col-md-3">
                            <span class="rotate-box-icon"><i class="fa fa-heart"></i></span>
                            <div class="rotate-box-info">
                                <h4>프로젝트 초대</h4>
                                <p>함께 프로젝트를 진행하고 싶은 프리랜서가 있다면 프로젝트에 초대할 수 있습니다.</p>
                            </div>
	                    </div>
	                    
	                    <div class="col-md-3">
                            <span class="rotate-box-icon"><i class="fa fa-clock-o"></i></span>
                            <div class="rotate-box-info">
                                <h4>미팅 + 프로젝트 착수</h4>
                                <p>프로젝트에 참여한 회원들과 온라인으로 의사소통할 수 있는 채팅기능을 지원합니다.</p>
                            </div>
	                    </div>
	                </div> <!-- /.row -->
	            </div>
	            
	            <div class="col-md-12" style="text-align:center">
					<span class="fa fa-chevron-down" aria-hidden="true" style="margin-top: 100px; font-size: 30; color: #e3e3e3;"><p>Tech Statistics Service</p></span>
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
					<h2 class="brand-heading">Statistic & Chatting Service</h2>
					<p>
					프로젝트 진행을 위해선 소통이 매우 중요합니다. 업무를 담당하게 될 프리랜서의 역량을 통계를 통해 큰 흐름을 조회하고 분석해보세요. 그리고 채팅을 통해 해당 프리랜서가 이전에 진행했던 포트폴리오 들을 직접 시연을 통해 확인하거나 자료를 전달받을 수 있습니다. 더욱 견고한 프로젝트를 준비하세요.
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
        	<div class="modal-content" style="margin-top: 30%; padding-bottom: 0; padding-top: 10px;">
        	
        		<div class="tab-content">
	        		<form id="aaa">
		                <div class="form-group">
		                    <input type="text" class="form-control" name="userId" id="userId" placeholder="User ID">
		                </div>
		
		                <div class="form-group">
		                    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
		                </div>
		
		                <button class="btn btn-primary btn-block" id="loginButton">LOGIN</button>
						
						<div class="text-div"><span>or</span></div>
						
						<div class="form-group">
	                  	  	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
								<img src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png" width="100%"/>
							</a>
					  	</div>
					  
					  	<div id="naver_id_login" class="form-group">
                  	  		<img src="/resources/images/layout/naverLogin.PNG"/>
					  	</div>

		            </form>
        		</div>
        		
        	</div>
        </div>
    </div>
    <script type="text/javascript">
    //============ 네이버 ==============
    var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,52);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
	function naverSignInCallback() {
		
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
    
 	naver_id_login.get_naver_userprofile("naverSignInCallback()");
 	</script>
    
    <!-- modal Add User -->
	<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog" style="width: 450px">
        	<div class="modal-content" style="margin-top: -4%; padding-bottom: 0; padding-top: 10px;">
        	
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
									<form id="addUserF" method="post" enctype="multipart/form-data">
	                                	<div class="form-group">
	                                    	<input type="text" id="addUser11" name="userId" class="form-control" placeholder="User ID">
	                                    	<div id="checkId1" style="color:red; font-size:12px;">아이디를 입력해주세요.</div>
	                 				 	</div>
	                                  	<div class="form-group">
	                                    	<input type="password" id="password11" name="password" class="form-control" placeholder="Password">
	                                  	</div>
		                                <div class="form-group">
		                                    <input type="password" id="password22" name="password2" class="form-control" placeholder="Password 확인">
		                                </div>
	                                  	<div id="checkpw1" style="color:red; font-size:12px;"></div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="userName1" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="addr1" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="tel1" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	<div class="form-group">
	                                    	<input type="text" id="email1" name="email" class="form-control" placeholder="이메일">
	                                  	</div>
	                                  	<div class="form-group">
					 						<input type="file" id="image1" accept="image/png, image/jpeg, image/gif" name="file" id="image1" 
					 						style="width: 100%; margin-top: 35px;"/>
										</div>
                 				
                                  		<button class="btn btn-primary btn-block" id="addUserV" style="margin-top:60px">회원가입</button>
                                  		<button class="btn btn-default btn-block">취소</button>
            
									</form>
                        		</div>
                        		<div class="tab-pane" id="tab_default_2">
		                        	<form id="addCompanyF" method="post" enctype="multipart/form-data">
		                            	<div class="form-group">
		                                	<input type="text" id="addUser22" name="userId" class="form-control" placeholder="User ID">
		                                	<div id="checkIdd" style="color:red; font-size:12px;">아이디를 입력해주세요.</div>
		                                </div>
		                                
                                  		<div class="form-group">
                                      		<input type="password" id="password33" name="password" class="form-control" placeholder="Password">
                                  		</div>
                                  		
	                                  	<div class="form-group">
	                                      	<input type="password" id="password44" name="password2" class="form-control" placeholder="Password 확인">
	                                  	</div>
	                                  	
	                                  	<div id="checkpw2" style="color:red; font-size:12px;"></div>
	                                  	
	                                  	<div class="form-group">
	                                      	<input type="text" id="userName2" name="userName" class="form-control" placeholder="이름">
	                                  	</div>
	                                  	
	                                  	<div class="form-group">
	                                      	<input type="text" id="addr2" name="addr" class="form-control" placeholder="주소">
	                                  	</div>
	                                  	
	                                  	<div class="form-group">
	                                      	<input type="text" id="tel2" name="tel" class="form-control" placeholder="연락처">
	                                  	</div>
	                                  	
	                                  	<div class="form-group">
	                                      	<input type="text" id="email2" name="email" class="form-control" placeholder="이메일">
	                                  	</div>
	                                  	
	                                  	<div class="form-group">
	                                      	<input type="text" id="companyName" name="companyName" class="form-control" placeholder="기업명">
	                                  	</div>
	                                  	
	                                   	<div class="form-group">
	                                      	<input type="text" id="empNum" name="empNum" class="form-control" placeholder="직원수">
	                                  	</div>
                                  
		                                <div class="form-group">
		                                	<input type="text" class="form-control"  id="datepicker" name="pubDate" placeholder="이곳을 클릭하여 설립일을 선택해 주세요"  readonly>
										    <div id="checkDate" style="color:red; font-size:12px;">설립일을 선택하세요</div>
		                               	</div>
		                               	
									 	<div class="form-group">
					 						<input type="file" accept="image/png, image/jpeg, image/gif" name="logoFile" id="image2" 
					 						style="width: 100%; margin-top: 25px;"/>
										</div>
										
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