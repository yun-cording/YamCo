<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
</style>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="">
	<div id="mydiv">
	<div style="width:830px; margin: auto; margin-top:240px;">
	<span id="maintext">가입하실 때 입력하신 <span style="color:tomato">핸드폰 번호</span>를 입력해 주세요.</span>
	</div>
	
	<div>
	<input type="text" required placeholder="휴대폰 : ">
	</div>
	
	<button><span></span></button>
	<button><span></span></button>
	<button><span></span></button>
	
	</div>
	</form>
</body>
</html>