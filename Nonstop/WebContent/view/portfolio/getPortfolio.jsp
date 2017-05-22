<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    
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
	    padding: 10px 0;
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
                        	좋아요버튼, 추천버튼, 스크랩버튼, 맨 오른쪽 댓글버튼
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
	                            	<span>November 23, 2016 / by <a href="#" target="_blank">Alex Parker</a></span>
	                            </div>
	                            <!-- Post Detail End -->
	                            
	                            <!-- Post Image Start -->
                                <div class="post-image margin-top-40 margin-bottom-40">
                                   <img src="http://placehold.it/800x500" alt="">
                                   <!-- <p>Image source from <a href="#" target="_blank">Link</a></p> -->                                      
                                </div>
                                <!-- Post Image End -->
	                            
	                            <!-- 상세설명 -->
	                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. <b>Cras vel tempus velit</b>, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodales. Sed posuere nisi ipsum, eget dignissim nunc dapibus eget. Aenean elementum <b><a href="javascript:void(0)" data-toggle="popover" data-placement="top" data-content="You can write any text here">Click me</a></b> sollicitudin sapien ut sapien fermentum aliquet mollis. Curabitur ac quam orci sodales quam ut tempor. <b data-toggle="tooltip" data-placement="top" title="You can write any text here.">Hover me</b> suspendisse, gravida in augue in, interdum bibendum dui. Suspendisse sit amet justo sit amet diam fringilla commodo. Praesent ac magna at metus malesuada tincidunt non ac arcu. Nunc gravida eu felis vel elementum. Vestibulum sodales quam ut tempor tempor. Donec sollicitudin sapien ut sapien fermentum, non ultricies nulla gravida.</p>
	                            
	                            
	                            
	                             <!-- Post Comment (Disqus) Start -->
                                  <div id="comment" class="comment">
                                    <h3>Discuss about post</h3>
                                     
                                     
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