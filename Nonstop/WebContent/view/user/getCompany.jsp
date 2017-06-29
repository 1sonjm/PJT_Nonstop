<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<!-- Awesome Font -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="/resources/javascript/jquery.js"></script>

<!-- <script src="/resources/javascript/bootstrap.min.js"></script> -->

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
   integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
   crossorigin="anonymous"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/css/nonstop.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/full.css" rel="stylesheet"> 


	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
            }
            .text-info{
         color: black;
         padding-left: 10px;
        }
        

        
         #sizeChange1, #sizeChange2, #sizeChange3, #sizeChange4, #sizeChange5, #sizeChange6, #sizeChange7{
        	font-size : 17px;
        	margin : 10px;
        	font-weight:bold;
        }
       

        .text-muted {
         color: black;
        }
        .row {
        height: 15px;
        } 
        

     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		  $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#updateCompanyV" ).on("click" , function() {
					self.location = "/user/updateCompany?userId=${user.userId}"
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#listCompanyX" ).on("click" , function() {
						self.location = "/index.jsp"
					});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#deleteUser" ).on("click" , function() {
					 var userId = $(this).attr('userId')
					 
					 self.location = "/user/deleteUser?userId="+userId;
						
					});
			});
		
		
		
		
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/common/toolbar.jsp" />
   	 <!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	    <div class="col-md-12 text-center" style="margin-bottom : 10px;">
	       <h3>기업정보조회</h3>
	       <h5 >기업 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
		
		<div class="col-md-12 text-center">
            <c:if test="${empty user.image}">
				<img class="img-circle" src="/resources/images/layout/defaultProfile.jpg" width="200" height="200" />
			</c:if>
            <c:if test="${!empty user.image}">
				<img class="img-circle" src="/resources/images/upload/${user.image}" width="200" height="200" />
			</c:if>
        </div>
		
		<div class="col-md-12 text-center" style=" margin-bottom: 30px;">
			<h3>${user.userId}</h3>
		</div>
		
		<div class="col-md-12" id="sizeChange1">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-user" ></i></div>
			<div class="col-xs-7" >${user.userName}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange2">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-earphone" ></i></div>
			<div class="col-xs-7" >${ !empty user.tel ? user.tel : ''}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange3">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-home" ></i></div>
			<div class="col-xs-7" >${user.addr}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange4">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-envelope" ></i></div>
			<div class="col-xs-7" >${user.email}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange5">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="fa fa-building" aria-hidden="true"></i></div>
			<div class="col-xs-7" >${user.companyName}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange6">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-king" ></i></div>
			<div class="col-xs-7" >${user.empNum}</div>
		</div>
		
		<div class="col-md-12" id="sizeChange7">
	  		<div class="col-xs-5 " style="text-align : right; color:#c8c6c6;"><i class="glyphicon glyphicon-globe" ></i></div>
			<div class="col-xs-7" >${user.pubDate}</div>
		</div>
		
		

		<div class="form-group" >
	  		<div class="col-md-12 text-center " style="margin-top : 30px;">
				<a class="btn btn-primary btn" href="#" role="button" id = "updateCompany">기업정보수정</a>	
				<a class="btn btn-primary btn" href="#" role="button" id = "listCompany">돌아가기</a>

	<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주소</strong></div>
			<div class="col-xs-8 col-md-4">${user.addr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>연락처</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.tel ? user.tel : ''}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>기업명</strong></div>
			<div class="col-xs-8 col-md-4">${user.companyName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>직원수</strong></div>
			<div class="col-xs-8 col-md-4">${user.empNum}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>설립일</strong></div>
			<div class="col-xs-8 col-md-4">${user.pubDate}</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			
				<a class="btn btn-primary btn" href="#" role="button" id = "updateCompanyV">회원정보수정</a>	
	  		</div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			
				<a class="btn btn-primary btn" href="#" role="button" id = "listCompanyX">돌아가기</a>
	  		</div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			

				<a class="btn btn-primary btn" href="#" role="button" id = "deleteUser" userId="${user.userId}">회원탈퇴</a>
	  		</div>
		</div>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>