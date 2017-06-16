<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>List_Portfolio</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="/resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/javascript/bootstrap.min.js"></script>
    
	<script type="text/javascript">

	$(document).ready(function() {
		$('#Carousel').carousel({
			interval: 5000
   		})
	});
      
	$(function() {
         
		$(".img-circle").on("click" , function() {
        	alert("께헤헿");
            self.location="/portfolio/addPortfolio";
        }); 
         //포트폴리오 상세보기
         //동적으로 생성된 요소에 이벤트를 걸기위해 on메소드 사용($(document).on( '이벤트', '객체', '동작');)
         //무한스크롤 적용시 스크롤 문제로 iziModal(fullScreen Modal, jquery Plugin)사용 
        $(document).on('click', '.thumbnail', function() {
             self.location="/portfolio/getPortfolio?portNo="+$(this).find('input').val();  
        });
         
        //카테고리 버튼
        $("#division li").on("click" , function() {
        	var prevDiv = $("#postDivision").val();
        	var nextDiv = $(this).text().trim();
        	
        	if(nextDiv == "전체"){
        		nextDiv = 1;  
 			}else if(nextDiv=="WEB + APP"){
 				nextDiv = 2;  
 			}else if(nextDiv=="WEB"){
 				nextDiv = 3;
        	}else{
 				nextDiv = 4;  
            }
            
            if(prevDiv == 1 || prevDiv == 10 || prevDiv == 11 || prevDiv == 12){
            	
            	switch(nextDiv) {
            	case 1:
            		self.location="/portfolio/listPortfolio?postDivision=1";
            		break;
            	case 2:
            		self.location="/portfolio/listPortfolio?postDivision=10";
            		break;
            	case 3:
            		self.location="/portfolio/listPortfolio?postDivision=11";
            		break;
            	case 4:
            		self.location="/portfolio/listPortfolio?postDivision=12";
            		break;
            	}
            	
            }else{
            	switch(nextDiv) {
            	case 1:
            		self.location="/portfolio/listPortfolio?postDivision=2";
            		break;
            	case 2:
            		self.location="/portfolio/listPortfolio?postDivision=20";
            		break;
            	case 3:
            		self.location="/portfolio/listPortfolio?postDivision=21";
            		break;
            	case 4:
            		self.location="/portfolio/listPortfolio?postDivision=22";
            		break;
            	}
            }
        });
        
        //조회순, 추천순, 최신순
        $("#sorting li").on("click" , function() {
         	//alert($(".breadcrumb .active").text().trim());
        	//var text = $(".breadcrumb .active").text().trim();
        	//var activeText = $(this).text() 
        	var postSorting = $(this).text().trim();
        	
        	if(postSorting == "조회순"){
        		postSorting = 1;  
 			}else if(postSorting=="최신순"){
 				postSorting = 2;  
 			}else{
 				postSorting = 3;  
            }
        	
         	//$('.breadcrumb .active').empty().append('<a href="#">'+text+'</a>');
        	//siblings() : 요소의 모든 형제를 포함하는 확장 집합을 반환
        	//$(this).siblings('li').removeClass('active');
        	//$(this).contents().empty();
        	//$(this).addClass("active").text(activeText); 
        	
        	self.location = "/portfolio/listPortfolio?postDivision="+$("#postDivision").val()+"&postSorting="+postSorting;
        });
        
        /* 검색 카테고리 */
        $("#searchCondition-li li").on("click" , function() {
			var displayValue = $(this).text().trim();
        	$("#searchCondition").text(displayValue).append('&nbsp;&nbsp;&nbsp;<span class="caret"></span>'); 
        	$("#searchCondition").val(displayValue);
        });
        
        /* 검색버튼 */
        $("#search").on("click", function() {
        	
        	if($("#searchCondition").prev().text().trim() == "검색조건") {
        		alert("검색 조건을 먼저 설정해주세요.");
        		return false;
        	}
        	
        	var searchCondition = $("#searchCondition").val();
        	var searchKeyword = $("#searchKeyword").val();
        	var postDivision = $("#postDivision").val(); 
        	var postSorting = $("#postSorting").val(); 
			
			$("form").attr("method" , "POST").attr("action" , "/portfolio/listPortfolio").submit();
        	
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
	    /* 포트폴리오 등록 */
    	$(".addPortfolio").on("click" , function() { 
    		if($(".sessionScope").val() == ""){
    			alert("로그인 후 이용해 주세요.");
    			return false;
    		}
    		self.location="/portfolio/addPortfolio";
    	});
	});
	    
	    
	/* 스크랩추가 */
	$(function() {
		//동적으로 생성된 요소에 이벤트를 걸기위해 on메소드 사용($(document).on( '이벤트', '객체', '동작');)
		$(document).on("click", ".Scrap", function() {
				
			var flag = $(this).text().trim();
            var requestTarget;
            var asdf;
                
            if(flag=="add to scrap"){
            	alert("해당 게시물을 스크랩합니다.");
            	requestTarget = "addJsonPortScrap";
            	asdf = "delete to scrap";  
			}else if(flag=="delete to scrap"){
            	alert("스크랩을 삭제합니다.");
            	requestTarget = "deleteJsonPortScrap";
            	asdf ="add to scrap"
			}else{
            	alert("스크랩을 삭제합니다.");
            	requestTarget == "deleteJsonPortScrap";
            	asdf ="add to scrap"
            }
                
            var portNo=$(this).attr('portNo');
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
                    	   
                    	if(flag=="add to scrap"){
                    		$(".Scrap").html("delete to scrap");  
                    	}else{
                            $(".Scrap").html("add to scrap");
                        }
                          
				}//success
			});//ajax
                //이벤드 전파 방지(상위 요소에 이벤트가 전파되는 것을 방지) 1.event.stopPropagation(); 이유 모르겠는데 안먹힘 2. return false;
                return false;
		});
          
		/* 무한스크롤 */
        $(document).ready(function () {
        	$(window).scroll(function() {
	        	var maxHeight = $(document).height();
	        	var currentScroll = $(window).scrollTop() + $(window).height();
	
	        	if (maxHeight <= currentScroll) {
		        	$.ajax( 
		  				{
		  					url : "/portfolio/listJsonPortfolio",
		  					method : "POST" ,
		  					dataType : "json" ,
		  					context : this,					
		  					data : {								
		  						postDivision: $("#postDivision").val(),
		  						endRowNum : $(".scrolling:last").attr("endRowNum"),
		  					}, 
		  					success : function(data) {
								//넘어오는 데이터가 json타입이 아니면 파싱을 못함 > 컨트롤러 수정 @ResponseBody
		  						var displayValue = "";
		  						if(data != "") {
		  							$(data).each(function(index){
		  										
			  							if(index%4==0) {
			  								//if문 사용시 변수를 if문 안에서 찍어줘야 한다. 기본!
									    	displayValue +='<div class="margin-bottom-30">'
						  						+'<div class="container">'    
						  						+'<div class="row">';  
									  	}  
			  											  
			  							displayValue += '<div class="col-md-3 col-sm-6">'
						                	+'<div class="thumbnail">'
						                    +'<figure class="effect-sadie">'
						                    +'<input type="hidden" id="portNo" name="portNo" value="'+this.portNo+'"/>'
						                                      
						                    +'<div class="thumbnail-portImage">'
						                    +'<img src="/resources/images/upload/'+this.portFile+'" width="400px" height="300px" alt="">'                       
						                	+'</div>'   
						              		+'<div class="caption">'
						                           
						            		+'<blockquote>'
						          			+'<div class="row">'
						        			+'<div class="col-sm-3 text-center">'
						      				+'<img class="img-circle" src="/resources/images/upload/'+this.portUserImg+'" id="listUserImg" width="50px" height="50px" style="height:50px">'
						    				+'<input type="hidden" id="portUserId" name="portUserId" value="'+this.portUserId+'"/>' 
						  					+'</div>'
											+'<div class="col-sm-9">'
											+'<h5>'+this.portTitle+'</h5>'
											+'<h6 style="color:gray; margin-top:5px; font-weight:400">'+this.portUserId+'</h6>'
											+'</div>'
											+'<figcaption>'          
											+'<p class="hover__active">'
											+'<span class="glyphicon glyphicon-search" aria-hidden="false"></span>'
											+'view portfolio<br/>';
															
										if($(".sessionScope").val() != '') {
								        	if(this.scrapNo != 0){
								            	displayValue += '<button type="button" class="Scrap" portNo="${portfolio.portNo}">delete to scrap</button>';
								        	}else {
								            	displayValue += '<button type="button" class="Scrap" portNo="'+this.portNo+'">add to scrap</button>';
								        	}	 
										}
							            displayValue +='</p>'
											+'<p class="text-center">'                            
											+'<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> '+this.totalPortView+' &ensp;&ensp;&ensp;&ensp;&ensp;'
											+'<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> '+this.totalPortLike+' &ensp;&ensp;&ensp;&ensp;&ensp;'
											+'<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>'+this.totalPortComment+'</p>'
											+'</figcaption>'
											+'</div>'
											+'</blockquote>'                                        
											+'<input type="hidden" class="scrolling" endRowNum="'+this.endRowNum+'">'
											+'</div>'
											+'</figure>'
											+'</div>'
											+'</div>';
										         
				  						if(index%4==3) {
				  							displayValue +='</div></div></div>' ;
				  						} 
		  										  
		  										
		  							});//each
		  								  	
		  							//body태그 끝부분에 displayValue를 추가한다. .after()는 태그 후단에 추가시키기 때문에 문제발생 .append()는 태그 사이에 삽입됨  
		  							$("body").append(displayValue);  
		  							//무한스크롤 무한루프 방지. 맨 아래에서 1800만큼 윗부분에 스크롤을 위치시킨다.
		  							$("body").scrollTop($(document).height()-1800);  
		  									
		  						}else{
		  							alert("마지막 포트폴리오 입니다.");
		  						}//if문
							}//success end
					});//ajax end   
				}
			})
		});//무한스크롤 end
	});
   </script>
   <style>

	/* 등록 */   
   .addPortfolio {
       font-size: 35px;
       color: #d6d6d6;
       position: fixed;
       right: 40px;
       top: 58.5px;
       z-index: 1010;
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
   
   /* listportfolio 상단 서브네비바 */
   .navbar-static-top .dropdown{
	margin-top: 9px;
	}
	.navbar-static-top .input-group-sm{
	margin-top: 15px;
	}
   
   /* 스크랩버튼 */
   .hover__active span {
      background:#ff6600;
      width:48px;
      height:48px;
      border-radius:50%;
      text-align:center;
      vertical-align:middle;
      padding-top:17px;
      display:block;
      left:0;
      right:0;
      margin:0 auto;
      margin-bottom:10px;
   }
   
   .hover__active button {
       display: inline-block;
       margin: 5px;
       padding: 6px 14px;
       text-transform:uppercase;
       font-size: 12px;
       font-weight: 200;
         line-height: 1.5;
       border-radius: 0;
        color: #fff;
       background-color: #2c2a2b;
        text-align: center;
        font-weight: 400;
        border: 0;
/*       border-color: white; */
       -webkit-transition: background 0.2s, color 0.2s;
       -moz-transition: background 0.2s, color 0.2s;
       transition: background 0.2s, color 0.2s;
   }
   
   .hover__active button:hover {
      background: rgba(255, 255, 255, 1);
       color: #ff6600;
   }
   
   .hover__active button:hover:before {
      -webkit-animation: spinAround 2s linear infinite;
       -moz-animation: spinAround 2s linear infinite;
       animation: spinAround 2s linear infinite;
   }
   
   .hover__active {
      color:#fff;
      text-transform:uppercase;
      font-size:12px;
      text-align:center;
      left:0;
      right:0   ;
      margin-bottom:80px;
   }
   /* 스크랩버튼 끝 */

   /* hover 효과 */
   
   figure.effect-sadie figcaption::before {
      position: absolute;
   
      bottom: 20px;
      left: 15px;
      width: 90%;
      height: 90%;
      background: -webkit-linear-gradient(top, rgba(72,76,97,0) 0%, rgba(72,76,97,0.8) 75%);
      background: linear-gradient(to bottom, rgba(72,76,97,0) 0%, rgba(72,76,97,0.8) 75%);
      content: '';
      opacity: 0;
      -webkit-transform: translate3d(0,50%,0);
      transform: translate3d(0,50%,0);
   }

   figure.effect-sadie figcaption::before,
   figure.effect-sadie p {
      -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
      transition: opacity 0.35s, transform 0.35s;
   }
   
   figure.effect-sadie p {
      color: white;
      position: absolute;
      bottom: 0;
      left: 0;
      padding: 2em;
      width: 100%;
      opacity: 0;
      -webkit-transform: translate3d(0,10px,0);
      transform: translate3d(0,10px,0);
   }
   
   figure.effect-sadie:hover figcaption::before ,
   figure.effect-sadie:hover p {
      opacity: 1;
      -webkit-transform: translate3d(0,0,0);
      transform: translate3d(0,0,0);
   }
   
      
   /* 여기까지 */
   
   .thumbnail-portImage { 
      position: relative; 
      padding-top: 75%; /* 4:3 ratio */ 
      /* 1:1 : padding-top: 100%; */
      /* 2:1 : padding-top: 50% */
      /* 1:2 : padding-top: 200% */
      /* 4:3 : padding-top: 75% */
      /* 16:9 : padding-top: 56.25% */

      overflow: hidden; 
   } 
   
   img { 
      position: absolute; 
      top: 0; 
      left: 0; 
      right: 0; 
      bottom: 0; 
      max-width: 100%; 
      height: auto; 
   }
   
   .input-group-btn > .btn-success {      
      background: #ebebeb;
      border-color: #bdbdbd;
   }
   
   #listUserImg {
   	  margin-top: 12%;
   	  margin-left: 25%;
   	  margin-right: 25%;
   }

	blockquote {
	  padding: 0;
	  padding-right: 5%;
	  border-left: 0;
	}
	
	blockquote h5 {
	  margin-top: 10%;
	  margin-bottom: 3px;
	  overflow: hidden; 
	  text-overflow: ellipsis;
	  white-space: nowrap; 
	  width: 100%;
	}
   </style>

</head>

<body>
<!-- Navigation -->
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/view/common/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<!-- Second Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container"> <!-- <div class="container"> / <div class="container-fluid"> -->
      
		<ul class="nav navbar-nav">
			<!-- all / web / app 카테고리 분류 -->
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<c:choose>
					<c:when test ="${param.postDivision==1 || param.postDivision==2}">
						<span>전체</span>
					</c:when>
					<c:when test ="${param.postDivision==10 || param.postDivision==20}">
						<span>WEB + APP</span>
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
					<li val="2"><a href="#">WEB + APP</a></li>
					<li val="3"><a href="#">WEB</a></li>
					<li val="4"><a href="#">APP</a></li>
					<!-- hidden Tag -->
					<input type="hidden" id="postDivision" name="postDivision" value="${param.postDivision}"/>
				</ul>
			</li>
			
			<!-- 사용기술 분류 -->
			<li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<span >사용 기술</span>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">Language</a></li>
					<li><a href="#">Framework</a></li>
					<li class="divider"></li>
					<li><a href="#">etc...</a></li>
				</ul>
			</li>
			
			<!-- 소팅 분류 -->
			<li class="dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
				<input type="hidden" id="postSorting" name="postSorting" val="${param.postSorting}"/>
					<c:choose>
					<c:when test ="${param.postSorting==1}">
						<span>조회순</span>
					</c:when>
					<c:when test ="${param.postSorting==2}">
						<span>최신순</span>
					</c:when>
					<c:when test ="${param.postSorting==3}">
						<span>추천순</span>
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
					<li><a href="#">추천순</a></li>
				</ul>
			</li>
		</ul>
		
		<form class="navbar-form navbar-right" role="search">
		<div class="input-group input-group-sm">
			<div class="input-group-btn">
				<button type="button" class="btn btn-success dropdown-toggle" id="searchCondition" name="searchCondition" data-toggle="dropdown" aria-expanded="false" style="background: #fff">
	        		검색조건&nbsp;&nbsp;&nbsp;<span class="caret"></span></button>
	        	<ul class="dropdown-menu" id="searchCondition-li" role="menu">
	          		<li><a href="#">제목</a></li>
	          		<li><a href="#">작성자</a></li>
	        	</ul>
			</div><!-- /btn-group -->
			<span class="input-group-addon" id="sizing-addon3"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> </span>
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" aria-label="...">
	      	<span class="input-group-btn">
	        	<button class="btn btn-default" id="search" type="button">검색</button>
			</span>
		</div><!-- /input-group -->
		</form>

   </div>
</nav>

<!-- Ranking type-->
<div class="container"> 
	<div class="margin-top-50" style="margin-left:1.2%">
  		<h5 class="text-left" style="color:gray; font-weight:400">| 
  		<c:choose>
			<c:when test ="${param.postDivision==1 || param.postDivision==10 || param.postDivision==11 || param.postDivision==12}">
			개발자
			</c:when>
			<c:otherwise>
			디자이너 
			</c:otherwise>
		</c:choose>
  		포트폴리오 이번달 랭킹</h5>
   		<h3 class="text-left" style="margin-bottom:0; margin-top:-5px">
		<c:choose>
			<c:when test ="${param.postDivision==1 || param.postDivision==10 || param.postDivision==11 || param.postDivision==12}">
			DEVELOPER&nbsp; 
			</c:when>
			<c:otherwise>
			DESIGNER&nbsp;
			</c:otherwise>
		</c:choose>
		PORTFOLIO RANKING</h3>
   	</div>	
	<div class="margin-bottom-30"></div>
</div>  

<!-- Ranking contents -->
<div class="container">
    <div class="row">
      <div class="col-md-12">
           <div id="Carousel" class="carousel slide">
               
               <ol class="carousel-indicators">
                   <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                   <li data-target="#Carousel" data-slide-to="1"></li>
                   <li data-target="#Carousel" data-slide-to="2"></li>
               </ol>
                
               <!-- Carousel items -->
               <div class="carousel-inner">
                     
				<c:set var="i" value="0"/>
				<c:forEach var="ranking" items="${ranking}" >
				<c:set var="i" value="${i+1}"/>
				
				<c:if test="${i==1}">
				<div class="item active">
					<div class="row">
				</c:if>    
				
				<c:if test="${i%4==1 && i>1}">
				<div class="item">
					<div class="row">
				</c:if>    
	         
		           <div class="col-md-3 col-sm-6">
		                <div class="thumbnail">
		                   <figure class="effect-sadie">
		                   <input type="hidden" id="portNo" name="portNo" value="${ranking.portNo}"/>
		                                      
		                      <div class="thumbnail-portImage">
		                      	<c:set var="portFile" value="${ranking.portFile}" />
		                      	<c:set var="portFileArray" value="${fn:split(portFile, '.')}" />
		                      	<c:choose>
									<c:when test="${portFileArray[fn:length(portFileArray)-1]=='pdf'}">
										<img src = "/resources/images/layout/pdf_img.jpg" width="400px" height="300px" alt="">
									</c:when>
									<c:when test="${portFileArray[fn:length(portFileArray)-1]=='odp'}">
										<img src = "/resources/images/layout/ppt_img.jpg" width="400px" height="300px" alt="">
									</c:when>
									<c:otherwise>
										<img src="/resources/images/upload/${ranking.portFile}" width="400px" height="300px" alt="">
									</c:otherwise>
								</c:choose>                      
		                       </div>   
		                       <div class="caption">
		                           
		                           <blockquote>
		                          <div class="row">
		                            <div class="col-sm-3 text-center">
		                              <img class="img-circle" src="/resources/images/upload/${ranking.portUserImg}" id="listUserImg" width="50px" height="50px" style="height:50px">
		                              <input type="hidden" id="portUserId" name="portUserId" value="${ranking.portUserId}"/>                         
		                            </div>
		                            <div class="col-sm-9">
		                              <h5>${ranking.portTitle}</h5>
		                              <h6 style="color:gray; margin-top:5px; font-weight:400">${ranking.portUserId}</h6>
		                            </div>
		                            <figcaption>          
		                               <p class="hover__active">
		                                   <span class="glyphicon glyphicon-search" aria-hidden="false"></span>
		                                   view portfolio<br/>

											<!-- 스크랩버튼 -->
		                                   <c:if test="${ranking.scrapNo != 0}">
		                                   <button type="button" class="Scrap" portNo="${ranking.portNo}">delete to scrap</button>
		                                   </c:if>
		                                   
		                                   <c:if test="${ranking.scrapNo == 0 && !empty sessionScope.user}">
		                                   <button type="button" class="Scrap" portNo="${ranking.portNo}">add to scrap</button>
		                                   </c:if>
		                                   
		                                   <c:if test="${empty sessionScope.user}">
		                                   <input type="hidden" class="sessionScope" value="${sessionScope.user}">
		                                   </c:if>
		                                                                   
		                                 </p>
			                           <p class="text-center">                            
			                              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ${ranking.totalPortView} &ensp;&ensp;&ensp;&ensp;&ensp;
			                              <span class="glyphicon glyphicon-heart" aria-hidden="true"></span> ${ranking.totalPortLike} &ensp;&ensp;&ensp;&ensp;&ensp;
			                              <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> ${ranking.totalPortComment}
			                           </p> 
		                        	</figcaption>
		                          </div>
		                        </blockquote>                                        
		                                 
		                       </div>
		                    </figure>
		                </div>
		            </div>   
	         
		   	 <c:if test="${i%4==0}">        
		         </div>
		     </div>  
		   	 </c:if>
		   
			 </c:forEach>
           
          </div><!--.Carousel-->
      </div>
      <a data-slide="prev" href="#Carousel" class="left carousel-control"><span class="glyphicon glyphicon-menu-left" aria-hidden="true" style="color:rgb(189, 189, 189); font-size:40px"></span></a>
   	  <a data-slide="next" href="#Carousel" class="right carousel-control"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="color:rgb(189, 189, 189); font-size:40px"></span></a>
   </div>
</div>
        

<div class="margin-top-70"></div>

<!-- Page Content -->
<c:set var="i" value="0"/>
<c:forEach var="portfolio" items="${list}" end="15" >
<c:set var="i" value="${i+1}"/>


<c:if test="${i%4==1}">
<div class="margin-bottom-30">
	<div class="container">    
		<div class="row">   
</c:if>      

			<div class="col-md-3 col-sm-6">
            	<div class="thumbnail">
                	<figure class="effect-sadie">
                	<input type="hidden" id="portNo" name="portNo" value="${portfolio.portNo}"/>
                                      
                    <div class="thumbnail-portImage">
                    	<c:set var="portFile" value="${portfolio.portFile}" />
		                <c:set var="portFileArray" value="${fn:split(portFile, '.')}" />
                    	<c:choose>
							<c:when test="${portFileArray[fn:length(portFileArray)-1]=='pdf'}">
								<img src = "/resources/images/layout/pdf_img.jpg" width="400px" height="300px" alt="">
							</c:when>
							<c:when test="${portFileArray[fn:length(portFileArray)-1]=='odp'}">
								<img src = "/resources/images/layout/ppt_img.jpg" width="400px" height="300px" alt="">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/upload/${portfolio.portFile}" width="400px" height="300px" alt="">
							</c:otherwise>
						</c:choose>
                    </div>   
                    	<div class="caption">
                           
                    	<blockquote>
                        	<div class="row">
                        		<div class="col-sm-3 text-center">
                            		<img class="img-circle" src="/resources/images/upload/${portfolio.portUserImg}" id="listUserImg" width="50px" height="50px" style="height:50px">
                            		<input type="hidden" id="portUserId" name="portUserId" value="${portfolio.portUserId}"/> 
                            	</div>
                            <div class="col-sm-9">
                            	<h5>${portfolio.portTitle}</h5>
                            	<h6 style="color:gray; margin-top:5px; font-weight:400">${portfolio.portUserId}</h6>
                            </div>
                            <figcaption>          
                            	<p class="hover__active">
                                	<span class="glyphicon glyphicon-search" aria-hidden="false"></span>
                                	view portfolio<br/>
                                   	<!-- 스크랩버튼 -->
                                   	<c:if test="${portfolio.scrapNo != 0}">
                                   		<button type="button" class="Scrap" portNo="${portfolio.portNo}">delete to scrap</button>
                                   	</c:if>
                                   
                                   	<c:if test="${portfolio.scrapNo == 0 && !empty sessionScope.user}">
                                   		<button type="button" class="Scrap" portNo="${portfolio.portNo}">add to scrap</button>
                                   	</c:if>
                                   
                                   	<c:if test="${empty sessionScope.user}">
                                   	</c:if>
                                                                   
								</p>
	                           	<p class="text-center">                            
	                            	<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> ${portfolio.totalPortView} &ensp;&ensp;&ensp;&ensp;&ensp;
	                            	<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> ${portfolio.totalPortLike} &ensp;&ensp;&ensp;&ensp;&ensp;
	                              	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> ${portfolio.totalPortComment}
	                           </p> 
							</figcaption>
							</div>
                        </blockquote>                                        
                        <input type="hidden" class="scrolling" endRowNum="${portfolio.endRowNum}">
					</div>
                    </figure>
				</div>
			</div>   
         
<c:if test="${i%4==0}">        
         </div>
     </div>
</div>  
</c:if>
   
</c:forEach>


<!-- Back to Top Start -->
<!-- <a href="#" class="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a> -->
<a href="#" class="scroll-to-top"><span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span></a>
<!-- Back to Top End -->
<a href="#" class="addPortfolio"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>  

</body>

</html>