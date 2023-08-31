<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

 #main{
        width: 1920px;
        margin:  auto;
        font-family: 'Yeongdeok_TTF';
		
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

 #sidebar-right {
	float: left;
	width: 15.625%;
	height: 100%;
}


#footer {
	padding-top: 100px;
	left: 0px;
	width: 100%;
	clear: left;
}

#notice{
	padding-left: 30px;
	padding-top: 30px;
}

#notice_img{
 
	width: 900px;
	height: 330px;
	float: left;
	
}

#Recommen{
	width: 200px;
	height: 25px;
	padding-top:10px;
	margin-left: 120px;
	float: left;
}


#ingredient{
	padding-left: 50px;
	padding-top:30px;
	float: left;
}

#ingredient_img{
	width: 300px;
	height: 275px;
}

.new_yamyam {
	height: 480px;
}

.best_rcp{
	height: 920px;
}

.ref_search{
	height: 200px;
}

#ref_text{
	display: flex;
    align-items: center;
    justify-content: center;
    padding-top: 60px;
}

#grade_text{
	display: flex;
    align-items: center;
    justify-content: center;
    padding-top: 60px;
}

#grade_two{
	width: 200px;
	height: 200px;
	float: left;
	margin-left: 330px;
	margin-top: 128px;
	background: #FF7D66;
}
#grade_one{
	width: 200px;
	height: 250px;
	float: left;
	margin-top: 78px;
	background: tomato;
}
#grade_three{
	width: 200px;
	height: 130px;
	float: left;
	margin-top: 198px;
	background: #FF9481;
}

.nick{
	margin-top:30px;
	float: left;
	margin-left: 78px;
}

.rank{
	width: 60px;
	margin-top: 5px;
	margin-left: 70px;
	float: left;
}

.grade{
	height: 450px;
}

.border{
	width: 1260px;
	margin-left:30px;
	margin-top: 60px;
	float: left;
	border-bottom: 2px solid #21730B;
}

.flexContainer {
    width: 1320px;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
} 
.flexbetween{
	display: flex;
	flex-direction: row;
	 flex-wrap: wrap;
    justify-content: space-between;
    float: left;
}

.clear{
	clear:both;
}

.title{
font-size: 30px; color: tomato;
float: left;
text-align: center;
}

.point_tomato{
color: tomato;
}
.point_green{
color: #21730B;
}

.plus{
	margin-right: 50px;
	margin-top:5px;
	float: right;
	height: 30px;
	background: white;
	border: 3px solid #21730B;
	color: #21730B;
	border-radius: 5px;
	
}

.view{
	width: 80px;
}
.ref{
	width: 160px;
}

.recipe_one {
	margin: 20px;
	margin-left: 35px;
	margin-right: 30px;
	width: 250px;
	height:400px;
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
.recipe_thumbnail {
	width: 250px;
	height: 250px;
	border-radius: 5px;
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
.thumbnail{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-top: -25px;
	position: relative;
	left: -44px;
	
}


</style>
</head>
<body>
<div id="main">
		
		<jsp:include page="header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="recentlist.jsp" />
		</aside>
		<div id="content">
		<div class="clear">
		
			<div id="notice">
			<img id="notice_img" src="/resources/images/notice_exam.png">
			</div>
				<div id="Recommen"><span style="font-size: 22px;">오늘의 <span class="point_tomato">추천</span> 재료</span></div>
				<div id="ingredient">
			<img id="ingredient_img" src="/resources/images/potatoes.png">
			</div>
			</div>
			
			<div class="clear">
			<div class="border new_yamyam">
				<div><span class="title">최신 냠냠레시피</span></div>
				<button class="plus view">더보기</button>
			
			<div class="flexbetween">
				<c:forEach begin="1" end="4">
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
			</div>
		</div>	
		
		
			<div class="clear">
			<div class="border best_rcp">
				<div><span class="title">베스트 레시피</span></div>
				<button class="plus view">더보기</button>
			
			<div class="flexbetween">
				<c:forEach begin="1" end="8">
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
			</div>
		</div>	
		
		<div class="clear">
			<div class="border ref_search">
				<div><span class="title">냉장고를 열어봐</span></div>
				<button class="plus ref">냉장고 열러가기</button>
				<div id="ref_text"><span style="font-size: 40px">우리집 <span class="point_tomato">냉장고</span>의
				 이런 <span class="point_tomato">재료</span>로 이런 <span class="point_green">요리</span>를???</span></div>
			</div>
		</div>	
		
		<div class="clear">
			<div class="border grade">
				<div><span class="title">명예의 전당</span></div>
				<button class="plus view">더보기</button>
				<div id="grade_text"><span style="font-size: 40px"><span class="point_tomato">최고</span>의 <span class="point_green">냠냠쉐프</span>는?</span></div>
				<div id="grade_two"><img id="thumbnail_two" class="thumbnail" src="/resources/images/potatoes.png"><span class="nick">닉네임</span><img class="rank" src="/resources/images/rankingmedal/2.png"></div>
				<div id="grade_one"><img id="thumbnail_two" class="thumbnail" src="/resources/images/potatoes.png"><span class="nick">닉네임</span><img class="rank" src="/resources/images/rankingmedal/1.png"></div>
				<div id="grade_three"><img id="thumbnail_two" class="thumbnail" src="/resources/images/potatoes.png"><span class="nick">닉네임</span><img class="rank" src="/resources/images/rankingmedal/3.png"></div>
			</div>
		</div>	
			
		</div>
		<aside id="sidebar-right">
			<jsp:include page="bestlist.jsp" />
			</aside>
		<div id="footer"><jsp:include page="footer.jsp" /></div>
		</div>
		${alert }
</body>
</html>