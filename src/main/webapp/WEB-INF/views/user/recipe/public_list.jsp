<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>냠냠레시피</title>
	<link rel="icon" type="image/x-icon" href="resources/images/icon_tomato.png">
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
			/* Rectangle 77 */
			margin-top: 0px;
			background: snow;
		}

		#footer {
			left: 0px;
			width: 100%;
			height: 300px;
			clear: left;
		}

		#test {
			width: 100%;
			height: 1500px;
		}



		#category {
			width: 835px;
			height: 128px;
			margin: auto;
		}

		#category li:hover {
			background-color: #E53A1B;
		}

		#howto_menu {
			color: #FFF;
			width: 832px;
			list-style: none;
			margin: auto;
		}

		.howto_center {
			background-color: tomato;
			border-bottom: 1px solid #FFF;
			width: 100px;
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
		}

		#howto_first {
			border-right: 1px solid #FFF;
			border-bottom: 1px solid #FFF;
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
			background-color: tomato;
			width: 116px;
			border-radius: 30px 0px 0px 8px;
		}

		#howto_etc {
			border-bottom: 1px solid #FFF;
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
			background-color: tomato;
			width: 116px;
			border-radius: 0% 30px 8px 0px;
		}

		#category_menu {
			color: #FFF;
			width: 800px;
			list-style: none;
			margin: auto;
		}

		.category_center {
			background-color: tomato;
			color: #FFF;
			width: 100px;
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
		}

		#category_first {
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
			background-color: tomato;
			width: 100px;
			border-radius: 0px 0px 0px 30px;
			border-right: 1px solid #FFF;
		}

		#category_etc {
			line-height: 50px;
			text-align: center;
			float: left;
			height: 50px;
			background-color: tomato;
			width: 100px;
			border-radius: 0px 0px 30px 0px;
		}

		#category_helmet {
			width: 80px;
			height: 28px;
			border-radius: 10px 10px 0px 0px;
			border-bottom: 1px solid #FFF;
			background: #FF6347;
			margin: auto;
		}

		.recipe_thumbnail {
			width: 250px;
			height: 250px;
		}

		.recipe_one {
			margin: 60px 20px;
			background-color: aqua;
			width: 250px;
			display: inline-block;
		}

		.like img {
			vertical-align: middle;
			width: 16px;
			height: 16px;
		}

		.like span {
			height: 16px;
			font-size: 12px;
		}

		.profile {
			vertical-align: middle;
			width: 30px;
		}

		.writer {
			height: 30px;
		}

		.writer span {
			font-size: 16px;
			line-height: 30px;
		}

		.flexContainer {
			width: 1320px;
			display: flex;
			flex-direction: row;
			flex-wrap: wrap;
			justify-content: space-evenly;
		}
	</style>
</head>

<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">왼쪽</aside>
			<div id="content">
				<!-- 카테고리 만들기 -->
				<div id="category">
					<div id="category_helmet"></div>
					<ul id="howto_menu">
						<li id="howto_first">조리방법</li>
						<li class="howto_center">전체보기</li>
						<li class="howto_center">굽기</li>
						<li class="howto_center">끓이기</li>
						<li class="howto_center">볶기</li>
						<li class="howto_center">찌기</li>
						<li class="howto_center">튀기기</li>
						<li id="howto_etc">기타</li>
					</ul>
					<ul id="category_menu">
						<li id="category_first">카테고리</li>
						<li class="category_center">전체보기</li>
						<li class="category_center">국&찌개</li>
						<li class="category_center">일품</li>
						<li class="category_center">밥</li>
						<li class="category_center">반찬</li>
						<li class="category_center">후식</li>
						<li id="category_etc">기타</li>
					</ul>
				</div>
				<!-- 카테고리 끝 -->
				<!-- 레시피 출력 -->
				<!-- 콘텐츠공간 -->
				<div class="flexContainer">
					<div class="recipe_one">
						<p><img src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg"
								class="recipe_thumbnail"></p>
						<p>공공레시피명</p>
						<div class="writer">
							<img
								src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
								class="profile">
							<span>작성자 이름</span>
						</div>
						<div class="like" style="text-align: right;">
							<img class="icon" src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg" alt="">
							<span>4.9</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
							<span>42</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png" alt="">
							<span>7만</span>
						</div>
					</div>
				</div>
				<!-- 레시피 출력끝  -->
			</div>
			<aside id="sidebar-right">오른</aside>
		</div>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>

</body>

</html>