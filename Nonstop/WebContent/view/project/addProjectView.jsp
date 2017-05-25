<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<html lang="ko">
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/blitzer/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function fncAddProject() {
		
		var projDivision = $("select[name='division']").val();
		var projTitle = $("input[name='projTitle']").val();
		var projAnnoEnd = $("input[name='projAnnoEnd']").val();
		var projStartDate = $("input[name='projStartDate']").val();
		var projEndDate = $("input[name='projEndDate']").val();
		var projDetail = $("input[name='projDetail']").val();
		
		
		$("input:hidden[name='projDivision']").val(projDivision);
		
		if(projTitle == null || projTitle.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		
		if(projAnnoEnd == null || projAnnoEnd.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		
		if(projStartDate == null || projStartDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		
		if(projEndDate == null || projEndDate.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		if(projDetail == null || projDetail.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		var projLocation = "";	
		if( $("select[name='projLocation1']").val() != ""  &&  $("select[name='projLocation2']").val() != "") {
			var projLocation = $("select[name='projLocation1']").val() + " " + $("select[name='projLocation2']").val();
		}

		$("input:hidden[name='projLocation']").val( projLocation );
		
		$("form").attr("method", "POST").attr("action", "/project/addProject").submit();
		
	}
	
	
	$(function() {
		
		$( "button.btn.btn-primary" ).bind("click", function(){
		
			fncAddProject();
		});
		
		
	
		$("#projStartDate").datepicker({dateFormat:"yy-mm-dd", 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

		});
		
		$("#projEndDate").datepicker({dateFormat:"yy-mm-dd", 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

		});
		
		$("#projAnnoEnd").datepicker({dateFormat:"yy-mm-dd", 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			  monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']

		});
		
		
		
		
	
	});
	

	</script>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품등록</h3>
	       <h5 class="text-muted">새 상품을 <strong class="text-danger">등록</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
		
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
		  
		  
		  <!-- <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  id="datepicker" name="manuDate" placeholder="이곳을 클릭하여 제조일자를 선택해 주세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >제조일자를 선택하세요</strong>
		      </span>
		    </div>
		  </div> -->
		  
		  
		  <div class="form-group">
		  <label for="projectDate" class="col-sm-offset-1 col-sm-3 control-label">소요기간</label>
			    <div class="col-sm-2">
			      <input type="text" class="form-control" id="projStartDate" name="projStartDate" readonly>
			    </div>
			    <div class="col-sm-2">
			      <input type="text" class="form-control" id="projEndDate" name="projEndDate" readonly>
			    </div>
		  </div>
		  
		  		
		  <div class="form-group">
		    <label for="projTitle" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
		    <div class="col-sm-5">
		      <input type="projTitle" class="form-control" id="projTitle" name="projTitle" placeholder="꼭 입력해주세요">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="projDetail" class="col-sm-offset-1 col-sm-3 control-label">상세내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="projDetail" name="projDetail" placeholder="가격을 입력해주세요">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="projLocation" class="col-sm-offset-1 col-sm-3 control-label">지역</label>
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
		    <input type="hidden" name="projLocation" />
		  </div>
		  
		  
		  
		  
		   <div class="form-group">
		  <label for="projAnnoEnd" class="col-sm-offset-1 col-sm-3 control-label">마감일</label>
			    <div class="col-sm-2">
			      <input type="text" class="form-control" id="projAnnoEnd" name="projAnnoEnd" readonly>
			    </div>
		  </div>
		  
		  
		   <!--css파트에 Inline form쪽에 아이콘합치는기능 실현해보기  -->
		   
		 <!--   <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="manuDate" class="form-control" id="manuDate" name="manuDate" readonly>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id><i class="glyphicon glyphicon-calendar" id="date4"></i></button>
		    </div>
		  </div> -->
		  
		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>




		<!-- 데이트픽커 -->
		<!-- <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  id="datepicker" name="manuDate" placeholder="이곳을 클릭하여 제조일자를 선택해 주세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger" >제조일자를 선택하세요</strong>
		      </span>
		    </div>
		  </div> -->
		  