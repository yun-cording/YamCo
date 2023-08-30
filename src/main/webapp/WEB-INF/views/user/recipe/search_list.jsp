<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>레시피 검색결과</title>
<link rel="icon" type="image/x-icon" href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/recipe/search_list.css?after" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js?after"></script>
<script src="resources/js/user/recipe/search_list.js"></script>
</head>
<body>
	<div id="mydiv">
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
				<div class="row mx-5">
					<div class="col-9">
						<span class="search_subject">검색된 냠냠 레시피는 총</span> <span class="search_count">${list.size()}</span> <span class="search_subject">개</span>
					</div>
					<div class="col-1 tab-on">
						<span>정확순</span>
					</div>
					<div class="col-1 tab-off">
						<span>조회순</span>
					</div>
					<div class="col-1 tab-off">
						<span>평점순</span>
					</div>
				</div>
			<!-- 레시피 출력 -->
			<!-- 콘텐츠공간 -->
			<div id="flexContainer">
				<c:forEach items="${list }" var="k">
					<div class="recipe_one">
						<p><img src="${k.u_rcp_img }" class="recipe_thumbnail"></p>
						<p>${k.u_rcp_title }</p>
						<div class="writer">
							<img src="${k.m_image }" class="profile"><span>${k.m_nick }</span>
						</div>
						<div class="like" style="text-align: right;">
							<img class="icon" src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg" alt="">
							<span>${k.avg_grade }</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
							<span>${k.c_count }</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"	alt="">
							<span>${k.u_rcp_hit }</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${list.size()>4 }">
			<div class="d-flex justify-content-center my-5">
				<button type="button" class="btn btn-lg text-white"
				 style="background-color: tomato" id="btn_append">더보기
				 </button>
			</div>
			</c:if>
			<script type="text/javascript">
				$(function () {
					var idx = 2;
					$(".recipe_one").slice(idx).hide();
					$("#btn_append").on("click", function() {
		                $(".recipe_one:hidden").slice(0, idx).show();
		                if ($(".recipe_one:hidden").length === 0) {
		                    $("#btn_append").hide(); // 모든 항목이 표시되었을 때 버튼 숨기기
		                }
					});
				});
			</script>
			<!-- 레시피 출력끝  -->
		</div>
		<aside id="sidebar-right">
			<jsp:include page="../../bestlist.jsp" />
		</aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/js/user/sidebar.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>