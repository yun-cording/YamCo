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
	href="resources/css/user/ranking/ranking_recipe.css?after" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js"></script>
<script type="text/javascript">
	function search() {
		document.getElementById("lsearch").style.background = 'tomato';
		document.getElementById("searchtext").style.color = 'white ';

		document.getElementById("lrecipe").style.background = 'white';
		document.getElementById("recipetext").style.color = 'black';
	}

	function recipe() {
		document.getElementById("lrecipe").style.background = 'tomato';
		document.getElementById("recipetext").style.color = 'white ';

		document.getElementById("lsearch").style.background = 'white';
		document.getElementById("searchtext").style.color = 'black';
	}

	function select_week() {
		document.getElementById("week").style.cssText = 'background-color:tomato';
		document.getElementById("weektext").style.color = 'white';

		document.getElementById("month").style.cssText = 'background-color:white';
		document.getElementById("monthtext").style.color = 'black';

		location.href = "/go_ranking_recipe_7day.do";
	}

	function select_month() {
		document.getElementById("month").style.cssText = 'background-color:tomato';
		document.getElementById("monthtext").style.color = 'white';

		document.getElementById("week").style.cssText = 'background-color:white';
		document.getElementById("weektext").style.color = 'black';
	}
</script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div id="lrecipe" onclick="recipe()">
				<span id="recipetext">레시피</span>
			</div>
			<a href="/ranking_search.go"><dlv id="lsearch" onclick="search()">
				<span id="searchtext">검색어</span></dlv></a>
			<div id="topline"></div>
			<div id="search_rankingtext">레시피랭킹</div>

			<div id="week" onclick="select_week()">
				<span id="weektext">주간</span>
			</div>
			<div id="month" onclick="select_month()">
				<span id="monthtext">월간</span>
			</div>

			<div id="flexContainer">
				<c:choose>
					<%-- lank_list_recipe가 비어있지 않은 경우 --%>
					<c:when test="${not empty lank_list_recipe }">
						<c:forEach var="k" items="${lank_list_recipe }" varStatus="vs">
							<c:choose>
								<c:when test="${not empty k.hit_1mon}">
									<div class="recipe_one">
										<p>
											<%-- 공공레시피와 사용자레시피의 url을 다르게 설정한다 --%>
											<c:choose>
												<c:when test="${k.rcp_idx < 10000 }">
													<c:set var="rcp_url"
														value="/go_publicDet.do?rcp_seq=${k.rcp_idx }" />
												</c:when>
												<c:otherwise>
													<c:set var="rcp_url"
														value="/user_recipe_detail.do?rcp_idx=${k.rcp_idx }" />
												</c:otherwise>
											</c:choose>
											<a href="${rcp_url }"> <img
												src="../resources/images/rankingmedal/${vs.count}.png"
												class="medal"> <c:choose>
													<%-- u_rcp_img가 없는 경우 기본 이미지 출력 --%>
													<c:when test="${k.u_rcp_img == null}">
														<img
															src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg"
															class="recipe_thumbnail" alt="맛있는 음식 기본 이미지">
													</c:when>
													<c:otherwise>
														<%-- 메달 이미지 1부터 출력 --%>
														<%-- u_rcp_img가 유효한 값이 아닐 경우 문자열 그대로 출력됨 --%>
														<img src="${k.u_rcp_img}" class="recipe_thumbnail"
															alt="${k.u_rcp_img}">
													</c:otherwise>
												</c:choose>
											</a>
										</p>
										<p>${k.u_rcp_title }</p>
										<div class="writer">
											<%-- m_image가 없는 경우 기본 이미지 출력 --%>
											<c:choose>
												<c:when test="${k.m_image == null}">
													<img src="/resources/images/icon_input.png" class="profile"
														alt="기본 프로필 이미지">
												</c:when>
												<c:otherwise>
													<%-- m_image가 유효한 값이 아닐 경우 문자열 그대로 출력됨 --%>
													<img src="${k.m_image }" class="profile"
														alt="${k.m_image }">
												</c:otherwise>
											</c:choose>

											<span>${k.m_nick}</span>
										</div>
										<div class="like" style="text-align: right;">
											<img class="icon"
												src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg"
												alt="">
											<c:choose>
												<%-- avg_grade가 null인 경우(별점이 없는 경우) --%>
												<c:when test="${k.avg_grade == null}">
													<span>X</span>
												</c:when>
												<c:otherwise>
													<span>${k.avg_grade }</span>
												</c:otherwise>
											</c:choose>

											<img class="icon"
												src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png"
												alt=""> <span>${k.c_count}</span> <img class="icon"
												src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"
												alt=""> <span>${k.hit_1mon}</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<%-- 레시피가 1개도 없는 경우, 출력 화면 구성은 추후 다시 확정할 것! --%>
						<p>레시피 데이터가 존재하지 않습니다.</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
		</aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
</body>
</html>