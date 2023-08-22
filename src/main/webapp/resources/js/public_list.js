	$(document).ready(function() {
		var footer = $("#footer"); // ID로 선택
		var quickmenu = $("#quickmenu_total");
		var footerThreshold = footer.offset().top - quickmenu.height()-400;
		var currentPosition = parseInt($(".quickmenu").css("top"));
		var currentPosition2 = parseInt($(".bestlist").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			if(position<footerThreshold){
				$(".quickmenu").stop().animate({
					"top" : position + currentPosition + "px"
				}, 500);
			}
			$(".bestlist").stop().animate({
				"top" : position + currentPosition2 + "px"
			}, 500);
		});
	});