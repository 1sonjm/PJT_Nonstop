<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 지도오오오오오오오오ㅗ오오오 -->
<!-- http://jsfiddle.net/gh/get/jquery/1.11.0/highslide-software/highcharts.com/tree/master/samples/mapdata/countries/kr/kr-all -->

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--	///////////////////////// Font ////////////////////////// -->
<link href="https://fonts.googleapis.com/css?family=Oxygen|Syncopate" rel="stylesheet">

<!--	///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- highcharts javascript sources -->
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<!-- amCharts javascript sources -->
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/xy.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/pie.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
<!-- amCharts plugins -->
<script type="text/javascript" src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css">

<!-- CreatChart -->
<script src="/resources/javascript/chartsCreate.js"></script>


<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<style type="text/css">
.ui-datepicker-year{
		display:none;
}
</style>
<script type="text/javascript">
function getJsonDataList(type,addr){
	$.ajax("/statistics/"+addr,{
		method : "POST" ,
		dataType : "json" ,
		headers : {
			"Accept" : "application/json"//,
			//"Content-Type" : "application/json"
		},
		data:{
			techClass : $('#selectTechClass').val(),
			techNo : $('#selectTechData').val(),
			searchStartDate : $('input[name="dateStart"]').val(),
			searchEndDate : $('input[name="dateEnd"]').val()
		},
		success : function(jsonData) {
			if(jsonData.length != 0){
				//console.log(JSON.stringify(jsonData));
				switch(type){
				case "total":
					totalStatistics(jsonData);
					break;
				case "major":
					majorStatistics(jsonData,$('#selectViewDiv').val());
					break;
				case "period":
					statisticsByPeriod(jsonData);
					break;
				case "region":
					var highMap = new highMaps();
					highMap.init('???');
					break;
				case "techData":
					return jsonData;
					break;
				}
			}else{
				alert("조회된 정보가 없습니다.");
			}
		}
	});
}
function combineDate(input,count){
	var d = new Date(input);
	d.setMonth(d.getMonth()+1+count);
	return d.getFullYear()+"/"+d.getMonth()+"/"+d.getDate();
}

$(function(){
	var nowDate = combineDate(new Date(),0);
	getJsonDataList("total","getJSONListTotalStatistics");
	
	$('input[name="dateStart"]').val(combineDate(nowDate,-1));
	$('input[name="dateEnd"]').val(nowDate);

	$('li a:contains("전체 기술 집계")').on('click',function(){
		if($(this).attr('aria-expanded') != "true"){
			$('#searchInfo').css('display','none');
			getJsonDataList("total","getJSONListTotalStatistics");
			$('#tabIndex').val('1');
		}
	})
	$('li a:contains("과반수 사용 기술")').on('click',function(){
		if($(this).attr('aria-expanded') != "true"){
			$('#selectTechData').attr('disabled',true);
			$('#searchInfo').css('display','block');
			$('#searchTarget').css('display','block');
			$('#searchDate').css('display','none');
			$('#tabIndex').val('2');
		}
	})
	$('li a:contains("기간별 수요/공급")').on('click',function(){
		if($(this).attr('aria-expanded') != "true"){
			$('#selectTechData').attr('disabled',false);
			$('#searchInfo').css('display','block');
			$('#searchTarget').css('display','none');
			$('#searchDate').css('display','block');
			$('#tabIndex').val('3');
		}
	})
	$('li a:contains("지역별 수요/공급")').on('click',function(){
		if($(this).attr('aria-expanded') != "true"){
			$('#selectTechData').attr('disabled',true);
			$('#searchInfo').css('display','block');
			$('#searchTarget').css('display','block');
			$('#searchDate').css('display','none');
			$('#tabIndex').val('4');
		}
	})
	$('#search').on('click',function(){
		switch ($('#tabIndex').val()) {
		case '2':
			getJsonDataList("major","getJSONMajorStatisticsList");
			break;
		case '3':
			getJsonDataList("period","getJSONPeriodStatisticsList");
			break;
		case '4':
			var highMap = new highMaps();
			highMap.init();
			//highMap.init(getJsonDataList("region","getJSONRegionStatisticsList"));
			break;
		}
	})
	
	//동적 기술목록 호출
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
	
	//달력 생성
	$('#daterange').daterangepicker({
			"showDropdowns": true,
			"showWeekNumbers": true,
			"ranges": {
					"지난 1개월 간": [combineDate(nowDate,-1),nowDate],
					"지난 3개월 간": [combineDate(nowDate,-3),nowDate],
					"지난 6개월 간": [combineDate(nowDate,-6),nowDate],
					"지난 1년 간": [combineDate(nowDate,-12),nowDate],
					"지난 3년 간": [combineDate(nowDate,-36),nowDate]
			},
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
			"startDate": combineDate(nowDate,-6),
			"endDate": nowDate,
			"minDate": combineDate(nowDate,-40),//자료의 최초값 넣기
			"maxDate": nowDate,
			"opens": "left"
	}, function(start, end, label) {
		//console.log('선택기간: ' + start.format('YYYY/MM/DD') + ' to ' + end.format('YYYY/MM/DD') + ' (' + label + ')');
	});
});

function aa(){
	self.location = "https://192.168.0.16:8444/";
}
</script>

</head>
<body>

<jsp:include page="/view/common/toolbar.jsp" />

<div class="container">
	<h2>Dynamic Tabs</h2>
	<button onclick="aa()">채팅창으로 이동</button>
	<p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. Then add a .tab-pane class with a unique ID for every tab and wrap them inside a div element with class .tab-content.</p>
	<ul class="nav nav-pills nav-justified">
		<li class="active"><a data-toggle="tab" aria-expanded="true" href="#total">전체 기술 집계</a></li>
		<li><a data-toggle="tab" href="#major">과반수 사용 기술</a></li>
		<li><a data-toggle="tab" href="#period">기간별 수요/공급</a></li>
		<li><a data-toggle="tab" href="#region">지역별 수요/공급</a></li>
	</ul>
	<input type="hidden" id="tabIndex" value="0">
	<div class="row" id="searchInfo" style="display: none;">
		<div class="col-md-2">
			<div class="form-group">
				<span>분류</span>
				<select class="form-control" id="selectTechClass">
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
		<div class="col-md-3">
			<div class="form-group" id="TechData">
				<span>기술명</span>
				<select class="form-control" id="selectTechData">
					<c:forEach var="dataValue" items="${techDataList}" begin="0" step="1">
						<option value="${dataValue.techNo}">${dataValue.techName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<button type="button" class="btn btn-primary btn-lg btn-block" id="search">조회</button>
		</div>
		<div class="col-md-5" id="searchTarget">
			<span class="text-left">조회 대상</span>
			<select class="form-control" id="selectViewDiv">
				<option value="1">수요</option>
				<option value="2">공급</option>
				<option value="3">회원비율</option>
			</select>
		</div>
		<div class="col-md-5" id="searchDate">
			<span class="text-left">조회 기간</span>
			<input class="form-control" type="text" id="daterange"/>
			<input type="hidden" name="dateStart" value="">
			<input type="hidden" name="dateEnd" value="">
		</div>
	</div>
	<div class="tab-content">
		<div id="total" class="tab-pane active" style="width: 100%; height: 600px;">
		<span>기술 가진 회원에 따라 그림의 크기가 커집니다</span>
		</div>
		<div id="major" class="tab-pane" style="width: 100%; height: 600px;">
		</div>
		<div id="period" class="tab-pane" style="width: 100%; height: 600px;">
		</div>
		<div id="region" class="tab-pane" style="width: 100%; height: 600px;"></div>
	</div>
</div>
</body>
</html>