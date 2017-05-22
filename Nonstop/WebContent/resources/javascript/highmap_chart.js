/*
 *  - Highmaps
 * 	Example : http://www.highcharts.com/maps/demo/map-drilldown
 *  Document : http://api.highcharts.com/highmaps
 * */
function highMaps() {
    
	var me = this;
	me.chart = null;
	me.event = {
		drillup : function(){
			
		}
	};
	
	this.init();
};
highMaps.prototype.init = function(){
	var me = this;
	// 전국단위 지도 로드
	$.getJSON('../../resources/json/0.json', function (geojson) {
        var data = Highcharts.geojson(geojson, 'map');
        $.each(data, function (i) {
        	this.drilldown = this.properties['code'];
        	this.value = i;
        	console.log(this.drilldown);
        });
        $('#chartdiv').highcharts('Map', {
        	credits: { enabled: false },
        	colorAxis: {
        		min : 0,
                minColor: '#6d64d1',
                maxColor: '#d16464'},
            chart : {
                events: {
                	// drilldown : 클릭시 하위레벨로 진입
                    drilldown: function (e) {
                        if (!e.seriesOptions) {
                        	// 상위레벨에서 선택한 부분의 코드값에 따라 하위레벨이 결정
                            var chart = this, mapKey = e.point.drilldown;
                            $.getJSON('../../resources/json/' + mapKey + '.json', function (geojson2) {
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
