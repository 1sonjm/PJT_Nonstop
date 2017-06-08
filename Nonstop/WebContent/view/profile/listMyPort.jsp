<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="../../resources/css/full.css" rel="stylesheet">

<!-- jQuery -->
<script src="../../resources/javascript/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../resources/javascript/bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	$(document).ready(function() {
		$('#Carousel').carousel({
			interval : 5000
		})
	});

	$(function() {

		$(".thumbnail").on("click",function() {
			
					self.location = "/portfolio/getPortfolio?portNo="+ $(this).find('input').val();
				});
	});

</script>
<style>
 .hover__active span {
      background:#ff7f66;
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
       color: #64bb5d;
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
   
   #aaaa , #aaa { 
      position: absolute; 
      top: 0; 
      margin-left: 10; 
      right: 0; 
      bottom: 0; 
      
      height: auto; 
   }
   
   .input-group-btn > .btn-success {      
      background: #ebebeb;
      border-color: #bdbdbd;
   }
   
	blockquote {
	  padding: 0;
	  padding-right: 5%;
	  border-left: 0;
	}
	
	blockquote h6 {
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

	
	<div class="margin-bottom-30">
				<div class="container">
					<div class="row">
	<c:set var="i" value="0" />
	<c:forEach var="portfolio" items="${list3}">
		<c:set var="i" value="${i+1}" />

		<c:if test="${portfolio.portUserId == sessionScope.user.userId }">

			<div class="col-md-3 col-sm-3 hero-feature" style="margin-top: 30px; margin-bottom: 20px;">
				<div class="thumbnail">
					<figure class="effect-sadie">
						<input type="hidden" id="portNo" name="portNo"
							value="${portfolio.portNo}" />

						<div class="thumbnail-portImage">
							<img src="../../resources/images/upload/${portfolio.portFile}" width="400px" height="300px" id="aaaa">
						</div>
						<div class="caption">

							<blockquote>
								<div class="row">
									<div class="col-sm-3 text-center">
									<span>
										<img class="img-circle" id="aaa" src="http://placehold.it/50x50"style="width: 50px; height: 50px;"> 
										</span>
										<input type="hidden" id="portUserId" name="portUserId" value="${portfolio.portUserId}" />
									</div>
									<div class="col-sm-9">
										<h6>${portfolio.portTitle}</h6>
										<small>${portfolio.portUserId}</small>
									</div>
									<figcaption>
										<p class="hover__active">
											<span class="glyphicon glyphicon-search" aria-hidden="false"></span>
											view portfolio<br />
											<c:if test="${portfolio.scrapNo != 0}">
												<button type="button" class="Scrap" portNo="${portfolio.portNo}">delete to scrap</button>
											</c:if>

											<c:if test="${portfolio.scrapNo ==0}">
												<button type="button" class="Scrap" portNo="${portfolio.portNo}">add to scrap</button>
											</c:if>


										</p>
										<p class="text-center">
											<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
											${portfolio.totalPortView} &ensp;&ensp;&ensp;&ensp;&ensp; <span
												class="glyphicon glyphicon-heart" aria-hidden="true"></span>
											${portfolio.totalPortLike} &ensp;&ensp;&ensp;&ensp;&ensp; <span
												class="glyphicon glyphicon-edit" aria-hidden="true"></span>
											${portfolio.totalPortComment}
										</p>
									</figcaption>
								</div>

							</blockquote>

						</div>
					</figure>
				</div>
				</div>
				
		</c:if>

	</c:forEach>

  </div>
     </div>
</div>  
	<!-- pagination -->
	<nav align="center">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>





</body>

</html>
