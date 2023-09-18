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
	href="resources/css/user/ranking/ranking_search_7day.css?after" />
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

	function select_month() {
		document.getElementById("month").style.cssText = 'background-color:tomato';
		document.getElementById("monthtext").style.color = 'white';

		document.getElementById("week").style.cssText = 'background-color:white';
		document.getElementById("weektext").style.color = 'black';
		
		location.href="/ranking_search.do";
	}
</script>
</head>
<body>

	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<div id="test">
			<aside id="sidebar-left">
				<jsp:include page="../../recentlist.jsp" />
			</aside>

			<div id="content">
				<a href="/ranking_recipe.do"><div id="lrecipe"
						onclick="recipe()">
						<span id="recipetext">레시피</span>
					</div></a>
				<dlv id="lsearch" onclick="search()"> <span id="searchtext">검색어</span></dlv>
				<div id="topline"></div>
				<div id="search_rankingtext">검색어랭킹</div>

				<div id="week">
					<span id="weektext">주간</span>
				</div>
				<div id="month" onclick="select_month()">
					<span id="monthtext">월간</span>
				</div>

				<c:choose>
					<%-- lank_list_search가 비어있지 않은 경우 --%>
					<c:when test="${not empty lank_list_search }">
						<c:forEach var="k" items="${lank_list_search }" varStatus="vs">
							<div id="keywardtext${vs.count }" class="keywardtextclass">
								<a href="">${vs.count }.${k }</a>
							</div>
							<div id="keyward${vs.count }" class="keywardLineClass"></div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<%-- 검색어가 1개도 없는 경우, 출력 화면 구성은 추후 다시 확정할 것! --%>
						<p>검색어 데이터가 존재하지 않습니다.</p>
					</c:otherwise>
				</c:choose>
				
			</div>
			<aside id="sidebar-right">
				<jsp:include page="../../bestlist.jsp" />
			</aside>
		</div>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
</body>
</html>