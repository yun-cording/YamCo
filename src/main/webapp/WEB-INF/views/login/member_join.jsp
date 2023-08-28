<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/login/member_join.css" />
<script type="text/javascript">
function memberinfochk() {
	alert("개인 회원 약관에 동의");
}

function memberinfoagree() {
	alert("개인정보 수집 및 이용 동의");
}

function go_memberJoin(f) {
	location.href = "/member_join.do";
}
</script>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	
	<form action="post">
	<div id="mydiv">
	
	<div class="middleform">
	<input type="text" placeholder="아이디(이메일) " class="middletext">
	<button class="doublechk"><span>중복확인</span></button>
	<div class="idline"></div>
	</div>
	<div >
	<input type="password" placeholder="비밀번호" class="textfiled">
	<div class="idline"></div>
	</div>
	<div >
	<input type="password" placeholder="비밀번호 확인 " class="textfiled">
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
	<input type="checkbox" value="여자" name="gender" id="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<span style="width: 600px; margin-top: 12px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</span>
	<input type="checkbox" value="여자" name="gender" id="chkbox2" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:30px;">
	<button class="buttons" style="background:#FF6347;"><span>회원가입</span></button>
	<button type="button" class="buttons" style="background: gray" onclick="go_memberJoin(this.form)"><span>돌아가기</span></button>
	</div>
	</div>
	</form>
</body>
</html>