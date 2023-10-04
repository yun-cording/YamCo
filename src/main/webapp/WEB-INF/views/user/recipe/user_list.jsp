<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"	href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/recipe/user_list.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js"></script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<!-- 카테고리 만들기 -->
			<%-- <div id="category">
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
					<li class="category_center">1인분</li>
					<li class="category_center">채식</li>
					<li class="category_center">국물류</li>
					<li class="category_center">돈까스,일식</li>
					<li class="category_center">고기,구이</li>
					<li class="category_center">해산물</li>
					<li class="category_center">분식</li>
					<li class="category_center">면류</li>
					<li class="category_center">죽</li>
					<li class="category_center">술안주</li>
					<li class="category_center">반찬</li>
					<li class="category_center">후식</li>
					<li id="category_etc">기타</li>
					
				</ul>
			</div>
			--%>
			<!-- 카테고리 끝 -->
			<!-- 레시피 출력 -->
			<!-- 콘텐츠공간 -->
			<div class="flexContainer">
				<c:forEach var="recipe" items="${userList}">
					<div class="recipe_one">
						<!-- rcp_idx 추가하자 -->
						<p><a href="/user_recipe_detail.do?rcp_idx=${recipe.rcp_idx}">
							<img
								src="resources/user_image/user_thumnail/${recipe.u_rcp_img}"
								class="recipe_thumbnail"></a>
						</p>
						<p>${recipe.u_rcp_title}</p>
						<div class="writer">
							<img
								src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
								class="profile"> <span>${recipe.m_nick}</span>
						</div>
						<div class="like" style="text-align: right;">
							<img class="icon"
								src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg"
								alt=""> <span>${recipe.avg_grade}</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png"
								alt=""> <span>${recipe.m_nick}</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"
								alt=""> <span>${recipe.u_rcp_hit}</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- <div class=pagecontainer>
				<ol class="paging">
					<li><a href=""> < </a></li>
					<li><a href=""> 1 </a></li>
					<li><a href=""> 2 </a></li>
					<li><a href=""> 3 </a></li>
					<li><a href=""> 4 </a></li>
					<li><a href=""> 5 </a></li>
					<li><a href=""> > </a></li>
				</ol>
			</div> -->
			<!-- 레시피 출력끝  -->
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