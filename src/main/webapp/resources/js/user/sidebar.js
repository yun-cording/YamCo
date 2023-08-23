	$(document).ready(function() {
		var footer = $("#footer"); // ID로 선택
		var quickmenu = $(".quickmenu");
		var bestlist = $(".bestlist");
		var footerThreshold1 = footer.offset().top - quickmenu.height()-400;
		var footerThreshold2 = footer.offset().top - bestlist.height()-400;
		var currentPosition = parseInt($(".quickmenu").css("top"));
		var currentPosition2 = parseInt($(".bestlist").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			if(position<footerThreshold1){
			
			}
			if(position<footerThreshold2){
				$(".quickmenu").stop().animate({
					"top" : position + currentPosition + "px"
				}, 500);
				$(".bestlist").stop().animate({
					"top" : position + currentPosition2 + "px"
				}, 500);
			}
		});
		
		$("#btn_append").on("click", function() {
			footer = $("#footer"); // ID로 선택
			quickmenu = $(".quickmenu");
			bestlist = $(".bestlist");
			footerThreshold1 = footer.offset().top - quickmenu.height() - 400;
			footerThreshold2 = footer.offset().top - bestlist.height() - 400;
		});
	});