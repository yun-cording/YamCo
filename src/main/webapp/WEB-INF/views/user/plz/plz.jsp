<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냠냠레시피</title>
	<link rel="stylesheet" href="resources/css/user/recipe/search_list.css?after" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="icon" type="image/x-icon" href="resources/images/icon_tomato.png">
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

 #mydiv{
        width: 1920px;
        margin:  auto;
		 font-family: 'Yeongdeok_TTF';
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
	width: 100%;
	clear: left;
	padding-top: 100px;
}

.text{
	font-size: 24px;
	background: tomato;
	color: white;
}
.margin{
	margin-left:100px;
	margin-top: 10px;
}
.top{
	margin-top: 60px;
}
.box{
	border: 3px solid tomato;
	border-radius: 40px;
	border-top-width: 40px;
	border-bottom-width: 40px;
	width: 1120px;
	height: 1000px;
	margin-left: 100px;
}
.arrow{
	width: 300px;
	height: 150px;
	float: left;
	margin-top: 20px;
}
.ref_top{
	margin-left: 250px;
	margin-top: 10px;
}
.click{
	color: tomato;
	font-size: 128px;
	font-weight: bold;
	float: left;
}
.clean{
clear: both;
}
.guide{
	margin-left: 320px;
	float: left;
	color: lightgray;
}
#gif-container{
	margin-left: 180px;
}
.hidden-input{
	float: left;
	 opacity: 0;
    transition: opacity 2s cubic-bezier(1, 0, 1, 1);
}
.input_text{
	width:80px;
	height:30px;
	font-size: 14px;
	position: relative;
	left: -102px;
	
}

.search{
	margin-top:15px;
	width:1120px;
	display: flex;
	align-content:center;
	justify-content: center;
}

.bt{
	
	border: none;
	background: tomato;
	color: white;
	font-size: 25px;
	font-weight: bold;
	width: 222px;
	height: 65px;
	border-radius: 36px;
	
}

#input-stack{
	width:1120px;
	display: flex;
	align-content:center;
	justify-content: center;
}
.center{
	margin-left: 74px;
}
.container{
	margin-top: 50px;
}

</style>

</head>
<body>
	<div id="mydiv">
		
		<jsp:include page="../../header.jsp" />
		<aside id="sidebar-left">
			<jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div class="margin top"><span class="text">우리집 냉장고 속에 있는 이런 재료론 어떤 요리가?</span></div>
			<div class="margin"><span class="text">아래 냉장고를 클릭해서 우리집 냉장고에 있는 재료를 입력하세요!</span></div>
			<div class="margin box">
				<div class="clean"><div class="ref_top"><img class="arrow" src="/resources/images/arrow_tomato.png"><span class="click">Click!</span></div>
				</div>
				<div class="guide"><span>※최대 3개의 재료까지 등록 가능합니다</span></div>
				<div id="gif-container"><img class="ref" id="gif-image" src="/resources/images/move_refrige.gif"></div>
				<div id="input-stack">
					<div class="clean">
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
					</div>
				</div>
					<div class="search"><button class="bt">레시피 검색</button></div>
			</div>
			<!-- 냉장고 끝 -->
			<!-- 검색시 -->
			<div class="container">
				<div class="row me-1">
					<div class="col-9">
						<span class="search_subject">냠냠 레시피는 총</span> <span class="search_count">???</span> <span class="search_subject">개</span>
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
		<div id="footer"><jsp:include page="../../footer.jsp" /></div>
	</div>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var gifContainer = document.getElementById("gif-container");
    var gifImage = document.getElementById("gif-image");
    var inputStack = document.getElementById("input-stack");
    var hiddenInputs = inputStack.querySelectorAll(".hidden");
    var clickCount = 0;
		
    
	 // 1. 클릭 시에만 GIF 재생
    gifContainer.addEventListener("click", function() {
             gifImage.src = "/resources/images/move_refrige.gif"; 
                 hiddenInputs[clickCount].style.opacity = "1";
             clickCount++
    });      
 	
    // 페이지 이탈 시 클릭 횟수 및 이미지 초기화
    window.addEventListener("beforeunload", function() {
        clickCount = 0;

        for (var i = 0; i < hiddenInputs.length; i++) {
            hiddenInputs[i].style.display = "none"; // 이미지 숨김
        }
    });
});
</script>
</body>
</html>