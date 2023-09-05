<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- controller에서 받은 값을 javascript에서 사용하기 위해 변수에 저장한다. --%>
<c:set var="keyword" value="${keyword }" />
<c:set var="orderKey" value="${orderKey }" />
<c:set var="order" value="${order }" />

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

button {
	font-family: 'Yeongdeok_TTF';
	font-size: 16px;
	width: 80px;
	height: 30px;
	background-color: white;
	border: 2px solid tomato;
	box-sizing: border-box;
}

.search_txf {
	width: 300px;
	height: 29px;
	border: 3px solid #FF6347;
	border-radius: 9px;
	margin-top: 53px;
	margin-left: 510px;
}

#search_btn {
	width: 40px;
	height: 32px;
	border: none;
	background: #FF6347;
	border-radius: 10px;
	margin-left: -5px;
	margin-bottom: 20px;
	position: relative;
	top: 11px;
}

#search_btn:hover {
	cursor: pointer;
}

.icon {
	z-index: 1;
	position: relative;
	margin-left: 811px;
	margin-top: -53px;
	width: 20px;
}

#search_div:hover {
	cursor: pointer;
}

#search_icon2 {
	width: 35px;
	height: 35px;
	position: relative;
	margin-top: 10px;
}

#search_icon2:hover {
	cursor: pointer;
}

#content_all {
	margin-top: 100px;
}

.content_title {
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

#c_title_t {
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.text_center {
	margin: auto;
	padding-right: 180px;
}

.kindOf {
	z-index: 2;
	float: left;
	margin-left: 1030px;
	margin-top: -37px;
}

.kindOf button:hover {
	background-color: tomato;
	color: white;
}

#see {
	float: left;
	padding: 2px;
}

#see:hover {
	cursor: pointer;
}

#save {
	float: left;
	padding: 2px;
}

#save:hover {
	cursor: pointer;
}

#star {
	float: left;
	padding: 2px;
}

#star:hover {
	cursor: pointer;
}

.search_item input:focus {
	border-color: tomato;
	outline: none;
}
</style>
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
						<a href="/myinfo.go"><li id="info_first">내 정보</li></a>
						<a href="/mywishlist.go"><li id="info">찜 목록</li></a>
						<a href="/reportcontent.go"><li id="info">신고 내역</li></a>
						<a href="/mycontent.go"><li id="info">내가 쓴 게시글</li></a>
						<a href="/mycomment.go"><li id="info_end">내가 쓴 댓글</li></a>
					</ul>
				</div>
				<div class="title_line"></div>
				<div class="search_item">
					<input id=search_input type="text" class="search_txf"
						name="search_txf">
					<button id="search_btn" type="button" onclick="goSearch()"></button>
					<%-- goSearch()가 많은 이유 : 프론트 엔드에서 위의 버튼이 안 눌려져서 근처에 있는 모든 요소에 function 적용함 --%>					
					<div id="search_div" class="icon" onclick="goSearch()">
						<img id="search_icon2"
							src="/resources/images/search_icon_white.png"
							onclick="goSearch()">
					</div>
				</div>
				<div class="kindOf">
					<button id="see" type="button" onclick="goSea()">조회순</button>
					<button id="save" type="button" onclick="goSave()">등록순</button>
					<button id="star" type="button" onclick="goStar()">평점순</button>
				</div>
				<div class="content_all">
					<c:choose>
						<c:when test="${not empty contentList}">
							<c:forEach items="${contentList}" var="k" varStatus="vs">
								<div class="content_title">
									<a href="/public_recipe_detail.go?rcp_idx=${k.rcp_idx}"> <span
										id="c_title_t">${vs.count}. ${k.u_rcp_title}</span>
									</a>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<%-- 작성한 게시물이 하나도 없는 경우 --%>
							<h2>작성한 게시물이 존재하지 않습니다.</h2>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<aside id="sidebar-right">
				<jsp:include page="../bestlist.jsp" />
			</aside>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
		/* 검색버튼을 누르면 해당 keyword를 컨트롤러에 넘겨준다. */
		function goSearch() {
			var search_input = document.getElementById("search_input").value;
			location.href = "/mycontent_search.go?keyword=" + search_input
					+ "&orderKey=u_rcp_hit&order=asc";
		}
		
		/* keyword(레시피 제목에 포함되는 문자열), orderKey(정렬 기준 column), order(정렬 방식)을 컨트롤러에 전달한다. */
		function order(column) {
			var keyword = "${keyword}";
			var orderKey = "${orderKey}";
			var order;
			//예를 들어 이미 조회순 내림차순 정렬이 되어있을 때 한번 더 누르면 조회순 오름차순 정렬이 되도록 하였다.
			if(orderKey === column) {
				order = "${order}";
				if(order === "asc") {
					order = "desc";
				} else {
					order = "asc";
				}
			} else {
				order = "desc";
			}
			location.href = "/mycontent_search.go?orderKey=" + column + "&keyword=" + keyword + "&order=" + order;
		}

		/* 조회순 버튼이 눌렸을 경우 */
		function goSea() {
			order("u_rcp_hit");
		}

		/* 등록순 버튼이 눌렸을 경우 */
		function goSave() {
			order("u_rcp_time");
		}

		/* 평점순 버튼이 눌렸을 경우 */
		function goStar() {
			order("avg_grade");
		}

		$(document)
				.ready(
						function() {
							var keyword = "${keyword}";
							var orderKey = "${orderKey}";
							$("#search_input").val(keyword);
							
							//orderKey에 따라 버튼 색상을 변경해준다.
							if (orderKey === "u_rcp_hit") {
								$("#see").css("background-color", "tomato");
								$("#see").css("color", "white");
							} else if (orderKey === "u_rcp_time") {
								$("#save").css("background-color", "tomato");
								$("#save").css("color", "white");
							} else if (orderKey === "avg_grade") {
								$("#star").css("background-color", "tomato");
								$("#star").css("color", "white");
							} else { //처음에 orderKey가 없다. 그 경우 조회순 버튼 색상을 변경해준다.
								$("#see").css("background-color", "tomato");
								$("#see").css("color", "white");
							}

							$("#see")
									.on(
											"click",
											function() {
												$("#see")
														.attr("style",
																"background-color : tomato; color : white;")
												$("#save")
														.attr("style",
																"background-color : white; color : black;")
												$("#star")
														.attr("style",
																"background-color : white; color : black;")
											});

							$("#save")
									.on(
											"click",
											function() {
												$("#save")
														.attr("style",
																"background-color : tomato; color : white;")
												$("#see")
														.attr("style",
																"background-color : white; color : black;")
												$("#star")
														.attr("style",
																"background-color : white; color : black;")
											});

							$("#star")
									.on(
											"click",
											function() {
												$("#star")
														.attr("style",
																"background-color : tomato; color : white;")
												$("#see")
														.attr("style",
																"background-color : white; color : black;")
												$("#save")
														.attr("style",
																"background-color : white; color : black;")
											});
						});
	</script>
</body>
</html>