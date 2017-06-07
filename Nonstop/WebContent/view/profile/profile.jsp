<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">


  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - FREE Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 	$(".addCareer").on("click" , function() {
 		self.location = "/profile/addCareerView";
	}); 
	
 	$("span.listFollow").on("click" , function() {
 		
		var reqUserId = $(this).attr('reqUserId');
	
		self.location = "/profile/getFollowList?reqUserId="+reqUserId;
		
	  	 popWin 
		= window.open("/view/profile/listFollow.jsp",
								"popWin", 
								"left=300,top=200,width=500,height=720,marginwidth=0,marginheight=0,"+
								"scrollbars=no,scrolling=no,menubar=no,resizable=no");   
		});
 	
	$("#follow").on("click" ,function() {
		
		var flag = $(this).text().trim();
		var requestTarget;
		var asdf;
		
		//alert(flag);
		if(flag == "팔로우"){
			requestTarget = "addJsonFollow";
			asdf = "언팔로우";
		}else{
			requestTarget = "deleteJsonFollow";
			asdf = "팔로우";
		}
		//alert(1);
		var targetUserId = $(this).attr('targetUserId');
		//alert(targetUserId);
		$.ajax(
			{
				url : "/profile/"+requestTarget+"/"+targetUserId,
				method : "GET" ,
				dateType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	
				},
				success : function(JSONData , status) {
					$(document).on("click", "#unFollow", function(){
						var targetUserId = $(this).attr('targetUserId');
						self.location="/profile/deleteJsonFollow?targetUserId="+targetUserId;	
						});

			      		if(flag=="팔로우"){
			      			$( "#followflag" ).html("언팔로우");
			      		}else{
			      			$( "#followflag" ).html("팔로우");
			      		}
				}
			});
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
		margin-top : 145px;
	}
	
	#sidebar p {
		color: #f2f2f2;
		margin-top : 0px;
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
	#profileImg{
	display : block;
	margin-left : auto;
	margin-right : auto;
	margin-bottom : 0px;
	margin-top: 60px;
	}
		
	
	</style>

  </head>

  <body>
 
  <jsp:include  page="/view/common/toolbar.jsp" />
  <section id="container" >    
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
        
          <div id="sidebar"  class="nav-collapse ">

        <!-- sidebar menu start-->
              <!-- <ul class="sidebar-menu"> -->
              
              <br/><br/><br/><br/><br/><br/>
             
              	  <img src="../../resources/images/upload/${user.image}" id="profileImg" class="img-circle" width="160px">
              	  <h5 class="text-center">${user.userId}</h5>
              	  <p class="text-center">${user.addr}</p>
              	  
              	  <c:if test="${user.role=='3'}">
              	  <h5 class="text-center">기업대표자 : ${user.companyName}</h5>
              	  <h5 class="text-center">직원수 : ${user.empNum}</h5>
              	  <h5 class="text-center">설립일 : ${user.pubDate}</h5>
              	  </c:if>
				 

				  
				<c:if test="${user.userId != sessionScope.user.userId }">
				  <c:if test="${follow.reqUserId==sessionScope.user.userId && career.careerUserId==targetUserId }">
				  <div class="col-sm-12 text-center">
					 <span class="follow" targetUserId="${user.userId}" id="follow">
		      		<button type="button" class="btn btn-primary" id="profile" >언팔로우</button>
		      		</span>
		      		</div>
		      		</c:if>
		      		
		      		<c:if test="${follow.reqUserId != sessionScope.user.userId}">
		      		<div class="col-sm-12 text-center">
					 <span class="follow" targetUserId="${user.userId}" id="follow">
		      		<button type="button" class="btn btn-primary" id="followflag" >팔로우</button>
		      		</span>
		      		</div>
		      		</c:if>
		      	</c:if>
		      		
		      		<c:if test="${session.user.userId  == param.userId}"> 
		      		<div class="col-sm-12 text-center">
					 <span class="listFollow" reqUserId="${user.userId}">
		      		<button type="button" class="btn btn-primary" id="followflag" >팔로우목록보기</button>
		      		<ul class="nav nav-pills nav-stacked labels-info inbox-divider">
                          <li> <h4>Followers</h4> </li>
                           <c:set var="i" value="0" />
		  					<c:forEach var="follow" items="${follow}">
							<c:set var="i" value="${ i+1 }" />
							
                          <li> 
                          <a href="#" class="followProfile" userId="${user.userId}"> 
                          <i class=" fa fa-sign-blank text-danger"></i> 
                          ${follow.targetUserId} 
                          </a> 
                          
                          </li>
                         <!--  <li> <a href="#"> <i class=" fa fa-sign-blank text-success"></i> Design </a> </li>
                          <li> <a href="#"> <i class=" fa fa-sign-blank text-info "></i> Family </a>
                          </li><li> <a href="#"> <i class=" fa fa-sign-blank text-warning "></i> Friends </a>
                          </li><li> <a href="#"> <i class=" fa fa-sign-blank text-primary "></i> Office </a>
                          </li> -->
                          </c:forEach>
                      </ul> 
		      		</span>
		      		</div>
		      		</c:if>	
              <!-- </ul> -->
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
					    <li role="presentation" class="active"><a href="#Profile" aria-controls="Profile" role="tab" data-toggle="tab">Profile</a></li>
					    
					    <c:if test="${user.role=='3'}">
					    <li role="presentation"><a href="#Project" aria-controls="Project" role="tab" data-toggle="tab">Project</a></li>
					    </c:if>
					    
					    <c:if test="${user.role=='2'}">
					    <li role="presentation"><a href="#Portfolio" aria-controls="Portfolio" role="tab" data-toggle="tab">Portfolio</a></li>
					    </c:if>

					 	<c:if test="${user.userId  == sessionScope.user.userId}"> 
					    <li role="presentation"><a href="#projectScrap" aria-controls="projectScrap" role="tab" data-toggle="tab" >projectScrap</a></li>
					 	</c:if>
					 	
					 	 <c:if test="${user.userId  == sessionScope.user.userId}"> 
					    <li role="presentation"><a href="#portfolioScrap" aria-controls="portfolioScrap" role="tab" data-toggle="tab" >portfolioScrap</a></li>
					 	</c:if>
					  </ul>
			
					  <!-- Tab panes -->
					  <div class="tab-content">
					  
					    <div role="tabpanel" class="tab-pane active" id="Profile">
					   <c:if test="${user.role=='2'}">
					    <jsp:include page="/view/profile/listCareer.jsp" /> 
					    </c:if>	
					    <jsp:include page="/view/profile/listRecordProject.jsp" /> 					    	  
					    </div>
					    
					  <div role="tabpanel" class="tab-pane" id="Portfolio">
					    	<br/> <h5>내가올린 포트폴리오 목록보기</h5> <br/>
					   <jsp:include page="/view/profile/listMyPort.jsp" />
						</div> 
						
						 <div role="tabpanel" class="tab-pane" id="Project">
						 	<br/> <h5>내가올린 프로젝트 목록보기</h5> <br/>
						 </div>
						 
					    <div role="tabpanel" class="tab-pane" id="portfolioScrap">
							<br/> <h5>포트폴리오 스크랩 목록보기</h5> <br/>
					   		<jsp:include page="/view/profile/listPortScrap.jsp"/>
					    </div>
					    
					    <div role="tabpanel" class="tab-pane" id="projectScrap">
							<br/> <h5>프로젝트 스크랩 목록보기</h5> <br/>
					   		<jsp:include page="/view/profile/listProjScrap.jsp"/>
					    </div> 
					   
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
