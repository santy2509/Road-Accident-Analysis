(function($) {
	"use strict";

	$(window).load(function(){
		pageLoader();
	});

	$(document).ready(function() {
		fullWidthHeight();
		getSetImage();
		pageWrapperHeight();
		secondLine();
		countdownClock();
		pageTransition();
		mobileNav();
	});
	
	$(window).resize(function() {
		fullWidthHeight();
		pageWrapperHeight();
	});

	// PAGE-LOADER
	function pageLoader(){
	    if ($("html").hasClass('ie9')) {
	        $("#loader").addClass('display_none');
	        $("#ie9-loader").addClass('display_block');
	        $("#loader-wrapper").fadeOut(200);
	    }else{
	        $("#loader-wrapper").fadeOut(200);
	    }
	}

	// FULLSCREEN MAIN-WRAPPER
	function fullWidthHeight(){
		var w = $(window).width();
		var h = $(window).height();
		$(".main-wrapper").css({
			width : w,
			"min-height": h
		});
	}

	// GET AND SET IMAGE
	function getSetImage(){
		var path = $(".bg-wrapper").attr("data-mainbg");
		$(".main-wrapper.bg-wrapper").css({
			"background-image" : "url("+path+")"
		});
	}

	// PAGE-WRAPPER
	function pageWrapperHeight(){
		var total = $(".main-wrapper").height();
		var footer = $(".front-display").outerHeight();
		var page = total - footer;
		if($("html").hasClass("ff")){
			$(".page-wrapper").css("height", page);
			$(".page-wrapper").css("min-height", page);
		}
		else{
			$(".page-wrapper").css("min-height", page);
		}
	}

	// SECONDS-LINE
	function secondLine(){
		var count = 1;
		var oldcount = 1;
		$("ul.time-line li:nth-child("+count+")").addClass('active');
		$("#counter").html(count);
		var timer = setInterval(function() {
			$("ul.time-line li:nth-child("+oldcount+")").removeClass('active');
			$("#counter").html((count++)+1);
			$("ul.time-line li:nth-child("+count+")").addClass('active').prev().removeClass('active');
			if(count == 60){
				oldcount = count;
				count = 0;
			}
		}, 1000);
	}

	// COUNTDOWN-CLOCK
	function countdownClock(){
		var day = parseInt($("#countdown_dashboard").attr("data-day"));
		var month = parseInt($("#countdown_dashboard").attr("data-month"));
		var year = parseInt($("#countdown_dashboard").attr("data-year"));
		var hour = parseInt($("#countdown_dashboard").attr("data-hr"));
		var min = parseInt($("#countdown_dashboard").attr("data-min"));
		var sec = parseInt($("#countdown_dashboard").attr("data-sec"));

		// DESKTOP CLOCK
		$('#countdown_dashboard').countDown({
			targetDate: {
				'day': 		day,
				'month': 	month,
				'year': 	year,
				'hour': 	hour,
				'min': 		min,
				'sec': 		sec
			},
			omitWeeks: true
		});
	}

	// PAGE 
	function pageTransition(){
		var enter = "fadeInUp";
		var exit = "fadeOutUp";
		var clockHeight = $("#countdown_dashboard").outerHeight();
		$(".navigation-wrp .nav-box a").on("click",function(){
			$(".navigation-wrp .nav-box a").removeClass("active");
			$(this).addClass("active");
			var pageUrl = $(this).attr("data-page");
			if (pageUrl == 'home.html') {
				$(".page-wrapper .ajax-page-wrp .page").stop().animate({
					top: "-30px",
					opacity: 0
				}, 1000, function(){
					$(".page-wrapper .ajax-page-wrp").html('');
					$(".page-wrapper").addClass("home-page");
					$(".page-wrapper.home-page #home .tag-line").css("top", "30px");
					$(".page-wrapper.home-page #home .tag-line").stop().animate({
						top: 0,
						opacity: 1
					},1000);
					$(".page-wrapper.home-page #home #countdown_dashboard").stop().animate({
						height: clockHeight,
						"min-height": 0,
						opacity: 1
					},1000);
				});	
			}
			else{
				if($(".page-wrapper").hasClass("home-page")){
					$(".page-wrapper.home-page #home .tag-line").stop().animate({
						top: -30,
						opacity: 0
					}, 1000, function(){
						$(".page-wrapper").removeClass("home-page");
						$.post(pageUrl, function(data){
							$(".page-wrapper .ajax-page-wrp").html(data);
							$(".page-wrapper .ajax-page-wrp .page").css("top","30px");
							$(".page-wrapper .ajax-page-wrp .page").stop().animate({
								top: 0,
								opacity: 1
							}, 1000);
						});
					});
					$(".page-wrapper.home-page #home #countdown_dashboard").stop().animate({
						height: 0,
						"min-height": 0,
						opacity: 0
					}, 1000);
				}
				else{
					$(".page-wrapper .ajax-page-wrp .page").stop().animate({
						top: -30,
						opacity: 0
					}, 1000, function(){
						$(".page-wrapper .ajax-page-wrp").html('');
						$.post(pageUrl, function(data){
							$(".page-wrapper .ajax-page-wrp").html(data);
							$(".page-wrapper .ajax-page-wrp .page").css("top","30px");
							$(".page-wrapper .ajax-page-wrp .page").stop().animate({
								top: 0,
								opacity: 1
							}, 1000);
						});
					});
				}
			}
		});
	}

	// MOBILE-NAVIGATION
	function mobileNav(){
		$(".mobile-icon").on("click", function(){
			$(".nav-outter-wrp").slideDown(500).addClass("open");
			if($(".nav-outter-wrp").hasClass("open")){
				$(".nav-outter-wrp").on("click", function(){
					$(".nav-outter-wrp").slideUp(500).removeClass("open");
				});
			}
		});
	}
})(jQuery);








