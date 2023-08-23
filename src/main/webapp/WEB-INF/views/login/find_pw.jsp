<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style type="text/css">
#mydiv {
	position: relative; 
  width : 1920px;
  left : 0px; 
  top : 0px;
	margin: auto;
}

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

#maintext{
	font-size: 40px;
	font-family: 'Yeongdeok_TTF';
}

#textfiled{
	display:flex;
	width: 660px;
	height: 50px;
	margin: auto;
	margin-top: 60px;
	font-size: 24px;
	font-family: 'Yeongdeok_TTF';
}

#idline{
	display:flex;
	width: 660px;
	height: 5px;
	flex-shrink: 0;
	background:#FF6347;
	margin: auto;
	justify-content: row;
}

input[type="text"]{
	border:none;
	/* border-radius: 20px; */
	font-size: 24px;
	outline: none;
}

.buttons{
	display:inline-block;
	width: 176px;
	height: 50px;
	flex-shrink: 0;
	justify-content: row;
	border-radius: 40px;
	margin: auto;
	border: none;
}

.buttons > span{
	text-align: center;
	line-height: 50px;
	height: 50px;
	width: 176px;
	font-family: 'Yeongdeok_TTF';
	font-size: 24px;
	font-weight: bold;
	color: white;
}

</style>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="">
	<div id="mydiv">
	
	<div style="width:990px; margin: auto; margin-top:240px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1 (1).png" style="width:80px;">
	<span id="maintext">가입하실 때 입력하신 <span style="color:tomato">핸드폰 번호</span>를 입력해 주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_1 (1).png" style="width:80px;">
	</div>
	
	<div style="margin-top:200px;">
	<input type="text" placeholder="아이디(이메일) : " id="textfiled">
	<div id="idline"></div>
	</div>
	<div style="text-align:center; margin-top:120px;">
	<button class="buttons" style="background:#FF6347;"><span>비밀번호 찾기</span></button>
	<button class="buttons" style="background: gray;"><span>돌아가기</span></button>
	</div>
	
	</div>
	</form>
</body>
</html>