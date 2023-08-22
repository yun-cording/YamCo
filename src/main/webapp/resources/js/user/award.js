$(document)
			.ready(
					function() {
						$(".item:nth-child(1)").children("div").fadeOut();
						$(".item:nth-child(2)").children("div").fadeOut();
						$(".item:nth-child(3)").children("div").fadeOut();
						
						$(".lank_table th:nth-child(1)").css("border-radius", "30px 0 0 0");
						$(".lank_table th:nth-last-child(1)").css("border-radius", "0 30px 0 0");

						$(".item:nth-child(1)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.css("transform",
															"translateZ(500px) rotateY(0deg) translateX(0px) translateY(100px) scale(1.2)")
													.children("p")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"div")
																		.stop()
																		.fadeIn(
																				"slow");
															});
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.children("div")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"p")
																		.stop()
																		.fadeIn(
																				"slow");
															})
													.end()
													.css(
															"transform",
															"scale(1.0) translateY(0px) translateX(-690px) rotateY(-40deg) translateZ(-250px)");
										});

						$(".item:nth-child(2)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.css("transform",
															"translateZ(500px) translateY(100px) scale(1.2)")
													.children("p")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"div")
																		.stop()
																		.fadeIn(
																				"slow");
															});
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.children("div")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"p")
																		.stop()
																		.fadeIn(
																				"slow");
															})
													.end()
													.css("transform",
															"scale(1.0) translateY(0px) translateZ(0px)");
										});

						$(".item:nth-child(3)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.css("transform",
															"translateZ(500px) rotateY(0deg) translateX(0px) translateY(100px) scale(1.2)")
													.children("p")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"div")
																		.stop()
																		.fadeIn(
																				"slow");
															});
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.children("div")
													.stop()
													.fadeOut(
															"slow",
															function() {
																$(this)
																		.siblings(
																				"p")
																		.stop()
																		.fadeIn(
																				"slow");
															})
													.end()
													.css(
															"transform",
															"scale(1.0) translateY(0px) translateX(690px) rotateY(40deg) translateZ(-250px)");
										});
										
										
						var lank = 10;
						$(".row_append")
								.on(
										"click",
										function() {
											for (var i = 0; i < 10; i++) {
												lank++;
												$(".lank_table")
														.append(
																"<tr><td>"
																		+ lank
																		+ "</td><td>냠냠이"
																		+ lank
																		+ "</td><td>새우두부계란찜"
																		+ lank
																		+ "</td><td>한식</td><td>	<input data-role=\"rating\" data-value=\"3\" data-star-color=\"yellow\" data-stared-color=\"tomato\"></td></tr>");
											}
										});
					});