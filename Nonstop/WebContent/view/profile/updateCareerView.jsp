
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncUpdateCareer(){
		//Form 유효성 검증
	 	var careerUseTerm = $("input[name='careerUseTerm']").val();
		
	 	if(careerUseTerm == null || careerUseTerm.length<1){
			alert("기술 사용 경력은 반드시 입력하셔야 합니다.");
			return;
		}

		
			
		$("form").attr("method" , "POST").attr("action" , "/profile/updateCareer?careerNo=${param.careerNo}").submit();
	}
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "#update" ).on("click" , function() {
			//Debug..
			//alert("d");
			fncUpdateCareer();
		});
		
		 $( "#back" ).bind("click" , function() {
				//Debug..
				//alert("d");
				//self.location="/product/listProduct?menu=manage";	
		});
		 
	});	
	
	</script>

</head>

<body>

	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">개인기술정보</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="techName" class="col-sm-offset-1 col-sm-3 control-label">기술명</label>
		    <div class="col-sm-2">
		    <%--   <input type="text" class="form-control" id="techName" name="techName" value="${career.techName}"> --%>
		      
		      <select class="form-control" name="techNo" >
		      <c:if test="${career.techNo == '1000'}">
			 <option value="1000" selected="selected">Java</option>
			 <option value="1001" >Python</option>
			 <option value="1002" >PHP</option>
			 </c:if>
			 
			  <c:if test="${career.techNo == '1001'}">
			 <option value="1000">Java</option>
			  <option value="1001" selected="selected">Python</option>
			  <option value="1002">PHP</option>
			 </c:if>
			 
			  <c:if test="${career.techNo == '1002'}">
			   <option value="1000">Java</option>
			 <option value="1001">Python</option>
			 <option value="1002" selected="selected">PHP</option>
			 </c:if>
			 
			</select>
			
		    </div>
		  </div>
		
		 <div class="form-group">
		    <label for="careerUseTerm" class="col-sm-offset-1 col-sm-3 control-label">기술 사용기간</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="careerUseTerm" name="careerUseTerm" value="${career.careerUseTerm}" >
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="update" >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="back">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>