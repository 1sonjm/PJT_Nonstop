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

    <title>Thumbnail Gallery - Start Bootstrap Template</title>


    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
    
    <style>
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
	    /* width: 20.8%; */
	}	
	.my-pic {
	    width: 100%;
	    box-shadow: -2px -1px 88px 0px rgba(0,0,0,0.17);
	}
	
	.my-pic img {
	    width: 100%;
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
	    line-height: 30px;
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
	    font-size: 16px;
	    line-height: 30px;
	    color: #696868;
	    font-weight: 300;
	    letter-spacing: 0.8px;
	    font-family: "Poppins", sans-serif;
	}
	
	/* Scroll To Top */
	
	.scroll-to-top {
	    /* display: none; */
	    font-size: 40px;
	    color: #1abc9c;
	    position: fixed;
	    right: 20px;
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

    </style>

	<script type="text/javascript">
	(function ($) {
	    'use strict';

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
	    })(jQuery);
	
	$(function() {
	      /* 스크랩추가 */
	      $("#sarap").on("click" , function() {

	            var flag = $(this).text().trim();
	            var requestTarget;
	            var asdf;
	            
	            alert(flag);
	            
	            
	            if(flag=="add to scrap"){
	            	requestTarget = "addJsonPortScrap";
	               asdf = "delete to scrap";  
	               alert(1);
	            }else if(flag=="delete to scrap"){
	            	requestTarget = "deleteJsonPortScrap";
	               asdf ="add to scrap"
	            	   alert(2);
	            }else{
	            	requestTarget == "deleteJsonPortScrap";
	                asdf ="add to scrap"
	                	alert(3);
	            }
	            alert(requestTarget+"컨트롤러 어디로가니");
	            alert(asdf);
	            
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
	                   success : function(JSONData , status){
	                      var displatValue = 
	                      "<button type='button' id='Scrap' portNo='${portfolio.portNo}'>"+asdf+"</button>";
	                      
	                      $(".Scrap").html(displayValue);
	                   }
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
                      		<!-- <a href="index.html" title="Go to Home Page"><h2>Back Home</h2></a>
                        	<a href="#comment" class="smoth-scroll"><i class="icon-bubbles"></i></a> -->         
                        	<button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&ensp;좋아요</button>
                        	<button type="button" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&ensp;댓글 남기기</button>
                        	<c:if test="${portfolio.scrapNo == 0}">
                        	<button type="button" id="scrap" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>&ensp;add to scrap</button>
                        	</c:if>
                        	
                        	<c:if test="${portfolio.scrapNo != 0}">
                        	<button type="button" id="scrap" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>&ensp;delete to scrap</button>
                        	</c:if>
                        </div>
                        
                        <div class="col-md-12 content-page">
                            <div class="col-md-12 blog-post">
                              
                              <!-- 왜 안나오는거야아아아ㅏ워ㅠㅜㅠㅜㅠㅜ -->
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
                                <div class="post-image margin-top-40 margin-bottom-40">
                                   <img src="../../resources/images/upload/${portfolio.portFile}" alt="">
                                   <!-- <p>Image source from <a href="#" target="_blank">Link</a></p> -->                                      
                                </div>
                                <!-- Post Image End -->
	                            
	                            <!-- 상세설명 -->
	                            <p>${portfolio.portDetail}</p>
	                            
	                            <div class="margin-top-50"></div>
	                             <!-- Post Comment (Disqus) Start -->
                                  <div id="comment" class="comment">
                                    <h3>Discuss About Post</h3>
                                     
                                     
                                     <!-- Disqus Code Start  (Please Note: Disqus will not be load on local, You have to upload it on server.)-->
                                     <div id="disqus_thread"></div>
							          <script>
					
					/***  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS. LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables.
							
							var disqus_config = function () {
							this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
							this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
							};
							*/
							
							           (function() { // DON'T EDIT BELOW THIS LINE
							           var d = document, s = d.createElement('script');
							           s.src = '//uipasta.disqus.com/embed.js';   // Please change the url from your own disqus id
							           s.setAttribute('data-timestamp', +new Date());
							           (d.head || d.body).appendChild(s);
							           })();
							          </script>
			  <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
              <!-- Disqus Code End -->
              
                                   </div>
                                   <!-- Post Comment (Disqus) End -->
	
	                            
	                            		
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
			        <img src="http://placehold.it/270x230" alt="">
			     </div>
			 
			      <div class="my-detail">
			    	
				      <div class="white-spacing">
				          <h1>Alex Parker</h1>
				          <span>Web Developer</span>
				      </div> 
			       
				      <div class="row">
				         <input class="btn btn-default" type="button" value="Input">
				      </div>
				      <div class="row">
				         <input class="btn btn-default" type="button" value="Input">
				      </div>
			
			     </div>
			  </div>
			</div>
			<!-- About Me (Right Sidebar) End -->
		
		</div>
	</div>
</div>



<!-- Back to Top Start -->
<!-- <a href="#" class="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a> -->
<a href="#" class="scroll-to-top"><span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></a>
<!-- Back to Top End -->
    
<!-- jQuery -->
<script src="../../resources/javascript/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../resources/javascript/bootstrap.min.js"></script>

</body>
</html>