<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">

#mydiv {
	position: relative; 
  width : 1920px;
  left : 0px; 
  top : 0px;
	margin: auto;
}

.idline{
	display:flex;
	width: 660px;
	height: 5px;
	flex-shrink: 0;
	background:#FF6347;
	margin: auto;
	justify-content: row;
}

.textfiled{
	display:flex;
	width: 660px;
	height: 50px;
	margin: auto;
	margin-top: 60px;
	font-size: 24px;
	font-family: 'Yeongdeok_TTF';
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

@font-face {
    font-family: 'Yeongdeok_TTF';
    src: url('../../resources/fonts/Yeongdeok Blueroad.ttf') format('truetype');
}

#nicknamechk{


}

.textchk{
	display:flex;
	width: 660px;
	font-size: 24px;
	font-weight: bold;
	justify-content: row;
	margin: auto;
}

input[type="text"]{
	border:none;
	/* border-radius: 20px; */
	font-size: 24px;
	outline: none;
}

.middleform{
	display:flex;
	flex-shrink: 0;
	margin: auto;
	width: 660px;
	justify-content: justify-content;
	align-items: center;
	flex-wrap: wrap;
	margin-top: 60px;
}

#birthline{
	background:#FF6347;
	height: 5px;
	width: 660px;
	margin: auto;
}

.radiobox{
	height: 50px;
	line-height: 50px;
	width: 20px;
}
.chkbox{
	height: 50px;
	width: 24px;
	margin-top: 15px;
}

.chktext{
	height: 50px;
	line-height: 50px;
	font-family: 'Yeongdeok_TTF';
	font-size: 20px;
}

.middletext{ 
	width: 520px;
	height: 40px;
	font-size: 16px;
	font-family: 'Yeongdeok_TTF';
}

.doublechk{
	width: 96px;
	height: 30px;
	flex-shrink: 0;
	justify-content: row;
	border-radius: 40px;
	background:#FF6347;
	margin: auto;
	border: none;
}

.doublechk > span{
	text-align: center;
	line-height: 30px;
	height: 30px;
	width: 96px;
	font-family: 'Yeongdeok_TTF';
	font-size: 18px;
	color: white;
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
	
	<div class="middleform">
	<input type="text" placeholder="아이디(이메일) " class="middletext">
	<button class="doublechk"><span>중복확인</span></button>
	<div class="idline"></div>
	</div>
	<div >
	<input type="text" placeholder="비밀번호" class="textfiled">
	<div class="idline"></div>
	</div>
	<div >
	<input type="text" placeholder="비밀번호 확인 " class="textfiled">
	<div class="idline"></div>
	</div>
	<div class="middleform">
	<input type="text" placeholder="닉네임 " class="middletext">
	<button class="doublechk"><span>중복확인</span></button>
	<div class="idline"></div>
	</div>
	<div id="nicknamechk"></div>
	<div >
	<input type="text" placeholder="휴대폰 " class="textfiled">
	<div class="idline"></div>
	</div>
	
	<div class="middleform">
	<input type="text" placeholder="생년 월일 " class="middletext">
	<input type="radio" value="남자" name="gender"  class="radiobox" checked ><span class="chktext">남자</span>
	<input type="radio" value="여자" name="gender" class="radiobox" ><span class="chktext">여자</span>
	<div id="birthline" ></div>
	</div>
	
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span >개인 회원 약관에 동의</p>
	<input type="checkbox" value="여자" name="gender" class="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</p>
	<input type="checkbox" value="여자" name="gender" class="chkbox" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:30px;">
	<button class="buttons" style="background:#FF6347;"><span>회원가입</span></button>
	<button class="buttons" style="background: gray"><span>돌아가기</span></button>
	</div>
	</div>
	</form>
</body>
</html>