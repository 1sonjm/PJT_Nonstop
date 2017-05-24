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

    <title>List_Portfolio</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


	<!-- 筌�占쏙옙占쏙옙占� 占쏙옙占쏙옙 prev/next 甕곤옙占쏙옙 -->
	<script type="text/javascript">
		$(document).ready(function() {
		  $('#media').carousel({
		    pause: true,
		    interval: false,
		  });
		});
	</script>
	<style>
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
	</style>

</head>

<body>

<!-- Navigation -->
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/view/common/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<!-- Second Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container"> <!-- <div class="container"> 獄�占쏙옙占쏙옙占� �⑨옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 / <div class="container-fluid"> ��怨�占싼�占쏙옙 占쏙옙筌ｋ��占쏙옙繹�占쏙�占� 占쏙옙占쎈��占쏙옙占쏙옙 筌ㅿ옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 -->
		
		<div class="margin-top-5">
			<!-- Search-bar -->
			<div class="input-group input-group-sm">
				<!-- 카테고리 선택 -->		
				<div class="input-group-btn">
	   				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Actionsadsdff <span class="caret"></span></button>
	       			<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
			       </ul>
				</div>
				<!-- 돋보기모양 -->
				<span class="input-group-addon"> 		            
					<span class="glyphicon glyphicon-search"></span>
				</span>
				<input type="text" class="form-control" aria-label="...">
				<!-- 검색버튼 -->
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">검색</button>
				</span>			
			</div>	
		</div>
		
		<!-- ALL/WEB/APP 甕곤옙占쏙옙 -->
		<div class="row">	
			<div class="col-md-6 col-md-offset-3" align="center">
	        	<button class="button button-neutral" type="button">All</button>
	        	<button class="button button-neutral" type="button">Web</button>
	        	<button class="button button-neutral" type="button">App</button>
			</div>

			<!-- 占쏙옙占쏙옙 / 占쏙옙 占쏙옙占싼�占쏙옙 占쏙옙占쏙옙占쏙옙椰���占� 占쏙옙 占쏙옙 占쏙옙占쏙옙 
			<div class="col-md-3 col-md-offset-9" align="right">
				<ol class="breadcrumb">
				  <li class="active">筌ㅿ옙占쏙옙占쏙옙</li>
				  <li><a href="#">�곤옙筌ｏ옙占쏙옙</a></li>
				  <li><a href="#">鈺곌�占쏙옙占쏙옙</a></li>
				</ol>
			</div> -->
		</div>
		
	</div>
</nav>

<!-- Ranking -->
<!-- type -->
<div class="container">
  
  <div class="margin-top-70">
  <div class="margin-bottom-10">
	  <div class="text-center">	
		<span class="glyphicon glyphicon-tower" aria-hidden="true"></span>	  
	    <h3 class="text-center">portfolio-ranking</h3>
	    <p class="text-center">2017.05.10 - 2017.08.10 랭킹 순위</p>
	  </div>
  </div>
  </div>
  
  <!-- Ranking contents -->
  <div class='row'>
    <div class='col-md-12'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          <div class="item  active">
          	
            <div class="row">
              	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>포트폴리오타이틀</h5>
	                        <p>유저아이디</p>               
	                    </div>
	                </div>
            	</div>          
                <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>               
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>   
            </div>
          </div>
          
          <div class="item">
            <div class="row">
              <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>          
                <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>               
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>          
            </div>
          </div>
          
          <div class="item">
            <div class="row">
              <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>               
	                    </div>
	                </div>
            	</div>          
                <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>             
	                    </div>
	                </div>
            	</div>
            	<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/400x300" alt="">
	                    <div class="caption">
	                        <h5>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</h5>
	                        <p>占싼�占쎈�占쎈����占쏙옙 占쏙옙占쎈��占쏙옙</p>              
	                    </div>
	                </div>
            	</div>        
            </div>
          </div>
        </div>
        
        <!-- prev/next icon -->
        <a data-slide="prev" href="#media" class="left carousel-control">占쏙옙
        	<!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> - 占쏙옙占쎈��占쏙옙�곤옙 占쏙�由� -->
        </a>
        <a data-slide="next" href="#media" class="right carousel-control">占쏙옙</a>
        
      </div>
      
      <!-- 占쏙옙占쏙옙 占썬�삼옙野�占쏙옙��占쏙옙 --> 
      <div class="dot_pagination">
		<div data-tooltip="Tooltip 1" class="pagination__dot pagination__dot--active"></div>
		<div data-tooltip="Tooltip 2" class="pagination__dot"></div>
		<div data-tooltip="Tooltip 3" class="pagination__dot"></div>
	  </div>                         
    
    </div>
  </div>
</div>

<div class="container">
	<hr class="margin-top-30"/>
</div>
            
<div class="container">
	<ol class="breadcrumb">
	  <li class="active">조회순</li>
	  <li><a href="#">추천순</a></li>
	  <li><a href="#">최신순</a></li>
	</ol>			
</div>


    <!-- Page Content -->
    <c:set var="i" value="0"/>
	<c:forEach var="portfolio" items="${list}" >
	<c:set var="i" value="${i+1}"/>
	
	<c:if test="${i%4==1}">
    <div class="margin-bottom-30">
    	<div class="container">   	
        	<div class="row">	
	</c:if>		
	
	            <div class="col-md-3 col-sm-6">
	                <div class="thumbnail">
	                	<div class="thumbnail-portImage">
	                    	<img src="../../resources/images/upload/${portfolio.portFile}" width="400px" height="300px" alt="">
	                    </div>	
	                    <div class="caption">
	                        <div class="media">
							  <div class="media-left">
						    	  <img class="media-object" src="http://placehold.it/50x50" alt="">
							  </div>
							  <div class="media-body">
							    <h5 class="media-heading">${portfolio.portTitle}</h5>
							    <p>${portfolio.portUserId}</p>
							  </div>							
							</div> 	         
	                    </div>
	                </div>
	            </div>   
	         
    <c:if test="${i%4==0}">        
	         </div>
	     </div>
	</div>  
	</c:if>
	
</c:forEach>


	<!-- pagination -->
       <nav align="center">
	  <ul class="pagination">
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>

    

    <!-- jQuery -->
    <script src="../../resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/javascript/bootstrap.min.js"></script>

</body>

</html>
