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
		
	    
		var items = [];
		$("input:checkbox[name=tuTechNo]:checked").each(function(){
			items.push($(this).val());
		});
		
		$("input:hidden[name='checkBoxes']").val( items );
		
		var projLocation = "";	
		if( $("select[name='projLocation1']").val() != ""  &&  $("select[name='projLocation2']").val() != "") {
			var projLocation = $("select[name='projLocation1']").val() + " " + $("select[name='projLocation2']").val();
		}

		$("input:hidden[name='projLocation']").val( projLocation );
		
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
    
    
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/sunny/jquery-ui.css">
	
	<style>
		select{
			text-align : center;
		}
	</style>
	
    <script>
    
    $( function() {
	    $( "#projStartDate" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      buttonImage: "http://kr.seaicons.com/wp-content/uploads/2015/06/calendar-icon.png",
	      buttonImageOnly: true,
	      showButtonPanel: true,
	      buttonText: "Select date" 
	    });
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
	});
    
    $( function() {
	    $( "#projEndDate" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      buttonImage: "http://kr.seaicons.com/wp-content/uploads/2015/06/calendar-icon.png",
	      buttonImageOnly: true,
	      showButtonPanel: true,
	      buttonText: "Select date" 
	    });
	    $('#projEndDate').insertAfter( $('#projEndDate').next('img') );
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
	});
    
    $( function() {
	    $( "#projAnnoEnd" ).datepicker({
	      dateFormat : "yy-mm-dd",
	      buttonImage: "http://kr.seaicons.com/wp-content/uploads/2015/06/calendar-icon.png",
	      buttonImageOnly: true,
	      showButtonPanel: true,
	      buttonText: "Select date" 
	    });
	    $("img.ui-datepicker-trigger").attr("style", "width:35px; cursor: Pointer;");
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
						    <div class="col-sm-3">
						    	<select class="form-control" name="projLocation1" id="projLocation1">
								  	<option value="서울" >서울</option>
									<option value="인천" >인천</option>
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" name="projLocation2" id="projLocation2">
								  	<option value="강서구" >강서구</option>
									<option value="부평구" >부평</option>
								</select>
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



<!-- 

<select class="select-item1 middle left LOCATION_LIST_1">									
							<option value="">특별시.광역시.도</option><option value="02" >서울특별시</option>
<option value="031" >경기도</option>
<option value="032" >인천광역시</option>
<option value="033" >강원도</option>
<option value="041" >충청남도</option>
<option value="042" >대전광역시</option>
<option value="043" >충청북도</option>
<option value="044" >세종특별자치시</option>
<option value="051" >부산광역시</option>
<option value="052" >울산광역시</option>
<option value="053" >대구광역시</option>
<option value="054" >경상북도</option>
<option value="055" >경상남도</option>
<option value="061" >전라남도</option>
<option value="062" >광주광역시</option>
<option value="063" >전라북도</option>
<option value="064" >제주특별자치도</option>						</select>
						
<select name="v009" class="select-item2 middle LOCATION_LIST_2">									
	<option value="">시.군.구</option>
</select>
<select class="LOCATION_LIST_2_STORE" style="display:none"><option value="2" data-pv="02" >강남구</option>
<option value="3" data-pv="02" >강동구</option>
<option value="5" data-pv="02" >강북구</option>
<option value="7" data-pv="02" >강서구</option>
<option value="25" data-pv="02" >관악구</option>
<option value="30" data-pv="02" >광진구</option>
<option value="33" data-pv="02" >구로구</option>
<option value="41" data-pv="02" >금천구</option>
<option value="57" data-pv="02" >노원구</option>
<option value="65" data-pv="02" >도봉구</option>
<option value="66" data-pv="02" >동대문구</option>
<option value="75" data-pv="02" >동작구</option>
<option value="77" data-pv="02" >마포구</option>
<option value="107" data-pv="02" >서대문구</option>
<option value="110" data-pv="02" >서초구</option>
<option value="112" data-pv="02" >성동구</option>
<option value="113" data-pv="02" >성북구</option>
<option value="116" data-pv="02" >송파구</option>
<option value="133" data-pv="02" >양천구</option>
<option value="144" data-pv="02" >영등포구</option>
<option value="157" data-pv="02" >용산구</option>
<option value="164" data-pv="02" >은평구</option>
<option value="181" data-pv="02" >종로구</option>
<option value="185" data-pv="02" >중구</option>
<option value="188" data-pv="02" >중랑구</option>
<option value="1" data-pv="031" >가평군</option>
<option value="19" data-pv="031" >고양시</option>
<option value="24" data-pv="031" >과천시</option>
<option value="26" data-pv="031" >광명시</option>
<option value="29" data-pv="031" >광주시</option>
<option value="34" data-pv="031" >구리시</option>
<option value="38" data-pv="031" >군포시</option>
<option value="45" data-pv="031" >김포시</option>
<option value="54" data-pv="031" >남양주시</option>
<option value="73" data-pv="031" >동두천시</option>
<option value="90" data-pv="031" >부천시</option>
<option value="111" data-pv="031" >성남시</option>
<option value="119" data-pv="031" >수원시</option>
<option value="122" data-pv="031" >시흥시</option>
<option value="126" data-pv="031" >안산시</option>
<option value="127" data-pv="031" >안성시</option>
<option value="128" data-pv="031" >안양시</option>
<option value="132" data-pv="031" >양주시</option>
<option value="134" data-pv="031" >양평군</option>
<option value="136" data-pv="031" >여주시</option>
<option value="139" data-pv="031" >연천군</option>
<option value="152" data-pv="031" >오산시</option>
<option value="158" data-pv="031" >용인시</option>
<option value="168" data-pv="031" >의왕시</option>
<option value="169" data-pv="031" >의정부시</option>
<option value="170" data-pv="031" >이천시</option>
<option value="208" data-pv="031" >파주시</option>
<option value="210" data-pv="031" >평택시</option>
<option value="211" data-pv="031" >포천시</option>
<option value="213" data-pv="031" >하남시</option>
<option value="223" data-pv="031" >화성시</option>
<option value="9" data-pv="032" >강화군</option>
<option value="15" data-pv="032" >계양구</option>
<option value="52" data-pv="032" >남구</option>
<option value="53" data-pv="032" >남동구</option>
<option value="72" data-pv="032" >동구</option>
<option value="91" data-pv="032" >부평구</option>
<option value="106" data-pv="032" >서구</option>
<option value="137" data-pv="032" >연수구</option>
<option value="154" data-pv="032" >옹진군</option>
<option value="187" data-pv="032" >중구</option>
<option value="4" data-pv="033" >강릉시</option>
<option value="17" data-pv="033" >고성군</option>
<option value="76" data-pv="033" >동해시</option>
<option value="100" data-pv="033" >삼척시</option>
<option value="115" data-pv="033" >속초시</option>
<option value="129" data-pv="033" >양구군</option>
<option value="131" data-pv="033" >양양군</option>
<option value="146" data-pv="033" >영월군</option>
<option value="162" data-pv="033" >원주시</option>
<option value="172" data-pv="033" >인제군</option>
<option value="178" data-pv="033" >정선군</option>
<option value="197" data-pv="033" >철원군</option>
<option value="202" data-pv="033" >춘천시</option>
<option value="205" data-pv="033" >태백시</option>
<option value="209" data-pv="033" >평창군</option>
<option value="222" data-pv="033" >홍천군</option>
<option value="225" data-pv="033" >화천군</option>
<option value="226" data-pv="033" >횡성군</option>
<option value="14" data-pv="041" >계룡시</option>
<option value="23" data-pv="041" >공주시</option>
<option value="39" data-pv="041" >금산군</option>
<option value="58" data-pv="041" >논산시</option>
<option value="63" data-pv="041" >당진시</option>
<option value="83" data-pv="041" >보령시</option>
<option value="89" data-pv="041" >부여군</option>
<option value="108" data-pv="041" >서산시</option>
<option value="109" data-pv="041" >서천군</option>
<option value="124" data-pv="041" >아산시</option>
<option value="150" data-pv="041" >예산군</option>
<option value="196" data-pv="041" >천안시</option>
<option value="200" data-pv="041" >청양군</option>
<option value="206" data-pv="041" >태안군</option>
<option value="221" data-pv="041" >홍성군</option>
<option value="64" data-pv="042" >대덕구</option>
<option value="69" data-pv="042" >동구</option>
<option value="104" data-pv="042" >서구</option>
<option value="163" data-pv="042" >유성구</option>
<option value="183" data-pv="042" >중구</option>
<option value="31" data-pv="043" >괴산군</option>
<option value="59" data-pv="043" >단양군</option>
<option value="85" data-pv="043" >보은군</option>
<option value="143" data-pv="043" >영동군</option>
<option value="153" data-pv="043" >옥천군</option>
<option value="165" data-pv="043" >음성군</option>
<option value="180" data-pv="043" >제천시</option>
<option value="189" data-pv="043" >증평군</option>
<option value="193" data-pv="043" >진천군</option>
<option value="201" data-pv="043" >청주시</option>
<option value="203" data-pv="043" >충주시</option>
<option value="227" data-pv="044" >세종시</option>
<option value="6" data-pv="051" >강서구</option>
<option value="40" data-pv="051" >금정구</option>
<option value="42" data-pv="051" >기장군</option>
<option value="50" data-pv="051" >남구</option>
<option value="70" data-pv="051" >동구</option>
<option value="74" data-pv="051" >동래구</option>
<option value="87" data-pv="051" >부산진구</option>
<option value="94" data-pv="051" >북구</option>
<option value="96" data-pv="051" >사상구</option>
<option value="98" data-pv="051" >사하구</option>
<option value="105" data-pv="051" >서구</option>
<option value="118" data-pv="051" >수영구</option>
<option value="138" data-pv="051" >연제구</option>
<option value="142" data-pv="051" >영도구</option>
<option value="184" data-pv="051" >중구</option>
<option value="220" data-pv="051" >해운대구</option>
<option value="51" data-pv="052" >남구</option>
<option value="71" data-pv="052" >동구</option>
<option value="95" data-pv="052" >북구</option>
<option value="160" data-pv="052" >울주군</option>
<option value="186" data-pv="052" >중구</option>
<option value="49" data-pv="053" >남구</option>
<option value="60" data-pv="053" >달서구</option>
<option value="61" data-pv="053" >달성군</option>
<option value="68" data-pv="053" >동구</option>
<option value="93" data-pv="053" >북구</option>
<option value="103" data-pv="053" >서구</option>
<option value="117" data-pv="053" >수성구</option>
<option value="182" data-pv="053" >중구</option>
<option value="12" data-pv="054" >경산시</option>
<option value="13" data-pv="054" >경주시</option>
<option value="16" data-pv="054" >고령군</option>
<option value="35" data-pv="054" >구미시</option>
<option value="37" data-pv="054" >군위군</option>
<option value="44" data-pv="054" >김천시</option>
<option value="81" data-pv="054" >문경시</option>
<option value="86" data-pv="054" >봉화군</option>
<option value="101" data-pv="054" >상주시</option>
<option value="114" data-pv="054" >성주군</option>
<option value="125" data-pv="054" >안동시</option>
<option value="141" data-pv="054" >영덕군</option>
<option value="145" data-pv="054" >영양군</option>
<option value="148" data-pv="054" >영주시</option>
<option value="149" data-pv="054" >영천시</option>
<option value="151" data-pv="054" >예천군</option>
<option value="159" data-pv="054" >울릉군</option>
<option value="161" data-pv="054" >울진군</option>
<option value="167" data-pv="054" >의성군</option>
<option value="198" data-pv="054" >청도군</option>
<option value="199" data-pv="054" >청송군</option>
<option value="204" data-pv="054" >칠곡군</option>
<option value="212" data-pv="054" >포항시</option>
<option value="10" data-pv="055" >거제시</option>
<option value="11" data-pv="055" >거창군</option>
<option value="18" data-pv="055" >고성군</option>
<option value="46" data-pv="055" >김해시</option>
<option value="56" data-pv="055" >남해군</option>
<option value="82" data-pv="055" >밀양시</option>
<option value="97" data-pv="055" >사천시</option>
<option value="99" data-pv="055" >산청군</option>
<option value="130" data-pv="055" >양산시</option>
<option value="166" data-pv="055" >의령군</option>
<option value="192" data-pv="055" >진주시</option>
<option value="194" data-pv="055" >창녕군</option>
<option value="195" data-pv="055" >창원시</option>
<option value="207" data-pv="055" >통영시</option>
<option value="214" data-pv="055" >하동군</option>
<option value="215" data-pv="055" >함안군</option>
<option value="216" data-pv="055" >함양군</option>
<option value="218" data-pv="055" >합천군</option>
<option value="8" data-pv="061" >강진군</option>
<option value="21" data-pv="061" >고흥군</option>
<option value="22" data-pv="061" >곡성군</option>
<option value="28" data-pv="061" >광양시</option>
<option value="32" data-pv="061" >구례군</option>
<option value="47" data-pv="061" >나주시</option>
<option value="62" data-pv="061" >담양군</option>
<option value="78" data-pv="061" >목포시</option>
<option value="79" data-pv="061" >무안군</option>
<option value="84" data-pv="061" >보성군</option>
<option value="121" data-pv="061" >순천시</option>
<option value="123" data-pv="061" >신안군</option>
<option value="135" data-pv="061" >여수시</option>
<option value="140" data-pv="061" >영광군</option>
<option value="147" data-pv="061" >영암군</option>
<option value="155" data-pv="061" >완도군</option>
<option value="174" data-pv="061" >장성군</option>
<option value="176" data-pv="061" >장흥군</option>
<option value="190" data-pv="061" >진도군</option>
<option value="217" data-pv="061" >함평군</option>
<option value="219" data-pv="061" >해남군</option>
<option value="224" data-pv="061" >화순군</option>
<option value="27" data-pv="062" >광산구</option>
<option value="48" data-pv="062" >남구</option>
<option value="67" data-pv="062" >동구</option>
<option value="92" data-pv="062" >북구</option>
<option value="102" data-pv="062" >서구</option>
<option value="20" data-pv="063" >고창군</option>
<option value="36" data-pv="063" >군산시</option>
<option value="43" data-pv="063" >김제시</option>
<option value="55" data-pv="063" >남원시</option>
<option value="80" data-pv="063" >무주군</option>
<option value="88" data-pv="063" >부안군</option>
<option value="120" data-pv="063" >순창군</option>
<option value="156" data-pv="063" >완주군</option>
<option value="171" data-pv="063" >익산시</option>
<option value="173" data-pv="063" >임실군</option>
<option value="175" data-pv="063" >장수군</option>
<option value="177" data-pv="063" >전주시</option>
<option value="179" data-pv="063" >정읍시</option>
<option value="191" data-pv="063" >진안군</option>
<option value="228" data-pv="064" >제주시</option>
<option value="229" data-pv="064" >서귀포시</option></select>


 -->

