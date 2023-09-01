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
	/* Rectangle 77 */
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

#title_line{
	width: 1320px;
	border: 2px solid tomato;
	height: 1px;
	margin-top: 100px;
}

#title{
	font-size: 40px;
	margin-top: 98px;
	font-weight: bold;
	margin-left: 100px;
}

#profile{
	width: 220px;
	height: 300px;
	margin-left: 110px;
	margin-top: 100px;
}

#pro_pic{
	box-sizing: border-box;
	float: left;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	margin-top: 80px;
}

.clear{
	clear: both;
	width: 220px;
	height: 300px;
	margin: 0px;
}

.info_all{
	margin-top: 181px;
	font-family: 'Yeongdeok_TTF';	
}

#info_content{
	font-size: 25px;
	box-sizing: border-box;
	width: 820px;
	height: 60px; 
	margin-left: 300px;
	margin-right: 100px;
		
	border-bottom: 3px solid ;
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
	margin-top: 100px;
	margin-left: 396px;
}

input[type="text"]{
	border:none;
	font-size: 24px;
	outline: none;
	font-family: 'Yeongdeok_TTF';	
}

input[type="number"]{
	border:none;
	font-size: 24px;
	outline: none;
	font-family: 'Yeongdeok_TTF';	
}
 /* input number 화살표 없애는 거 */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}  
 

#btn_save{
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
#btn_save:hover{
	cursor: pointer;
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

#btn_double{
	width: 100px;
	height: 35px;
	float: right;
	text-align: center;
	color: white;
	background-color: tomato;
	border: none;
	border-radius: 30px 30px 30px 30px;
}
	</style>
</head>
<body>
<div id="mydiv">		
	<jsp:include page="../header.jsp" />
	<div id="test">
	<aside id="sidebar-left">
		<jsp:include page="../recentlist.jsp" />
	</aside>
		<div id="content">
			<div id="category">
				<ul>
					<a href="/myinfo.go"><li id="info_first">내 정보</li></a>
					<a href="/mywishlist.go"><li id="info">찜 목록</li></a>
					<a href="/reportcontent.go"><li id="info">신고 내역</li></a>
					<a href="/mycontent.go"><li id="info">내가 쓴 게시글</li></a>
					<a href="/mycomment.go"><li id="info_end">내가 쓴 댓글</li></a>
				</ul>
			</div>
			<div id="title_line"></div>
			<div id="title">내 정보 변경</div>
			<div class="clear">
			<form>
			<div id="profile">
					<img id="pro_pic" src="${mvo.m_image }">
				<div class="info_all">
					<div id="info_content">닉네임 : <input type="text" name="m_nick" value="${mvo.m_nick }"></div>
					<div id="info_content">휴대폰 : <input  type="number" name="m_phone" value="${mvo.m_phone }"></div>
					<div id="info_content">생년월일 : ${mvo.m_birthday }</div>
					<div id="info_content">성별 :  ${mvo.m_gender }</div>
				</div>
			</div>
			<div class="btn">
				<button type="button" id="btn_save" onclick="changeMyInfoDo(this.form)">저장</button>
				<button id="btn_exit">돌아가기</button>
			</div>
			</form>
			</div>
		</div>		 
	<aside id="sidebar-right">
		<jsp:include page="../bestlist.jsp" />
	</aside>
	</div>
	<div id="footer"><jsp:include page="../footer.jsp" /></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function changeMyInfoDo(f) {
		f.action = "/changeMyInfo.do"
		f.submit()
	}
	$(function() {
		
	})

</script>
</body>
</html>