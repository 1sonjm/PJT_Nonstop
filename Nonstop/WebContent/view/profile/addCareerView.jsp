<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="utf-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link href="/resources/css/nonstop.css" rel="stylesheet">
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
 			
			 $('#selectTechClass').on('change',function(){
					var a = "?techClass="+document.querySelector('#selectTechClass').value
					$.ajax("/statistics/getJSONListTechData"+a,{
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(jsonData) {
							//console.log(jsonData.techDataList[0].techName);
							document.querySelector("#selectTechData").innerHTML = "";
							for(var i=0;i<jsonData.techDataList.length;i++){
								document.querySelector("#selectTechData").innerHTML 
									+= "<option value='"+jsonData.techDataList[i].techNo+"'>"
												+jsonData.techDataList[i].techName
											+"</option>";
							}
						}
					});
				})
		});	
		 function fncAddCareer(){
		 	
		 	$("form").attr("method" , "POST").attr("action" , "/profile/addCareer").submit();
		 }
		 
		//동적 기술목록 호출
			
	
	</script>		
    
</head>

<body>

	
	<div class="container">
	
		<h1 class="bg-primary text-center">개인기술 정보 등록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		 
		  
		    <label for="techNo" class="col-sm-offset-1 col-sm-3 control-label">분류</label> 
		    
			<div class="form-group">
			<div class="col-md-2">
				<select class="form-control" id="selectTechClass" name="techClass">
					<c:forEach var="classValue" items="${techClassList}" begin="0" step="1">
						<option value="${classValue.techClass}">
							<c:choose>
								<c:when test="${classValue.techClass == 1}">Language</c:when>
								<c:when test="${classValue.techClass == 2}">Framework</c:when>
								<c:when test="${classValue.techClass == 3}">DBMS</c:when>
							</c:choose>
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		
		<label for="techNo" class="col-sm-offset-1 col-sm-3 control-label">기술명</label> 
			<div class="form-group" id="TechData">
			<div class="col-md-3">
				
				<select class="form-control" id="selectTechData"name="techNo" >
					<c:forEach var="career" items="${techDataList}" begin="0" step="1">
						<option value="${career.techNo}">${career.techName}</option>
					</c:forEach>
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