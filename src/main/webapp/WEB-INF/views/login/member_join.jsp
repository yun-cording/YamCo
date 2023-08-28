<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/login/member_join.css?after" />
<script type="text/javascript">
function memberinfochk() {
	alert("개인 회원 약관에 동의");
}

function memberinfoagree() {
	alert("개인정보 수집 및 이용 동의");
}

function memberJoin_go(f) {
	f.action = "/member_join.do";
	f.submit();
}

</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#m_id").keyup(function() {
			$.ajax({
				url : "/go_memberList.do",
				method : "post",
				dataType : "text",
				data : "m_id="+$("#m_id").val(),
				async : false,
				success : function(data) {
					if(data>=1){
						$(".idDoubleChk").text("중복된 아이디입니다.").css("color", "red");			
					}else{
						$(".idDoubleChk").text("사용 가능한 아이디입니다.").css("color", "green");
					}
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<jsp:include page="member_header.jsp" />
	
	<form action="" method="post">
	<div id="mydiv">
	
	<div class="middleform">
	<input type="text" placeholder="아이디(이메일) " class="middletext" name="m_id" id="m_id">
	<div class="idline"></div>
	<span class="idDoubleChk"></span>
	</div>
	<div >
	<input type="password" placeholder="비밀번호" class="textfiled" name="m_pw">
	<div class="idline"></div>
	</div>
	<div >
	<input type="password" placeholder="비밀번호 확인 " class="textfiled">
	<div class="idline"></div>
	</div>
	<div class="middleform">
	<input type="text" placeholder="닉네임 " class="middletext" name="m_nick">
	<button class="doublechk"><span>중복확인</span></button>
	<div class="idline"></div>
	</div>
	<div id="nicknamechk"></div>
	<div >
	<input type="text" placeholder="휴대폰 " class="textfiled" name="m_phone">
	<div class="idline"></div>
	</div>
	
	<div class="middleform">
	<input type="text" placeholder="생년 월일 " class="middletext" name="m_birthday">
	<input type="radio" value="남자" name="gender"  class="radiobox" checked><span class="chktext">남자</span>
	<input type="radio" value="여자" name="gender" class="radiobox" ><span class="chktext">여자</span>
	<div id="birthline" ></div>
	</div>
	
	<div class="textchk">
	<p style="width: 600px;"><span style="color:tomato;">(필수)</span >개인 회원 약관에 동의</p>
	<input type="checkbox" value="" name="" id="chkbox" onclick="memberinfochk()">
	</div>
	<div class="textchk">
	<span style="width: 600px; margin-top: 12px;"><span style="color:tomato;">(필수)</span>개인 정보 수집 및 이용 동의</span>
	<input type="checkbox" value="" name="" id="chkbox2" onclick="memberinfoagree()">
	</div>
	
	<div style="text-align:center; margin-top:30px;">
	<input type="hidden" name="gender">
	<button class="buttons" style="background:gray;" onclick="memberJoin_go(this.form)" disabled><span>회원가입</span></button>
	<button type="button" class="buttons" style="background: gray"><span>돌아가기</span></button>
	</div>
	</div>
	</form>
</body>
</html>