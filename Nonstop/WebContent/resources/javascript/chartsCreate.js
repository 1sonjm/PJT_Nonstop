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
	AmCharts.makeChart("total",{
		"type": "xy",
		"zoomOutButtonPadding": 20,
		"zoomOutButtonRollOverAlpha": 0.5,
		"zoomOutText": "전체보기",
		"startDuration": 0.55,
		"startEffect": "easeOutSine",
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
		"allLabels": [ 
			{
				"align": "right",
				"id": "Label-1",
				"size": 12,
				"text": "크기: 해당 기술을 쓸 수있는 회원비율",
				"x": "95%",
				"y": "0%"
			},{
				"align": "right",
				"id": "Label-2",
				"size": 11,
				"text": "지난 주간의 통계",
				"x": "98%",
				"y": "95%"
			}
		],
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


function majorStatistics(jsonData,target){
	var dataSet = [];
	for (var i=0; i<jsonData.dataList.length; i++){
//		console.log(jsonData.dataList[i].techNo
//				+"/"+jsonData.dataList[i].techName
//				+"/"+jsonData.dataList[i].techClass
//				+"/"+jsonData.dataList[i].demand
//				+"/"+jsonData.dataList[i].supply
//				+"/"+jsonData.dataList[i].userRate);
		
		switch (target) {
		case '1':
			dataSet.push({
				techName: jsonData.dataList[i].techName,
				ratio: jsonData.dataList[i].demand
			});
			break;
		case '2':
			dataSet.push({
				techName: jsonData.dataList[i].techName,
				ratio: jsonData.dataList[i].supply
			});
			break;
		case '3':
			dataSet.push({
				techName: jsonData.dataList[i].techName,
				ratio: jsonData.dataList[i].userRate
			});
			break;
		}
		
	}
	
	AmCharts.makeChart("major",{
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
		"allLabels": [ 
			{
				"align": "right",
				"id": "Label-1",
				"size": 12,
				"text": "지난 주간의 통계",
				"x": "95%",
				"y": "0%"
			}
		],
		"export": {	"enabled": true },
		"legend": {
			"enabled": true,
			"align": "center",
			"markerType": "circle",
			"valueAlign": "left",
			"valueText": ": [[value]]",
			"valueWidth": 40
		},
		"dataProvider": dataSet
	});
}

function statisticsByPeriod(jsonData){
	var dataSet = [];
	for (var i=0; i<jsonData.dataList.length; i++){
		console.log(jsonData.dataList[i].techNo
				+"/"+jsonData.dataList[i].techName
				+"/"+jsonData.dataList[i].techClass
				+"/"+jsonData.dataList[i].demand
				+"/"+jsonData.dataList[i].supply
		+"/"+jsonData.dataList[i].userRate
		+"/"+jsonData.dataList[i].date);
		
		dataSet.push({
			date: jsonData.dataList[i].regdate,
			demand: jsonData.dataList[i].demand,
			supply: jsonData.dataList[i].supply
		});
	}
	AmCharts.makeChart("period",
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
						"position": "right",
						"gridAlpha": 0,
						"title": "수요",
						"titleBold": false
					},
					{
						"id": "ValueAxis-2",
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
				"dataProvider": dataSet
			}
		);
}

/*
 *  - Highmaps
 * 	Example : http://www.highcharts.com/maps/demo/map-drilldown
 *  Document : http://api.highcharts.com/highmaps
 * */
function highMaps(jsonData) {
    
	var me = this;
	me.chart = null;
	me.event = {
		drillup : function(){
			
		}
	};
	
};
highMaps.prototype.init = function (jsonData){
	//alert(jsonData);
	var me = this;
	// 전국단위 지도 로드
	$.getJSON('/resources/json/0.json', function (geojson) {
        var data = Highcharts.geojson(geojson, 'map');
        $.each(data, function (i) {
        	this.drilldown = this.properties['code'];
        	/*
        	if(this.properties['name'] == '1'){
        		
        	}
        	*/
        	
        	switch(this.properties['name']){
        	case '서울특별시':
            	this.value = 123;
        		break;
        	case '부산광역시':
            	this.value = 445;
        		break;
        	case '대구광역시':
            	this.value = 789;
        		break;
        	case '인천광역시':
            	this.value = 756;
        		break;
        	case '광주광역시':
            	this.value = 154;
        		break;
        	case '대전광역시':
            	this.value = 783;
        		break;
        	case '울산광역시':
            	this.value = 453;
        		break;
        	case '세종특별자치시':
            	this.value = 195;
        		break;
        	case '경기도':
            	this.value = 45;
        		break;
        	case '강원도':
            	this.value = 59;
        		break;
        	case '충청북도':
            	this.value = 97;
        		break;
        	case '충청남도':
            	this.value = 210;
        		break;
        	case '전라북도':
            	this.value = 80;
        		break;
        	case '전라남도':
            	this.value = 70;
        		break;
        	case '경상북도':
            	this.value = 90;
        		break;
        	case '경상남도':
            	this.value = 375;
        		break;
        	case '제주특별자치도':
            	this.value = 678;
        		break;
        	}
        	
        });
        $('#region').highcharts('Map', {
        	credits: { enabled: false },
        	colorAxis: {
        		min : 0,
                minColor: '#d6d6d6',
                maxColor: '#d16464'},
            chart : {
                events: {
                	// drilldown : 클릭시 하위레벨로 진입
                    drilldown: function (e) {
                        if (!e.seriesOptions) {
                        	// 상위레벨에서 선택한 부분의 코드값에 따라 하위레벨이 결정
                            var chart = this, mapKey = e.point.drilldown;
                            $.getJSON('/resources/json/' + mapKey + '.json', function (geojson2) {
                                data = Highcharts.geojson(geojson2, 'map');
                                $.each(data, function (i) {
                                    this.value = i;
                                });
                                chart.addSeriesAsDrilldown(e.point, {
                                    name: e.point.name,
                                    data: data,
                                    showInLegend: false,
                                    cursor: 'pointer',
                                    dataLabels: {
                                        enabled: true,
                                        allowOverlap: false,
                                        format: '{point.name}',
                                    },
                                    tooltip: {
                                    	headerFormat: '',
                                        pointFormat: '{point.name}<br/>'
                                    }
                                });
                            });
                        }
                    },
                    drillup: function (e) {
                    	me.event.drillup();
                    }
                }
            },
            series : [{
                data : data,
                showInLegend: false,
                name: '전국',
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    allowOverlap: false,
                    shadow: false,
                    format: '{point.properties.name}'
                },
                tooltip: {
                	headerFormat: '',
                    pointFormat: '{point.properties.name}'
                },
            }],
            // 제목 제거
            title: null,
            // 부제목 제거
            subtitle: null,
            // 줌 설정
            mapNavigation: {
                enableMouseWheelZoom: true,
                enableTouchZoom : true
            },
            // 지역 선택시 하위 지도 띄우는 기능 설정
            drilldown: {
            	// 상위 지도 레이블 스타일 설정
                activeDataLabelStyle: {
                	color : '#000',
                	shadow: false,
                    textShadow: '0 0 0px #000000',
                    fontWeight: "none",
                    textDecoration: 'none'
                },
                // 상위 지도 버튼 스타일 설정
                drillUpButton: {
                    relativeTo: 'spacingBox'
                }
            },
        });
        me.chart = $("#chartdiv").highcharts();
    });
};



/*
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
}*/
