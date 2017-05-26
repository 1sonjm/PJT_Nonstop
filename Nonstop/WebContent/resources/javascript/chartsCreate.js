/**
 * 
 */

function totalStatistics(jsonData){
	var dataSet1 = [];
	var dataSet2 = [];
	var dataSet3 = [];
	
	for (var i=0; i<jsonData.dataList.length; i++){
//		console.log(jsonData.dataList[i].techNo
//				+"/"+jsonData.dataList[i].techName
//				+"/"+jsonData.dataList[i].techClass
//				+"/"+jsonData.dataList[i].demand
//				+"/"+jsonData.dataList[i].supply
//				+"/"+jsonData.dataList[i].userRate);
		
		switch(jsonData.dataList[i].techClass){
			case 1:
				dataSet1.push({
					x: jsonData.dataList[i].demand,
					y: jsonData.dataList[i].supply,
					value: jsonData.dataList[i].userRate,
					techName: jsonData.dataList[i].techName
				});
				break;
			case 2:
				dataSet2.push({
					x2: jsonData.dataList[i].demand,
					y2: jsonData.dataList[i].supply,
					value2: jsonData.dataList[i].userRate,
					techName2: jsonData.dataList[i].techName
				});
				break;
			case 3:
				dataSet3.push({
					x3: jsonData.dataList[i].demand,
					y3: jsonData.dataList[i].supply,
					value3: jsonData.dataList[i].userRate,
					techName3: jsonData.dataList[i].techName
				});
				break;
		}
	}
	AmCharts.makeChart("chartdiv",{
		"type": "xy",
		"zoomOutButtonPadding": 20,
		"zoomOutButtonRollOverAlpha": 0.5,
		"zoomOutText": "전체보기",
		"startDuration": 0.55,
		"startEffect": "easeOutSine",
		"backgroundColor": "#F4F4F4",
		"borderColor": "#F6F6F6",
		"fontSize": 12,
		"export": {"enabled": true},
		"chartCursor": {"enabled": true},
		"chartScrollbar": {
			"enabled": true,
			"dragIcon": "dragIconRectSmall",
			"hideResizeGrips": true,
			"oppositeAxis": false,
			"scrollbarHeight": 8,
			"selectedBackgroundColor": "#EEB3A7"
		},
		"graphs": [
			{
				"balloonText": "<b>[[techName]]</b> <br/>수요:<b>[[x]]</b> 공급:<b>[[y]]</b><br>회원비율:<b>[[value]]%</b>",
				"bullet": "diamond",
				"id": "AmGraph-1",
				"labelPosition": "right",
				"labelText": "[[techName]]",
				"lineAlpha": 0,
				"lineColor": "#7CB064",
				"minBulletSize": 10,
				"title": "Language",
				"valueField": "value",
				"xField": "x",
				"yField": "y"
			},
			{
				"balloonText": "<b>[[techName2]]</b> <br/>수요:<b>[[x]]</b> 공급:<b>[[y]]</b><br>회원비율:<b>[[value]]%</b>",
				"bullet": "diamond",
				"id": "AmGraph-2",
				"labelPosition": "right",
				"labelText": "[[techName2]]",
				"lineAlpha": 0,
				"lineColor": "#ad3456",
				"minBulletSize": 10,
				"title": "Framework",
				"valueField": "value2",
				"xField": "x2",
				"yField": "y2"
			},
			{
				"balloonText": "<b>[[techName3]]</b> <br/>수요:<b>[[x]]</b> 공급:<b>[[y]]</b><br>회원비율:<b>[[value]]%</b>",
				"bullet": "diamond",
				"id": "AmGraph-3",
				"labelPosition": "right",
				"labelText": "[[techName3]]",
				"lineAlpha": 0,
				"lineColor": "#4578bb",
				"minBulletSize": 10,
				"title": "DBMS",
				"valueField": "value3",
				"xField": "x3",
				"yField": "y3"
			}
		],
		"valueAxes": [
			{"id": "xAxis","axisAlpha": 0,"title": "공급","titleBold": false,"titleFontSize": 15},
			{"id": "yAxis","position": "bottom","axisAlpha": 0,"title": "수요","titleBold": false,"titleFontSize": 15}
		],
		"legend": {"enabled": true},
		"dataProvider": dataSet1.concat(dataSet2.concat(dataSet3))
	} );
}
function majorStatistics(){
	AmCharts.makeChart("chartdiv",{
		"type": "pie",
		"angle": 30,
		"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
		"depth3D": 15,
		"innerRadius": "50%",
		"labelRadius": 34,
		"labelText": "[[title]]<br>[[percents]]%",
		"radius": "45%",
		"baseColor": "#B14A43",
		"pullOutDuration": 0.4,
		"pullOutEffect": "easeInSine",
		"startDuration": 0.5,
		"startEffect": "easeOutSine",
		"titleField": "techName",
		"valueField": "ratio",
		"backgroundColor": "#E9E9E9",
		"fontSize": 12,
		"theme": "default",
		"export": {	"enabled": true },
		"legend": {
			"enabled": true,
			"align": "center",
			"markerType": "circle",
			"valueAlign": "left",
			"valueText": ": [[value]]",
			"valueWidth": 40
		},
		"dataProvider": [
			// 이 아래로
			{"techName": "java","ratio": 8},
			{"techName": "spring","ratio": 6},
			{"techName": "cwr","ratio": "3"},
			{"techName": "qwe","ratio": "2"},
			{"techName": "asdf","ratio": "2"},
			{"techName": "기타","ratio": "1"}
			// 이위로 반복문 통해 데이터 입력
		]
	});
}

function statisticsByPeriod(){
	
	AmCharts.makeChart("chartdiv",
			{
				"type": "serial",
				"categoryField": "date",
				"columnSpacing": 3,
				"columnWidth": 0.62,
				"rotate": true,
				"synchronizeGrid": true,
				"marginBottom": 25,
				"marginLeft": 65,
				"marginRight": 25,
				"marginTop": 70,
				"startDuration": 0.4,
				"startEffect": "easeOutSine",
				"accessible": false,
				"backgroundColor": "#E9E9E9",
				"fontSize": 12,
				"hideBalloonTime": 0,
				"export": {"enabled": true},
				"categoryAxis": {
					"gridPosition": "start",
					"titleBold": false
				},
				"graphs": [
					{
						"balloonText": "[[title]]:[[value]]",
						"bulletBorderThickness": 0,
						"fillAlphas": 1,
						"fillColors": "#D67255",
						"id": "AmGraph-1",
						"lineColor": "undefined",
						"title": "수요",
						"type": "column",
						"valueField": "demand"
					},
					{
						"balloonText": "[[title]]:[[value]]",
						"fillAlphas": 1,
						"fillColors": "#7CB064",
						"id": "AmGraph-2",
						"lineColor": "undefined",
						"lineThickness": 0,
						"tabIndex": -1,
						"title": "공급",
						"type": "column",
						"valueAxis": "ValueAxis-2",
						"valueField": "supply"
					}
				],
				"valueAxes": [
					{
						"id": "ValueAxis-1",
						"title": "수요",
						"titleBold": false
					},
					{
						"id": "ValueAxis-2",
						"position": "right",
						"gridAlpha": 0,
						"title": "공급",
						"titleBold": false
					}
				],
				"balloon": {
					"borderThickness": 3,
					"fadeOutDuration": 0,
					"fillAlpha": 1,
					"pointerWidth": 10,
					"shadowAlpha": 0
				},
				"legend": {
					"enabled": true,
					"useGraphSettings": true
				},
				"dataProvider": [
					// 이 아래로
					{"date": "2017.1","demand": "21","supply": "20"},
					{"date": "2017.2","demand": "11","supply": "100"},
					{"date": "2017.3","demand": "15","supply": "30"},
					{"date": "2017.4","demand": "123","supply": "20"}
					// 이위로 반복문 통해 데이터 입력
				]
			}
		);
}

function statisticsByRegion(){
	var data = [
	    ['kr-so', 15],//서울
	    ['kr-4194', 20],//??
	    ['kr-in', 10],//인천
	    ['kr-kg', 20],//경기
	    ['kr-kw', 11],//강원
	    ['kr-sj', 7],//세종
	    ['kr-tj', 8],//대전
	    ['kr-gn', 12],//경남
	    ['kr-gb', 14],//경북
	    ['kr-kj', 17]//경주
	    ['kr-cb', 2],//전북
	    ['kr-2685', 4],//전남
	    ['kr-tg', 16],//대구
	    ['kr-pu', 5],//부산
	    ['kr-ul', 9],//울산
	    ['kr-kn', 3],//경남
	    ['kr-2688', 6],//경북
	    ['kr-cj', 20],//??
	];
	
	// Create the chart
	Highcharts.mapChart('region', {
	    chart: {map: 'countries/kr/kr-all'},
	    title: {text: 'Highmaps basic demo'},
	    subtitle: {text: 'Source map: <a href="http://code.highcharts.com/mapdata/countries/kr/kr-all.js">South Korea</a>'},
	    mapNavigation: {
	        enabled: true,
	        buttonOptions: {verticalAlign:'bottom'}
	    },
	    colorAxis: {min: 0},
	
	    series: [{
	        data: data,
	        name: 'Random data',
	        states: {
	            hover: {
	                color: '#BADA55'
	            }
	        },
	        dataLabels: {
	            enabled: true,
	            format: '{point.name}'
	        }
	    }]
	});
}