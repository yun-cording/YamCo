<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/award.css">
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#mydiv {
	width: 1920px;
	height: 100%;
	margin: auto;
}

#sidebar-right {
	background-color: yellow;
	float: left;
	width: 15.625%;
	height: 100%;
}

#sidebar-left {
	background-color: yellow;
	width: 15.625%;
	height: 100%;
	float: left;
}

#content {
	width: 68.75%;
	height: 100%;
	float: left;
	margin-top: 0px;
	background: snow;
}

#footer {
	background-color: #333;
	left: 0px;
	color: #fff;
	text-align: center;
	width: 100%;
	height: 300px;
	clear: left;
}

#test {
	width: 100%;
	height: 1500px;
}
</style>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".item:nth-child(1)").children("div").hide();
						$(".item:nth-child(2)").children("div").hide();
						$(".item:nth-child(3)").children("div").hide();

						$(".item:nth-child(1)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.fadeIn(
															"slow",
															function() {
																$(this)
																		.css(
																				"transform",
																				"translateZ(500px) rotateY(0deg) translateX(0px) translateY(100px) scale(1.2)");
																$(this)
																		.children(
																				"p")
																		.hide();
																$(this)
																		.children(
																				"div")
																		.show();
															});
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.css(
															"transform",
															"scale(1.0) translateY(0px) translateX(-690px) rotateY(-40deg) translateZ(-250px)");
											$(this).children("div").hide();
											$(this).children("p").show();
										});

						$(".item:nth-child(2)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.css("transform",
															"translateZ(500px) translateY(100px) scale(1.2)");
											$(this).children("p").hide();
											$(this).children("div").show();
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.css("transform",
															"scale(1.0) translateY(0px) translateZ(0px)");
											$(this).children("div").hide();
											$(this).children("p").show();
										});

						$(".item:nth-child(3)")
								.on(
										"mouseenter",
										function() {
											$(this)
													.css("transform",
															"translateZ(500px) rotateY(0deg) translateX(0px) translateY(100px) scale(1.2)");
											$(this).children("p").hide();
											$(this).children("div").show();
										})
								.on(
										"mouseleave",
										function() {
											$(this)
													.css(
															"transform",
															"scale(1.0) translateY(0px) translateX(690px) rotateY(40deg) translateZ(-250px)");
											$(this).children("div").hide();
											$(this).children("p").show();
										});
					});
</script>
</head>
<body>
	<div id="mydiv">

		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">왼쪽</aside>
			<div id="content">
				<div class="scene">
					<div class="carousel">
						<div class="item">
							<div>
								<div class="prize_title">
									<p>7월의 대상</p>
								</div>
								<div class="prize_content">
									<div class="prize_profile">
										<div class="profile_photo">
											<img src="resources/images/java4.gif">
										</div>
										<div class="profile_nickname">
											<span>냠냠이</span>
										</div>
									</div>
									<div class="prize_recipe">
										<div class="prize_recipe_title">
											<p>새우두부계란찜</p>
										</div>
										<div class="prize_recipe_photo">
											<img src="resources/images/java4.gif">
										</div>
										<div class="prize_recipe_content">
											<p>
												남녀노소 누구나<br>부담없이 먹을 수 있는</br>최고의 요리
											</p>
										</div>
									</div>
								</div>
							</div>
							<p>최우수상
							<p>
						</div>
						<div class="item">
							<div>
								<img src="resources/images/java4.gif">
							</div>
							<p>대상
							<p>
						</div>
						<div class="item">
							<div>
								<img src="resources/images/java4.gif">
							</div>
							<p>우수상
							<p>
						</div>
						<div>명예의 전당</div>
					</div>
				</div>
			</div>
			<aside id="sidebar-right">오른</aside>
		</div>
		<div id="footer">아래</div>
	</div>

</body>
</html>