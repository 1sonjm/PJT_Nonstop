<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>addProject</title>
    
	
    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/nonstop.css" rel="stylesheet">
	
	
    <!-- Custom CSS -->
    <link href="/resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
 	<script src="/resources/javascript/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/javascript/bootstrap.min.js"></script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
    <style>	
    legend {
    	border-bottom:0;
    }
    
    </style>

    <script type="text/javascript">

	
    
    /* Validation Check */
   function fncAddProject() {
	    var projUserId = $("input[name='projUserId']").val();
	    var projDivision = $("select[name='division']").val();
		var projTitle = $("input[name='projTitle']").val();
		var projAnnoEnd = $("input[name='projAnnoEnd']").val();
		var projStartDate = $("input[name='projStartDate']").val();
		var projEndDate = $("input[name='projEndDate']").val();
		var projDetail = $("textarea[name='projDetail']").val();
		
		/*String을 Date로 형변환*/
		$("input:hidden[name='projDivision']").val(projDivision);
		
		if(projTitle == null || projTitle.length<1){
			alert("개발구분은 반드시 선택해야 합니다.");
			return;
		}
		
		if(projAnnoEnd == null || projAnnoEnd.length<1){
			alert("마감일은 반드시 입력하여야 합니다.");
			return;
		}
		
		if(projStartDate == null || projStartDate.length<1){
			alert("소요기간은 반드시 입력하셔야 합니다.");
			return;
		}
		
		if(projEndDate == null || projEndDate.length<1){
			alert("소요기간은 반드시 입력하셔야 합니다.");
			return;
		}
		
		if(projDetail == null || projDetail.length<1){
			alert("상세정보는 반드시 입력하셔야 합니다.");
			return;
		}
		
	    
		var items = [];
		$("input:checkbox[name=tuTechNo]:checked").each(function(){
			items.push($(this).val());
		});
		
		$("input:hidden[name='checkBoxes']").val( items );
		
		var projLocation = $("#projLocation").val();
		var projLocationArray=projLocation.split(" ");
		var location = projLocationArray[0]+" "+projLocationArray[1];

		$("input:hidden[name='projLocation']").val( location );
		
		$("form").attr("method", "POST").attr("action", "/project/addProject").submit();
		
	}
    
   $(function() {
		
		$( "#ok" ).bind("click", function(){
		
			fncAddProject();
		});
   });
   
   
   $(function() {
		
		$( "#cancle" ).bind("click", function(){
		
			history.go(-1);
		});
   });
   
   function projLocation_daumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               var fullAddr = ''; 

               if (data.userSelectedType === 'R') { 
                   fullAddr = data.roadAddress;

               } else { 
                   fullAddr = data.jibunAddress;
               }
               
               $("#projLocation").val(fullAddr);
           }
       }).open();
   }

    </script>
    
    
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/cupertino/jquery-ui.css">
	
	<style>
		select{
			text-align : center;
		}
	</style>
	
    <script>
    
    $( function() {
	    $( "#projStartDate" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ], 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    });
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
	});
    
    $( function() {
	    $( "#projEndDate" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ], 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    });
	    $('#projEndDate').insertAfter( $('#projEndDate').next('img') );
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
	});
    
    $( function() {
	    $( "#projAnnoEnd" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ], 
		  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    });
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
	});
    
    </script>
    
</head>
<body>

<!-- Navigation -->
<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/view/common/toolbar.jsp" />
<!-- <c:import url="/user/toolbarMailCheck"/> -->
<!-- ToolBar End   /////////////////////////////////////-->

<div class="margin-top-120">
	<div class="container">
		<div class="row">
			<form class="form-horizontal" >
			<input type="hidden" name="projUserId" value="${sessionScope.user.userId}">
	    		<fieldset>			
				<!-- Form Name -->
				<legend align="center">프로젝트 등록</legend>
				
				<!-- Text input-->
				<div class="margin-top-30">
					<div class="form-group">
					    <label for="division" class="col-sm-offset-1 col-sm-2 control-label">분류</label>
					    <div class="col-sm-3">
					    	<select class="form-control" name="division" id="division">
							  	<option value="11" >개발/WEB</option>
								<option value="12" >개발/APP</option>
							  	<option value="21" >디자이너/WEB</option>
								<option value="22" >디자이너/APP</option>
							</select>
					    </div>
					    <input type="hidden" name="projDivision"  />
					</div>
					
					<!-- Select Basic -->					
					<div class="form-group">
					  <label for="projectDate" class="col-sm-offset-1 col-sm-2 control-label">소요기간</label>
						    <div class="col-sm-3">
						      <input type="text" class="form-control" id="projStartDate" name="projStartDate" readonly>
						    </div>
						    <div class="col-sm-3">
						      <input type="text" class="form-control" id="projEndDate" name="projEndDate" readonly>
						    </div>
					</div>
					
					<div class="form-group">
					  <label class="col-md-3 control-label">프로젝트 제목</label>  
					  <div class="col-md-6">
					  	<input id="projTitle" name="projTitle" placeholder="제목을 입력해주세요" class="form-control input-md" type="text">					    
					  </div>
					</div>	
					
					<!-- Textarea -->
               		<div class="form-group">
               			<label class="col-md-3 control-label">상세내용</label>
					  	<div class="col-md-6">                     
                         <textarea class="form-control textarea" rows="13" name="projDetail" id="projDetail" placeholder="Message"></textarea>
               			</div>
               		</div>
					
					
					   
					<div class="form-group">
					    <label for="projLocation" class="col-sm-offset-1 col-sm-2 control-label">지역</label>
						    <div class="col-sm-1" style="height : 39px">
							    <input  class="form-btn" type="button" onclick="projLocation_daumPostcode()" value="주소 찾기" style="height : 100%">
							</div>
							<div class="col-sm-5">
							    <input class="form-control" type="text" id="projLocation" placeholder="주소">
							</div>
					    <input type="hidden" name="projLocation" />
					</div>
					
			
					<div class="form-group">
						<label class="col-md-3 control-label">마감일</label>
						<div class="col-md-3">
							<input class="form-control" type="text" name="projAnnoEnd" id="projAnnoEnd" readonly />
						</div>
					</div> 
					
					<!-- Multiple Checkboxes -->
					<div class="form-group">
					  <label class="col-md-3 control-label" for="checkboxes">개발언어</label>
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
					
					<div class="form-group">
					  <label class="col-md-3 control-label" for="checkboxes">프레임워크</label>
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
					
					
					<div class="form-group">
					  <label class="col-md-3 control-label" for="checkboxes">DBMS</label>
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
					 <input type="hidden" name="checkBoxes"/>
					<br/>		

					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<button type="button" class="btn btn-primary btn-block btn-lg" id="ok" tabindex="7">등&nbsp;록</button>
						</div>
						<div class="col-md-2">
							<a href="#" class="btn btn-success btn-block btn-lg" id="cancle">취&nbsp;소</a>
						</div>
					</div>
					
		
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>



