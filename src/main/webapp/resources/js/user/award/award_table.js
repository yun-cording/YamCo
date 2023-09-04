$(document)
	.ready(
		function () {
			var loop = 0;

			if ($(".lank_table_row:hidden").length > loop) {
				$(".lank_table_row:hidden").slice(0, loop + 1).show();
				if ($(".lank_table_row:hidden").length < 1) {
					$(".row_append").hide();
				}
			} else {
				$(".lank_table_row:hidden").show();
				$(".row_append").hide();
			}

			$(".row_append").on("click", function () {
				if ($(".lank_table_row:hidden").length > loop) {
					$(".lank_table_row:hidden").slice(0, loop + 1).show();
					if ($(".lank_table_row:hidden").length < 1) {
						$(".row_append").hide();
					}
				} else {
					$(".lank_table_row:hidden").show();
					$(".row_append").hide();
				}
			});
		});