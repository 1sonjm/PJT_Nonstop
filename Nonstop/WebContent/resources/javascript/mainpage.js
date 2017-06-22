/*!
 * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery to collapse the navbar on scroll
function collapseNavbar() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}

$(window).scroll(collapseNavbar);
$(document).ready(collapseNavbar);

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
        
        //더 알아보기 누를 경우 좌측 페이징 처리
        if($(this).data('index') == 0) {
        	$(".paging_home li:nth-child(1)").removeClass('active');
        	$(".paging_home li:nth-child(2)").addClass('active');
        }
        //jQuery: data() 이해와 활용. http://www.nextree.co.kr/p10155/
        
    });
    $('a.link_paging').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        
        //offset() : 어떤 요소의 문서 상의 상대적인 현재 위치를 알 수 있습니다.
        //offset().top : 객체의 속성 중 top의 좌표값을 반환한다.

        //좌측 페이징 처리. 기존 active된 클래스 지우고 클릭한 li 태그  클래스 active 설정
        if($(this).text().trim() == 1) {
        	$('.paging_home').children('li').removeClass('active');
        	$(this).parent().addClass('active');
        }
        
        //툴바 헤더 눌렀을 때 페이징 처리
        if($(this).text().trim() == 'NONSTOP') {
        	$('.paging_home').children('li').removeClass('active');
        	$(".paging_home li:nth-child(1)").addClass('active');
        }
        
        //.find()와 .children()함수는 아주 유사하지만 DOM 트리에서 레벨 1의 위치- 첫번째 깊이-만 검색을 하는 부분에서 차이점이 있습니다. 
        //이 부분을 부연설명을 하면, find()함수는 선택요소의 내부 요소들을 모두 검색하고 children()함수는 바로 아래 수준의 요소만 자식요소로 인정한다는 겁니다. 
        
        //.attr() : 인자에 따라 2가지로 사용할 수 있습니다. 하나의 인자만 있다면 속성값을 가져오는 것이고 2개의 인자를 쓰면 속성값을 변경하는 것입니다.

        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $(this).closest('.collapse').collapse('toggle');
});

//더 알아보기 태그 스크롤 내려가면 사라지게 하기
jQuery(document).ready(function () {

	$(window).scroll(function(){
    if ($(this).scrollTop() < 500) {
        $('.page-scroll').fadeIn();
     } else {
        $('.page-scroll').fadeOut();
     }
     });
});

//Data Count
$(function() {
	$.fn.countTo = function (options) {
		options = options || {};

		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);

			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;

			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};

			$self.data('countTo', data);

			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);

			// initialize the element with the starting value
			render(value);

			function updateTimer() {
				value += increment;
				loopCount++;

				render(value);

				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}

				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;

					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}

			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.text(formattedValue);
			}
		});
	};

	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};

	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
});