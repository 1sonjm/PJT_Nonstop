<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>프로젝트 목록보기</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">
    
    <link href="/resources/css/main.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	<!-- jQuery -->
    <script src="/resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/javascript/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


	<style>
	
		table {
        	border-collapse: collapse;
		    border: collapse;
		    width: 100%;
            padding-left : 20px;
            table-layout : fixed;
		}
		
		th, tr {
		    padding: 8px;
		    text-align: left;
		    table-layout:fixed;
		    text-overflow:ellipsis;
		    overflow:hidden;
		}
		
		.breadcrumb{
			margin : 0;
		}
		
	    .thumbnail:hover{
	    	background-color:#ffffe6;
	    	border: 2px solid orange;
	    }
        
        .thumbnail{
        	/* background-color:#fffffa; */
        }
        
        .glyphicon.glyphicon-plus-sign{
        	background-color: rgba( 255, 255, 255, 0.5 );
      		float : right;
      		border : 0;
     	}
     	
     	.glyphicon.glyphicon-star{
        	background-color: rgba( 255, 255, 255, 0.5 );
      		border : 0;
     	}
     	
     	#shape1{
        	margin:0;
        	padding:5px;
        	background-color: #dddddd;
     	}
     	#shape2{
        	margin:0;
        	padding:5px;
        	background-color: #f78a09;
     	}
     	
     	/* scrap button */
     	.fa-star.inbox-started, .fa-star:hover {
          color: #f78a09;
    	}
      
       .fa-star {
          color: #d5d5d5;
        }
        
		#techNameButton{
			padding : 2px;
			heigth : 8px;
			border : 0;
			text-decoration:none;
		}
		
		::selection { color:white; background:blue; }
		::-moz-selection { color:white; background:blue; }
		
		.navbar-static-top .dropdown{
		   margin-top: 9px;
		}
		.navbar-static-top .input-group-sm{
		   margin-top: 15px;
		}
		
		.dropdown-submenu {
  			position: relative;
		}
		
		.dropdown-submenu>.dropdown-menu {
		    top: 0;
		    left: 100%;
		    margin-top: -6px;
		    margin-left: -1px;
		    -webkit-border-radius: 0 6px 6px 6px;
		    -moz-border-radius: 0 6px 6px;
		    border-radius: 0 6px 6px 6px;
		}
		
		.dropdown-submenu:hover>.dropdown-menu {
		    display: block;
		}
		
		.dropdown-submenu>a:after {
		    display: block;
		    content: " ";
		    float: right;
		    width: 0;
		    height: 0;
		    border-color: transparent;
		    border-style: solid;
		    border-width: 5px 0 5px 5px;
		    border-left-color: #ccc;
		    margin-top: 5px;
		    margin-right: -10px;
		}
		
		.dropdown-submenu:hover>a:after {
		    border-left-color: #fff;
		}
		
		.dropdown-submenu.pull-left {
		    float: none;
		}
		
		.dropdown-submenu.pull-left>.dropdown-menu {
		    left: -100%;
		    margin-left: 10px;
		    -webkit-border-radius: 6px 0 6px 6px;
		    -moz-border-radius: 6px 0 6px 6px;
		    border-radius: 6px 0 6px 6px;
		}
		
		
		/* Scroll To Top */
	   .scroll-to-top {
	       display: none;
	       font-size: 35px;
	       position: fixed;
	       right: 40px;
	       bottom: 50px;
	       z-index: 999;
	       transition: all 0.3s ease-in-out;
	       color : #ff6600;
	   }
	   
	   .scroll-to-top:hover,
	   .scroll-to-top:focus {
	       color: #333333;
	   }
		     	
     	
	</style>
	<!-- 筌�占쏙옙占쏙옙占� 占쏙옙占쏙옙 prev/next 甕곤옙占쏙옙 -->
	<script type="text/javascript">
	
	$(function( ) {
		
		$("#division li").on("click" , function() {
        	var prevDiv = $("#postDivision").val();
        	var nextDiv = $(this).text().trim();
        	
        	if(nextDiv == "전체"){
        		nextDiv = 1;  
 			}else if(nextDiv=="WEB"){
 				nextDiv = 2;
        	}else{
 				nextDiv = 3;  
            }
            
            if(prevDiv == 1 || prevDiv == 11 || prevDiv == 12){
            	
            	switch(nextDiv) {
            	case 1:
            		self.location="/project/listProject?postDivision=1";
            		break;
            	case 2:
            		self.location="/project/listProject?postDivision=11";
            		break;
            	case 3:
            		self.location="/project/listProject?postDivision=12";
            		break;
            	}
            	
            }else{
            	switch(nextDiv) {
            	case 1:
            		self.location="/project/listProject?postDivision=2";
            		break;
            	case 2:
            		self.location="/project/listProject?postDivision=21";
            		break;
            	case 3:
            		self.location="/project/listProject?postDivision=22";
            		break;
            	}
            }
        });
        
        //(1:조회순 / 2:최신순 / 3:마감임박순 / 4:지원자순)
        $("#sorting li").on("click" , function() {
        	var postSorting = $(this).text().trim();
        	
        	if(postSorting == "조회순"){
        		postSorting = 1;  
 			}else if(postSorting=="최신순"){
 				postSorting = 2;  
 			}else if(postSorting=="마감임박순"){
 				postSorting = 3;  
 			}else{
 				postSorting = 4;  
            }
        	
        	self.location = "/project/listProject?postDivision="+$("#postDivision").val()+"&postSorting="+postSorting;
        });
        
        /* 검색 카테고리 버튼 나오게 하기 */
        $("#searchCondition-li li").on("click" , function() {
			var displayValue = $(this).text().trim();
        	if(displayValue=="제목"){
        		$("#searchButton").text(displayValue); 
        		$("#searchButton").val(0);
        	}else if(displayValue=="개발지역"){
        		$("#searchButton").text(displayValue);
        		$("#searchButton").val(1);
        	}else{
        		$("#searchButton").val();
        	}
        	$("input:hidden[name=searchCondition]").val($("#searchButton").val());
        });
        
        /* 검색버튼 클릭햇을때*/
        $("#search").on("click", function() {
        	
        	$("#currentPage").val();
        	
        	var searchCondition = $("input:hidden[name=searchCondition]").val();
        	var searchKeyword = $("#searchKeyword").val();
        	var postDivision = $("#postDivision").val(); 
        	var postSorting = $("#postSorting").val();
        	
        	if(searchCondition==""){
        		alert("검색 조건을 먼저 설정해주세요.");
        		return ;
        	}
        	
        	if(postSorting == ""){
        		$("form").attr("method" , "POST").attr("action" , "/project/listProject?postDivision="+postDivision+"&postSorting=1").submit();
        	}else{
        	$("form").attr("method" , "POST").attr("action" , "/project/listProject?postDivision="+postDivision+"&postSorting="+postSorting).submit();
        	}
        	
        });
      /*검색 엔터첬을때    */
        $(function() {
			$( "#searchKeyword" ).keypress( function(e) {
				if(e.keyCode==13){
					$("#currentPage").val();
		        	
		        	var searchCondition = $("input:hidden[name=searchCondition]").val();
		        	var searchKeyword = $("#searchKeyword").val();
		        	var postDivision = $("#postDivision").val(); 
		        	var postSorting = $("#postSorting").val();
		        	
		        	if(searchCondition==""){
		        		alert("검색 조건을 먼저 설정해주세요.");
		        		return false;
		        	}
		        	
		        	if(postSorting == ""){
		        		$("form").attr("method" , "POST").attr("action" , "/project/listProject?postDivision="+postDivision+"&postSorting=1").submit();
		        	}else{
		        	$("form").attr("method" , "POST").attr("action" , "/project/listProject?postDivision="+postDivision+"&postSorting="+postSorting).submit();
		        	}
				}
			});
		});
	});
		
	
		$(document).ready(function() {
		    $('#Carousel').carousel({
		        interval: 5000
		    })
		});
		
		
		$(function() {
			$(".glyphicon.glyphicon-plus-sign").on("click", function(){
				self.location ="/view/project/addProjectView.jsp";
			});
			
		});	
		
		
		$(function () {
			'use strict';
		    /* 스크롤 버튼 */
			//DOM(Document Object Model)이 로드되었을 때 실행되어야 하는 코드
		    jQuery(document).ready(function () {
		
		    	/* Smooth Scroll */		
			    $('a.smoth-scroll').on("click", function (e) {
			        var anchor = $(this);
			        $('html, body').stop().animate({
			            scrollTop: $(anchor.attr('href')).offset().top - 50
			        }, 1000);
			        e.preventDefault();
			    });
				
				/* Scroll To Top */			
			    $(window).scroll(function(){
			    if ($(this).scrollTop() >= 500) {
			        $('.scroll-to-top').fadeIn();
			     } else {
			        $('.scroll-to-top').fadeOut();
			     }
			     });
			
			    $('.scroll-to-top').click(function(){
			      $('html, body').animate({scrollTop : 0},800);
			      return false;
			      });
		    });
		});
		
		
		////상세보기 눌렀을때 : 로그인 안되었을시
		$(function() {
			$(".detailButton").on("click", function(){
				
				if($("#sessionUserId").val() == "" || $("#sessionUserId").val() ==null ){
					
					$("#loginButton").on("click" , function() {
						
						var id=$("input:text[name='userId']").val();
						var pw=$("input:password[name='password']").val();
						
						if(id == null || id.length <1) {
							alert('ID 를 입력하지 않으셨습니다.');
							$("input:text[name='userId']").focus();
							return;
						}
						
						if(pw == null || pw.length <1) {
							alert('패스워드를 입력하지 않으셨습니다.');
							$("input:text[name='userId']").focus();
							return;
						}
						
						$("form").attr("method","POST").attr("action","/user/login").submit();
					});
				}else{
				////상세보기 눌렀을때 : 로그인 되었을시
					self.location ="/project/getProject?projNo="+$(this).attr("value");
				}
			});
		});
		
		
		   $(function() {
	            /* 스크랩추가 */
	            $("i.fa").on("click" , function() {

	                  var flag = $(this).attr('scrap');
	                  var requestTarget;

	                  if(flag==0){
	                     requestTarget = "addJsonProjScrap";
	                  }else{
	                     requestTarget = "deleteJsonProjScrap";
	                  }
	                   var projNo=$(this).attr('projNo');
	                   $.ajax(
	                      {
	                         url : "/profile/"+requestTarget+"/"+projNo,
	                         method : "GET",
	                         dateType : "json",
	                         headers : {
	                            "Accept" : "application/json",
	                           "Content-Type" : "application/json"   
	                       },
	                         context : this,
	                         success : function(JSONData , status){
	                          
	                            if(flag==0){
	                               $(this).removeClass('fa fa-star').addClass('fa fa-star inbox-started');
	                               $(this).attr('scrap','1');
	                            }else{
	                               $(this).removeClass('fa fa-star inbox-started').addClass('fa fa-star');
	                           $(this).attr('scrap','0');
	                            }
	                         }
	                      });
	                   });
	            });

	</script>
	
							
	<!-- ///////////// 카카오 계정 연동 ////////////////// -->
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/> -->
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- ////////////////////////////////////////////////// -->				
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


</head>

<body>

<jsp:include page="/view/common/toolbar.jsp" />
<%-- <c:import url="/user/toolbarMailCheck"/> --%>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container"> 
	<input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
	<input type="hidden" class="projUserId" name="projUserId" id="projUserId" value="${project.projUserId}" />
	<input type="hidden" class="sessionUserId" name="sessionUserId" id="sessionUserId" value="${sessionScope.user.userId}" />
	      
		<ul class="nav navbar-nav">
			<!-- all / web / app 카테고리 분류 -->
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<c:choose>
					<c:when test ="${param.postDivision==1 || param.postDivision==2}">
						<span>전체</span>
					</c:when>
					<c:when test ="${param.postDivision==11 || param.postDivision==21}">
						<span>WEB</span>
					</c:when>
					<c:otherwise>
						<span>APP</span>
					</c:otherwise>
					</c:choose>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" id="division">
					<li val="1"><a href="#">전체</a></li>
					<li val="2"><a href="#">WEB</a></li>
					<li val="3"><a href="#">APP</a></li>
					<!-- hidden Tag -->
					<input type="hidden" id="postDivision" name="postDivision" value="${param.postDivision}"/>
				</ul>
			</li>
			
			<!-- 사용기술 분류 -->
			<!-- <li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<span >사용 기술</span>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">Language</a></li>
	              <li class="dropdown-submenu">
	                <a tabindex="-1" href="#" value="2">Language</a>
	                <ul class="dropdown-menu">
	                  <li><a tabindex="-1" href="#" value="1000">Java</a></li>
	                  <li><a href="#"value="1001">Python</a></li>
	                  <li><a href="#" value="1002">PHP</a></li>
	                  <li><a href="#" value="1003">JavaScript</a></li>
	                  <li><a href="#" value="1004">Swift</a></li>
	                </ul>
	              </li>
	              <li class="dropdown-submenu">
	                <a tabindex="-1" href="#"  value="3">Framework</a>
	                <ul class="dropdown-menu">
	                  <li><a tabindex="-1" href="#">Spring</a></li>
	                  <li><a href="#" value="2000">Django</a></li>
	                  <li><a href="#" value="2001">Symfony</a></li>
	                </ul>
	              </li>
	              <li class="dropdown-submenu">
	                <a tabindex="-1" href="#"  value="4">DBMS</a>
	                <ul class="dropdown-menu">
	                  <li><a tabindex="-1" href="#" value="3000">Oracle</a></li>
	                  <li><a href="#" value="3001">MsSQL</a></li>
	                  <li><a href="#" value="3002">MySQL</a></li>
	                  <li><a href="#" value="3003">SQLite</a></li>
	                </ul>
	              </li>
				</ul>
			</li> -->
			
			<!-- 소팅 분류 -->
			<li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<c:choose>
					<c:when test ="${param.postSorting==1}">
						<span>조회순</span>
					</c:when>
					<c:when test ="${param.postSorting==2}">
						<span>최신순</span>
					</c:when>
					<c:when test ="${param.postSorting==3}">
						<span>마감임박순</span>
					</c:when>
					<c:when test ="${param.postSorting==4}">
						<span>지원자순</span>
					</c:when>
					<c:otherwise>
						<span>조회순</span>
					</c:otherwise>
					</c:choose>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" id="sorting">
					<li><a href="#">조회순</a></li>
					<li><a href="#">최신순</a></li>
					<li><a href="#">마감임박순</a></li>
					<li><a href="#">지원자순</a></li>
					<input type="hidden" id="postSorting" name="postSorting" value="${param.postSorting}"/>
				</ul>
			</li>
		</ul>
		
		<form class="navbar-form navbar-right" role="search" style="float : right;  margin : 0;">
		<div class="input-group input-group-sm">
			<div class="input-group-btn">
				<input type="hidden" id="searchCondition" name="searchCondition" value="${search.searchCondition}"/>
				<button type="button" class="btn btn-success dropdown-toggle" id="searchButton" name="searchButton" 
						data-toggle="dropdown" aria-expanded="false" style="background: #fff; border-color : #bdbdbd" >
	        		검색조건&nbsp;&nbsp;&nbsp;
	        	
	        	<span class="caret"></span></button>
	        	<ul class="dropdown-menu" id="searchCondition-li" role="menu">
	          		<li><a href="#" value="0">제목</a></li>
	          		<li><a href="#" value="1">개발지역</a></li>
	        	</ul>
			</div><!-- /btn-group -->
			<span class="input-group-addon" id="sizing-addon3"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> </span>
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
				   value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
	      	<span class="input-group-btn">
	        	<button class="btn btn-default" id="search" type="button">검색</button>
	        	<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
			</span>
		</div><!-- /input-group -->
		</form>

   </div>
</nav>

<div class="container">
  <div class="row">
	  <div class="margin-top-20">
		  <div class="text">	
		     <h2 class="text" style="font-weight: 600; padding-left : 18px">PROJECT<c:if test="${sessionScope.user.role == 3}"><button type="button" class="glyphicon glyphicon-plus-sign" style="font-size: 35px"/></c:if></h2>
		  </div>
	  </div>
  </div>
</div>


    <!-- Page Content -->
    <div class="margin-bottom-40">
    	<div class="container">   	
        	<div class="row">
        		<c:set var="i" value="0" />
				<c:forEach var="project" items="${list}">
				<c:set var="i" value="${ i+1 }" />
					<div class="col-md-6 col-sm-6 hero-feature" style="margin-top: 30px; margin-bottom: 20px; height: 400px">
						<input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
						<input type="hidden" name="projAnnoStart" id="projAnnoStart" value="${project.projAnnoStart}" /> 
						<input type="hidden" name="projAnnoEnd" id="projAnnoEnd" value="${project.projAnnoEnd}" /> 
						<input type="hidden" name="projStartDate" id="projStartDate" value="${project.projStartDate}" /> 
						<input type="hidden" name="projEndDate" id="projEndDate" value="${project.projEndDate}" />
						<div class="thumbnail">
							<table style="height: 400px; overflow:hidden;">
								<tr style="height: 40px; border-bottom: 1px solid #ddd">
									<th colspan="10" style="font-size: 25px; table-layout: fixed; height: 40px;  white-space:nowrap;">
										<c:if test="${project.scrapNo==0}">
			                               <i class="fa fa-star" projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
			                            <c:if test="${project.scrapNo!=0}">
			                               <i class="fa fa-star inbox-started"  projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
										${project.projTitle}
									</th>
									<th colspan="2" style="text-align: center">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<div class="w3-panel w3-round-large" id="shape1">
												    <font color=black>마감</font>
												</div>
											</c:when>
											<c:when test="${project.projDday>=1}">
												<div class="w3-panel w3-round-large" id="shape2">
													<font color=white>모집중</font>
												</div>
											</c:when>
										</c:choose>
									</th>
								</tr>

								<tr style="height: 10px; font-size: 15px; text-align: center">
									<td colspan="3">공고기간</td>
									<td colspan="3">예상기간</td>
									<td colspan="3">지원자수</td>
									<td colspan="3">개발지역</td>
								</tr>

								<tr style="height: 50px">

									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value="">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<font color=#ff607f>마감</font>
											</c:when>
											<c:when test="${project.projDday==1}">
												<font color=#ff607f>마감 임박</font>
											</c:when>
											<c:when test="${project.projDday>1}">
												<font color=#ff607f>${project.projDday}</font>일 남음
											</c:when>
										</c:choose>
									</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value="">${project.projExpectDate}일</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center">${project.recCount}명</th>
									<th colspan="3" style="text-align: center">${project.projLocation}</th>
								</tr>

								<tr style="height: 10px; border-bottom: 1px solid #ddd">
									<th colspan="12"></th>
								</tr>

								<tr style="height: 20px">
									<th colspan="12">
									<c:choose>
										<c:when test="${project.projDivision==11}">
									  		<span class="glyphicon glyphicon-flash" aria-hidden="true" style="color : orange ; font-size: 14px"></span>개발 분야  : 개발>WEB
									  	</c:when>
										<c:when test="${project.projDivision==12}">
									  		<span class="glyphicon glyphicon-flash" aria-hidden="true" style="color : orange ; font-size: 14px"></span>개발 분야  : 개발>APP
									  	</c:when>
										<c:when test="${project.projDivision==21}">
									  		<span class="glyphicon glyphicon-flash" aria-hidden="true" style="color : orange ; font-size: 14px"></span>개발 분야  : 디자이너>WEB
									  	</c:when>
										<c:when test="${project.projDivision==22}">
									  		<span class="glyphicon glyphicon-flash" aria-hidden="true" style="color : orange ; font-size: 14px"></span>개발 분야  : 디자이너>APP
									  	</c:when>
									</c:choose></th>
								</tr>


								<tr style="height: 20px; border-bottom: 1px solid #ddd;">
									<th colspan="12"><span class="glyphicon glyphicon-flash" aria-hidden="true" style="color : orange ; font-size: 14px"></span>개발 기술 : 
										<c:set var="i" value="0"/>
											<c:forEach var="listTechUse" items="${listTechUse}" >
											<c:set var="i" value="${i+1}"/>
											<c:if test="${listTechUse.tuProjNo== project.projNo}">
												<span class="label label-info" style="color : #000;">${listTechUse.tuTechName}</span>
											</c:if>
										</c:forEach>
									</th>
								</tr>

								<tr style="height: 150px; text-align: top-left;" class="projDetail">
									<td colspan="12">
										<p>
											<strong>상세내용</strong>
										</p> 
									${project.projDetail}
									</td>
								</tr>

								<tr>
									<th colspan="4" ></th>
									<th colspan="4" class="detailButton" value="${project.projNo}">
										<button type="button" class="label label-info" style="font-size : 15px; 
												color : #000; margin : 0; width :100% ; height : 100%" id="modalLogin" 
												data-toggle="modal" data-target="#myModalLogin">상 세 보 기
										</button>
									</th>
									<th colspan="4" ></th>
								</tr>
							</table>
						</div>
					</div>
				</c:forEach>
	            </div>
	         </div>
	      </div>
	      
	<div class="modal fade" id="myModalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content" style="margin-top: 30%; padding-bottom: 0; padding-top: 10px;">
           
              <div class="tab-content">
                 <form id="aaa">
                      <div class="form-group">
                          <input type="text" class="form-control" name="userId" id="userId" placeholder="User ID" >
                      </div>
      
                      <div class="form-group">
                          <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                      </div>
     
                      <button class="btn btn-primary btn-block" id="loginButton">LOGIN</button>
                  
                 	  <div class="text-div"><span>or</span><!-- <br/>Sign in using --></div>
                  
                  
                  	  <div class="form-group">
                  	  	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
							<img src="/resources/images/layout/kakao_account_login_btn_medium_narrow.png" width=100% />
						</a>
					  </div>
					  
					  <div class="form-group" >
					  	<a id="naver_id_login" >
                  	  		<img src="/resources/images/layout/naverLogin.png"/>
                  	  	</a>
					  </div>

                  </form>
              </div>
              
           </div>
        </div>
    </div>
	
	<!-- <a href="#" class="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a> -->
	<a href="#" class="scroll-to-top"><span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span></a>
	
<!-- ///////////////////////네이버///////////////////////////////////// -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- ///////////////////////네이버///////////////////////////////////// -->
	
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,52);
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

