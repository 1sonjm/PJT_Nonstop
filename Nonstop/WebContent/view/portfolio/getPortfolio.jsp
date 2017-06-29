<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Thumbnail Gallery - Start Bootstrap Template</title>


    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">
    
    <!-- Awesome Font -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <!-- <link href="/resources/css/full.css" rel="stylesheet"> -->

    <!-- jQuery -->
	<script src="/resources/javascript/jquery.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/javascript/bootstrap.min.js"></script>
	
	<!-- 이미지 갤러리 CSS, JS -->
	<link rel="stylesheet" href="/resources/Gallery/css/blueimp-gallery.min.css">
	<script src="/resources/Gallery/js/blueimp-gallery.min.js"></script>
	
    <style>
    .my-pic img { 
      width:100%;	
      /* position: relative; 
      padding-top: 100%;*/
      /* 1:1 : padding-top: 100%; */
      /* 2:1 : padding-top: 50% */
      /* 1:2 : padding-top: 200% */
      /* 4:3 : padding-top: 75% */
      /* 16:9 : padding-top: 56.25% */
   } 
    .media-left .comment-img{
    	margin-top: 2px;
    	margin-bottom: 2px;
    	padding-left: 5px;
    }
    
    .comment-div{    	
    	height: 40px; width: 100%;
    }
    .comment-div h6{
    	margin-top:5px;
    	margin-bottom: 3px;
    	font-weight: 400;
    	font-size: 12px;
    	color: #656c7e;
    }
    .comment-div span{
    	margin-top:5px;
    	font-weight: 400;
    	font-size: 12px;
    	color: #a8a8a8;
    }
    .comment-div p{
    	line-height: 15px !important;
    }
   	.comment-input{
	    border:2px solid #dbdfe4;
	    border-radius: 4px;
	    height: 50px; width: 100%;
	    padding: 5px 10px;
	    color: #7f919e;
    }
    .comment-input h5{
	    font-weight: 500;
    }

    hr.thick-line{
		border-color: #e7e9ee;
		border-width: 2px; 
		margin-top: 5px;
		margin-bottom: 20px;
    }
    /* 버튼 */
    .btn-lg{
       margin-left: 5px;
       padding: 10px, 14px;
       font-size: 16px;
       font-weight: 500;
       background-color: #ececec;
       border: 0;
       border-radius:0;
    }
    
    .preloader {
       background: #ffffff;
       bottom: 0;
       left: 0;
       position: fixed;
       right: 0;
       top: 0;
       z-index: 99999;
   }
   
   /* 로딩되는 쓸데없어보이는 아이인데 */
   .rounder {
       width: 60px;
       height: 60px;
       position: absolute;
       top: 50%;
       left: 50%;
       margin: -26px 0 0 -26px;
       font-size: 10px;
       border-right: 5px solid #333333;
       border-left: 5px solid #1abc9c;
       border-radius: 50%;
       -webkit-animation: spinner 700ms infinite linear;
       animation: spinner 700ms infinite linear;
       z-index: 10000;
   }
   
   /* 미니프로필 */
   .about-fixed {
       position: fixed;
       width: 17%;
   }   
   .my-pic {
       width: 100%;
       height: 0;
	   padding-bottom: 100%;
       box-shadow: -2px -1px 88px 0px rgba(0,0,0,0.17);
       overflow: hidden;
   }
   
   .my-detail {
       text-align: center;
       margin-bottom: 30px;
       background: #ffffff;
       box-shadow: -2px -1px 88px 0px rgba(0,0,0,0.17);
   }
   
   .my-detail .white-spacing {
       padding: 23px 0;
       border-bottom: 1px dashed #cccccc;
   }
   
   .my-detail h1 {
       font-size: 20px;
       font-weight: 700;
   }
   
   .my-detail span {
       color: #c1c1c1;
       font-weight: 400;
       font-size: 16px;
   }

   /* 포트폴리오 상세페이지 메인 */
   #main {
       margin: 50px 0;
   }
   
   .main-color {
       color: #1abc9c;
   }
   
   /* 포트폴리오 상세페이지 메인 page-body (윗부분) */
   .page-body {
       background: #ffffff;
       box-shadow: -2px -1px 88px 0px rgba(0,0,0,0.17);
   }
   
   .sub-title {
       padding: 30px;
   }
   
   .sub-title h2 {
       display: inline-block;
       font-size: 25px;
       letter-spacing: 0.5px;
       font-weight: 600;
   
   }
   
   .sub-title i {
       float: right;
       font-size: 35px;
       margin-top: 15px;
   }
   
   /* 포트폴리오 상세페이지 메인 content-page (내용) */
   .content-page {
       padding-top: 30px;
       padding-bottom: 60px;
       border-top: 1px dashed #dedede;
       border-bottom: 1px dashed #dedede;
   }
   
   /* Blog Post & Single Blog Page */
   div.blog-post {
       /* display: none; 이새키 모야 얘땜에안나와써!!! */
       margin-bottom: 50px;
   }
   
   .blog-post .post-image img {
       width: 100%;
   }
   
   .blog-post .post-image p {
       text-align: center;
       font-size: 14px;
       margin-top: 10px;
   }
   
   .blog-post .post-image a {
       font-weight: 600;
   }
   
   .blog-post .post-title h1 {
       color: #333333;
       font-size: 35px;
       line-height: 45px;
       font-weight: 700;
       margin-top: 24px;
   }
   
   .blog-post .post-title h2 {
       font-size: 25px;
       line-height: 35px;
       font-weight: 600;
       letter-spacing: 0.5px;
   }
   
   .blog-post .post-info {
       font-size: 14px;
       line-height: 30px;
       font-weight: 500;
       padding: 0;
       color: #8c8c8c;
   }
   
   .blog-post p {
       font-size: 14px;
       line-height: 30px;
       color: #696868;
       font-weight: 300;
       letter-spacing: 0.8px;
       font-family: "Poppins", sans-serif;
   }
   .back {
       font-size: 35px;
       color: #d6d6d6;
       position: fixed;
       right: 40px;
       top: 40px;
       z-index: 999;
       transition: all 0.3s ease-in-out;
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
   }
   
   .scroll-to-top:hover,
   .scroll-to-top:focus {
       color: #333333;
   }
   
   @media only screen and (max-width:435px) {
       .scroll-to-top {
          font-size: 25px;
       }
   }
   
   .sidebar-nav ul li {
		list-style: none;
	}
	
	#sidebarnav {
		cursor:pointer;
		padding-left: 0;
	}
	
	#sidebarnav li:hover {
		background: #ebebeb;
	}
	
	.sidebar-nav li>div {
		height: 20px;
		margin-right: 5px;
		display: inline-block;
		text-align: center;
		vertical-align: middle;
		color: #cccccc;
		/*border-radius: 100%; */
	}
	
	.sidebar-nav span>i {
		float: right;
		width: auto;
		font-size: 20px;
		margin-top: 0px;
		color: #cccccc;
	}
	
	.sidebar-nav a>i {
		float: right;
		width: auto;
		font-size: 14px;
		margin-top: 4px;
		margin-right: 18px;
		color: #cccccc;
	}
	
	.sidebar-nav ul li.nav-small {
		font-size: 14px;
		padding: 14px 14px 14px 20px;
		/* color: #90a4ae;
	    font-weight: 500; */
		border-bottom: 1px solid #ebebeb;
	}

    </style>

   <script type="text/javascript">
  
   $(function() {
	   
	   
	   /* Gallery Script */
	   document.getElementById('links').onclick = function (event) {
		    event = event || window.event;
		    var target = event.target || event.srcElement,
		        link = target.src ? target.parentNode : target,
		        options = {index: link, event: event},
		        links = this.getElementsByTagName('a');
		    blueimp.Gallery(links, options);
		};
		
		/* Gallery Script Carousel */
		blueimp.Gallery(
		    document.getElementById('links').getElementsByTagName('a'),
		    {
		        container: '#blueimp-gallery-carousel',
		        carousel: true,
		    }
		);
   });
   /* 댓글 버튼 */
   function fnMove(comment){
        var position = $("#comment").offset();
        $('html, body').animate({scrollTop : position.top}, 800);
   }
    
	/* 댓글 */
   $(function() {
	   /* 댓글 길이 알림 */
	   var maxLength = 200;
       $('textarea').keyup(function() {
         var length = $(this).val().length;
         var length = maxLength-length;
         $('#chars').text(length);
       });
	   
      /* 댓글 박스 클릭시 comment창 보이게 */ 
       $(".comment-input").on("click" , function() {
          $(".comment-input").css("display" , "none"); 
          $(".comment-btn").css("display" , "block");
       }); 
       /*댓글 등록*/
      $("#addComment").on("click" , function() {    	  
    	  $.ajax( 
					{
						url : "/portfolio/addJsonComment",
						method : "POST" ,
						dataType : "json" ,
						context : this,
						data : {
								comContent:$("#comContent").val(),
								comPortNo:$(this).next().val(),
								comUserId:$(this).next().next().val(),
								} , 
						success : function(serverData , status) {
								  location.reload();
						}
				});
      });
      
      /*댓글 삭제*/
      $(".glyphicon-trash").on("click" , function() {
          alert($(this).next().val());
          alert($("#portNo").val());
          $.ajax( 
					{
						url : "/portfolio/deleteComment/"+$(this).next().val()+"/"+$("#portNo").val(),
						method : "GET" ,
						dataType : "json" ,
						context : this,
						headers : {
	                        "Accept" : "application/json",
	                        "Content-Type" : "application/json"   
	                    },
						success : function(data) {
								  location.reload();
						}
	      });          
       }); 
   }); 
	
   /* 스크랩 */
   $(function() {
         /* 스크랩추가+삭제 */
         $("#scrap").on("click" , function() {

        	   var flag = $(this).text().trim();
               var requestTarget;
               var asdf;
               
               if(flag=="스크랩"){
            	  var flag = "addtoscrap";
                  requestTarget = "addJsonPortScrap";
                  asdf = "스크랩 삭제";  
               }else if(flag=="스크랩 삭제"){
            	  var flag = "deletetoscrap";
                  requestTarget = "deleteJsonPortScrap";
                  asdf ="스크랩"
               }else{
                  requestTarget == "deleteJsonPortScrap";
                   asdf ="add to scrap"
               }
               
                var portNo=$("#portNo").val();
                $.ajax(
                   {
                      url : "/profile/"+requestTarget+"/"+portNo,
                      method : "GET",
                      dateType : "json",
                      headers : {
                        "Accept" : "application/json",
                        "Content-Type" : "application/json"   
                    },
                      success : function(data){
                    	  		location.reload();
                      }
                   });
                });
         });
   
   /* 좋아요*/
   $(function() {
	   /* 좋아요 추가 */
       $("#portLike").on("click" , function() {       		
    	   alert("이 게시물을 좋아합니다.");
       		$.ajax( 
					{
						url : "/portfolio/addJsonPortLike",
						method : "POST" ,
						dataType : "json" ,
						context : this,					
						data : {								
								PortNo : $("#portNo").val(),
								UserId : $("#sessionUserId").val(),
								}, 
						success : function(data) {
								  location.reload();
						}
			});     		
       });
       /* 좋아요 삭제*/
       $("#delPortLike").on("click" , function() {
    	   alert("좋아요를 취소합니다.");
      		$.ajax( 
					{
						url : "/portfolio/delJsonPortLike",
						method : "POST" ,
						dataType : "json" ,
						context : this,										 
						data : {								
								PortNo : $("#portNo").val(),
								UserId : $("#sessionUserId").val(),
								portLikeNo : $(this).next().val(),
								}, 								
						success : function(data) {
								  location.reload(); 
						}
			});
       });
   });
   
   /* 팔로우하기, 쪽지보내기, 프로젝트 초대, 채팅하기, 수정, 삭제, 내 프로필 이동 */
   $(function() {
	   /*팔로우*/
	   $("#getFollow").on("click" , function() {       	
		   
		   var targetUserId = $(".white-spacing h1").text();
		   /*팔로우하기*/
		   if($("#follow").text().trim() == "팔로우 하기") {
			   alert($(".white-spacing h1").text()+"에게 팔로우를 신청합니다.");
			   $.ajax( 
						{
							url : "/profile/addJsonFollow/"+targetUserId,
							method : "GET" ,
							dataType : "json" ,
							context : this,					
							headers : {
				                        "Accept" : "application/json",
				                        "Content-Type" : "application/json"   
				                      },
							success : function(data) {
									  location.reload();
							}
				});
		   }
		   /*팔로우취소*/
		   if($("#follow").text().trim() == "팔로우 취소") {
			   alert($(".white-spacing h1").text()+" 팔로우를 취소합니다.");
			   $.ajax( 
						{
							url : "/profile/deleteJsonFollow/"+targetUserId,
							method : "GET" ,
							dataType : "json" ,
							context : this,					
							headers : {
				                        "Accept" : "application/json",
				                        "Content-Type" : "application/json"   
				                      },
							success : function(data) {
									  location.reload();
							}
				});
		   }
       });
	   
      /* 수정 */
      $("#updatePortfolio").on("click", function (e) {
		   alert($("#portNo").val());
		   self.location="/portfolio/updatePortfolio?portNo="+$("#portNo").val(); 
	   });
	  /* 삭제 */ 
	   $("#deletePortfolio").on("click", function (e) {
		   alert($("#portNo").val());
		   self.location="/portfolio/deletePortfolio?portNo="+$("#portNo").val(); 
	   });
	  /* 내 프로필 이동 */
	  $("#getProfile").on("click", function (e) {
		   self.location="/profile/getOtherProfile?userId="+$(".white-spacing h1").text().trim();
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
	    /* 뒤로가기 */
	    $(document).ready(function(){
	    	$(".back").on("click" , function() { 
	    		window.history.back();
	    	});
	    });
	});
   
   </script>
</head>

<body>

<div id="main">
	<div class="container">
		<div class="row">
        
           <!-- Blog Post (Left Body) Start -->
           <div class="col-md-9">
              <div class="col-md-12 page-body">
                 <div class="row">
                     
                 	<div class="sub-title">
                            
                    		<c:if test="${!empty sessionScope.user}">
                           		<c:if test="${sessionScope.user.userId == portfolio.portUserId}">
                           		<button type="button" class="btn btn-info btn-lg" id="updatePortfolio"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&ensp;게시물 수정</button>
                           		<button type="button" class="btn btn-info btn-lg" id="deletePortfolio"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&ensp;게시물 삭제</button>
                           		</c:if>
                           	   
                           		<c:if test="${sessionScope.user.userId != portfolio.portUserId}">
	                           	   <!-- 좋아요버튼 -->
		                           <c:if test="${portfolio.portLikeFlag == false}">
		                           <button type="button" class="btn btn-info btn-lg" id="portLike"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&ensp;좋아요</button>
		                           </c:if>
		                           
		                           <c:if test="${portfolio.portLikeFlag == true}">
		                           <button type="button" class="btn btn-info btn-lg" id="delPortLike"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&ensp;좋아요 취소</button>
		                           <input type="hidden" value="${portfolio.portLikeNo}">
		                           </c:if>
		                           <!-- 댓글버튼 -->
		                           <button type="button" class="btn btn-info btn-lg" onclick="fnMove(comment)"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&ensp;댓글 남기기</button>
		                           
		                           <!-- 스크랩버튼 -->
		                           <c:if test="${portfolio.scrapNo == 0}">
		                           <button type="button" id="scrap" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>&ensp;스크랩</button>
		                           </c:if>
		                           
		                           <c:if test="${portfolio.scrapNo != 0}">
		                           <button type="button" id="scrap" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>&ensp;스크랩 삭제</button>
		                           </c:if>
								</c:if>
							</c:if>       
                        <!-- sub-title End -->   
						</div>
                        
                        <div class="col-md-12 content-page">
                        	<div class="col-md-12 blog-post">
                              
                        		<!-- Post Headline Start -->
                        		<div class="post-title">
                                  <h1>${portfolio.portTitle}</h1> 
                        		</div>
                        		<!-- Post Headline End -->
                                       
                                       
								<!-- Post Detail Start -->
								<div class="post-info">
                                	<span>${portfolio.portMonth} ${portfolio.portDay}, ${portfolio.portYear} / by <a href="#" target="_blank">${portfolio.portUserId}</a></span>
                              	</div>
                              	<!-- Post Detail End -->
                               
                              	<!-- Post Image Start -->
                              	<c:set var="portFile" value="${portfolio.portFile}" />
                              	<c:set var="portFileArray" value="${fn:split(portFile, '.')}" />

                                <div class="post-image margin-top-40 margin-bottom-40">
                                
                                <c:choose>
								<c:when test="${portFileArray[fn:length(portFileArray)-1]=='pdf' || portFileArray[fn:length(portFileArray)-1] == 'odp' || portFileArray[fn:length(portFileArray)-1] == 'odt' || portFileArray[fn:length(portFileArray)-1] == 'ods'}">
									<iframe src = "/resources/ViewerJS/#../../resources/images/upload/${portfolio.portFile}" width="100%" height="100%" allowfullscreen webkitallowfullscreen></iframe>
								</c:when>
								<%--<c:when test="${portFileArray[fn:length(portFileArray)-1] == 'odp'}">
									<iframe src = "/resources/ViewerJS/#../../resources/images/upload/${portfolio.portFile}" width="100%" height="100%" allowfullscreen webkitallowfullscreen></iframe>
								</c:when> --%>
								
								<c:when test="${!empty portfolio.images}">
								
									<%-- <img src="/resources/images/upload/${portfolio.portFile}" alt=""> --%>
								
									<!-- The Gallery as lightbox dialog, should be a child element of the document body -->
									<div id="blueimp-gallery" class="blueimp-gallery">
									    <div class="slides"></div>
									    <h3 class="title"></h3>
									    <a class="prev">‹</a>
									    <a class="next">›</a>
									    <a class="close">×</a>
									    <a class="play-pause"></a>
									    <ol class="indicator"></ol>
									</div>
	                               
	                            	<div id="links" class="col-md-12" style="padding-left: 0; padding-right: 0;">
	                            		<!-- 메인 이미지 -->
	                            		<img src="/resources/images/upload/${portfolio.portFile}" alt="">
	                            		<!-- 모든 이미지 -->
	                            		<ul class="images" style=" list-style: none;margin-left: -40px;margin-top: 20px;">
											
											<c:set var="i" value="0"/>
											<c:forEach var="portImages" items="${portfolio.images}" >
											<c:set var="i" value="${i+1}"/>
											
											<li class="col-sm-1" style="padding-left: 0; padding-right: 7px; width:10%">
												<a href="/resources/images/upload/${portImages.imgName}" title="Banana">
											        <img src="/resources/images/upload/${portImages.imgName}" alt="Banana" style="border-radius:5px; width:100%;">
											    </a>
										    </li>
										    
										    </c:forEach>
										    
									    </ul>
									</div>
								</c:when>
								<c:otherwise>
									<img src="/resources/images/upload/${portfolio.portFile}" alt="">
								</c:otherwise>
								</c:choose>	
                                
                                </div>
                                
                                <!-- Post Image End -->
                               
                              	<!-- 상세설명 -->
                              	<p>${portfolio.portDetail}</p>
                               
                              	<div class="margin-top-50"></div>
                               
                               	<!-- Post Comment (Disqus) Start -->
                                <div id="comment" class="comment">
                                	<h3>Discuss About Post</h3>
                                	<div class="margin-top-20"></div>
                                  	<h6>${portfolio.totalPortComment} Comments</h6>
                                  	<hr class="thick-line">
                                   
                                    <c:if test="${!empty sessionScope.user}">
	                                    <div class="media">
										  <div class="media-left">
										    <a href="#">
										    <c:if test="${sessionScope.user.image !=null}">
										      <img src="/resources/images/upload/${sessionScope.user.image}" width="50px" height="50px" alt="">									      
										    </c:if>
										     <c:if test="${sessionScope.user.image ==null}">
										      <img src="/resources/images/upload/user_img.jpg" width="50px" height="50px" alt="">									      
										    </c:if>
										    </a>
										  </div>
									
								  	      <div class="media-body">
									  		  <input type="text" class="comment-input" placeholder="댓글을 달아 보세염...">
										  	  <div class="comment-btn" style="display:none;">
										  		<div class="well">
									            	<h4><i class="fa fa-paper-plane-o"></i> Leave a Comment:</h4>
								                    <form role="form">
								                    <div class="form-group">
								                       <textarea id="comContent" maxlength="200" style="resize: none; wrap:hard; width:700px; height:120px;"></textarea><br/>
		                            					200 / <span id="chars">200</span> 글자 남았습니다.
								                    </div>
								                      <button type="button" name="comPortContent" value="" class="btn btn-primary" id="addComment">Submit</button>
								                      <input type="hidden" id="portNo" value="${portfolio.portNo}">
								                      <input type="hidden" id="sessionUserId" value="${sessionScope.user.userId}">
								                    </form>
								                 </div>						  	
										  	  </div>
									      </div>
									    </div>
									</c:if>
								    <div class="margin-top-30"></div>								
								
									<!-- ajax로 받은 데이터 들어올 곳 -->						
									<div id="ajaxTarget"></div> 																    
								
									<c:set var="i" value="0"/>
									<c:forEach var="portCommentList" items="${portCommentList}" >
									<c:set var="i" value="${i+1}"/>
									
									<div class="media">
									  <div class="media-left">
									    <a href="#">
									    <c:if test="${portCommentList.comUserImg !=null}">									    
									      <img class="comment-img" src="/resources/images/upload/${portCommentList.comUserImg}" width="45px" height="45px" alt="">
									    </c:if>
									    <c:if test="${portCommentList.comUserImg ==null}">									    
									      <img class="comment-img" src="/resources/images/upload/user_img.jpg" width="45px" height="45px" alt="">
									    </c:if>
									    </a>
									  </div>
									  <div class="media-body">
									  	<div class="comment-div">
									  		<h6><strong>${portCommentList.comUserId}</strong>
									  			&nbsp;&nbsp;•&nbsp;&nbsp;${portCommentList.comRegDate}
									  			<c:set var="sessionUserId" value="${sessionScope.user.userId}"/>
									  			<c:if test="${portCommentList.comUserId eq sessionUserId}">
									  				&nbsp;&nbsp;<span class="glyphicon glyphicon-trash" id="deleteComment" aria-hidden="true"></span>
									  				<input type="hidden" value="${portCommentList.comNo}"/>
									  			</c:if>
									  		</h6>
									  		<p>${portCommentList.comContent}</p>							  		
									  	</div>										  
									  </div>
									</div>
																	
								</c:forEach>
								
                            	</div>
                            	<!-- comment End -->                                     
                       		</div>
               			</div>
               		</div>
           		</div>
           	</div>
            <!-- Blog Post (Right Sidebar) End -->
         
         	<!-- About Me (Right Sidebar) Start -->
         	<div class="col-md-3">
            	<div class="about-fixed">
              
	            	<div class="my-pic">
	              		<img class="userImg" src="/resources/images/upload/${user.image}" alt="">
	           		</div>
          
	              	<div class="my-detail">
	                
	                	<div class="white-spacing">
	                    	<h1>${user.userId}</h1>
	                    	<span>${user.email}</span><br/>
	                    	<%-- <span>${sessionScope.user.addr}</span> --%>
	                 	</div> 
	                 	
	                	<div class="sidebar-nav">
		                	<ul id="sidebarnav">
		                		<c:if test="${!empty sessionScope.user}">
									
									<c:if test="${sessionScope.user.userId == portfolio.portUserId}">
										<li class="nav-small" id="getProfile">
											<div class="icon">
												<span class="fa fa-pie-chart" aria-hidden="true"></span>
											</div> 
											<span class="mineProfile" style="color: #666666;">
												내 프로필로 이동
											</span> 
										</li>
									</c:if>
									
									<c:if test="${sessionScope.user.userId != portfolio.portUserId}">
										<li class="nav-small" id="getProfile">
											<div class="icon">
												<span class="fa fa-pie-chart" aria-hidden="true"></span>
											</div> 
											<span class="mineProfile" style="color: #666666;">
												프로필 보기
											</span> 
										</li>
										<li class="nav-small" id="getFollow">
											<div class="icon">
												<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
											</div> 
											<c:if test="${portfolio.portFollowFlag == true}">
												<span class="followProfile" id="follow" style="color: #666666;">
													팔로우 취소
												</span> 
											</c:if>
											<c:if test="${portfolio.portFollowFlag == false}">
												<span class="followProfile" id="follow" style="color: #666666;">
													팔로우 하기
												</span> 
											</c:if>
										</li>
									</c:if>
									
								</c:if>
							</ul>
	                	</div>
	                 	
	                 	<%-- <div class="margin-top-20">
	                  	<c:if test="${!empty sessionScope.user}">
		                    <c:if test="${sessionScope.user.userId == portfolio.portUserId}">
		                    	<button type="button" class="btn btn-info btn-lg" id="getProfile">내 프로필 보기</button>
		                    </c:if>
		                  	<c:if test="${sessionScope.user.userId != portfolio.portUserId}">
		                  	
		                  		<c:set var="userRole" value="${user.role}"/>
								<c:if test="${userRole eq '2'}">
									<c:if test="${portfolio.portFollowFlag == true}">
										<button type="button" class="btn btn-info btn-lg" id="follow">팔로우 취소</button>
									</c:if>
									<c:if test="${portfolio.portFollowFlag == false}">
										<button type="button" class="btn btn-info btn-lg" id="follow">팔로우하기</button>
									</c:if>
			                    </c:if>
			                    <c:if test="${userRole eq '3'}">
			                     	<button type="button" class="btn btn-info btn-lg" id="toProject">프로젝트 초대</button>
			                    </c:if>
			                  </div>
			                  <div class="margin-top-10">
								<c:if test="${userRole eq '2'}">
			                     	<button type="button" class="btn btn-info btn-lg" id="sendLetter">쪽지 보내기</button>
			                    </c:if>
			                    <c:if test="${userRole eq '3'}">
			                     	<button type="button" class="btn btn-info btn-lg" id="chatting">채팅 문의</button>
			                    </c:if>
			                    
		                  	</c:if>
	                  	</c:if>
	                 	</div>
	                  	<div class="margin-bottom-20">&nbsp;</div>  --%>
					</div>
				</div>
			</div>
	       	<!-- About Me (Right Sidebar) End -->
         
		</div>
	</div>
</div>


<!-- Back to Top Start -->
<!-- <a href="#" class="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a> -->
<a href="#" class="scroll-to-top"><span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span></a>
<!-- Back to Top End -->
<a href="#" class="back"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>    

</body>
</html>