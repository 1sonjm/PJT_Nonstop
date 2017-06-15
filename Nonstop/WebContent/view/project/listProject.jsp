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
        	background-color: orange;
     	}
     	
     	/* scrap button */
     	.fa-star.inbox-started, .fa-star:hover {
          color: #f78a09;
    	}
      
       .fa-star {
          color: #d5d5d5;
        }
        
        form{
          float : right;
          margin : 0;
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
			
			if($("#sessionUserId").val() == "" || $("#sessionUserId").val() ==null ){
				$(".detailButton").on("click", function(){
					self.location ="/user/login";
				});
			}else{
				$(".detailButton").on("click", function(){
					self.location ="/project/getProject?projNo="+$(this).attr("value");
				});
			}
			
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


</head>

<body>

<jsp:include page="/view/common/toolbar.jsp" />

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
		
		<form class="navbar-form navbar-right" role="search">
		<div class="input-group input-group-sm">
			<div class="input-group-btn">
				<input type="hidden" id="searchCondition" name="searchCondition" value="${search.searchCondition}"/>
				<button type="button" class="btn btn-success dropdown-toggle" id="searchButton" name="searchButton" 
						data-toggle="dropdown" aria-expanded="false" style="background: #fff" >
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

									<!-- <th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value=""><script language=javascript>d_day()</script>일 남음</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value=""><script language=javascript>expect_day()</script>일</th> -->
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
									  		개발 분야 : 개발>WEB
									  	</c:when>
										<c:when test="${project.projDivision==12}">
									  		개발 분야 : 개발>APP
									  	</c:when>
										<c:when test="${project.projDivision==21}">
									  		개발 분야 : 디자이너>WEB
									  	</c:when>
										<c:when test="${project.projDivision==22}">
									  		개발 분야 : 디자이너>APP
									  	</c:when>
									</c:choose></th>
								</tr>


								<tr style="height: 20px; border-bottom: 1px solid #ddd;">
									<th colspan="12">개발 기술 : 
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
										<button type="button" class="label label-info" style="font-size : 15px; color : #000; margin : 0; width :100% ; height : 100%">상 세 보 기</button>
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

</body>

</html>

