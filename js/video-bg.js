(function($) {
	"use strict";
	
	$(document).ready(function() {
		var isMobile = {
		    Android: function() {
		        return navigator.userAgent.match(/Android/i);
		    },
		    BlackBerry: function() {
		        return navigator.userAgent.match(/BlackBerry/i);
		    },
		    iOS: function() {
		        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		    },
		    Opera: function() {
		        return navigator.userAgent.match(/Opera Mini/i);
		    },
		    Windows: function() {
		        return navigator.userAgent.match(/IEMobile/i);
		    },
		    any: function() {
		        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		    }
		};

		if( isMobile.any() ){
			$(".player").css("display","none");
			$(".main-wrapper").backstretch([
				"images/bg-1.jpg",
				"images/bg-2.jpg",
				"images/bg-3.jpg",
				"images/bg-4.jpg"    
			], {fade: 4000});
		}
		else{
			$(".player").css("display","block");
			$(".player").YTPlayer();
		}

	});	

})(jQuery);
