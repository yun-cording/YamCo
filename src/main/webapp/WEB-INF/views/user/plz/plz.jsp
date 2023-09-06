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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
	background: rgb(248,248,248);
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
	color: black;
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
.off{
	display: none;
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
				<form onsubmit="return submitForm(this);">
				<div id="input-stack">
					<div class="clean">
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
						<div class="hidden-input hidden center"><img src="/resources/images/icon_input.png"><input class="input_text" type="text"></div>
					</div>
				</div>
					<div class="search"><button id="rcp_search_bt" class="bt" onclick="searchbt()">레시피 검색</button></div>
			</form>
			</div>
			<!-- 냉장고 끝 -->
			<div id="onoff" class="off">
			<!-- 검색시 시작 -->
			<div class="container">
				<div class="row mx-5">
				<div class="col-10">
					<span class="search_subject">검색된 냠냠's 쉐프레시피는 총</span> <span class="search_count">${u_list.size()}</span> <span class="search_subject">개 입니다.</span>
				</div>
				<div id="u_order_hit" class="col-1 tab-on" onclick="search_sort_hit_go()">
					<span>조회순</span>
				</div>
				<div id="u_order_grade" class="col-1 tab-off" onclick="search_sort_grade_go()">
					<span>평점순</span>
				</div>
			</div>
			</div>
			
			<!-- 레시피 출력 시작 -->
			
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
<script type="text/javascript">
function submitForm(form) {
    // 입력된 값을 가져와서 컨트롤러로 보내는 로직을 작성
    var inputValues = [];
    var inputElements = form.querySelectorAll(".input_text");
    inputElements.forEach(function (inputElement) {
        inputValues.push(inputElement.value);
    });

    // AJAX 또는 다른 방법을 사용하여 컨트롤러로 입력 값을 전달
	$.ajax({
        url: '/your-controller-endpoint', // 컨트롤러의 엔드포인트 URL을 지정
        type: 'POST', // 또는 'GET' 등 HTTP 요청 메서드를 선택
        data: {
            inputValues: inputValues // 서버에 전달할 데이터를 객체로 지정
        },
        success: function (response) {
            // AJAX 요청이 성공한 경우 실행되는 콜백 함수
            // 서버에서 받은 응답 데이터를 처리하고 화면에 표시
            document.getElementById("onoff").innerHTML = response;
            document.getElementById("onoff").style.display = "block";
        },
        error: function (error) {
            // AJAX 요청이 실패한 경우 실행되는 콜백 함수
            console.error('AJAX 요청 실패:', error);
        }
    });
    
    
    // 폼 제출을 막음
    return false;
}


function searchbt() {
	  var container = document.getElementById("onoff");
	  if (container.classList.contains("off")) {
		  container.classList.remove("off");
	  }
}

</script>
</body>
</html>