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

.title{
	font-size: 40px;
	margin-top: 98px;
	font-weight: bold;
	margin-left: 100px;
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

.info_content{
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
	margin-left: 484px;
}

input[type="password"]{
	border:none;
	/* border-radius: 20px; */
	font-size: 24px;
	outline: none;
	font-family: 'Yeongdeok_TTF';	
}

#btn_save{
	width: 175px;
	height: 53px;
	font-size: 28px;
	text-align: center;
	color: white;
	background-color: lightgray;
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
.info_content span{
	display: inline-block;
	font-size: 13px;
	width: 370px;
	text-align: right;
}
button:hover {
	cursor:pointer; 
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
			<div class="title">비밀번호 변경</div>
			<div class="clear">	
			<form action="/changeMyPw.do" method="post">		
			<div class="info_all">
					<div class="info_content">기존 비밀번호 : <input type="password" name="old_pw" id="old_pw"> <span id=txt></span> </div>
					<div class="info_content">새 비밀번호 : <input type="password" name="m_pw" id="new_pw"> <span id=txt2></span></div>
					<div class="info_content">비밀번호 확인 : <input type="password" id="new_pw_ok"> <span id=txt3></span></div>
				</div>
			<div class="btn">
				<button id="btn_save" disabled>비밀번호 변경</button>
				<button type="button" id="btn_exit" onclick="history.go(-1)">돌아가기</button>
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
			
			function checkValidSomeThing(param) {
				var pwtxt = /^(?=.*?[a-z])(?=.*?[0-9]).{8,15}$/;
				return pwtxt.test(param);
			}
			
			$(function() {
					var status1 = false;
					var status2 = false;
					var old_pw = $("#old_pw").val();
					var txt =$("#txt");
					var new_pw = $("#new_pw").val();
					var txt2 = $("#txt2");
					var new_pw_ok = $("#new_pw_ok").val();
					var txt3 = $("#txt3");
				$("#old_pw").keyup(function (){
					status1=false
					old_pw = $("#old_pw").val();
					txt = $("#txt");
					if(old_pw===""){
						txt.text("");
					}else{
						$.ajax({
							url: "/pwChk.do",
							method : "post",
							data : "old_pw="+old_pw,
							async: false,
							success: function(res) {
								if(res){
									txt.text("비밀번호가 일치합니다.")
									txt.css("color","green")
									status1 = true;
								}else{
									txt.text("비밀번호가 불일치합니다.")
									txt.css("color","red")
								}
							},
							error: function() {
								alert("ajxa실패");
							}
						})						
					}
					if(status1&&status2){
						$("#btn_save").prop("disabled", false);
						$("#btn_save").css("background-color", "tomato");
					}else{
						$("#btn_save").prop("disabled", true);
						$("#btn_save").css("background-color", "lightgray");
					}
				})
				$("#new_pw").keyup(function (){
					status2=false;
					new_pw = $("#new_pw").val();
					txt2 = $("#txt2");
					if(new_pw===""){
						txt2.text("");
					}else if(!checkValidSomeThing(new_pw)){
						txt2.text("최소 8자리 이상 15자리 이하 영문 소문자, 숫자를 사용해주세요")
						txt2.css("color","red")
					}else{
						txt2.text("");
						if(new_pw===new_pw_ok){
							txt3.text("비밀번호가 일치합니다.")
							txt3.css("color","green")
							status2=true
						}else{
							txt3.text("비밀번호가 일치하지 않습니다.");
							txt3.css("color","red")
						}
					}
					if(status1&&status2){
						$("#btn_save").prop("disabled", false);
						$("#btn_save").css("background-color", "tomato");
					}else{
						$("#btn_save").prop("disabled", true);
						$("#btn_save").css("background-color", "lightgray");
					}
				})
				$("#new_pw_ok").keyup(function (){
					new_pw_ok = $("#new_pw_ok").val();
					txt3 = $("#txt3");
					status2=false;
					if(new_pw_ok===""){
						txt3.text("");
					}else if(!checkValidSomeThing(new_pw_ok)){
						txt3.text("최소 8자리 이상 15자리 이하 영문 소문자, 숫자를 사용해주세요")
						txt3.css("color","red")
					}else{
						if(new_pw===new_pw_ok){
							txt3.text("비밀번호가 일치합니다.")
							txt3.css("color","green")
							status2=true
						}else{
							txt3.text("비밀번호가 일치하지 않습니다.");						
						}
					}
					if(status1&&status2){
						$("#btn_save").prop("disabled", false);
						$("#btn_save").css("background-color", "tomato");
					}else{
						$("#btn_save").prop("disabled", true);
						$("#btn_save").css("background-color", "lightgray");
					}
				})
			});
		</script>
</body>
</html>