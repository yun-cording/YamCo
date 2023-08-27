<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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


#category li:hover{
	background-color: #E53A1B;
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
	padding-top: 300px;
}

#category{
	margin-top: 25px;
	font-size: 15px;
}

#category li:hover{
	background-color: #E53A1B;
}

 ul{
 	list-style: none;
	margin: auto;
	width: 625px;
 }	

#info_first{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	
	width: 125px;
	height: 50px;
	
	background: tomato;
	border-radius: 30px 0px 0px 30px;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

#info{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	
	width: 125px;
	height: 50px;
	float: left;
	
	background: tomato;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

#info_end{	
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px 15px 15px 20px;
	float: left;
	
	width: 125px;
	height: 50px;
	
	background: tomato;
	border-radius: 0px 30px 30px 0px;
	
	align-items: center;
	text-align: center;
	
	color: #FFFFFF;
}

.title_line{
	width: 1320px;
	border: 2px solid tomato;
	height: 1px;
	margin-top: 100px;
}

.q_all{
	margin-top: 100px;
}

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

.between{
	margin-top: 100px;
}

.arrow{
	float: right;
	padding-bottom: 20px;
	margin-right: 30px;
}

#q_title_t{	
	width: 1100px;
	font-size: 30px;
	padding-left: 10px;
	float: left;
	margin-top: 25px;
}

.img_size{
	width: 200px;
	height: 200px;
	margin-left: 10px;
}
.img{
	width: 200px;
	height: 200px;
	margin-left: 10px;
	float: left;
	margin-top: 30px;
}

.text_center{
	margin: auto;
	padding-right: 180px;

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
	});
</script>
</head>
<body>
<div id="mydiv">		
		<jsp:include page="../header.jsp" />
		<div id="test">
		<aside id="sidebar-left">왼쪽</aside>
		<div id="content">
			<div id="category">
				<ul>
					<li id="info_first">내 정보</li>
					<li id="info">찜 목록</li>
					<li id="info">신고 내역</li>
					<li id="info">내가 쓴 게시글</li>
					<li id="info_end">내가 쓴 댓글</li>
				</ul>
			</div>
			<div class="title_line"></div>
			<div class="q_all">
			<div class="q_title">
				<span id="q_title_t">1. 육회덮밥</span>
				<div><img class="arrow" id="a_1" src="/resources/images/arrow_down.png"></div>
			</div>
			<div class="answer" id="a1">
				<div class="img"><img src="/resources/images/potatoes.png" class="img_size"></div>
				<p id="a_text_1" class="text_center">맛있어요~
				</p>
			</div>
			<div class="q_title">
				<span id="q_title_t">2. 감자전</span>
				<img class="arrow" id="a_2" src="/resources/images/arrow_down.png">
				</div>
				<div class="answer" id="a2">
				<div class="img"><img src="/resources/images/potatoes.png" class="img_size"></div>
				<span id="a_text_2">바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~바삭해요~~
				<br><br><br><br><br><br><br>
				</span>
			</div>
				<div class="q_title">
				<span id="q_title_t">3. 치킨</span>
				<img class="arrow" id="a_3" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a3">
				<span id="a_text_3">
					존맛탱~~~
				</span>
			</div>
		<div class="q_title">
				<span id="q_title_t">4. 피자</span>
				<img class="arrow" id="a_4" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a4">
				<span id="a_text_4">
					 좀 짭니다~~~~
				</span>
			</div>
			<div class="q_title">
				<span id="q_title_t">5. 김치찜</span>
				<img class="arrow" id="a_5" src="/resources/images/arrow_down.png">
		</div>
		<div class="answer" id="a5">
				<span id="a_text_5">고기를 더 넣었더니 더 맛있네요~~~~~
				</span>
			</div>
		 </div>
		 </div>
		<aside id="sidebar-right">오른</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
</body>
</html>