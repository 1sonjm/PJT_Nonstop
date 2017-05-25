<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - FREE Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
      <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {listCareer
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 	$("#addCareer").on("click" , function() {
 		self.location = "/profile/addCareerView";
	}); 
	
$("#listCareer").on("click" , function() {
		self.location = "/profile/getCareerList?careerUserId=user05";
}); 
 });

</script>


	<style>
	/*sidebar navigation*/

	#sidebar {
	    width: 270px;
	    height: 100%;
	    position: fixed;
	    background: #424a5d;
	}
	
	#sidebar h5 {
		color: #f2f2f2;
		font-weight: 700;
	}
	
	
	ul.sidebar-menu {
	    margin-top: 75px;
	}
	
	/* MAIN CONTENT CONFIGURATION */
	#main-content {
	    margin-left: 270px;
	}
	
	.header, .footer {
	    min-height: 60px;
	    padding: 0 15px;
	}
	
	.header {
	    position: fixed;
	    left: 0;
	    right: 0;
	    z-index: 1002;
	}
	
	.black-bg {
	    background: #ffd777;
	    border-bottom: 1px solid #c9aa5f;
	}
	
	.wrapper {
	    display: inline-block;
	    margin-top: 60px;
	    padding-left: 15px;
	    padding-right: 15px;
	    padding-bottom: 15px;
	    padding-top: 0px;
	    width: 100%;
	}
		
	
	</style>

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
 
  <section id="container" >    
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
        
          <div id="sidebar"  class="nav-collapse ">

        <!-- sidebar menu start-->
              <ul class="sidebar-menu">
              
              	  <p class="center"><a href="profile.html"><img src="http://placehold.it/500x500" class="img-circle" width="60"></a></p>
              	  <h5 class="center">Marcel Newman</h5>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

             <div class="container">
				<div class="row">
					<div>
				
					  <!-- Nav tabs -->
					  <ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
					    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
					    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
					    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
					  </ul>
			
					  <!-- Tab panes -->
					  <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="home">
					   
					    <jsp:include page="/view/profile/listCareer.jsp" /> 					    
					  					  
					    </div>
					    <div role="tabpanel" class="tab-pane" id="profile">
							<%-- <jsp:include page="/portfolio.jsp" /> --%>
						</div>
					    <div role="tabpanel" class="tab-pane" id="messages">ggtfdgdh</div>
					    <div role="tabpanel" class="tab-pane" id="settings">rffherg</div>
					  </div>
					
					</div>
				</div>
			</div>
          </section>
      </section>

    
  </section>

  
	<!-- jQuery -->
	<script src="../../resources/javascript/jquery.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="../../resources/javascript/bootstrap.min.js"></script>
  
	
  </body>
</html>
