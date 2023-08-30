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
<script type="text/javascript">
	$(function () {
		$("#btn_append").on("click", function() {
			var newRecipe = '';
			for (var i = 0; i < 4; i++) {
				newRecipe += '<div class="recipe_one">';
				newRecipe +='<p>';
				newRecipe +='<img	src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg" class="recipe_thumbnail">';
				newRecipe +='<p>';
				newRecipe +='<p>공공레시피명</p>';
				newRecipe +='<div class="writer">';
				newRecipe +='<img src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg" class="profile"> <span>작성자 이름</span> ';
				newRecipe +='</div>';
				newRecipe +='<div class="like" style="text-align: right;">';
				newRecipe +='	<img class="icon"	src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg" alt="">';
				newRecipe +='<span>4.9</span>';
				newRecipe +='<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt=""> ';
				newRecipe +='<span>42</span>';
				newRecipe +='<img class="icon"	src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png" alt=""> ';
				newRecipe +='<span>7만</span>';
				newRecipe +='<span>7만</span>';
				newRecipe +='</div></div>';
			}
			$("#flexContainer").append(newRecipe);
		});
	});

</script>
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
						<span class="search_subject">냠냠 레시피는 총</span> <span class="search_count">${list.size()}</span> <span class="search_subject">개</span>
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
				<c:forEach begin="1" end="12">
					<div class="recipe_one">
						<p>
							<img
								src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg"
								class="recipe_thumbnail">
						</p>
						<p>공공레시피명</p>
						<div class="writer">
							<img
								src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
								class="profile"> <span>작성자 이름</span>
						</div>
						<div class="like" style="text-align: right;">
							<img class="icon"
								src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg"
								alt=""> <span>4.9</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png"
								alt=""> <span>42</span> <img class="icon"
								src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"
								alt=""> <span>7만</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="d-flex justify-content-center my-5">
				<button type="button" class="btn btn-lg text-white"
				 style="background-color: tomato" id="btn_append">더보기</button>
			</div>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>