<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>

<link rel="icon" type="image/x-icon"href="resources/images/icon_tomato.png">
<link rel="stylesheet" href="resources/css/user/ranking/ranking_recipe.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/user/sidebar.js"></script>
<script type="text/javascript">
function search() {
	document.getElementById("lsearch").style.background='tomato';
	document.getElementById("searchtext").style.color='white ';
	
	document.getElementById("lrecipe").style.background='white';
	document.getElementById("recipetext").style.color='black';
}

function recipe() {
	document.getElementById("lrecipe").style.background='tomato';
	document.getElementById("recipetext").style.color='white ';

	document.getElementById("lsearch").style.background='white';
	document.getElementById("searchtext").style.color='black';
}


function select_week() {
	document.getElementById("week").style.cssText='background-color:tomato';
	document.getElementById("weektext").style.color='white';
	
	document.getElementById("month").style.cssText='background-color:white';
	document.getElementById("monthtext").style.color='black';
}

function select_month() {
	document.getElementById("month").style.cssText='background-color:tomato';
	document.getElementById("monthtext").style.color='white';
	
	document.getElementById("week").style.cssText='background-color:white';
	document.getElementById("weektext").style.color='black';
}


</script>
</head>
<body>
	<div id="mydiv">
    <jsp:include page="../../header.jsp" />
			<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp"/>
			</aside>
				<div id="content">
				<div id="lrecipe" onclick = "recipe()"><span id="recipetext" >레시피</span></div>
				<dlv id="lsearch" onclick = "search()"><span id="searchtext" >검색어</span></dlv>
				<div id="topline" >
				</div>
		        <div id="search_rankingtext" >검색어랭킹</div>
				
				<div id="week" onclick="select_week()"><span id="weektext">주간</span></div>
				<div id="month" onclick="select_month()"><span id="monthtext">월간</span></div>

        <div id="flexContainer">
      <c:forEach var="k" begin="1" end="30">
        <div class="recipe_one">
          <p>
            <img src="../resources/images/rankingmedal/${k}.png" class="medal">
            <img src="https://mediahub.seoul.go.kr/wp-content/uploads/2020/10/d13ea4a756099add8375e6c795b827ab.jpg" class="recipe_thumbnail">
          </p>
          <p>공공레시피명</p>
          <div class="writer">
            <img src="https://png.pngtree.com/png-vector/20191115/ourmid/pngtree-beautiful-profile-line-vector-icon-png-image_1990469.jpg"
              class="profile"> <span>작성자 이름</span>
          </div>
          <div class="like" style="text-align: right;">
            <img class="icon" src="https://img.medicalreport.kr/resources/2019/07/23/o0vYNCXzJDWRPejw.jpg"
              alt=""> <span>4.9</span> <img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png"
              alt=""> <span>42</span> <img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png" alt=""> <span>7만</span>
          </div>
        </div>
			</c:forEach>
      </div>
      </div>
      <aside id="sidebar-right">
      <jsp:include page="../../bestlist.jsp"/>
      </aside>
		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
</body>
</html>