<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

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
        
        .text-muted {
         color: black;
        }
        .row {
        height: 15px;
        } 
        
        #sizeChange1, #sizeChange2, #sizeChange3, #sizeChange4{
        	font-size : 17px;
        	margin : 10px;
        	font-weight:bold;
        }
       
        
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			 
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#updateUserV" ).on("click" , function() {
				 
				 var userId = $(this).attr('userId');
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#listUserV" ).on("click" , function() {
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
	       <h3>회원정보조회</h3>
	       <h5 >내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    
   		<div class="col-md-12 text-center">
   			<c:if test= "${empty user.image}">
               	<img class="img-circle" src="/resources/images/layout/defaultProfile.jpg" width="200" height="200" />
            </c:if>
            <c:if test= "${!empty user.image}">
				<img class="img-circle" src="/resources/images/upload/${user.image}" width="200" height="200" />
			</c:if>
        </div>
			
		
		<div class="col-md-12 text-center">
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
		
		<div class="form-group" >
	  		<div class="col-md-12 text-center " style="margin-top : 10px;">
				<button type="button" class="btn btn-primary" id="updateUserV"  userId="">회원정보수정</button>
				<a class="btn btn-primary btn" href="#" role="button" id = "listUserV">돌아가기</a>
				<a class="btn btn-primary btn" href="#" role="button" id = "deleteUser" userId="${user.userId}">회원탈퇴</a>
	  		</div>
		</div>
		
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>

<!-- 

<div class="container">
	<div class="row">
        <div class="profile-header-container">   
    		<div class="profile-header-img">
                <img class="img-circle" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" />
                badge
                <div class="rank-label-container">
                    <span class="label label-default rank-label">100 puntos</span>
                </div>
            </div>
        </div> 
	</div>
</div>

body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
}
/**
 * Profile image component
 */
.profile-header-container{
    margin: 0 auto;
    text-align: center;
}

.profile-header-img {
    padding: 54px;
}

.profile-header-img > img.img-circle {
    width: 120px;
    height: 120px;
    border: 2px solid #51D2B7;
}

.profile-header {
    margin-top: 43px;
}

/**
 * Ranking component
 */
.rank-label-container {
    margin-top: -19px;
    /* z-index: 1000; */
    text-align: center;
}

.label.label-default.rank-label {
    background-color: rgb(81, 210, 183);
    padding: 5px 10px 5px 10px;
    border-radius: 27px;
}
 -->