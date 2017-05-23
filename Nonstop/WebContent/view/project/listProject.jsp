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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


	<!-- 筌�占쏙옙占쏙옙占� 占쏙옙占쏙옙 prev/next 甕곤옙占쏙옙 -->
	<script type="text/javascript">
	</script>


</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Start Bootstrap</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Services</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<!-- Second Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container"> <!-- <div class="container"> 獄�占쏙옙占쏙옙占� �⑨옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 / <div class="container-fluid"> ��怨�占싼�占쏙옙 占쏙옙筌ｋ��占쏙옙繹�占쏙�占� 占쏙옙占쎈��占쏙옙占쏙옙 筌ㅿ옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 -->
		
		<div class="margin-top-5">
			<!-- Search-bar -->
			<div class="input-group input-group-sm">
				<!-- 카테고리 선택 -->		
				<div class="input-group-btn">
	   				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">검색 <span class="caret"></span></button>
	       			<ul class="dropdown-menu" role="menu">
						<li><a href="#">제목</a></li>
						<li><a href="#">개발기술</a></li>
						<li><a href="#">기업명</a></li>
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


<div class="container">
	<hr class="margin-top-30"/>
</div>
            
<div class="container">
	<ol class="breadcrumb">
	  <li><a href="#">최신등록순</a></li>
	  <li><a href="#">마감임박순</a></li>
	  <li><a href="#">지원자순</a></li>
	  <li><a href="#">조회순</a></li>
	</ol>			
</div>

    <!-- Page Content -->
    <div class="margin-bottom">
    	<div class="container">   	
        	<div class="row">	
	             <div class="col-md-6 col-sm-6">
	                <div class="thumbnail">
	                	<div class="tit">
							<a href="#" id="projScrap" class="glyphicon glyphicon-star"></a>
								<span class="projectTitle" id="projTitle" data-name="projTitle" value="제목이다이아ㅇㅀㅇㅀ"></span>
							<hr/>
						</div>
						
							<input type="hidden" name="projNo" value="${project.projNo}"/>
						    <div class="w3-quarter w3-container" >
						      <h5>${project.projTitle}</h5>  
						    </div>
						    <div class="w3-quarter w3-container">
						        <h5>w3-quarter</h5>  
						    </div>
						    <div class="w3-quarter w3-container">
						       <h5>w3-quarter</h5>  
						    </div>
						    <div class="w3-quarter w3-container">
						        <h5>w3-quarter</h5>  
						    </div>
						
	                </div>
	            </div>   
	         </div>
	     </div>
	</div>  
	
	<div class="info-middle">
					<ul class="sort-middle-item-wrap">
						<li class="sort-middle-item">
							<span class="tit">프로젝트 공고기간</span>
							<span class="item01" data-pno="viewing" id="projectViewTimeView"><strong class="bg timeNumber"></strong><span class="timeUnit"></span></span>
						</li>
						<li class="sort-middle-item">
							<span class="tit">예상기간</span>
							<span class="item02"><strong class="bg projectInfoData" data-name="during"></strong>일</span>
						</li>
						<li class="sort-middle-item">
							<span class="tit">지원자</span>
							<span class="item03"><strong class="bg projectInfoData" data-name="ALL_APPLY_COUNT"></strong>명</span>
						</li>
						<li class="sort-middle-item">
							<span class="tit">미팅 희망지역</span>											
							<span class="item04"><strong class="bg projectInfoData" data-name="pvNmu"></strong></span>
						</li>
					</ul>
					<div class="info-middle-end">
						<div class="expectation-pay bg">분야 :  <span class="em-brown projectInfoData" data-name="fld1N2"></span></div>
						<div class="expectation-pay bg">예상비용 :  <span class="projectInfoData" data-name="costView"></span></div>
						<table>
							<tr>
								<td valign="top" style="width:80px;"><div class="expectation-pay bg left middle">필요기술 :</div></td>
								<td><div class="sort-type middle" id="projectViewInfoLanguageWrapper"></div></td>
							</tr>
						</table>															
					</div>
				</div>
	
	
	             
		
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


			  
