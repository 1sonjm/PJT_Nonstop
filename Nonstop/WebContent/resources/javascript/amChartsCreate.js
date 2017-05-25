/**
 * 
 */

function totalStatics(JSON){
	AmCharts.makeChart("chartdiv",{
		"type": "xy",
		"zoomOutButtonPadding": 20,
		"zoomOutButtonRollOverAlpha": 0.4,
		"zoomOutButtonColor":"#EEB3A7",
		"zoomOutText": "전체보기",
		"backgroundColor": "#E9E9E9",
		"fontSize": 12,
		"export": { "enabled": true },
		"chartCursor": { "enabled": true },
		"chartScrollbar": {
			"enabled": true,
			"dragIcon": "dragIconRectSmall",
			"hideResizeGrips": true,
			"oppositeAxis": false,
			"scrollbarHeight": 8,
			"selectedBackgroundColor": "#EEB3A7"
		},
		"graphs": [{
			"balloonText": "<b>[[techName]]</b> <br/>수요:<b>[[x]]</b> 공급:<b>[[y]]</b><br>회원비율:<b>[[value]]%</b>",
			"bullet": "diamond",
			"id": "AmGraph-1",
			"lineAlpha": 0,
			"lineColor": "#7CB064",
			"minBulletSize": 10,
			"valueField": "value",
			"xField": "x",
			"yField": "y"
		}],
		"valueAxes": [
			{
				"id": "supply",
				"axisAlpha": 0,
				"title": "공급",
				"titleFontSize": 15
			},
			{
				"id": "demand",
				"position": "bottom",
				"axisAlpha": 0,
				"title": "수요",
				"titleFontSize": 15
			}
		],
		"dataProvider": [
			// 이 아래로
			{"y": "10","x": "14","value": "1","techName": "java"},
			{"y": "5","x": "2","value": "20","techName": "aa"},
			{"y": "8","x": "3","value": "10","techName": "dd"},
			{"y": "9","x": "7","value": "11","techName": "ff"},
			{"y": "1","x": "3","value": "15","techName": "cc"},
			{"y": "6","x": "5","value": "16","techName": "gg"}
			// 이위로 반복문 통해 데이터 입력
		]
	} );
}
function majorStatics(){
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