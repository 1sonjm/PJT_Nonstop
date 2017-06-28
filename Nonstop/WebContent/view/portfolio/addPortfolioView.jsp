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
    
	/* layout.css Style */
	.upload-drop-zone {
	  height: 200px;
	  border-width: 2px;
	  margin-bottom: 20px;
	}
	
	/* skin.css Style*/
	.upload-drop-zone {
	  color: #ccc;
	  border-style: dashed;
	  border-color: #ccc;
	  line-height: 200px;
	  text-align: center
	}
	.upload-drop-zone.drop {
	  color: #222;
	  border-color: #222;
	}
	
	
	
	.image-preview-input {
	    position: relative;
	    overflow: hidden;
	    margin: 0px;    
	    color: #333;
	    background-color: #fff;
	    border-color: #ccc;    
	}
	.image-preview-input input[type=file] {
		position: absolute;
		top: 0;
		right: 0;
		margin: 0;
		padding: 0;
		font-size: 20px;
		cursor: pointer;
		opacity: 0;
		filter: alpha(opacity=0);
	}
	.image-preview-input-title {
	    margin-left:2px;
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

   	    'use strict';

   	    // UPLOAD CLASS DEFINITION
   	    // ======================

   	    var dropZone = document.getElementById$("#drop-zone");
   	    var uploadForm = document.getElementById('js-upload-form');

   	    var startUpload = function(files) {
   	        console.log(files)
   	    }

   	    uploadForm.addEventListener('submit', function(e) {
   	        var uploadFiles = document.getElementById('js-upload-files').files;
   	        e.preventDefault()

   	        startUpload(uploadFiles)
   	    })

   	    dropZone.ondrop = function(e) {
   	        e.preventDefault();
   	        this.className = 'upload-drop-zone';

   	        startUpload(e.dataTransfer.files)
   	    }

   	    dropZone.ondragover = function() {
   	        this.className = 'upload-drop-zone drop';
   	        return false;
   	    }

   	    dropZone.ondragleave = function() {
   	        this.className = 'upload-drop-zone';
   	        return false;
   	    }

   	});

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
					  <div class="col-md-5"> 
					    <label class="radio-inline">
					      <input name="portDiv" id="portDiv" value="1" checked="checked" type="radio">
					      	개발
					      </label> 
					    <label class="radio-inline">
					      <input name="portDiv" id="portDiv" value="2" type="radio">
					       	디자인
					    </label>					 
					  </div>
					</div>
					
					<!-- Select Basic -->					
					<div class="form-group">
			 		 <label class="col-md-4 control-label">개발구분 상세</label>
			 			 <div class="col-md-5">			         
						    <select id="portDivision" name="portDivision" class="form-control">
						      <option value="10">웹+앱 개발</option>
						      <option value="11">웹사이트 개발</option>
						      <option value="12">어플리케이션 개발</option>
						      <option value="20">웹+앱 디자인</option>
						      <option value="21">웹사이트 디자인</option>
						      <option value="22">어플리케이션 디자인</option>
						    </select>
		 				</div>
					</div>			
					
					<div class="form-group">
						<label class="col-md-4 control-label">파일</label>  
					 	<div class="col-md-5">
					 		<input type="file" accept="image/png, image/jpeg, image/gif" name="portFileName[]" id="portFileName" multiple/>
						   <!-- image-preview-filename input [CUT FROM HERE]-->
				           <!-- <div class="input-group image-preview">
				              
								<input placeholder="" type="text" class="form-control image-preview-filename" disabled="disabled">
								don't give a name === doesn't send on POST/GET 
								<span class="input-group-btn"> 
									image-preview-clear button
									<button type="button" class="btn btn-default image-preview-clear" style="display:none;"> <span class="glyphicon glyphicon-remove"></span> Clear </button>
									image-preview-input
									<div class="btn btn-default image-preview-input"> 
										<span class="glyphicon glyphicon-folder-open"></span> 
										<span class="image-preview-input-title">Browse</span>
										<input type="file" accept="image/png, image/jpeg, image/gif" name="portFileName[]" id="portFileName" multiple/>
										rename it 
									</div>
									<button type="button" class="btn btn-labeled btn-default"> 
										<span class="btn-label">
											<i class="glyphicon glyphicon-upload"></i> 
										</span>Upload
									</button>
								</span> 

				            </div>/input-group image-preview [TO HERE] 
				            
				            <br />
					
							Drop Zone
							<div class="upload-drop-zone" id="drop-zone"> Or drag and drop files here </div>
							<br />
							Upload Finished
							<div class="js-upload-finished">
								<h4>Upload history</h4>
								<div class="list-group"> <a href="#" class="list-group-item list-group-item-danger"><span class="badge alert-danger pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue-01.xls</a> <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">23-11-2014</span>amended-catalogue.xls</a> </div>
							</div> -->
				            
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
					<div class="form-group">
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
					<div class="form-group">
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
					<div class="form-group">
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