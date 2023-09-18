<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/award.css?after">
<style type="text/css">
@font-face {
	font-family: 'Yeongdeok_TTF';
	src: url('/resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Yeongdeok_TTF';
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
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">
				<jsp:include page="../../recentlist.jsp" />
			</aside>
			<div id="content">
				<c:if test="${not empty awardList}">
					<div class="scene">
						<div class="carousel">
							<c:choose>
								<c:when test="${not empty awardList[1]}">
									<div class="item">
										<div>
											<div class="prize_title">
												<p>최우수상</p>
											</div>
											<div class="prize_content">
												<div class="prize_profile">
													<div class="profile_photo">
														<img src="${awardList[1].m_image}"
															alt="${awardList[1].m_image}">
													</div>
													<div class="profile_nickname">
														<span>${awardList[1].m_nick}</span>
													</div>
												</div>
												<div class="prize_recipe">
													<c:choose>
														<c:when test="${not empty recipeMap['1']}">
															<div class="prize_recipe_title">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['1'].rcp_idx}"><p>${recipeMap['1'].u_rcp_title}</p></a>
															</div>
															<div class="prize_recipe_photo">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['1'].rcp_idx}"><img
																	src="resources/user_image/user_thumnail/${recipeMap['1'].u_rcp_img}"
																	alt="${recipeMap['1'].u_rcp_img}"></a>
															</div>
															<div class="prize_recipe_content">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['1'].rcp_idx}"><p>${recipeMap['1'].u_rcp_tip }</p></a>
															</div>
														</c:when>
														<c:otherwise>
															<div class="prize_recipe_title">
																<%-- 요리 정보가 없는 경우 --%>
																<h2>대표 레시피 없음</h2>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
										<p>최우수상</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="item" style="display: none;"></div>
								</c:otherwise>
							</c:choose>
							<div class="item">
								<div>
									<div class="prize_title">
										<p>대상</p>
									</div>
									<div class="prize_content">
										<div class="prize_profile">
											<div class="profile_photo">
												<img src="${awardList[0].m_image}"
													alt="${awardList[0].m_image}">
											</div>
											<div class="profile_nickname">
												<span>${awardList[0].m_nick}</span>
											</div>
										</div>
										<div class="prize_recipe">
											<c:choose>
												<c:when test="${not empty recipeMap['0']}">
													<div class="prize_recipe_title">
														<a
															href="/user_recipe_detail.do?rcp_idx=${recipeMap['0'].rcp_idx}"><p>${recipeMap['0'].u_rcp_title}</p></a>
													</div>
													<div class="prize_recipe_photo">
														<a
															href="/user_recipe_detail.do?rcp_idx=${recipeMap['0'].rcp_idx}"><img
															src="resources/user_image/user_thumnail/${recipeMap['0'].u_rcp_img}"
															alt="${recipeMap['0'].u_rcp_img}"></a>
													</div>
													<div class="prize_recipe_content">
														<a
															href="/user_recipe_detail.do?rcp_idx=${recipeMap['0'].rcp_idx}"><p>${recipeMap['0'].u_rcp_tip }</p></a>
													</div>
												</c:when>
												<c:otherwise>
													<div class="prize_recipe_title">
														<%-- 요리 정보가 없는 경우 --%>
														<h2>대표 요리 정보 없음</h2>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								<p>대상</p>
							</div>

							<c:choose>
								<c:when test="${not empty awardList[2]}">
									<div class="item">
										<div>
											<div class="prize_title">
												<p>우수상</p>
											</div>
											<div class="prize_content">
												<div class="prize_profile">
													<div class="profile_photo">
														<img src="${awardList[2].m_image}"
															alt="${awardList[2].m_image}">
													</div>
													<div class="profile_nickname">
														<span>${awardList[2].m_nick}</span>
													</div>
												</div>
												<div class="prize_recipe">
													<c:choose>
														<c:when test="${not empty recipeMap['2']}">
															<div class="prize_recipe_title">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['2'].rcp_idx}"><p>${recipeMap['2'].u_rcp_title}</p></a>
															</div>
															<div class="prize_recipe_photo">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['2'].rcp_idx}"><img
																	src="resources/user_image/user_thumnail/${recipeMap['2'].u_rcp_img}"
																	alt="${recipeMap['2'].u_rcp_img}"></a>
															</div>
															<div class="prize_recipe_content">
																<a
																	href="/user_recipe_detail.do?rcp_idx=${recipeMap['2'].rcp_idx}"><p>${recipeMap['2'].u_rcp_tip }</p></a>
															</div>
														</c:when>
														<c:otherwise>
															<div class="prize_recipe_title">
																<%-- 요리 정보가 없는 경우 --%>
																<h2>대표 요리 정보 없음</h2>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
										<p>우수상</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="item" style="display: none;"></div>
								</c:otherwise>
							</c:choose>
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
							<c:forEach items="${awardList}" varStatus="vs">
								<tr class="lank_table_row">
									<td>${vs.count}</td>
									<td>${awardList[vs.index].m_nick }</td>
									<c:set var="myIndex">${vs.index}</c:set>
									<c:choose>
										<c:when test="${not empty recipeMap[myIndex]}">
											<td><a
												href="/user_recipe_detail.do?rcp_idx=${recipeMap[myIndex].rcp_idx}">${recipeMap[myIndex].u_rcp_title}</a></td>
											<td>${recipeMap[myIndex].u_rcp_category}</td>
											<td>${recipeMap[myIndex].avg_grade}</td>
										</c:when>
										<c:otherwise>
											<td colspan="3">대표 레시피 없음</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row_append">
						<h2>+</h2>
					</div>
				</c:if>
			</div>
			<aside id="sidebar-right">
				<jsp:include page="../../bestlist.jsp" />
			</aside>
		</div>
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/js/user/sidebar.js"></script>

	<script src="resources/js/user/award/award.js?after"></script>
	<script src="resources/js/user/award/award_table.js?after"></script>
</body>
</html>