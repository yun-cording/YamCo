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

#category{
	margin-top: 25px;
	font-size: 15px;
}

#category li:hover{
	background-color: #E53A1B;
}


#content {
	width: 68.75%;
	float: left;
	background: white;
	font-family: 'Yeongdeok_TTF';
	height: 1010px;
}

#footer {
	left: 0px;
	color: #fff;
	width: 100%;
	clear: left;
}

.category{
	margin-top: 25px;
	font-size: 15px;
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
	font-size: 40px;
	margin-top: 98px;
	font-weight: bold;
	margin-left: 100px;
}

.title_content{
	margin-top: 100px;
	margin-left: 474px;
	font-size: 30px;
}

#pw_color{
	color: tomato;
	font-weight: bold;
}

.clear{
	clear: both;
	width: 220px;
	height: 300px;
	margin: 0px;
}

.info_all{
	margin-top: 200px;
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
	margin-left: 484px;
}

#btn_bye{
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

input[type="password"]{
	border:none;
	/* border-radius: 20px; */
	font-size: 24px;
	outline: none;
	font-family: 'Yeongdeok_TTF';	
}
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  justify-content: center;
  align-items: center;
}

.modal-content {
	position: fixed;
	top: 35%;
	left: 35%;
	width:30%;
	height: 30%;
	line-height: 100px;
	background-color: white;
	display: inline-block;
	text-align: center;
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
					<a href="/myinfo.do"><li id="info_first">내 정보</li></a>
					<a href="/mywishlist.do"><li id="info">찜 목록</li></a>
					<a href="/reportcontent.do"><li id="info">신고 내역</li></a>
					<a href="/mycontent.do"><li id="info">내가 쓴 게시글</li></a>
					<a href="/mycomment.do"><li id="info_end">내가 쓴 댓글</li></a>
				</ul>
			</div>
			<div class="title_line"></div>
			<div class="title">회원 탈퇴</div>
			<div class="title_content">회원님의 <span id="pw_color">비밀번호</span>를 입력해주세요.</div>
				<div class="info_all">
					<div id="info_content">기존 비밀번호 : <input type="password" id="pw" name="pw"></div>
				</div>
				<div class="btn">
					<button type="button" id="btn_bye">탈퇴하기</button>
					<button type="button" id="btn_exit" onclick="history.go(-1)">돌아가기</button>
				</div>
		 </div>
		<aside id="sidebar-right">
			<jsp:include page="../bestlist.jsp" />
		</aside>
		</div>
		<div id="footer"><jsp:include page="../footer.jsp" /></div>
	</div>
		<div id="myModal" class="modal">
		    <div class="modal-content">
		    	<span id="closeModalBtn" style="float: right; cursor: pointer;">&times;</span>
		     	<h2>정말 탈퇴하시겠습니까?</h2> <br>
		     	<button id="yesBtn" style="width: 100px; height: 30px;">예</button>
	   			<button id="noBtn" style="width: 100px; height: 30px;">아니오</button>
		    </div>
	  	</div>
	  	${alert }
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var pw;
	$("#btn_bye").on("click",function(){
		$("#myModal").css('display','block');
	});
	$("#yesBtn").on("click",function() {
		pw = $("#pw").val();
		location.href = '/leaveMember.do?pw='+pw;
    });
	$("#noBtn").on("click",function() {
		$("#myModal").css("display", "none");
	});
	$("#closeModalBtn").on("click",function() {
		$("#myModal").css("display", "none");
	});
})
</script>
</body>
</html>