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

.category{
	margin-top: 25px;
	font-size: 15px;
}

.category li:hover{
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

.title{
	color: #606060;
	text-align: center;
	margin-top: 60px;
	font-size: 24px;
}

button{
	 font-family: 'Yeongdeok_TTF';
	 font-size: 16px;
	 width: 80px;
	 height: 30px;
	 background-color: white;
	 border: 2px solid tomato;
	 float: left;	 
}

.btn button:hover{
	background-color: tomato;
	color: white;
}

.btn{
	float: right;
	margin-top: -50px;
}

.r_title{
	box-sizing: border-box;
	width: 1260px;
	height: 80px; 
	margin-left: 30px;
	margin-right: 30px;
		
	border-left: 20px solid ;
	border-bottom: 3px solid ;
	border-color: tomato;
	margin-top: 40px;
}

.arrow{
	float: right;
	padding-bottom: 20px;
	margin-right: 30px;
}

#r_title_t{	
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

.r_type{
	margin: auto;
	float: right;
	margin-top: 25px;
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
		<div class="category">
				<ul>
					<li id="info_first">내 정보</li>
					<li id="info">찜 목록</li>
					<li id="info">신고 내역</li>
					<li id="info">내가 쓴 게시글</li>
					<li id="info_end">내가 쓴 댓글</li>
				</ul>
			</div>
			<div class="title_line"></div>			
			<div class="title">
				<h2>게시글 신고 내역</h2>
			</div>
			<div class="btn">
				<button id="write_con">게시글</button>
				<button id="write_com">댓글</button>
			</div>
			<div class="r_title">
				<span id="r_title_t">신고 게시글 제목</span>
				<div><img class="arrow" id="a_1" src="/resources/images/arrow_down.png"></div>
			<div class="r_type"><span>신고유형</span></div>
			</div>
			<div class="answer" id="a1">
				<p id="a_text_1">해당 게시물을 확인 후 블라인드 처리 완료하였습니다. 이용에 불편을 드려 죄송합니다.
				</p>
			</div>
			<div class="r_title">
				<span id="r_title_t">신고 게시글 제목</span>
				<img class="arrow" id="a_2" src="/resources/images/arrow_down.png">
				<div class="r_type"><span>신고유형</span></div>
				</div>
				<div class="answer" id="a2">
				<span id="a_text_2">해당 게시물을 확인 후 블라인드 처리 완료하였습니다. 이용에 불편을 드려 죄송합니다.
				</span>
			</div>
				<div class="r_title">
				<span id="r_title_t">신고 게시글 제목</span>
				<img class="arrow" id="a_3" src="/resources/images/arrow_down.png">
		<div class="r_type"><span>신고유형</span></div>
		</div>
		<div class="answer" id="a3">
				<span id="a_text_3">
					해당 게시물을 확인 후 블라인드 처리 완료하였습니다. 이용에 불편을 드려 죄송합니다.
				</span>
			</div>
		<div class="r_title">
				<span id="r_title_t">신고 게시글 제목</span>
				<img class="arrow" id="a_4" src="/resources/images/arrow_down.png">
		<div class="r_type"><span>신고유형</span></div>
		</div>
		<div class="answer" id="a4">
				<span id="a_text_4">
					 해당 게시물을 확인 후 블라인드 처리 완료하였습니다. 이용에 불편을 드려 죄송합니다.
				</span>
			</div>
			<div class="r_title">
				<span id="r_title_t">신고 게시글 제목</span>
				<img class="arrow" id="a_5" src="/resources/images/arrow_down.png">
		<div class="r_type"><span>신고유형</span></div>
		</div>
		<div class="answer" id="a5">
				<span id="a_text_5">해당 게시물을 확인 후 블라인드 처리 완료하였습니다. 이용에 불편을 드려 죄송합니다.
				</span>
			</div>
			
		 </div>
		<aside id="sidebar-right">오른</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
</body>
</html>
	