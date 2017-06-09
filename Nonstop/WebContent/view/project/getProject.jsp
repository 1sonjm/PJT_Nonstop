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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="/resources/javascript/jquery.js"></script>

<script src="/resources/javascript/bootstrap.min.js"></script>


<!-- Bootstrap Core CSS -->
<link href="/resources/css/nonstop.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet">

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

.row {
	border: 0;
}
/* 미니프로필 */
.about-fixed {
	position: fixed;
	width: 18%;
}

.my-pic {
	 width: 100%;
     height: 0;
     padding-bottom: 100%;
     box-shadow: -2px -1px 88px 0px rgba(0,0,0,0.17);
     overflow: hidden;
}

.my-pic img {
	width: 100%;
}

.my-detail {
	margin-bottom: 30px;
	background: #ffffff;
	box-shadow: -2px -1px 88px 0px rgba(0, 0, 0, 0.17);
}

.white-spacing {
	padding-left: 10px;
	border-bottom: 1px dashed #cccccc;
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
	box-shadow: -2px -1px 88px 0px rgba(0, 0, 0, 0.17);
}

.sub-title {
	padding: 10px;
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

.comment-div{    	
   	height: 40px; width: 100%;
}
.comment-div h6{
	margin-top:5px;
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

.scroll-to-top:hover, .scroll-to-top:focus {
	color: #333333;
}

@media only screen and (max-width:435px) {
	.scroll-to-top {
		font-size: 25px;
	}
}

.glyphicon.glyphicon-star {
	background-color: rgba(255, 255, 255, 0.5);
	border: 0;
}

#shape1 {
	margin: 0;
	padding: 5px;
	background-color: #dddddd;
	width: 100px;
	heigth: 60px;
	float: right;
	text-align: center;
	font-size: 20px;
}

#shape2 {
	margin: 0;
	padding: 5px;
	background-color: orange;
	width: 100px;
	heigth: 60px;
	float: right;
	text-align: center;
	font-size: 20px;
}

th, tr {
	padding: 7px;
	
	text-overflow: ellipsis
}


#gab {
	margin: 20px;
}


.btn.btn-default.btn-sm {
	float: right;
}

.media-left .comment-img {
	margin-top: 2px;
	margin-bottom: 2px;
	padding-left: 5px;
}


hr.thick-line {
	border-color: #e7e9ee;
	border-width: 2px;
	margin-top: 5px;
	margin-bottom: 20px;
}


.glyphicon-time, .glyphicon-home, .glyphicon-list-alt,
	.glyphicon-map-marker {
	font-size: 20px;
	margin-left: 10%;
	margin-right: 10%;
}


#backButton, #applButton, #viewButton {
	float: right;
	margin-left: 5px;
	font-size: 16px;
	font-weight: 500;
	background-color: #ececec;
	border: 0;
	border-radius: 0;
	width: 120px;
	text-align : center;
}

#updateButton, #deleteButton {
	float: left;
	margin-left: 5px;
	font-size: 16px;
	font-weight: 500;
	background-color: #ececec;
	border: 0;
	border-radius: 0;
	width: 120px;
	text-align : center;
}

#follow1, #follow2, #messageQuestion{
	margin-left:0%;
	margin-right:0%;
	font-size: 16px;
	font-weight: 500;
	background-color: #ececec;
	border: 0;
	border-radius: 0;
	width: 120px;
	float : center;
	text-align : center;
}


xmp{
	font-weight: bold;
}
</style>

<script type="text/javascript">
	
	
	function fncDeleteProject() {
		
		if(confirm("정말 삭제하시겠습니까?") !=0){
		
			$("form").attr("method", "POST").attr("action", "/project/deleteProject").submit();
			
		}else{
		}
	
	}
	
	
	$(function (){
		
		$("#projDetail").val().replace('/\n/g', '<br>');
	
	});
	
	
	 
	$(function() {
		$("#deleteButton").on("click", function(){
				fncDeleteProject(1);
		});
		
		$("#updateButton").on("click", function(){
			self.location ="/project/updateProjectView?projNo="+$(".projNo").attr("value");
		});
		
		$("#backButton").on("click", function(){
			history.go(-1);
		});
		
		$("#viewButton").on("click", function(){
			
		});
		
	});
	
	
	/* function aaa(jsondata){
		for(i=0;i<jsondata;i++){
			'<input type="checkbox" value='+jsondata[i].techNo+'>'+jsondata[i]techName
		}
	} */
	
	
	
	$(function() {
	      /* 스크랩추가 */
	      $(".glyphicon.glyphicon-star").on("click" , function() {

	            var flag = $(this).attr('value');
	            var requestTarget;
	            var asdf;
	            var qwer;
	            alert(flag);
	            
	            
	            if(flag=="addScrap"){
	               requestTarget = "addJsonProjScrap";
				   asdf = "스크랩 해제";
				   qwer = "deleteScrap";
	            }else{
	               requestTarget = "deleteJsonProjScrap";
	               asdf = "스크랩 추가";
	               qwer = "addScrap";
	            }
	            alert(requestTarget+"컨트롤러 어디로가니");

	             var projNo=$(this).attr('projNo');
	             alert(projNo);
	             $.ajax(
	                {
	                   url : "/profile/"+requestTarget+"/"+projNo,
	                   method : "GET",
	                   dateType : "json",
	                   headers : {
	                      "Accept" : "application/json",
	                     "Content-Type" : "application/json"   
	                 },
	                   success : function(JSONData , status){
	                      var displatValue = 
	                     "<button type='button' title='"+asdf+"' class='glyphicon glyphicon-star' style='font-size: 25px' id='deleteScrap' projNo='${project.projNo}' value='"+qwer+"'></button>"
	                      $(".glyphicon.glyphicon-star").html(displayValue);
	                   }
	                });
	             });
	      });
	
	   function fnMove(comment){
	        var position = $("#comment").offset();
	        $('html, body').animate({scrollTop : position.top}, 800);
	   }
	   
	   $(function() {
		      /* 댓글 박스 클릭시 comment창 보이게 */ 
		   var maxLength = 200;
	       $('textarea').keyup(function() {
	         var length = $(this).val().length;
	         var length = maxLength-length;
	         $('#chars').text(length);
	       });
	       /* 댓글 박스 클릭시 comment창 보이게 */ 
	       $(".comment-input").on("click" , function() {
		          $( ".comment-input" ).css("display" , "none"); 
		          $(".comment-btn").css("display" , "block");
	       }); 
	       
	       /* 댓글 등록 */
	       $("#addComment").on("click" , function() {
	 		  
	 	    	  $.ajax( 
	 						{
	 							url : "/project/addJsonComment",
	 							method : "POST" ,
	 							dataType : "json" ,
	 							context : this,
	 							data : {
	 									comContent:$("#comContent").val(),
	 									comProjNo:$(this).next().val(),
	 									comUserId:$(this).next().next().val(),
	 									} , 
	 							success : function(serverData , status) {
	 									  location.reload();
	 							}
	 					});
	 	      });
	 	      
	 	      /*댓글 삭제*/
	 	  $(".glyphicon-trash").on("click" , function() {
	           $.ajax( 
	 					{
	 						url : "/project/deleteComment/"+$(this).next().val()+"/"+$("#projNo").val(),
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
	   
	   $(function() {
		   /*팔로우*/
		   $("#follow1").on("click" , function() {       	
			   var targetUserId = $("#projUserId").val();
			   /*팔로우하기*/
				   alert($("#projUserId").val()+"에게 팔로우를 신청합니다.");
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
			});
		   
			   
		   $("#follow2").on("click" , function() {       	
			   var targetUserId = $("#projUserId").val();
			   /*팔로우취소*/
				   alert($("#projUserId").val()+" 팔로우를 취소합니다.");
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
	       });
	   });
	   
	   $(function() {
		   $("#messageQuestion").on("click" , function() {       	
		    	  self.location="/letter/addLetter";
		      });
	   });
    
	</script>
</head>

<body>
	<jsp:include page="/view/common/toolbar.jsp" />
	
	<form class="form-group" name="detailForm">
	<div id="main">
		<div class="container">

			<div class="row">
				<input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
				<!-- Blog Post (Left Body) Start -->
				<div class="col-md-9">
					<div class="col-md-12 page-body">
						<div class="row">
							<div class="sub-title">
								<c:if test="${sessionScope.user.role == '1'}">
									<button type="button" class="btn btn-info btn-lg" id="backButton">목록으로 가기</button>
									<button type="button" class="btn btn-info btn-lg" id="deleteButton">삭제</button>
								</c:if>
								<c:if test="${sessionScope.user.role == '2'}">
									<button type="button" class="btn btn-info btn-lg" id="backButton">목록으로 가기</button>
									<button type="button" class="btn btn-info btn-lg" id="applButton">지원하기</button>
								</c:if>
								<c:if test="${sessionScope.user.role == '3' && sessionScope.user.userId == project.projUserId}">
									<button type="button" class="btn btn-info btn-lg" id="updateButton">수정</button>
									<button type="button" class="btn btn-info btn-lg" id="deleteButton">삭제</button>
									<button type="button" class="btn btn-info btn-lg" id="backButton">목록으로 가기</button>
									<button type="button" class="btn btn-info btn-lg" id="viewButton">지원자 보기</button>
								</c:if>
								<c:if test="${sessionScope.user.role == '3' && sessionScope.user.userId != project.projUserId}">
									<button type="button" class="btn btn-info btn-lg" id="backButton">목록으로 가기</button>
								</c:if>
							</div>

							<div class="col-md-12 content-page">
								<div class="col-md-12 blog-post">

									<div class="post-title" style="padding-bottom: 10px;">

										<c:if test="${project.scrapNo==0}">
											<button type="button" title="스크랩 추가"
												class="glyphicon glyphicon-star" style="font-size: 25px"
												id="addScrap" projNo="${project.projNo}" value="addScrap"></button>
										</c:if>
										<c:if test="${project.scrapNo!=0}">
											<button type="button" title="스크랩 해제"
												class="glyphicon glyphicon-star" style="font-size: 25px"
												id="deleteScrap" projNo="${project.projNo}"
												value="deleteScrap"></button>
										</c:if>

										<strong style="font-size: 25px;">${project.projTitle}</strong>
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
									</div>

									<div class="post-title">
										<table style="width: 100%">
											<tr style="text-align: center; border-top: 2px solid rgb(147, 144, 144); margin-top: 10px; font-size: 14px">
												<td colspan="3">공고기간</td>
												<td colspan="3">예상기간</td>
												<td colspan="3">지원자수</td>
												<td colspan="3">개발지역</td>
											</tr>

											<tr style="font-size: 15px">

												<th colspan="3" style="border-right: 1px solid #ddd; text-align: center;" id="thatDay" value="">
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
												<th colspan="3" style="border-right: 1px solid #ddd; text-align: center">sdsdfsdf</th>
												<th colspan="3" style="text-align: center">${project.projLocation}</th>
											</tr>

											<tr
												style="border-bottom: 1px solid #ddd; padding-bottom: 5px;">
												<th colspan="12"></th>
											</tr>

											<tr>
												<th colspan="12"></th>
											</tr>

											<tr>
												<th colspan="12"
													style="background-color: rgb(236, 231, 231)"><c:choose>
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

											<tr>
												<th colspan="12" style="background-color: rgb(236, 231, 231)">
												개발 기술 :
													<c:set var="i" value="0"/>
														<c:forEach var="listTechUse" items="${listTechUse}" >
														<c:set var="i" value="${i+1}"/>
														${listTechUse.tuTechNo}
													</c:forEach>
												</th>
											</tr>



										</table>
									</div>
									<!-- Post Headline End -->

									<!-- Post Detail Start -->
									<div class="post-info" style="font-color: orange">
										<span><font color=orange>상세정보</font></span>
									</div>

									<!-- Post Image End -->
<!-- <xmp> -->
									<!-- 상세설명 -->
									<div class="post-info" id="projDetail" name="projDetail" value="">
										<xmp>${project.projDetail}</xmp>
									</div>
									

									<!--  <div class="margin-top-50"></div> -->
									<!-- Post Comment (Disqus) Start -->
									<div class="margin-top-50"></div>
                               		
                               		<div id="comment" class="comment">
                                	<h3>Discuss About Post</h3>
                                	<div class="margin-top-20"></div>
                                  	<h6>22 Comments</h6>
                                  	<hr class="thick-line">
                                   
                                    <div class="media">
									  <div class="media-left">
									    <a href="#">
									      <img src="../../resources/images/upload/${sessionScope.user.image}" width="50px" height="50px" alt="">									      
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
						                      <button type="button" name="comProjContent" value="" class="btn btn-primary" id="addComment">Submit</button>
						                      <input type="hidden" id="projNo" value="${project.projNo}">
						                      <input type="hidden" id="sessionUserId" value="${sessionScope.user.userId}">
						                    </form>
						                 </div>						  	
								  	  </div>
								    </div>
								
								    <div class="margin-top-30"></div>								
								
									<!-- ajax로 받은 데이터 들어올 곳 -->						
									<div id="ajaxTarget"></div> 																    
								
									<c:set var="i" value="0"/>
									<c:forEach var="projCommentList" items="${projCommentList}" >
									<c:set var="i" value="${i+1}"/>
									
									<div class="media">
									  <div class="media-left">
									    <a href="#">									    
									      <img class="comment-img" src="../../resources/images/upload/${projCommentList.comUserImg}" width="45px" height="45px" alt="">
									    </a>
									  </div>
									  <div class="media-body">
									  	<div class="comment-div">
									  		<h6><strong>${projCommentList.comUserId}</strong>
									  			&nbsp;&nbsp;•&nbsp;&nbsp;${projCommentList.comRegDate}
									  			<c:set var="sessionUserId" value="${sessionScope.user.userId}"/>
									  			<c:if test="${projCommentList.comUserId eq sessionUserId}">
									  				&nbsp;&nbsp;<span class="glyphicon glyphicon-trash" id="deleteComment" aria-hidden="true"></span>
									  				<input type="hidden" value="${projCommentList.comNo}"/>
									  			</c:if>
									  		</h6>
									  		<p>${projCommentList.comContent}</p>							  		
									  	</div>										  
									  </div>
									</div>
								</c:forEach>
                            </div>                                     
                        </div>
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
						    <img class="userImg" src="../../resources/images/upload/user01img.jpg" alt="">
              			</div>
              			
              			<div class="my-detail">
              			<div class="white-spacing">
              			 	<br/>
	                        <p class="glyphicon glyphicon-time"></p>
							${project.projAnnoStart} <br />
							<p class="glyphicon glyphicon-home"></p>
							${user.userName} <br />
							<p class="glyphicon glyphicon-list-alt"></p>
								<c:choose>
									<c:when test="${project.projDivision==11}">
								  		개발 > WEB
								  	</c:when>
									<c:when test="${project.projDivision==12}">
								  		개발 > APP
								  	</c:when>
									<c:when test="${project.projDivision==21}">
								  		디자이너 > WEB
								  	</c:when>
									<c:when test="${project.projDivision==22}">
								  		디자이너 > APP
								  	</c:when>
								</c:choose>
							<br />
							<p class="glyphicon glyphicon-map-marker"></p>
							${project.projLocation} <br />
		                 </div> 
						 
						 <div class="margin-top-20">
						 	<input type="hidden" name="projUserId" id="projUserId" value="${project.projUserId}"/>
						 	<center>
								<button type="button" class="btn btn-info btn-lg" id="messageQuestion">쪽지 문의</button>
								<c:if test="${sessionScope.user.role == 2}">
								<%-- 	<c:if test="${project.projFollowFlag == true}"> --%>
										<button type="button" class="btn btn-info btn-lg" id="follow1">팔로우 하기</button>
										<button type="button" class="btn btn-info btn-lg" id="follow2">팔로우 취소</button>
									<%-- </c:if>
									<c:if test="${project.projFollowFlag == false}">
										
									</c:if> --%>
								</c:if>
							</center>
		                 </div>
		                 
		                 <div class="margin-bottom-20">&nbsp;</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Back to Top Start -->
	<!-- <a href="#" class="scroll-to-top"><i class="fa fa-long-arrow-up"></i></a> -->
	<a href="#" class="scroll-to-top"><span
		class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></a>
	<!-- Back to Top End -->

	<!-- jQuery -->
</form>
</body>
</html>
