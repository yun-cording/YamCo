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
	height: 1010px;
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

.profile{
	width: 220px;
	height: 300px;
	margin-left: 280px;
}

.title{
	font-size: 40px;
	margin-top: 98px;
	font-weight: bold;
	margin-left: 100px;
}

#pro_pic{
	box-sizing: border-box;
	float: left;
	width: 200px;
	height: 200px;
	border-radius: 50%;
}

#nickname{
	float: left;
	font-size: 30px;
	width: 130px;
	margin-top: 55px;
	margin-left: 65px;
}

#nick_line{
	border-bottom: 3px solid tomato;
	width: 200px;
	margin-left: 10px;
	margin-top: 10px;
	float: left;	
}

.clear{
	clear: both;
	width: 220px;
	height: 300px;
	margin: 0px;
}

.info_all{
	margin-top: 181px;
}

#info_content{
	font-size: 25px;
	box-sizing: border-box;
	width: 600px;
	height: 60px; 
	margin-left: 400px;
	margin-right: 100px;
		
	border-left: 20px solid ;
	border-color: tomato;
	margin-top: 30px;
	padding-left: 10px;
	padding-top: 13px;
}

button{
	font-family: 'Yeongdeok_TTF';	
}

.btn{
	width: 600px;
	float: left;
	align-items: center;
	margin-top: 250px;
	margin-left: 396px;
}

#btn_change{
	width: 175px;
	height: 53px;
	font-size: 28px;
	text-align: center;
	color: white;
	background-color: tomato;
	border: none;
	border-radius: 30px 30px 30px 30px;
	float: left;
}

#btn_ch_pw{
	width: 175px;
	height: 53px;
	font-size: 28px;
	text-align: center;
	color: white;
	background-color: tomato;
	border: none;
	border-radius: 30px 30px 30px 30px;
	float: left;
}

#btn_exit{
	width: 175px;
	height: 53px;
	font-size: 28px;
	text-align: center;
	color: white;
	background-color: #878787;
	border: none;
	border-radius: 30px 30px 30px 30px;
	float: left;
}
</style>
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
			<div class="title">로그인 정보</div>
			<div class="clear">
			<div class="profile">
				<img id="pro_pic" src="/resources/images/jongjongka.jpg">
					<span id="nickname">닉네임</span>
					<div id="nick_line"></div>
					<div class="info_all">
						<div id="info_content">아이디(이메일) : gkdlfn@naver.com</div>
						<div id="info_content">핸드폰 번호 : 010-0000-0000</div>
						<div id="info_content">생년월일 : 981016</div>
						<div id="info_content">성별 : 여성</div>
					</div>
				</div>
				<div class="btn">
					<button id="btn_change">정보 변경</button>
					<button id="btn_ch_pw">비밀번호 변경</button>
					<button id="btn_exit">탈퇴하기</button>
				</div>
			</div>
		 </div>
		<aside id="sidebar-right">오른</aside>
		</div>
<div id="footer"><jsp:include page="../footer.jsp" /></div>
		</div>
</body>
</html>