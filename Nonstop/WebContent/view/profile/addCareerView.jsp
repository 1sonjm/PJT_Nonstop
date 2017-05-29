<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			 $( "#addCareer" ).on("click" , function() {
					fncAddCareer();
				//self.location ="/profile/addCareer?techNo="+$(this).attr('techNo')+"&careerUseTerm="+$(this).attr('careerUseTerm');
				//$("form").attr("method" , "POST").attr("action" , "/profile/addCareer").submit();
				});
 
		});	
		 function fncAddCareer(){
		 	
		 	$("form").attr("method" , "POST").attr("action" , "/profile/addCareer").submit();
		 }
	
	</script>		
    
</head>

<body>

	
	<div class="container">
	
		<h1 class="bg-primary text-center">개인기술 정보 등록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		  
		    <label for="techNo" class="col-sm-offset-1 col-sm-3 control-label">기술명</label> 
		    <div class="col-sm-4" id="techNo">
		     
		    <select class="form-control" name="techNo" >
			 <option value="1000">JAVA</option>
			 <option value="1001">python</option>
			 <option value="1002">php</option>
			</select>
		    </div>
		  </div>  
		  
		  <div class="form-group">
		    <label for="careerUseTerm" class="col-sm-offset-1 col-sm-3 control-label">사용기간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="careerUseTerm" name="careerUseTerm" placeholder="기술사용기간">
		    </div>
		  </div>
		  
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
		      <button type="button" class="btn btn-primary" id="addCareer" >등록</button>
		    
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>