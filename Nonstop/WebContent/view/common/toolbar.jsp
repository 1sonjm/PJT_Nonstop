<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<nav class="navbar navbar-inverse navbar-fixed-top" id="floater">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" id="logo">NONSTOP</a>
	    </div>
	    
	    <ul class="nav navbar-nav" id="center">
	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Portfolio</a>
	        <ul class="dropdown-menu">
	          <li><a href="#" id="portDesigner">Designer</a></li>
	          <li><a href="#" id="portDeveloper">Developer</a></li>
	        </ul>
	      </li>


	      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project </a>
	        <ul class="dropdown-menu">
	          <li><a href="#" id="projDesigner">Designer</a></li>
	          <li><a href="#" id="projDeveloper">Developer</a></li>
	        </ul>
	      </li>
	      
	      
	      <li><a href="#">Statistics</a></li>
	    </ul>
	    
	    
	    <ul class="nav navbar-nav navbar-right">
	      <%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
		   	  <li><a href="#"><span class="glyphicon glyphicon-user"></span>김준영님 환영합니다.</a></li>
		   	  <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
		      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">프로필</a></li>
		          <li><a href="#">내정보보기</a></li>
		          <li><a href="#">내정보수정</a></li>
		          <li><a href="#">팔로우 목록보기</a></li>
		          <li><a href="#">로그아웃</a></li>
		        </ul>
		      </li>
		      
		      
		      
		     <!--  <li><a href="#"><span class="glyphicon glyphicon-align-justify"></span></a></li> -->
	      <%-- </c:if> --%>
	      
	      <%-- <c:if test="${sessionScope.user.role != '1' || ${sessionScope.user.role != '2' || ${sessionScope.user.role != '3'}">
	      	  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
		      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		  </c:if> --%>
	    </ul>
	  </div>
	</nav>

<style>
	
	
	
	#center {
		margin-left:30%;
        margin-right:30%;
       
	}
	
	/* p {
		margin-top : 0;
		margin-bottom : 0;
		font-size: 150%;
	} */
	</style>

<script type="text/javascript">

		//============= 메인페이지 이동 Event  처리 =============   
		$(function() {
		   $("#logo").on("click" , function() {
		      self.location = "/index.jsp";
		   }); 
		});
		
		//============= toolbar portfolio 이동 Event 처리 =============
	    $(function() {
	         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	          $("#portDesigner").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/portfolio/listPortfolio"
	          }); 
	    });
	   
	   //============= toolbar portfolio 이동 Event 처리 =============
	    $(function() {
	         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	          $("#portDeveloper").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/portfolio/listPortfolio"
	          }); 
	    });
		
	   //============= toolbar user login 이동 Event 처리 =============
	   
	    $(function() {
	          $("a:contains('로그인')").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/user/login"
	          }); 
	    });
	   
	  //============= toolbar statistics getListTotalStatistics 이동 Event 처리 =============
		   
	    $(function() {
	          $("a:contains('Statistics')").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/statistics/getListTotalStatistics"
	          }); 
	    });
	  
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDesigner").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/getProject?projNo=1"
			}); 
		 });
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/getProject?projNo=1"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$(function() {
		 	$("a:contains('판매상품등록')").on("click" , function() {
				self.location = "/product/addProductView.jsp"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('판매상품관리')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('상 품 검 색')").on("click" , function() {
				self.location = "/product/listProduct?menu=search"
			}); 
		});
	 	
	 	$(function() {
		 	$(".totalList").on("click" , function() {
				self.location = "/purchase/listSale"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('구매이력조회')").on("click" , function() {
				self.location = "/purchase/listPurchase"
			}); 
		});
	 	
</script>  


