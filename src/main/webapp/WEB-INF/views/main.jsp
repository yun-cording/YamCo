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

.image-banner{
 
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
	margin: 0px;
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
	float: left;
	width: 200px;
	text-align: center;
	
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
	left: 75px;
}
a,button{
cursor: pointer;
}

</style>
</head>
<script type="text/javascript">
	function search_go(f) {
		const form = document.getElementById("myForm");
		console.log(form)
		form.action = "/search.go" ;
		form.submit();
	}
	</script>

<body>
<div id="main">
		
		<jsp:include page="header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="recentlist.jsp" />
		</aside>
		<div id="content">
		<div class="clear">
			<div id="notice">
			<c:forEach var="k" items="${noticeList}">
            	<img id="notice_img_${status.index}" class="image-banner" src="/resources/images/${k.notice_img}" alt="${k.notice_title}" />
			</c:forEach>
			</div>
				<div id="Recommen"><span style="font-size: 22px;">오늘의 <span class="point_tomato">추천</span> 재료</span></div>
				<div id="ingredient">
			<form method="post" id="myForm">
			<a ><input type="hidden" name="search_text" value="${saveVO.foodsave_title}">
			<img id="ingredient_img" src="/resources/images/${saveVO.foodsave_img}" onclick="search_go(this.form)" ></a>
			</form>
			</div>
			</div>
				
			
			<div class="clear">
			<div class="border new_yamyam">
				<div><span class="title">최신 냠냠레시피</span></div>
				<button type="button" class="plus view" onclick="">더보기</button>
			
			<div class="flexbetween">
				<c:forEach items="${userList }" var="k">
				<div class="recipe_one">
							<a href="/사용자레시피?rcp_seq=${k.rcp_idx}">
							<p><img src="resources/user_image/user_thumnail/${k.u_rcp_img }" class="recipe_thumbnail"></p>
							<p>${k.u_rcp_title }</p>
							<div class="writer">
								<img src="${k.m_image }" class="profile"><span>${k.m_nick }</span>
							</div>
							</a>
							<div class="like" style="text-align: right;">
							<img class="icon" src="/resources/images/icon_tomato_ver2_1.png" alt="">
							<span>${empty k.avg_grade ? 0 : k.avg_grade }</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
							<span>${empty k.c_count ? 0 : k.c_count}</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"	alt="">
							<span>${empty k.u_rcp_hit ? 0 : k.u_rcp_hit}</span>
						</div>
						</div>
					</c:forEach>
				
				</div>
			</div>
		</div>	
		
		
			<div class="clear">
			<div class="border best_rcp">
				<div><span class="title">베스트 레시피</span></div>
				<button type="button" class="plus view" onclick="bestgo()">더보기</button>
			
			<div class="flexbetween">
				<c:forEach items="${bestList }" var="k">
				<div class="recipe_one">
							<a href="/사용자레시피?rcp_seq=${k.rcp_idx}">
							<p><img src="${k.u_rcp_img }" class="recipe_thumbnail"></p>
							<p>${k.u_rcp_title }</p>
							<div class="writer">
								<img src="${k.m_image }" class="profile"><span>${k.m_nick }</span>
							</div>
							</a>
							<div class="like" style="text-align: right;">
							<img class="icon" src="/resources/images/icon_tomato_ver2_1.png" alt="">
							<span>${empty k.avg_grade ? 0 : k.avg_grade }</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/8316/8316018.png" alt="">
							<span>${empty k.c_count ? 0 : k.c_count}</span>
							<img class="icon" src="https://cdn-icons-png.flaticon.com/512/2415/2415461.png"	alt="">
							<span>${empty k.u_rcp_hit ? 0 : k.u_rcp_hit}</span>
						</div>
						</div>
					</c:forEach>
				
				</div>
			</div>
		</div>	
		
		<div class="clear">
			<div class="border ref_search">
				<div><span class="title">냉장고를 열어봐</span></div>
				<button type="button" class="plus ref" onclick="openref()">냉장고 열러가기</button>
				<div id="ref_text"><span style="font-size: 40px">우리집 <span class="point_tomato">냉장고</span>의
				<span class="point_tomato">재료</span>로 이런 <span class="point_green">요리</span>를???</span></div>
			</div>
		</div>	
		
		<div class="clear">
			<div class="border grade">
				<div><span class="title">명예의 전당</span></div>
				<button type="button" class="plus view" onclick="awardgo()">더보기</button>
				<c:if test="${not empty award_list}">
					<div id="grade_text"><span style="font-size: 40px"><span class="point_tomato">최고</span>의 <span class="point_green">냠냠쉐프</span>는?</span></div>
					
					<div id="grade_two" >
					<c:choose>
						<c:when test="${not empty award_list[1].m_image}">
							<img id="thumbnail_two" class="thumbnail" src="${award_list[1].m_image}">
						</c:when>
						<c:otherwise>
							<img id="thumbnail_two" class="thumbnail" src="/resources/images/icon_input.png">
						</c:otherwise>
					</c:choose>
					<span class="nick">${award_list[1].m_nick}</span><img class="rank" src="/resources/images/rankingmedal/2.png"></div>
					
					<div id="grade_one" >
					<c:choose>
						<c:when test="${not empty award_list[0].m_image}">
							<img id="thumbnail_two" class="thumbnail" src="${award_list[0].m_image}">
						</c:when>
						<c:otherwise>
							<img id="thumbnail_two" class="thumbnail" src="/resources/images/icon_input.png">
						</c:otherwise>
					</c:choose>
					<span class="nick">${award_list[0].m_nick}</span><img class="rank" src="/resources/images/rankingmedal/1.png"></div>
					
					<div id="grade_three">
					<c:choose>
						<c:when test="${not empty award_list[2].m_image}">
							<img id="thumbnail_two" class="thumbnail" src="${award_list[2].m_image}">
						</c:when>
						<c:otherwise>
							<img id="thumbnail_two" class="thumbnail" src="/resources/images/icon_input.png">
						</c:otherwise>
					</c:choose>
							<span class="nick">${award_list[2].m_nick}</span><img class="rank" src="/resources/images/rankingmedal/3.png"></div>
				</c:if>
			</div>
		</div>	
			
		</div>
		<aside id="sidebar-right">
			<jsp:include page="bestlist.jsp" />
			</aside>
		<div id="footer"><jsp:include page="footer.jsp" /></div>
		</div>
		${alert }
		<script type="text/javascript">
	 var noticeImages = document.querySelectorAll(".image-banner");
	 var currentIndex = 0;
	 function hideAllImages() {
	        noticeImages.forEach(function(image) {
	        	 image.style.opacity = 0;
	             image.style.display = "none";
	        });
	    }
	 function showImage(index) {
	        noticeImages[index].style.display = "block";
	        var opacity = 0;
	        var timer = setInterval(function() {
	            opacity += 0.02; // 매 20ms마다 투명도를 증가시켜 부드럽게 나타나게 함
	            noticeImages[index].style.opacity = opacity.toFixed(2); // 소수점 두 자리까지 설정
	            if (opacity >= 1) {
	                clearInterval(timer); // 투명도가 1에 도달하면 타이머 종료
	            }
	        }, 20); // 20ms 간격으로 실행
	    }
	 
	 function changeImage() {
			 hideAllImages();
	        showImage(currentIndex);
	        currentIndex = (currentIndex + 1) % noticeImages.length;
	    }
		// 초기에는 첫 번째 이미지만 표시
	    hideAllImages();
	    showImage(currentIndex);

	 	// 5초마다 이미지 변경
	    setInterval(changeImage, 5000);
	 	
	    function awardgo() {
	    	location.href ="/award.go" ;
		}
	    function openref() {
	    	location.href ="/plz.go" ;
		}
	    function bestgo() {
	    	location.href ="/go_ranking_recipe.do" ;
		}
	  	
</script>
</body>
</html>