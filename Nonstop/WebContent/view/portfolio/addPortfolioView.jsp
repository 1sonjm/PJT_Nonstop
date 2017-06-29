<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>addPortfolio</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
	<script src="/resources/javascript/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/javascript/bootstrap.min.js"></script>
	
    <style>	
    legend {
    	border-bottom:0;
    }
    
	/* 체크박스 내부 라벨(사용기술) */
	.checkbox label {
		font-weight: 400;
		font-color: #000;
	}
	
	label {
		font-weight: 500;
		color: #666666;
	}
    </style>

    <script type="text/javascript">

    $(function() {
	    /* Validation Check */
	    function fncAddPortfolio() {
	    	
	    	var portTitle=$("input[name='portTitle']").val();
	    	var	portDetail=$("input[name='portDetail']").val();
	    	var portFile=$("input[name='portFile']").val();
	    	var portUserId=$("#portUserId").val();
	    	
	    	if(portTitle == ""){
	    		alert("제목을 입력해 주세요.");
	    		return;
	    	}
	    	
	    	if(portDetail == ""){
	    		alert("포트폴리오에 대한 상세 설명을 기입해주세요.");
	    		return;
	    	}
	    	
	    	if(portFile == ""){
	    		alert("이미지를 등록해주세요.");
	    		return;
	    	}
			
	    	/* 사용기술 넣는 부분 START */
	    	var items = [];
			$("input:checkbox[name=tuTechNo]:checked").each(function(){
				items.push($(this).val());
			});
			
			
			$("input:hidden[name='checkBoxes']").val( items );
			/* 사용기술 넣는 부분 END */
			
			alert("포트폴리오가 등록되었습니다.");
			
	    	$("form").attr("method" , "POST").attr("action" , "/portfolio/addPortfolio").submit();
			
	    }
    });

    $(function() {
	    $("#portDiv input").on("click" , function() {
			
			if($(this).val()==1){
				$("fieldset #techUse").css("display", "block");
				$("#portDivision").find("option").remove();
				$("#portDivision").append("<option value='10'>웹+앱 개발</option>");
				$("#portDivision").append("<option value='11'>웹사이트 개발</option>");
				$("#portDivision").append("<option value='12'>어플리케이션 개발</option>");
	
			}else{
				$("fieldset #techUse").css("display", "none");
				$("#portDivision").find("option").remove();
				$("#portDivision").append("<option value='20'>웹+앱 디자인</option>");
				$("#portDivision").append("<option value='21'>웹사이트 디자인</option>");
				$("#portDivision").append("<option value='22'>어플리케이션 디자인</option>");
			}
		});
    });
    
    $(function() {
    	
    	$("input:submit").on("click" , function() {
    		fncAddPortfolio();
    	});
    	
    	$(".btn.btn-success.btn-block.btn-lg").on("click" , function() {		
    		$("form")[0].reset(); 
    	});
    	
    });

    </script>
    
</head>
<body>

<!-- Navigation -->
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/view/common/toolbar.jsp" />
<!-- ToolBar End   /////////////////////////////////////-->

<div class="margin-top-100">
	<div class="container">
		<div class="row">
			<form class="form-horizontal" method="post" enctype="multipart/form-data">
			<input type="hidden" name="portUserId" id="portUserId" value="${sessionScope.user.userId}"/> 
	    		<fieldset>			
				<!-- Form Name -->
				<legend align="center"><strong>포트폴리오 등록</strong></legend>
				
				<!-- Text input-->
				<div class="margin-top-30">
					<div class="form-group">
					  <label class="col-md-4 control-label">포트폴리오 제목</label>  
					  <div class="col-md-5">
					  	<input id="portTitle" name="portTitle" placeholder="제목을 입력해주세요" class="form-control input-md" type="text">					    
					  </div>
					</div>
					
					<!-- Multiple Radios (inline) -->
					<div class="form-group">
					  <label class="col-md-4 control-label">개발구분</label>
					  <div class="col-md-5" id="portDiv"> 
					    <label class="radio-inline">
					      <input name="portDiv" value="1" type="radio">
					      	개발
					      </label> 
					    <label class="radio-inline">
					      <input name="portDiv" value="2" type="radio">
					       	디자인
					    </label>					 
					  </div>
					</div>
					
					<!-- Select Basic -->					
					<div class="form-group">
			 		 <label class="col-md-4 control-label">개발구분 상세</label>
			 			 <div class="col-md-5">			         
						    <select id="portDivision" name="portDivision" class="form-control">
						      <option value="0">개발구분을 먼저 선택해주세요</option>
						    </select>
		 				</div>
					</div>			
					
					<div class="form-group">
						<label class="col-md-4 control-label">파일</label>  
					 	<div class="col-md-5">
					 		<input type="file" accept="image/png, image/jpeg, image/gif, .pdf, .odp" name="portFileName[]" id="portFileName" multiple/>
						</div>
					</div>						
				
					<!-- Textarea -->
               		<div class="form-group">
               			<label class="col-md-4 control-label">상세내용</label>
					  	<div class="col-md-5">                     
                         <textarea class="form-control textarea" rows="13" name="portDetail" id="portDetail" placeholder="Message"></textarea>
               			</div>
               		</div>
					
					<!-- Multiple Checkboxes -->
					<div class="form-group" id="techUse" style="display: none">
						<label class="col-md-4 control-label" for="checkboxes">개발언어</label>
						<div class="row">
						
							<div class="col-md-1">
								<div class="checkbox">
									<label for="checkboxes-0">
								    	<input name="tuTechNo" id="Java" value="1000" type="checkbox">
								      	Java
								   	</label>
								</div>						  	
					  		</div>
						  	<div class="col-md-1">
								<div class="checkbox">
							    	<label for="checkboxes-0">
							      	<input name="tuTechNo" id="Python" value="1001" type="checkbox">
							     	Python
							    	</label>
								</div>							  
						  	</div>
						  	<div class="col-md-1">
								<div class="checkbox">
							    	<label for="checkboxes-0">
							      	<input name="tuTechNo" id="PHP" value="1002" type="checkbox">
							      	PHP
							    	</label>
								</div>							 
							</div>
						 	<div class="col-md-1">
						  		<div class="checkbox">
						    		<label for="checkboxes-0">
						      		<input name="tuTechNo" id="JavaScript" value="1003" type="checkbox">
						      		JavaScript
						    		</label>
						  		</div>							 
						  	</div>
						  	<div class="col-md-1">
						  		<div class="checkbox">
						    		<label for="checkboxes-0">
						      		<input name="tuTechNo" id="Swift" value="1004" type="checkbox">
						      		Swift
						    		</label>
						  		</div>
						  	</div>
					  
						</div>
					</div>
					
					<!-- Multiple Checkboxes -->
					<div class="form-group" id="techUse" style="display: none">
						<label class="col-md-4 control-label" for="checkboxes">프레임워크</label>
						<div class="row">
							<div class="col-md-1">
							  	<div class="checkbox">
									<label for="checkboxes-0">
								      <input name="tuTechNo" id="Spring" value="2000" type="checkbox">
								      Spring
							    	</label>
								</div>						  	
						  	</div>
							<div class="col-md-1">
								<div class="checkbox">
									<label for="checkboxes-0">
									<input name="tuTechNo" id="Django" value="2001" type="checkbox">
								      Django
								    </label>
								</div>							  
							</div>
						  	<div class="col-md-1">
								<div class="checkbox">
							    	<label for="checkboxes-0">
							      	<input name="tuTechNo" id="Symfony" value="2002" type="checkbox">
							      	Symfony
							    	</label>
							  	</div>							 
							</div>
							
						</div>
					</div>
					
					
					<!-- Multiple Checkboxes -->
					<div class="form-group" id="techUse" style="display: none">
					  <label class="col-md-4 control-label" for="checkboxes">DBMS</label>
					  	<div class="row">
						  <div class="col-md-1">
						  	<div class="checkbox">
								<label for="checkboxes-0">
							      <input name="tuTechNo" id="Oracle" value="3000" type="checkbox">
							      Oracle
						    	</label>
							</div>						  	
						  </div>
						  <div class="col-md-1">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechNo" id="MsSQL" value="3001" type="checkbox">
							      MsSQL
							    </label>
							</div>							  
						  </div>
						  <div class="col-md-1">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechNo" id="MySQL" value="3002" type="checkbox">
							      MySQL
							    </label>
							  </div>
						  </div>
						  <div class="col-md-1">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechNo" id="SQLite" value="3003" type="checkbox">
							      SQLite
							    </label>
							  </div>
						  </div>						 
						</div>
					  </div>				
					</div>
					<input type="hidden" name="checkBoxes"/>	
					<br/>
					<br/>
					<div class="margin-bottom-50">	
						<div class="row">
							<div class="col-md-2 col-md-offset-4">
								<input type="submit" value="등록" class="btn btn-primary btn-block" tabindex="7">
							</div>
							<div class="col-md-2">
								<a href="#" class="btn btn-default btn-block">취소</a>
							</div>
						</div>	
					</div>	
				</fieldset>
			</form>
		</div>
	</div>
</div>

</body>
</html>