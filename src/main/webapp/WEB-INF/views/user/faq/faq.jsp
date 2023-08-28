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

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

 #mydiv{
        width: 1920px;
        margin:  auto;		
    }
    
 #sidebar-right {
	background-color: white;
	float: left;
	width: 15.625%;
}

#sidebar-left {
	background-color: white;
	width: 15.625%;
	float: left;
}

#content {
	width: 68.75%;
	float: left;
	/* Rectangle 77 */
	margin-top: 0px;
	background: white;
	font-family: 'Yeongdeok_TTF';
}

#footer {
	left: 0px;
	color: #fff;
	width: 100%;
	clear: left;
	padding-top: 135px;
}

.title{
	color: tomato;
	margin-left: 10px;
	margin-top: 60px;
	font-size: 24px;
}
/* Line 12 */
.title_line{
	width: 1320px;
	height: 1px;
	border: 2px solid tomato;
	margin-top: 10px;
	margin-bottom: 135px;
}

/* Rectangle 79 */
.q_title{
	box-sizing: border-box;
	width: 1260px;
	height: 80px; 
	margin-left: 30px;
	margin-right: 30px;
		
	border-left: 20px solid ;
	border-bottom: 3px solid ;
	border-color: tomato;
	margin-top: 30px;
}

.arrow{
	float: right;
	padding-bottom: 20px;
	margin-right: 30px;
}

.q_title_t{	
	width: 1100px;
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.answer{
	font-size: 30px;
	text-align: center;
	display: none;  
	 	
	box-sizing: border-box;
	
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 50px;
	padding-top: 17px;
	width: 1260px;
	height: 300px;
	
	font-weight: 400;
	line-height: 40px;
	
	color: tomato;
	
	border-bottom: 3px solid tomato;
	align-items: center;
	justify-content: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var i=0;
		$("#a_1").on("click", function() {
			if(i++%2 == 0){
				$("#a1").fadeOut(400);					
				$("#a_1").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a1").fadeIn({direction : "top"});
				$('#a1').attr("style", "display : flex;");
				$("#a_1").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_2").on("click", function() {
			if(i++%2 == 0){
				$("#a2").fadeOut(400);			
				$("#a_2").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a2").fadeIn({direction : "top"});	
				$('#a2').attr("style", "display : flex;");
				$("#a_2").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_3").on("click", function() {
			if(i++%2 == 0){
				$("#a3").fadeOut(400);					
				$("#a_3").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a3").fadeIn({direction : "top"});	
				$('#a3').attr("style", "display : flex;");
				$("#a_3").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_4").on("click", function() {
			if(i++%2 == 0){
				$("#a4").fadeOut(400);					
				$("#a_4").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a4").fadeIn({direction : "top"});	
				$('#a4').attr("style", "display : flex;");
				$("#a_4").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_5").on("click", function() {
			if(i++%2 == 0){
				$("#a5").fadeOut(400);				
				$("#a_5").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a5").fadeIn({direction : "top"});	
				$('#a5').attr("style", "display : flex;");
				$("#a_5").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_6").on("click", function() {
			if(i++%2 == 0){
				$("#a6").fadeOut(400);					
				$("#a_6").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a6").fadeIn({direction : "top"});	
				$('#a6').attr("style", "display : flex;");
				$("#a_6").attr("src","/resources/images/arrow_up.png");
			}			
		});
		
		$("#a_7").on("click", function() {
			if(i++%2 == 0){
				$("#a7").fadeOut(400);					
				$("#a_7").attr("src","/resources/images/arrow_down.png");
			}else{
				$("#a7").fadeIn({direction : "top"});	
				$('#a7').attr("style", "display : flex;");
				$("#a_7").attr("src","/resources/images/arrow_up.png");
			}			
		});
	});
</script>
</head>
<body>
	<div id="mydiv">		
		<jsp:include page="../../header.jsp" />
		<div id="test">
		<aside id="sidebar-left"><jsp:include page="../../recentlist.jsp" />
		</aside>
		<div id="content">
			<div class="title">
				<h2>자주묻는 질문</h2>
			</div>
			<div class="title_line"></div>
			<div class="q_title">
				<span class="q_title_t">요리 레시피를 어떻게 검색하나요?</span>
				<div><img class="arrow" id="a_1" src="/resources/images/arrow_down.png"></div>
			</div>
			<div class="answer" id="a1">
				<p class="a_text_1">레시피 검색은 사이트 상단의 검색 바에 키워드나 요리명을 입력하면 됩니다. 또한, 카테고리별로 분류된 레시피 목록을 확인할 수 있습니다.
				</p>
			</div>
			<div class="q_title">
				<span class="q_title_t">레시피에 사용되는 재료들을 확인하고 싶어요. 어떻게 찾을 수 있을까요?</span>
				<img class="arrow" id="a_2" src="/resources/images/arrow_down.png">
				</div>
				<div class="answer" id="a2">
				<span class="a_text_2">각 레시피 페이지에서 '재료' 섹션을 확인하시면 필요한 재료들의 목록과 양을 찾을 수 있습니다.
				</span>
			</div>
				<div class="q_title">
				<span class="q_title_t">특정 식재료가 포함된 레시피를 추천해주세요.</span>
				<img class="arrow" id="a_3" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a3">
				<span class="a_text_3">
					물론! 어떤 식재료를 사용하고 싶으신지 알려주시면, 그에 맞는 레시피를 추천해 드릴게요.
				</span>
			</div>
		<div class="q_title">
				<span class="q_title_t">레시피의 난이도에 따라 분류되는 기준이 어떻게 되나요?</span>
				<img class="arrow" id="a_4" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a4">
				<span class="a_text_4">
					 레시피의 난이도는 준비 과정, 조리 시간, 필요한 기술 등을 고려하여 판단됩니다. 간단한 레시피부터 전문적인 요리까지 다양한 난이도의 레시피를 제공하고 있습니다.
				</span>
			</div>
			<div class="q_title">
				<span class="q_title_t">레시피에 나오는 양은 몇 인분 기준인가요?</span>
				<img class="arrow" id="a_5" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a5">
				<span class="a_text_5">대부분의 레시피는 2~4인분을 기준으로 작성되어 있습니다. 그러나 원하는 만큼 배수로 조절하여 요리할 수도 있습니다.
				</span>
			</div>
			<div class="q_title">
				<span class="q_title_t">레시피에 나와있는 조리 순서가 이해되지 않아요.</span>
				<img class="arrow" id="a_6" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a6">
				<span class="a_text_6">레시피 페이지에서 각 단계별로 제공되는 설명을 참고하시면 됩니다. 어려운 부분이 있으면 그 부분을 더 자세히 설명해드릴 수도 있습니다.
				</span>
			</div>
		<div class="q_title">
				<span class="q_title_t">레시피의 영양 정보를 확인하려면 어떻게 해야 하나요?</span>
				<img class="arrow" id="a_7" src="/resources/images/arrow_down.png">
		</div>			
		<div class="answer" id="a7">
				<span class="a_text_7">대부분의 레시피에는 칼로리, 단백질, 지방 등의 영양 정보가 포함되어 있습니다. 각 레시피 페이지의 하단에 해당 정보를 확인할 수 있는 링크가 있을 것입니다.
				</span>
			</div>
		 </div>
		<aside id="sidebar-right"><jsp:include page="../../bestlist.jsp" /></aside>
		</div>
<div id="footer"><jsp:include page="../../footer.jsp" /></div>
		</div>
</body>
</html>