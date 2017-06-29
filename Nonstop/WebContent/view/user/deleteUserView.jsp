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
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .jumbotron {
    
    background-color: white;
    }
    
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
			
				$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				
				$("form").attr("method","POST").attr("action","/user/deleteUser").attr("target","_parent").submit();
				
			});
		});	
		
				$( function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#index").on("click" , function() {
						self.location = "../index.jsp"
					});
				});	
		
	
		
		
		
		
	</script>		
	
</head>

<body>

	
	<%-- <jsp:include page="/view/common/toolbar.jsp" /> --%>
   	<<jsp:include page="/view/common/toolbar.jsp" />
	
	<div class="container">
		
		<div class="row">
		
			
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">회원탈퇴</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" placeholder="중복확인하세요"  readonly>
		      
		      	
		      </span>
		    </div>
		  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >회원탈퇴</button>
					      <br/><br/>
					      <a class="btn btn-primary btn" href="#" role="button" id = "index">메인으로</a>	
					      			      					      
					    </div>
					  </div>
					  
					  
					  
	
</script>
  
  
  
			 
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	
 	</div>
 	

</body>

</html>