<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜 회원가입</title>
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

.textchk{
	display:flex;
	width: 660px;
	font-size: 24px;
	font-weight: bold;
	justify-content: row;
	margin: auto;
}

.chkbox{
	height: 50px;
	width: 24px;
	margin-top: 15px;
}

</style>
<script type="text/javascript">
function memberinfochk() {
	alert("개인 회원 약관에 동의");
}
function memberinfoagree() {
	alert("개인정보 수집 및 이용 동의");
}
</script>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	<form action="">
	<div id="mydiv">
	
	<div style="width:990px; margin: auto; margin-top:240px; text-align: center;">
	<img src="/resources/images/icon_tomato_ver2_1 (1).png" style="width:80px;">
	<span id="maintext"><span style="color:tomato">냠냠레시피</span>에서 사용하실 닉네임을 정해주세요.</span>
	<img src="/resources/images/icon_tomato_ver2_1 (1).png" style="width:80px;">
	</div>
	<div id="detail"></div> <!-- 중복된 닉네임입니다. 사용가능한 닉네임 입니다. 표시용 -->
	
	<div style="margin-top:200px;">
	<input type="text" placeholder="닉네임 : " id="textfiled" required>
	<div id="idline"></div>
	</div>
	
	<div class="textchk" style="margin-top:50px;">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span >개인 회원 약관에 동의</p>
	<input type="checkbox" value="여자" name="gender" class="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</p>
	<input type="checkbox" value="여자" name="gender" class="chkbox" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:120px;">
	<button class="buttons" style="background:#FF6347;"><span>회원가입</span></button>
	<button class="buttons" style="background:gray;"><span>돌아가기</span></button>
	</div>
	
	</div>
	</form>
</body>
</html>