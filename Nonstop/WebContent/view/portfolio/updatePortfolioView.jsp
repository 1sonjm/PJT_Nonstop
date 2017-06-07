<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>updatePortfolio</title>
    
    
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
    </style>

    <script type="text/javascript">
    $(document).on('click', '#close-preview', function(){ 
        $('.image-preview').popover('hide');
        // Hover befor close the preview
        $('.image-preview').hover(
            function () {
               $('.image-preview').popover('show');
            }, 
             function () {
               $('.image-preview').popover('hide');
            }
        );    
    });


    $(function() {
        // Create the close button
        var closebtn = $('<button/>', {
            type:"button",
            text: 'x',
            id: 'close-preview',
            style: 'font-size: initial;',
        });
        closebtn.attr("class","close pull-right");
        // Set the popover default content
        $('.image-preview').popover({
            trigger:'manual',
            html:true,
            title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
            content: "There's no image",
            placement:'bottom'
        });
        // Clear event
        $('.image-preview-clear').click(function(){
            $('.image-preview').attr("data-content","").popover('hide');
            $('.image-preview-filename').val("");
            $('.image-preview-clear').hide();
            $('.image-preview-input input:file').val("");
            $(".image-preview-input-title").text("Browse"); 
        }); 
        // Create the preview image
        $(".image-preview-input input:file").change(function (){     
            var img = $('<img/>', {
                id: 'dynamic',
                width:250,
                height:200
            });      
            var file = this.files[0];
            var reader = new FileReader();
            // Set preview image into the popover data-content
            reader.onload = function (e) {
                $(".image-preview-input-title").text("Change");
                $(".image-preview-clear").show();
                $(".image-preview-filename").val(file.name);            
                img.attr('src', e.target.result);
                $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
            }        
            reader.readAsDataURL(file);
        });  
    });
    
    /* Validation Check */
    function fncAddPortfolio() {
    	
    	var portTitle=$("input[name='portTitle']").val();
    	var	portDetail=$("input[name='portDetail']").val();
    	var portFile=$("input[name='portFile']").val();
    	
    	if(portTitle == null || portTitle.length < 1){
    		alert("제목을 입력해 주세요.");
    		return;
    	}
    	
    	if(portDetail == null || portDetail.length < 1){
    		alert("포트폴리오에 대한 상세 설명을 기입해주세요.");
    		return;
    	}
    	
    	if(portFile == null || portFile.length < 1){
    		alert("이미지를 등록해주세요.");
    		return;
    	}
    	
    	alert("portTitle");
    	alert("portDetail");
    	alert("portFile");
    	alert($("#portDivision").val());
    	
    	/* $("form").attr("method" , "POST").attr("action" , "/portfolio/addPortfolio").submit(); */
    }




    $(function() {
    	
    	$(".btn.btn-primary.btn-block.btn-lg").on("click" , function() {
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

<div class="margin-top-120">
	<div class="container">
		<div class="row">
			<form class="form-horizontal" method="post" enctype="multipart/form-data">
	    		<fieldset>			
				<!-- Form Name -->
				<legend align="center">Update Portfolio</legend>
				
				<!-- Text input-->
				<div class="margin-top-30">
					<div class="form-group">
					  <label class="col-md-4 control-label">포트폴리오 제목</label>  
					  <div class="col-md-5">
					  	<input id="portTitle" name="portTitle" placeholder="${portfolio.portTitle}" class="form-control input-md" type="text">			    
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
						   <!-- image-preview-filename input [CUT FROM HERE]-->
				           <div class="input-group image-preview">
				              <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
				                <span class="input-group-btn">
				                    <!-- image-preview-clear button -->
				                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
				                        <span class="glyphicon glyphicon-remove"></span> Clear
				                    </button>
				                    <!-- image-preview-input -->
				                    <div class="btn btn-default image-preview-input">
				                        <span class="glyphicon glyphicon-folder-open"></span>
				                        <span class="image-preview-input-title">찾아보기</span>
				                        <input type="file" accept="image/png, image/jpeg, image/gif" name="portFileName" id="portFileName"/> <!-- rename it -->
				                    </div>
				                </span>
				            </div><!-- /input-group image-preview [TO HERE]--> 
						</div>
					</div>						
				
					<!-- Textarea -->
               		<div class="form-group">
               			<label class="col-md-4 control-label">상세내용</label>
					  	<div class="col-md-5">                     
                         <textarea class="form-control textarea" rows="13" name="portDetail" id="portDetail" placeholder="${portfolio.portDetail}"></textarea>
               			</div>
               		</div>
					

					
					<!-- Multiple Checkboxes -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="checkboxes">개발언어</label>
					  	<div class="row">
						  <div class="col-md-2">
						  	<div class="checkbox">
								<label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Java
						    	</label>
							</div>						  	
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="2" type="checkbox">
							      Python
							    </label>
							</div>							  
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="3" type="checkbox">
							      Php
							    </label>
							  </div>							 
							</div>
						</div>
					</div>
					
					<!-- Multiple Checkboxes -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="checkboxes">프레임워크</label>
					  	<div class="row">
						  <div class="col-md-2">
						  	<div class="checkbox">
								<label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Spring
						    	</label>
							</div>						  	
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Django
							    </label>
							</div>							  
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
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
						  <div class="col-md-2">
						  	<div class="checkbox">
								<label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Oracle
						    	</label>
							</div>						  	
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Mssql
							    </label>
							</div>							  
						  </div>
						  <div class="col-md-2">
							  <div class="checkbox">
							    <label for="checkboxes-0">
							      <input name="tuTechName" id="checkboxes-0" value="1" type="checkbox">
							      Mysql
							    </label>
							  </div>
						  </div>							 
						</div>
					  </div>				
					</div>	
					<br/>
					<br/>

					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<input type="submit" value="등록" class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>
						<div class="col-md-2">
							<a href="#" class="btn btn-success btn-block btn-lg">취소</a>
						</div>
					</div>	
		
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>