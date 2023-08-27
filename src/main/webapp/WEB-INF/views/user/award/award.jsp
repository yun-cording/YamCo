<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<link rel="stylesheet"
	href="https://cdn.korzh.com/metroui/v4/css/metro-all.min.css">
<link rel="stylesheet" href="resources/css/user/award.css?after">
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#mydiv {
	width: 1920px;
	margin: auto;
}

#sidebar-right {
	float: left;
	width: 15.625%;
}

#sidebar-left {
	width: 15.625%;
	float: left;
}

#content {
	width: 68.75%;
	float: left;
	margin-top: 0px;
}

#footer {
	left: 0px;
	color: #fff;
	text-align: center;
	width: 100%;
	clear: left;
}

#test {
	width: 100%;
	height: 1500px;
}
</style>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.korzh.com/metroui/v4/js/metro.min.js"></script>
<script src="resources/js/user/award.js"></script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">
				<jsp:include page="../../recentlist.jsp" />
			</aside>
			<div id="content">
				<div class="scene">
					<div class="carousel">
						<div class="item">
							<div>
								<div class="prize_title">
									<p>7월의 최우수상</p>
								</div>
								<div class="prize_content">
									<div class="prize_profile">
										<div class="profile_photo">
											<a href="/"><img
												src="resources/images/test_lhj/free-icon-profile-1361913.png"></a>
										</div>
										<div class="profile_nickname">
											<a href="/"><span>냠냠이2</span></a>
										</div>
									</div>
									<div class="prize_recipe">
										<div class="prize_recipe_title">
											<a href="/"><p>새우두부계란찜2</p></a>
										</div>
										<div class="prize_recipe_photo">
											<a href="/"><img
												src="resources/images/test_lhj/steamed_shrimp_tofu_and_eggs.jpg"></a>
										</div>
										<div class="prize_recipe_content">
											<a href="/"><p>
													둘이 먹다가<br>하나가 죽어도</br>모를 요리
												</p></a>
										</div>
									</div>
								</div>
							</div>
							<p>최우수상</p>
						</div>
						<div class="item">
							<div>
								<div class="prize_title">
									<p>7월의 대상</p>
								</div>
								<div class="prize_content">
									<div class="prize_profile">
										<div class="profile_photo">
											<a href="/"><img
												src="resources/images/test_lhj/free-icon-profile-1361913.png"></a>
										</div>
										<div class="profile_nickname">
											<a href="/"><span>냠냠이1</span></a>
										</div>
									</div>
									<div class="prize_recipe">
										<div class="prize_recipe_title">
											<a href="/"><p>새우두부계란찜1</p></a>
										</div>
										<div class="prize_recipe_photo">
											<a href="/"><img
												src="resources/images/test_lhj/steamed_shrimp_tofu_and_eggs.jpg"></a>
										</div>
										<div class="prize_recipe_content">
											<a href="/"><p>
													남녀노소 누구나<br>부담없이 먹을 수 있는</br>최고의 요리
												</p></a>
										</div>
									</div>
								</div>
							</div>
							<p>대상</p>
						</div>
						<div class="item">
							<div>
								<div class="prize_title">
									<p>7월의 우수상</p>
								</div>
								<div class="prize_content">
									<div class="prize_profile">
										<div class="profile_photo">
											<a href="/"><img
												src="resources/images/test_lhj/free-icon-profile-1361913.png"></a>
										</div>
										<div class="profile_nickname">
											<a href="/"><span>냠냠이3</span></a>
										</div>
									</div>
									<div class="prize_recipe">
										<div class="prize_recipe_title">
											<a href="/"><p>새우두부계란찜3</p></a>
										</div>
										<div class="prize_recipe_photo">
											<a href="/"><img
												src="resources/images/test_lhj/steamed_shrimp_tofu_and_eggs.jpg"></a>
										</div>
										<div class="prize_recipe_content">
											<a href="/"><p>
													그 누구도<br>맛보지 못 했던</br>새로운 맛의 개척
												</p></a>
										</div>
									</div>
								</div>
							</div>
							<p>우수상</p>
						</div>
						<div>명예의 전당</div>
					</div>
				</div>

				<table class="lank_table">
					<thead>
						<tr>
							<th>순위</th>
							<th>닉네임</th>
							<th>대표레시피</th>
							<th>카테고리</th>
							<th>평점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach begin="1" end="10" step="1" var="k" varStatus="vs">
							<tr>
								<td>${k }</td>
								<td><a href="/">냠냠이${k }</a></td>
								<td><a href="/">새우두부계란찜${k }</a></td>
								<td>한식</td>
								<td><input data-role="rating" data-value="3"
									data-star-color="yellow" data-stared-color="tomato"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row_append">
					<h2>+</h2>
				</div>
			</div>
			<aside id="sidebar-right">
				<jsp:include page="../../bestlist.jsp" />
			</aside>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js"></script>
</body>
</html>