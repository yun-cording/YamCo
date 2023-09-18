<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

@font-face {
	font-family: 'Yeongdeok_TTF';
	src: url('../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

#category li:hover {
	background-color: #E53A1B;
}

#mydiv {
	width: 1920px;
	margin: auto;
}

#sidebar-right {
	background-color: white;
	float: left;
	width: 15.625%;
}

#sidebar-left {
	background-color: white;
	width: 15.625%;
	float: left;
}

#content {
	width: 68.75%;
	float: left;
	/* Rectangle 77 */
	margin-top: 0px;
	background: white;
	font-family: 'Yeongdeok_TTF';
}

#footer {
	left: 0px;
	color: #fff;
	width: 100%;
	clear: left;
	padding-top: 300px;
}

#category {
	margin-top: 25px;
	font-size: 15px;
}

#category li:hover {
	background-color: #E53A1B;
}

ul {
	list-style: none;
	margin: auto;
	width: 625px;
}

#info_first {
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	width: 125px;
	height: 50px;
	background: tomato;
	border-radius: 30px 0px 0px 30px;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
}

#info {
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	width: 125px;
	height: 50px;
	float: left;
	background: tomato;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
}

#info_end {
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	width: 125px;
	height: 50px;
	background: tomato;
	border-radius: 0px 30px 30px 0px;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
}

.title_line {
	width: 1320px;
	border: 2px solid tomato;
	height: 1px;
	margin-top: 100px;
}

.q_all {
	margin-top: 100px;
}

.q_title {
	box-sizing: border-box;
	width: 1260px;
	height: 80px;
	margin-left: 30px;
	margin-right: 30px;
	border-left: 20px solid;
	border-bottom: 3px solid;
	border-color: tomato;
	margin-top: 30px;
}

.between {
	margin-top: 100px;
}

.arrow {
	float: right;
	padding-bottom: 20px;
	margin-right: 30px;
}

.arrow:hover {
	cursor: pointer;
}

/* #q_title_t { */
.q_title_t {
	width: 1100px;
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.img_size {
	width: 200px;
	height: 200px;
	margin-left: 10px;
}

.img {
	width: 200px;
	height: 200px;
	margin-left: 10px;
	float: left;
	margin-top: 30px;
}

.text_center {
	margin: auto;
	padding-right: 180px;
}

.answer {
	font-size: 30px;
	text-align: center;
	display: none;
	box-sizing: border-box;
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 50px;
	padding-top: 17px;
	width: 1260px;
	height: 300px;
	font-weight: 400;
	line-height: 40px;
	color: tomato;
	border-bottom: 3px solid tomato;
}

.row_append {
	margin: 10px auto;
	padding: 10px;
	width: calc(30% - 20px);
	border: 3px solid tomato;
	border-radius: 30px;
	text-align: center;
	color: tomato;
	cursor: pointer;
}

.qa {
	display: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var arrowDown = "/resources/images/arrow_down.png"; //아래 화살표 이미지
		var arrowUp = "/resources/images/arrow_up.png"; //위 화살표 이미지
		var loop = 0; //반복 단위 step

		/* 화살표 버튼을 누르면 실행됨 */
		$(".arrow").on("click", function() {
			var answer = $(this).closest(".q_title").next();
			if ($(this).attr("src") === arrowUp) {
				//지금 위 화살표이면 answer 내용 숨기고 아래 화살표로 바꿈
				answer.fadeOut(400);
				$(this).attr("src", arrowDown);
			} else {
				//지금 아래 화살표이면 answer 내용 나타내고 위 화살표로 바꿈
				answer.fadeIn({
					direction : "top"
				});
				answer.attr("style", "display : flex;");
				$(this).attr("src", arrowUp);
			}
		});

		//페이지가 처음 로딩되었을 때 qa div를 loop +  1개 노출시킴
		if ($(".qa:hidden").length > loop) {
			$(".qa:hidden").slice(0, loop + 1).show();
			if ($(".qa:hidden").length < 1) { //숨겨져있는 qa div가 없으면 더보기 버튼 숨김
				$(".row_append").hide();
			}
		} else { //loop + 1개 보다 qa div 개수가 적으면 모두 노출시키고 더보기 버튼 숨김
			$(".qa:hidden").show();
			$(".row_append").hide();
		}

		//더보기 버튼 클릭할 때마다 qa div를 loop + 1개 노출시킴
		$(".row_append").on("click", function() {
			if ($(".qa:hidden").length > loop) {
				$(".qa:hidden").slice(0, loop + 1).show();
				if ($(".qa:hidden").length < 1) {
					$(".row_append").hide();
				}
			} else {
				$(".qa:hidden").show();
				$(".row_append").hide();
			}
		});

		/* var i=0;
		$("#a_1").on("click", function() {
			if(i++%2 == 0){
				$("#a1").fadeOut(400);					
				$("#a_1").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a1").fadeIn({direction : "top"});
				$('#a1').attr("style", "display : flex;");
				$("#a_1").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_2").on("click", function() {
			if(i++%2 == 0){
				$("#a2").fadeOut(400);			
				$("#a_2").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a2").fadeIn({direction : "top"});	
				$('#a2').attr("style", "display : flex;");
				$("#a_2").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_3").on("click", function() {
			if(i++%2 == 0){
				$("#a3").fadeOut(400);					
				$("#a_3").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a3").fadeIn({direction : "top"});	
				$('#a3').attr("style", "display : flex;");
				$("#a_3").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_4").on("click", function() {
			if(i++%2 == 0){
				$("#a4").fadeOut(400);					
				$("#a_4").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a4").fadeIn({direction : "top"});	
				$('#a4').attr("style", "display : flex;");
				$("#a_4").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_5").on("click", function() {
			if(i++%2 == 0){
				$("#a5").fadeOut(400);				
				$("#a_5").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a5").fadeIn({direction : "top"});	
				$('#a5').attr("style", "display : flex;");
				$("#a_5").attr("src","/resources/images/arrow_up.png");
			}			
		}); */
	});
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">
				<jsp:include page="../recentlist.jsp" />
			</aside>
			<div id="content">
				<div id="category">
					<ul>
						<a href="/myinfo.do"><li id="info_first">내 정보</li></a>
						<a href="/mywishlist.do"><li id="info">찜 목록</li></a>
						<a href="/reportcontent.do"><li id="info">신고 내역</li></a>
						<a href="/mycontent.do"><li id="info">내가 쓴 게시글</li></a>
						<a href="/mycomment.do"><li id="info_end">내가 쓴 댓글</li></a>
					</ul>
				</div>
				<div class="title_line"></div>
				<div class="q_all">
					<c:choose>
						<c:when test="${not empty commentList}">
							<c:forEach items="${ commentList}" var="k" varStatus="vs">
								<div class="qa">
									<div class="q_title">
										<span class="q_title_t">${vs.count }. <c:choose>
												<c:when test="${k.rcp_idx < 10000}">
													<c:set var="rcp_url"
														value="/go_publicDet.do?rcp_seq=${k.rcp_idx }" />
												</c:when>
												<c:otherwise>
													<c:set var="rcp_url"
														value="/user_recipe_detail.do?rcp_idx=${k.rcp_idx }" />
												</c:otherwise>
											</c:choose> <a href="${rcp_url }">${k.u_rcp_title}</a>

										</span>
										<div>
											<img class="arrow" src="/resources/images/arrow_down.png">
										</div>
									</div>
									<div class="answer">
										<div class="img">
											<img src="${k.c_img }" alt="${k.c_img }" class="img_size">
										</div>
										<p class="text_center">${k.c_contents }</p>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h2>작성한 댓글이 존재하지 않습니다.</h2>
						</c:otherwise>
					</c:choose>
				</div>
				<%-- 1 대신 step 단위 입력할 것 --%>
				<c:if test="${commentList.size() > 1 }">
					<div class="row_append">
						<h2>더보기</h2>
					</div>
				</c:if>
			</div>
			<aside id="sidebar-right">
				<jsp:include page="../bestlist.jsp" />
			</aside>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
</body>
</html>