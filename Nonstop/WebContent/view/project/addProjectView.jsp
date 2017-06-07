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
		
		
		var projLocation = "";	
		if( $("select[name='projLocation1']").val() != ""  &&  $("select[name='projLocation2']").val() != "") {
			var projLocation = $("select[name='projLocation1']").val() + " " + $("select[name='projLocation2']").val();
		}

		$("input:hidden[name='projLocation']").val( projLocation );
		alert(projUserId);
		alert(projDivision);
		alert(projTitle);
		alert(projAnnoEnd);
		alert(projStartDate);
		alert(projEndDate);
		alert(projDetail);
		alert(projLocation);
		
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

    </script>
    
    <!-- Include Required Prerequisites -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" /> -->
	 
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
    <script>
    /*데이트 픽커*/
    $(function() {
 		
 		var nowDate = new Date();
 		
 		$('#daterange1').on('change',function(){
 			
 			var ss1 = $('#daterange1').val().split(' ~ ')[0];
 			alert(ss1);
 			var ss3 = new Date(ss1);
 			alert(ss3);
 			var ss5 = ss3.getFullYear()+"/"+(ss3.getMonth()+1)+"/"+ss3.getDate();
 			$('input[name="projStartDate"]').val(ss5);
 			alert($('input[name="projStartDate"]').val());
 			
 			var ss2 = $('#daterange1').val().split(' ~ ')[1];
 			alert(ss2);
 			var ss4 = new Date(ss2);
 			alert(ss3);
 			var ss6 = ss4.getFullYear()+"/"+(ss4.getMonth()+1)+"/"+ss4.getDate();
 			$('input[name="projEndDate"]').val(ss6);
 			alert($('input[name="projEndDate"]').val());
 			
 			
 			
 			
 		/* 	$('input[name="projStartDate"]').val($('#daterange1').val().split(' ~ ')[0]);
 			$('input[name="projEndDate"]').val($('#daterange1').val().split(' ~ ')[1]); */
 		});
 		
 	
 		$('input[name="daterange1"]').daterangepicker({
 			"showDropdowns": true,
 			"locale": {
 					"format": "YYYY/MM/DD",
 					"separator": " ~ ",
 					"applyLabel": "적용",
 					"cancelLabel": "취소",
 					"weekLabel": "주",
 					"daysOfWeek": ["일","월","화","수","목","금","토"],
 					"monthNames": ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
 					"firstDay": 1
 			},
 			"showCustomRangeLabel": false,
 			"alwaysShowCalendars": true,
 			"startDate": nowDate,
 			"endDate": (nowDate,+1),
 			"opens": "left"
 		}, 
 		
 		function(start, end, label) {
 			//console.log('선택기간: ' + start.format('YYYY/MM/DD') + ' to ' + end.format('YYYY/MM/DD') + ' (' + label + ')');
 		});
 		
    });
    
	$(function() {
 		
 		var nowDate = new Date();
 		
 		$('input[name="daterange2"]').daterangepicker({
 			"singleDatePicker" : true,
 			"showDropdowns": true,
 			"locale": {
 					"format": "YYYY/MM/DD",
 					"applyLabel": "적용",
 					"cancelLabel": "취소",
 					"weekLabel": "주",
 					"daysOfWeek": ["일","월","화","수","목","금","토"],
 					"monthNames": ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
 					"firstDay": 1
 			},
 			"showCustomRangeLabel": false,
 			"alwaysShowCalendars": true,
 			"startDate": nowDate,
 			"endDate": (nowDate,+1),
 			"opens": "left"
 		}, 
 		
 		function(start, end, label) {
 			//console.log('선택기간: ' + start.format('YYYY/MM/DD') + ' to ' + end.format('YYYY/MM/DD') + ' (' + label + ')');
 		});
 		
 		
 		
 	/* 	var year = $('#daterange2').val().substr(0,4);
 		var month = $('#daterange2').val().substr(5,2);
 		var day = $('#daterange2').val().substr(8,2);
 		var date = new Date(year, month, day);
 		var date1 = new Date($('#daterange2').val());
 		alert(year);
 		alert(month);
 		alert(day);
 		alert(date);
 		alert(date1); */
 		$('#daterange2').on('change',function(){
 			
 			var ss1 = $('#daterange2').val();
 			var ss2 = new Date(yyyy,mm,dd);
 			ss2=dateToYYYYMMDD(ss2);
 			alert("asdfadsfdsa"+ss2);
 			var ss3 = ss2.getFullYear()+"/"+(ss2.getMonth()+1)+"/"+ss2.getDate();
 			$('input[name="projAnnoEnd"]').val(ss3);
 			alert($('input[name="projAnnoEnd"]').val());
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
			<form class="form-horizontal" >
			<input type="hidden" name="projUserId" value="${sessionScope.user.userId}">
	    		<fieldset>			
				<!-- Form Name -->
				<legend align="center">프로젝트 등록</legend>
				
				<!-- Text input-->
				<div class="margin-top-30">
					
					<!-- Multiple Radios (inline) -->
					<!-- <div class="form-group">
					  <label class="col-md-4 control-label">개발구분</label>
					  <div class="col-md-5"> 
					    <label class="radio-inline">
					      <input name="projDivision" id="projDivision" value="11" type="radio">
					      	개발/WEB
					      </label> 
					    <label class="radio-inline">
					      <input name="projDivision" id="projDivision" value="12" type="radio">
					       	개발/APP
					    </label>
					    <label class="radio-inline">
					      <input name="projDivision" id="projDivision" value="21" type="radio">
					       	디자이너/WEB
					    </label>
					    <label class="radio-inline">
					      <input name="projDivision" id="projDivision" value="22" type="radio">
					       	디자이너/APP
					    </label>					 
					  </div>
					</div> -->
					
					<div class="form-group">
					    <label for="division" class="col-sm-offset-1 col-sm-3 control-label">분류</label>
					    <div class="col-sm-2">
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
						<label class="col-md-4 control-label">소요기간</label>
						<div class="col-md-5">
							<input class="form-control" name="daterange1" type="text" id="daterange1"/>
							<input type="hidden" name="projStartDate" id="projStartDate" value="">
							<input type="hidden" name="projEndDate" id="projEndDate" value="">
						</div>
					</div>
					
					<div class="form-group">
					  <label class="col-md-4 control-label">프로젝트 제목</label>  
					  <div class="col-md-5">
					  	<input id="projTitle" name="projTitle" placeholder="제목을 입력해주세요" class="form-control input-md" type="text">					    
					  </div>
					</div>	
					
					<!-- Textarea -->
               		<div class="form-group">
               			<label class="col-md-4 control-label">상세내용</label>
					  	<div class="col-md-5">                     
                         <textarea class="form-control textarea" rows="13" name="projDetail" id="projDetail" placeholder="Message"></textarea>
               			</div>
               		</div>
					


					<div class="form-group">
					    <label for="projLocation" class="col-sm-offset-1 col-sm-3 control-label">지역</label>
					    <div class="row">
						    <div class="col-sm-2">
						    	<select class="form-control" name="projLocation1" id="projLocation1">
								  	<option value="서울" >서울</option>
									<option value="인천" >인천</option>
								</select>
								<select class="form-control" name="projLocation2" id="projLocation2">
								  	<option value="강서구" >강서구</option>
									<option value="부평구" >부평</option>
								</select>
						    </div>
					    </div>
					    <input type="hidden" name="projLocation" />
					</div>
					
					<div class="form-group">
						<label class="col-md-4 control-label">마감일</label>
						<div class="col-md-5">
							<input class="form-control" type="text" name="daterange2" id="daterange2" />
							<input type="hidden" name="projAnnoEnd" id="projAnnoEnd" value="">
						</div>
					</div>
					
					<!-- Multiple Checkboxes -->
				<!-- 	<div class="form-group">
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
					
					Multiple Checkboxes
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
					
					
					Multiple Checkboxes
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
					<br/> -->

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