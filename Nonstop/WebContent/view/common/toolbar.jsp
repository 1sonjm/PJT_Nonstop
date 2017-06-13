<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	  <div class="container">
	    <div class="navbar-header">
	    	<!-- 줄어들면 생기는 메뉴버튼 -->
	    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                Menu <i class="fa fa-bars"></i>
            </button>
	    	<!-- 로고 -->
	      	<a class="navbar-brand page-scroll" href="/index.jsp">
                NONSTOP
            </a>
	    </div>
	    
			<!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-main-collapse">
                <ul class="nav navbar-nav" id="center">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PORTFOLIO</a>
                   <ul class="dropdown-menu">
                     <li><a href="#" id="portDesigner">DESIGNER</a></li>
                     <li><a href="#" id="portDeveloper">DEVELOPER</a></li>
                   </ul>
                </li>

                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECT </a>
                   <ul class="dropdown-menu">
                     <li><a href="#" id="projDesigner">DESIGNER</a></li>
                     <li><a href="#" id="projDeveloper">DEVELOPER</a></li>
                   </ul>
                </li>

	      
	      
	      <li><a id="statistics" href="#">STATISTICS</a></li>
	      <li><a id="chat" href="#">CHAT</a></li>
            </ul>
            
            <ul class="nav navbar-nav navbar-right">
               <c:if test="${empty sessionScope.user.userId }">
                      <li><a href="#" id="login">로그인</a></li>
                      <li><a href="#" id="addUser">회원가입</a></li>
                    </c:if>
               <c:if test="${!empty sessionScope.user.userId }">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.userName}님 환영합니다.</a></li>
                    <li><a href="#" id="listLetter"><span class="glyphicon glyphicon-envelope"></span></a></li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify"></span></a>
                    <ul class="dropdown-menu">
                      <input type="hidden" id="userId" name="userId" value="${sessionScope.user.userId}"/>                     
                      <li><a href="#" id="profile2">프로필</a></li>
                      <li><a href="#" id="getUser">내정보보기</a></li>
                      <li><a href="#" id="updateUser">내정보수정</a></li>
                      <li><a href="#" id="listFollow">팔로우 목록보기</a></li>
                      <li><a href="#" id="logout">로그아웃</a></li>
                    </ul>
                  </li>
                 </c:if>  
                  
             </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<style>
	
	
	

    
    #center {
       margin-left:0%;
       margin-right:0%;   
    }
    @media (min-width: 1200px) {
      #center {
      	margin-left:29%;
      	margin-right:5%;
      }
    }
	</style>

    <script type="text/javascript">
   //============= logout Event  처리 =============   
   $(function() {
       $("#logout").on("click" , function() {
         $(self.location).attr("href","/user/logout");
         //self.location = "/user/logout"
      }); 
    });
   
    //============= login 이동 Event 처리 =============   
    $(function() {
       $("#login").on("click" , function() {
         //$(self.location).attr("href","/user/logout");
         self.location = "/user/login"
      }); 
    });
    
    //============= 회원가입 이동 Event 처리 =============   
    $(function() {
       $("#addUser").on("click" , function() {
         //$(self.location).attr("href","/user/logout");
         self.location = "/user/addUser"
      }); 
    });
    
    //============= 쪽지함 이동 Event 처리 =============   
    $(function() {
       $("#listLetter").on("click" , function() {
          var receiveId = $("#userId").val();      
          self.location = "/letter/getReceiveLetterList?receiveId="+receiveId;
      }); 
    });
    
    //============= 프로필 이동 Event 처리 =============   
    $(function() {
       $("#profile2").on("click" , function() {
         self.location = "/profile/getMineProfile"
      }); 
    });
    
    //============= 내정보보기 이동 Event 처리 =============   
    $(function() {
       $("#getUser").on("click" , function() {
          //alert($("#userId").val());
          var userId = $("#userId").val();       
          self.location = "/user/getUser?userId="+userId;
      }); 
    });
    
    //============= 내정보수정 이동 Event 처리 =============   
    $(function() {
       $("#updateUser").on("click" , function() {
          alert($("#userId").val());
          var userId = $("#userId").val();       
           self.location = "/user/updateUser?userId="+userId;
      }); 
    });
    
    //============= 내정보수정 이동 Event 처리 =============
     $(function() {
       
       $("#listFollow").on("click" , function() {
       
      var reqUserId = $("#userId").val();
   
      self.location = "/profile/getFollowList?reqUserId="+reqUserId;
      
         popWin 
      = window.open("/view/profile/listFollow.jsp",
                        "popWin", 
                        "left=300,top=200,width=500,height=720,marginwidth=0,marginheight=0,"+
                        "scrollbars=no,scrolling=no,menubar=no,resizable=no");   
      });
     });
       
   //============= 통계 이동 Event 처리 =============   
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
       $("#statistics").on("click" , function() {
         $(self.location).attr("href","/statistics/getListStatistics");
         //self.location = "/user/logout"
      }); 
    });
      
   //============= toolbar project 이동 Event 처리 =============   
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
       $("#projDesigner").on("click" , function() {
         //$(self.location).attr("href","/user/logout");
         self.location = "/project/listProject?projDivision=2&sortFlag=0"
      }); 
    });
   
   //============= toolbar project 이동 Event 처리 =============
    $(function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
          $("#projDeveloper").on("click" , function() {
            //$(self.location).attr("href","/user/logout");
            self.location = "/project/listProject?projDivision=1&sortFlag=0"
         }); 
       });
   
   //============= toolbar portfolio 이동 Event 처리 =============
    $(function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
          $("#portDesigner").on("click" , function() {
            //$(self.location).attr("href","/user/logout");
            self.location = "/portfolio/listPortfolio?postDivision=2"
         }); 
       });

    //============= toolbar portfolio 이동 Event 처리 =============
     $(function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
           $("#portDeveloper").on("click" , function() {
             //$(self.location).attr("href","/user/logout");
             self.location = "/portfolio/listPortfolio?postDivision=1"
          }); 
        });

     //============= toolbar chat 이동 Event 처리 =============
      $(function() {
           //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $("#chat").on("click" , function() {
              //$(self.location).attr("href","/user/logout");
               self.location = "https://192.168.0.16:8444/#"+Math.random().toString(16).substr(2);
           }); 
         });
     
   </script>   


