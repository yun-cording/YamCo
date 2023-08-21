<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/icon_tomato.png">
<style type="text/css">

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#mydiv {
	position: relative; 
  width : 1920px;
	height: 2000px; 
  left : 0px; 
  top : 0px;
	margin: auto;
	width: 1920px; 
  height : 4400px;
}

#sidebar-right {
	background-color: yellow;
	float: right;
	width: 15.625%;
	height: 4400px;
}

#sidebar-left {
	background-color: yellow;
	width: 15.625%;
	float: left;
	height: 4400px;
}

#content {
	width: 68.75%;
	float: left;
	margin-top: 0px;
	background: snow;
	height: 4400px;
}

#footer {
	background-color: #333;
	left: 0px;
	color: #fff;
	width: 100%;
	height: 300px;
	clear: left;
}

#test {
	width: 100%;
	height: 1500px;
}

#topline {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 1060px;
	height: 106px;
	left: calc(50% - 1060px/ 2);
	top: 348px;
	border-bottom: 3px solid #21730B;
}

#lrecipe {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 110px;
	height: 54px;
	border: 2px solid #FF6347;
	left: 539px;
	top: 375px;
}

#lsearch {
  text-align: center;
	box-sizing: border-box;
	position: absolute;
	width: 110px;
	height: 54px;
	left: 430px;
	top: 375px;
	background: #FF6347;
	border: 2px solid #FF6347;
}

#toptext {
	position: absolute;
	width: 203px;
	height: 48px;
	left: calc(50% - 203px/ 2 + 0.5px);
	top: 370px;
	font-family: 'BM HANNA_TTF';
	font-style: normal;
	font-weight: 400;
	font-size: 48px;
	line-height: 48px;
	display: flex;
	align-items: center;
	text-align: center;
}

#today {
	box-sizing: border-box;
	position: absolute;
	width: 95px;
	height: 54px;
	left: 1206px;
	top: 474px;
	border: 2px solid #FF6347;
}

#week {
	box-sizing: border-box;
	position: absolute;
	width: 96px;
	height: 54px;
	left: 1301px;
	top: 474px;
	border: 2px solid #FF6347;
}

#month {
	box-sizing: border-box;
	position: absolute;
	width: 95px;
	height: 54px;
	left: 1397px;
	top: 474px;
	background: #FF6347;
	border: 2px solid #FF6347;
}
.todaytext{
font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
font-size: 24px;
line-height: 54px;
text-align: center;
display: block;
align-items: center;
color: #000000;
}

#searchtext{
  text-align: center;
  font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
  font-size: 24px;
line-height: 54px;
display: block;
color: #FFFFFF;
}

#recipetext{
  text-align: center;
  font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
  font-size: 24px;
  line-height: 54px;
display: block;
}

#search_rankingtext{
position: absolute;
width: 240px;
height: 48px;
left: calc(50% - 203px/2 + 0.5px);
top: 370px;
font-family: 'BM HANNA_TTF';
font-style: normal;
font-weight: 400;
font-size: 48px;
line-height: 48px;
display: flex;
align-items: center;
text-align: center;
color: #000000;
}

a{
  text-decoration: none;
}

@font-face {
    font-family: 'BM HANNA_TTF';
    src: url('../resources/fonts/BMHANNA_11yrs_ttf.ttf') format('truetype');
}

#lrecipe span:hover{
	background: #FF6347;
	color: #000000;
}

#lsearch span:hover{
	background: #FF6347;
	color: #000000;
}

.recipe_thumbnail{
width: 250px;
height: 250px;
}
.recipe_one{
  margin: 60px 20px;
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

#flexContainer{
  display: flex;
  width: 1320px;
  flex-wrap: wrap; 
  justify-content: space-evenly;
  margin-top: 280px;
  /* justify-content: space-evenly; 양끝과 아이템 사이의 간격을 동일하게 만듭니다. */
  /* flex-direction: row; 기본값이 row로 설정되어 있음. 안에 내용들이 좌에서 우로 가로방향으로 이동 */
  /* flex-wrap: wrap; flex폭이 지정되어 있고 flex안에 내용들이 flex항목의 width를 넘어갈때 여러 행에 나열될수 있도록 설정해주는 내용. 즉, 다음줄로 이동 */
}
.medal{
	width: 60px;
	height: 60px;
}

#toppart{
	
}

</style>
<script type="text/javascript">
function select_search() {
	
}
function select_recipe() {
	
}
function select_today() {
	
}
function select_week() {
	
}
function select_month() {
	
}

</script>
</head>
<body>
	<div id="mydiv">
    <jsp:include page="../../header.jsp" />
			<aside id="sidebar-left">왼쪽</aside>
			<aside id="sidebar-right">오른쪽</aside>
		<div id="test">
				
				<div id="toppart">
				<div id="lrecipe" onclick="select_recipe()"><span id="recipetext">검색어</span></div>
				<dlv id="lsearch" onclick="select_search()"><span id="searchtext">레시피</span></dlv>
				<div id="topline"></div>
        <div id="search_rankingtext">검색어랭킹</div>
				
				<div id="today" onclick="select_today()"><span class="todaytext">일간</span></div>
				<div id="week" onclick="select_week()"><span class="todaytext">주간</span></div>
				<div id="month" onclick="select_month()"><span class="todaytext">월간</span></div>
				</div>
				<!-- <c:forEach begin="1" end="30" var="k">
				<div id="firstline"><img src="../resources/rankingmedal/${k }.png" class="medal" id="medal${k }"></div>
				<div id="firstline"><img src="../resources/rankingmedal/1.png" class="medal" id="medal1"></div>		
				</c:forEach> -->

			
				
        
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

		<div id="footer">
			<jsp:include page="../../footer.jsp" />
		</div>
	</div>
</body>
</html>