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
    <link href="/resources/css/nonstop.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
    
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
    
    <!-- jQuery -->
    <script src="/resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/javascript/bootstrap.min.js"></script>
    
    <script src="/resources/javascript/animatedModal.min.js"></script>
    
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
       
         //카테고리 버튼(all)
         $("#button-all").on("click" , function() {
            var postDivision = $(this).val();
            
            if(postDivision == 1 || postDivision == 10 || postDivision == 11 || postDivision == 12){
               self.location="/portfolio/listPortfolio?postDivision=10";
            }else{
               self.location="/portfolio/listPortfolio?postDivision=20";
            }
         });
         //카테고리 버튼(web)
         $("#button-web").on("click" , function() {
            var postDivision = $(this).val();
            
            if(postDivision == 1 || postDivision == 10 || postDivision == 11 || postDivision == 12){
               self.location="/portfolio/listPortfolio?postDivision=11";
            }else{
               self.location="/portfolio/listPortfolio?postDivision=21";
            }
         });
         //카테고리 버튼(app)
         $("#button-app").on("click" , function() {
            var postDivision = $(this).val();
            
            if(postDivision == 1 || postDivision == 10 || postDivision == 11 || postDivision == 12){
               self.location="/portfolio/listPortfolio?postDivision=12";
            }else{
               self.location="/portfolio/listPortfolio?postDivision=22";
            }
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
														+'<small>'+this.portUserId+'</small>'
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
		  								
		  					 }//success
		  			  });//ajax   
	        	  }
	           })
      	  });
      });
   </script>
   <style>
   
   /* 스크랩버튼 */
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
   <div class="container"> <!-- <div class="container"> 獄�占쏙옙占쏙옙占� �⑨옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 / <div class="container-fluid"> ��怨�占싼�占쏙옙 占쏙옙筌ｋ��占쏙옙繹�占쏙�占� 占쏙옙占쎈��占쏙옙占쏙옙 筌ㅿ옙占쏙옙占쏙옙 ��占쏙옙占쏙옙��占쏙옙 -->
      <div class="input-group input-group-sm">
	      <div class="input-group-btn">
	        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Action <span class="caret"></span></button>
	        <ul class="dropdown-menu" role="menu">
	          <li><a href="#">Action</a></li>
	          <li><a href="#">Another action</a></li>
	          <li><a href="#">Something else here</a></li>
	          <li class="divider"></li>
	          <li><a href="#">Separated link</a></li>
	        </ul>
	      </div><!-- /btn-group -->
	      <span class="input-group-addon" id="sizing-addon3"> <span class="glyphicon glyphicon-search" aria-hidden="true"></span> </span>
	      <input type="text" class="form-control" aria-label="...">
	      <span class="input-group-btn">
	        <button class="btn btn-success" type="button">검색</button>
	      </span>
	    </div><!-- /input-group -->
	  </div>
 
      <!-- ALL/WEB/APP 甕곤옙占쏙옙 -->
      <div class="row">   
         <div class="col-md-6 col-md-offset-3" align="center">
              <button class="button button-neutral" type="button" id="button-all" value="${param.postDivision}">All</button>
              <button class="button button-neutral" type="button" id="button-web" value="${param.postDivision}">Web</button>
              <button class="button button-neutral" type="button" id="button-app" value="${param.postDivision}">App</button>
              <input type="hidden" id="postDivision" name="postDivision" value="${param.postDivision}"/>
         </div>

      </div>
   </div>
</nav>

<!-- Ranking type-->
<div class="container"> 
  <div class="margin-top-50"></div>
     <div class="text-center">   
      <span class="glyphicon glyphicon-tower" aria-hidden="true"></span>     
       <h3 class="text-center" style="margin-bottom:0; margin-top:15px">PORTFOLIO - RANKING</h3>
       <p class="text-center">2017.05.10 - 2017.08.10 랭킹 순위</p>
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
				<c:forEach var="portfolio" items="${list}" >
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
		                   <input type="hidden" id="portNo" name="portNo" value="${portfolio.portNo}"/>
		                                      
		                      <div class="thumbnail-portImage">
		                          <img src="/resources/images/upload/${portfolio.portFile}" width="400px" height="300px" alt="">                       
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
		                              <small>${portfolio.portUserId}</small>
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
		                                   <input type="hidden" class="sessionScope" value="">
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
      <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
   	  <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
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
                          <img src="/resources/images/upload/${portfolio.portFile}" width="400px" height="300px" alt="">                       
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
                              <small>${portfolio.portUserId}</small>
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

</body>

</html>