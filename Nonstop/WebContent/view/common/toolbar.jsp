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
		   	  <li><a href="#"><span class="glyphicon glyphicon-user"></span>���ؿ��� ȯ���մϴ�.</a></li>
		   	  <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
		      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">������</a></li>
		          <li><a href="#">����������</a></li>
		          <li><a href="#">����������</a></li>
		          <li><a href="#">�ȷο� ��Ϻ���</a></li>
		          <li><a href="#">�α׾ƿ�</a></li>
		        </ul>
		      </li>
		      
		      
		      
		     <!--  <li><a href="#"><span class="glyphicon glyphicon-align-justify"></span></a></li> -->
	      <%-- </c:if> --%>
	      
	      <%-- <c:if test="${sessionScope.user.role != '1' || ${sessionScope.user.role != '2' || ${sessionScope.user.role != '3'}">
	      	  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>�α���</a></li>
		      <li><a href="#"><span class="glyphicon glyphicon-user"></span> ȸ������</a></li>
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

		//============= ���������� �̵� Event  ó�� =============   
		$(function() {
		   $("#logo").on("click" , function() {
		      self.location = "/index.jsp";
		   }); 
		});
		
		//============= toolbar portfolio �̵� Event ó�� =============
	    $(function() {
	         //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	          $("#portDesigner").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/portfolio/listPortfolio"
	          }); 
	    });
	   
	   //============= toolbar portfolio �̵� Event ó�� =============
	    $(function() {
	         //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	          $("#portDeveloper").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/portfolio/listPortfolio"
	          }); 
	    });
		
	   //============= toolbar user login �̵� Event ó�� =============
	   
	    $(function() {
	          $("a:contains('�α���')").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/user/login"
	          }); 
	    });
	   
	  //============= toolbar statistics getListTotalStatistics �̵� Event ó�� =============
		   
	    $(function() {
	          $("a:contains('Statistics')").on("click" , function() {
	            //$(self.location).attr("href","/user/logout");
	            self.location = "/statistics/getListTotalStatistics"
	          }); 
	    });
	  
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDesigner").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/getProject?projNo=1"
			}); 
		 });
		
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/getProject?projNo=1"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$(function() {
		 	$("a:contains('�ǸŻ�ǰ���')").on("click" , function() {
				self.location = "/product/addProductView.jsp"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('�ǸŻ�ǰ����')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('�� ǰ �� ��')").on("click" , function() {
				self.location = "/product/listProduct?menu=search"
			}); 
		});
	 	
	 	$(function() {
		 	$(".totalList").on("click" , function() {
				self.location = "/purchase/listSale"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('�����̷���ȸ')").on("click" , function() {
				self.location = "/purchase/listPurchase"
			}); 
		});
	 	
</script>  


